---
별칭:
  - "강의 - Spring Security 설정 - springboot"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/73692bab1f0b44f7ad2318852ff4c613
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
  - "[[00 - 대시보드/주제/보안|보안]]"
---

# 강의: Spring Security 설정 - springboot

## 강의 내용

`WebSecirutyConfigureAdapter` WebSecirutyConfigure 를 쉽게 생성할 수 있도록 제공되는 추상 클래스

`MvcMatchersAuthorizedUrl org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer.ExpressionInterceptUrlRegistry.mvcMatchers(HttpMethod method, String... mvcPatterns)`

`mvcMatchers` 를 활용하면 요청 method별로 권한 검사를 실시할 수 있다.

```java
@Override
protected void configure(HttpSecurity http) throws Exception {
	http.authorizeRequests()
	    .mvcMatchers(HttpMethod.GET, "/", "/member/login", "/member/join").permitAll()
	    .mvcMatchers(HttpMethod.POST, "/member/login", "/member/join").permitAll()
	    .antMatchers("/member/detail").hasRole("ROLE_USER")             
	    .anyRequest().authenticated();
}
```

@config.WebSecurityConfig 

```java
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DataSource dataSource;

	@Bean
	public PersistentTokenRepository tokenRepository() {
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}

	
	/**
	 * 클래스레벨에 작성한 @Configuration 하위에서 작동. 
	 * 리턴 객체를 빈으로 등록하는 사용.
	 * id : passwordEncoder 메소드 이름
	 */
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	/**
	 * WebSecurity객체를 통해 인증대상에서 제외될 자원을 설정
	 */
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}

	/**
	 * HttpSecurity객체를 통해 인증/권한, 로그인/로그아웃등을 설정
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/member/**").authenticated()
			.antMatchers("/board/**").hasRole(MemberService.ROLE_USER)
			.antMatchers("/admin/**").hasRole(MemberService.ROLE_ADMIN)
			.antMatchers("/").permitAll();
		
		http.formLogin()
			.loginPage("/member/memberLogin.do")	// GET /login
			.loginProcessingUrl("/member/memberLogin.do") // POST /login
			.usernameParameter("id")
			.passwordParameter("password")
			.defaultSuccessUrl("/")
			.permitAll();
		
		//remember-me 기능 : session timeout이상으로 인증을 유지
		http.rememberMe()
			.key("spring-security-app") // application별 고유문자열
			.tokenValiditySeconds(60 * 60 * 24 * 14) // 14일 기본값
			.tokenRepository(tokenRepository()); // database관련정보 제공
		
		http.logout()
			.logoutUrl("/member/memberLogout.do") // POST
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true);
		
		//접근권한 없음 페이지 연결
		http.exceptionHandling()
			.accessDeniedPage("/error/accessDenied.do");
		
	}

	/**
	 * AuthenticationManagerBuilder객체를 통해
	 * UserDetailsService구현체 빈, 비밀번호 암호화 빈 등록
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberService)
			.passwordEncoder(passwordEncoder());
		
	}
	
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security|Spring Security]]
