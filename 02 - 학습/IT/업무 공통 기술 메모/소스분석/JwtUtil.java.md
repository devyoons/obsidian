---
별칭:
  - "학습 - JwtUtil.java"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/f1b2fa654d8946d9bf2395298f20ee0f
---

# 학습: JwtUtil.java

## 세부 내용

```java
package com.awasoft.safety.fsms.config.web.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.ToString;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@ToString
@Component
public class JwtUtil {
    
    @Value("${jwt.token.secret-key}")
    private String secretKey;
    @Value("${jwt.token.expTime}")
    private long expirationTime;
    @Value("${jwt.token.issuer}")
    private String issuer;

    public String createToken(String userId, String view){
        Claims claims = Jwts.claims();
        claims.put("userId", userId);
        switch (view) {
            case "push":
                //알람
                claims.put("roles", List.of("ROLE_ADMIN"));
                break;
            case "approval":
                //출근승인
                claims.put("roles", List.of("ROLE_ATTEND"));
                break;
        }
        
        LocalDateTime currentTime = LocalDateTime.now();
        
        return Jwts.builder()
                .setClaims(claims)
                .setIssuer(issuer)
                .setIssuedAt(Date.from(currentTime.atZone(ZoneId.systemDefault()).toInstant()))
                .setExpiration(Date.from(currentTime.plusMinutes(expirationTime)
                        .atZone(ZoneId.systemDefault()).toInstant()))
                .signWith(SignatureAlgorithm.HS512, secretKey)
                .compact();
    }
}
```

- JSON Web Token을 생성하는 JwtUtil 클래스
    - 사용자 인증과 권한 부여에 사용
- 어노테이션
    - `@ToString`
        - Lombok 라이브러리에서 제공하는 기능
        - 해당 클래스의 toString()메서드 자동생성해 객체의 내용을 쉽게 확인할 수 있음
    - `@Component`
        - Spring Framework에서 사용되는 것
        - 해당 클래스를 Spring의 빈(Bean)으로 등록하라는 의미
        - Spring컨테이너가 해당 클래스의 인스턴스를 생성하고 관리할 수 있음
    - `@Value`
        - 외부 설정 파일 (application.properties 또는 application.yml)에서 값을 읽어온다.
            - 각 변수는 JWT 생성에 필요한 정보들을 담고 있다.
        
        ```java
        jwt:
          token:
            secret-key: "awasoft-2022-01-19-secret"
            expTime: 30
            issuer: "awasoft"
        ```
        
        - **`secretKey`**: JWT를 암호화하기 위한 비밀 키를 저장합니다.
        - **`expirationTime`**: 생성된 JWT의 만료 시간을 설정합니다. 해당 시간이 지나면 JWT는 더 이상 유효하지 않습니다.
        - **`issuer`**: JWT의 발급자(issuer) 정보를 저장합니다. JWT의 발급자는 클레임 중에 하나로, 해당 토큰을 발급한 서비스 또는 애플리케이션의 정보를 나타냅니다.
- **`createToken`** 메서드
    - 사용자 ID와 view 정보를 입력으로 받아 JWT를 생성하는 기능을 수행
    - 메서드 내에서는 JWT의 클레임(claims)을 설정하고, 토큰의 발급 시간과 만료 시간을 지정한다.
    - **`Jwts.builder()`**를 사용하여 JWT를 생성하고, **`signWith`** 메서드를 사용하여 비밀 키를 사용하여 JWT를 서명합니다. 최종적으로 서명된 JWT를 문자열로 반환합니다.
- 이렇게 생성된 JWT는 클라이언트 측에서 인증에 사용되거나 서버 측에서 권한 부여를 위해 활용될 수 있습니다.

#### JWT( JSON Web Token)에서 "claims"란

"클레임(claims)"은 JWT에 포함되는 정보를 나타내는 데이터 조각입니다. JWT는 사용자 인증과 권한 관리를 위해 사용되며, 이를 위해 필요한 정보들을 클레임으로 표현하여 토큰에 담습니다. 클레임은 key-value 쌍으로 이루어져 있으며, 클레임의 종류에 따라 내용이 다를 수 있습니다.

JWT는 세 가지 종류의 클레임을 가지고 있습니다:

1. 등록된 클레임(Registered Claims): 이러한 클레임은 JWT에서 미리 정의된 몇 가지 표준 클레임으로, 선택적으로 사용할 수 있습니다. 토큰의 정보를 간단하게 표현하는데 사용됩니다. 예를 들면 다음과 같습니다.
    - **`iss`**: 토큰의 발급자(issuer) 정보
    - **`sub`**: 토큰의 주제(subject), 일반적으로 사용자 ID 등이 될 수 있음
    - **`aud`**: 토큰의 대상자(audience), 토큰을 사용할 수신자
    - **`exp`**: 토큰의 만료 시간(expiration time)
    - **`iat`**: 토큰의 발급 시간(issued at time)
    - **`nbf`**: 토큰의 사용 가능 시간(not before)
    등등
2. 공개 클레임(Public Claims): 이러한 클레임은 충돌을 피하기 위해 사용자가 직접 정의하는 클레임입니다. 하지만 이러한 클레임들은 표준이 아니기 때문에 충돌에 주의해야 합니다.
3. 비공개 클레임(Private Claims): 이러한 클레임은 서버와 클라이언트 간에 합의된 정보를 담습니다. 서버와 클라이언트 사이에 공유되어야 할 사용자 지정 데이터를 포함할 수 있습니다.

클레임은 JWT의 페이로드(payload) 부분에 JSON 형식으로 담겨져 있으며, 암호화되지 않기 때문에 클레임에 민감한 정보를 포함해서는 안됩니다. JWT는 서명(Signature)을 통해 검증되기 때문에 누구나 클레임의 내용을 읽을 수 있습니다. 따라서 중요한 정보는 서버 측에서 따로 보관되어야 합니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
