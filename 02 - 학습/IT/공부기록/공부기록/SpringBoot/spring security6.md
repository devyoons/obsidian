---
별칭:
  - "학습 - spring security6"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/17524612498b80778f2ac313d48f6b9b
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
  - "[[00 - 대시보드/주제/보안|보안]]"
---

# 학습: spring security6

## 세부 내용

[[Java] Spring Boot Security 3.x + JWT 이해하기 -2 : 환경설정 및 구성](https://adjh54.tistory.com/577)

- 단계별로 정리 잘되어있는 블로그

[Spring Security 6 튜토리얼 (1)](https://velog.io/@pizza_1/Spring-Security-6-%ED%8A%9C%ED%86%A0%EB%A6%AC%EC%96%BC-1)

- 주석이 잘 작성되어있는 블로그

[[JWT] 로그인 구현 1::로그인 기능 구현, JWT Provider 생성](https://yuma1029.tistory.com/15)

[스프링 시큐리티 + JWT](https://velog.io/@hyunn/%EC%8A%A4%ED%94%84%EB%A7%81-%EC%8B%9C%ED%81%90%EB%A6%AC%ED%8B%B0-JWT)

- 설계
    
```jsx
1. 구조 설계
백엔드

api: RESTful API 처리
auth: 인증 및 인가 (Spring Security와 JWT 사용)
com: 공통 모듈 (유틸리티, 공통 DTO/VO, 상수 등)
core: 데이터 접근 및 비즈니스 로직 처리
프론트엔드

mobile: 웹기반 모바일 클라이언트
web: 데스크톱 웹 클라이언트
2. Spring Security 6 설정
Spring Security 6와 JWT를 사용하여 인증 및 인가를 구성합니다.

2-1. Security Config 설정
java
코드 복사
package com.example.auth.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final JwtAuthenticationFilter jwtAuthenticationFilter;

    public SecurityConfig(JwtAuthenticationFilter jwtAuthenticationFilter) {
        this.jwtAuthenticationFilter = jwtAuthenticationFilter;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/api/v1/web/login", "/api/v1/mobile/login").permitAll()
                .anyRequest().authenticated()
            )
            .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
}
2-2. JWT 토큰 생성 및 검증
java
코드 복사
package com.example.auth.service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class JwtTokenProvider {

    @Value("${jwt.secret}")
    private String secretKey;

    @Value("${jwt.expiration}")
    private long expiration;

    // JWT 토큰 생성
    public String generateToken(String username, String role) {
        Claims claims = Jwts.claims().setSubject(username);
        claims.put("role", role);

        return Jwts.builder()
                .setClaims(claims)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + expiration))
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
    }

    // JWT 토큰 검증
    public boolean validateToken(String token) {
        try {
            Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // 토큰에서 사용자 정보 추출
    public String getUsernameFromToken(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }
}
2-3. JWT 필터
java
코드 복사
package com.example.auth.filter;

import com.example.auth.service.JwtTokenProvider;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final JwtTokenProvider tokenProvider;
    private final UserDetailsService userDetailsService;

    public JwtAuthenticationFilter(JwtTokenProvider tokenProvider, UserDetailsService userDetailsService) {
        this.tokenProvider = tokenProvider;
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws ServletException, IOException {
        String header = request.getHeader("Authorization");
        if (header != null && header.startsWith("Bearer ")) {
            String token = header.substring(7);
            if (tokenProvider.validateToken(token)) {
                String username = tokenProvider.getUsernameFromToken(token);
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                        userDetails, null, userDetails.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        }
        chain.doFilter(request, response);
    }
}
3. 서비스별 로그인 엔드포인트
/api/v1/web/login 및 /api/v1/mobile/login을 처리하는 AuthController 작성.
java
코드 복사
package com.example.auth.controller;

import com.example.auth.service.JwtTokenProvider;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1")
public class AuthController {

    private final AuthenticationManager authenticationManager;
    private final JwtTokenProvider tokenProvider;

    public AuthController(AuthenticationManager authenticationManager, JwtTokenProvider tokenProvider) {
        this.authenticationManager = authenticationManager;
        this.tokenProvider = tokenProvider;
    }

    @PostMapping("/web/login")
    public ResponseEntity<?> webLogin(@RequestParam String username, @RequestParam String password) {
        return authenticateAndGenerateToken(username, password, "WEB");
    }

    @PostMapping("/mobile/login")
    public ResponseEntity<?> mobileLogin(@RequestParam String username, @RequestParam String password) {
        return authenticateAndGenerateToken(username, password, "MOBILE");
    }

    private ResponseEntity<?> authenticateAndGenerateToken(String username, String password, String role) {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password));
        String token = tokenProvider.generateToken(username, role);

        return ResponseEntity.ok().body("Token: " + token);
    }
}
4. 유연한 확장성을 위한 설계
각 서비스별로 요청을 분기 처리하도록 api/v1/{service}/... 형식으로 설계.
공통 로직은 auth 및 core 모듈에서 관리하여 유지보수성을 높임.
권한 및 역할은 Spring Security의 GrantedAuthority와 RoleHierarchy를 통해 세분화 가능.
이 방식으로 진행하면 요구사항에 맞는 구조를 유지하면서 유연성과 확장성을 확보할 수 있습니다. 추가적인 질문이 있다면 알려주세요!
```

## 관련 노트

- 상위: [[02 - 학습/IT/공부기록/공부기록/SpringBoot/SpringBoot|SpringBoot]]
