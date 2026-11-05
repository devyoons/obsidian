---
별칭:
  - "강의 - Spring Security"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f26716a54a9e4179ba286cf491eb1b20
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
  - "[[00 - 대시보드/주제/보안|보안]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Spring Security

## 강의 내용

- 목차

## Spring Security

Spring Security는 스프링 기반의 어플리케이션 보안을 담당하는 프레임워크.

Spring Security를 사용하면 사용자 인증, 권한, 보안처리를 간단하지만 강력하게 구현 할 수 있다.

Filter 기반으로 동작하기 때문에 Spring MVC와 분리되어 동작한다.

- **인증(Authentication)** 접근한 유저를 식별하고, 애플리케이션에 접근할 수 있는지 검사하는 것
    - **접근 주체(Principal)** 보안 시스템이 작동되고 있는 애플리케이션에 접근하는 유저
    - **Credentials** 특정리소스에 접근하려는 사용자가 인증을 위해 제공하는 비밀번호
- **인가(Authorization)** 인증된 유저가 애플리케이션의 기능을 이용할 수 있는지 검사하는 것.
    - **권한 Authorities** 인증된 유저가 가진 권한 목록

## Spring Security Filter Chain

@web.xml

1. DelegatingFilterProxyRegistrationBean이 DelegatingFilterProxy필터클래스를`springSecurityFilterChain`이라는 이름의 Filter로 등록
    - legacy project에서는 web.xml에서 DelegatingFilterProxy필터 등록시 application-context에 빈으로 등록됨.
2. Servler이전 FilterChain실행중, `springSecurityFilterChain` 에 도달하면, `DelegatingFilterProxy`클래스는 `FilterChainProxy` 클래스에게 처리를 위임.
    - `FilterChainProxy`는 `AuthenticationFilter` 들을 리스트로 보관하고 있는 클래스
    - `FilterChainProxy`의 `AuthenticationFilter`들을 순서대로 실행.

```java
<filter>
		<filter-name>springSecurityFilterChain</filter-name>
		<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
	</filter>
	<filter-mapping>
		<filter-name>springSecurityFilterChain</filter-name>
		<url-pattern>
	</filter-mapping>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/49673b58_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/d7b8f158_Untitled.png]]

### Filter Chain 상세

[The Security Filter Chain](https://docs.spring.io/spring-security/site/docs/3.0.x/reference/security-filter-chain.html)

7.3 Filter Ordering

[[Spring Security] 필터 Filter, SecurityFilterChain 이해하기](https://atin.tistory.com/590)

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/3d65146d_Untitled.png]]

[https://atin.tistory.com/590](https://atin.tistory.com/590) 

1. `ChannelProcessingFilter` because it might need to redirect to a different protocol
2. `*SecurityContextPersistenceFilter`, so a `SecurityContext` can be set up in the `SecurityContextHolder` at the beginning of a web request, and any changes to the `SecurityContext` can be copied to the `HttpSession` when the web request ends (ready for use with the next web request)
    - Authentication객체를 보관하는 SecurityContext객체를 생성해주는 필터
3. `ConcurrentSessionFilter`, because it uses the `SecurityContextHolder` functionality but needs to update the `SessionRegistry` to reflect ongoing requests from the principal
4. Authentication processing mechanisms - `SecurityContextHolder` can be modified to contain a valid `Authentication` request token.
    - `*UsernamePasswordAuthenticationFilter`  `AbstractAuthenticationProcessingFilter` 를 상속.
    - `CasAuthenticationFilter`
    - `BasicAuthenticationFilter`
    - etc
5.  `SecurityContextHolderAwareRequestFilter`, if you are using it to install a Spring Security aware `HttpServletRequestWrapper` into your servlet container
    - HttpServlet 인증 방식에 따라 ServletRequest객체를 재구성하는 필터
6. `RememberMeAuthenticationFilter`, so that if no earlier authentication processing mechanism updated the `SecurityContextHolder`, and the request presents a cookie that enables remember-me services to take place, a suitable remembered `Authentication` object will be put there
7. `AnonymousAuthenticationFilter`, so that if no earlier authentication processing mechanism updated the `SecurityContextHolder`, an anonymous `Authentication` object will be put there
    - 이 필터에 올 때까지 인증 객체가 생성되지 않으면 익명의 사용자가 보낸 것으로 판단하고 처리한다. (Authentication 객체를 새로 생성)
8. `*ExceptionTranslationFilter`, to catch any Spring Security exceptions so that either an HTTP error response can be returned or an appropriate `AuthenticationEntryPoint` can be launched
    - 앞선 필터 처리 과정에서 인증 예외(AuthenticationException) 또는 인가 예외(AccessDeniedException)가 발생한 경우, 해당 예외를 캐치하여 처리하는 필터 (모든 예외를 다 이 필터에서 처리하는 건 아님)
9. `*FilterSecurityInterceptor`, to protect web URIs and raise exceptions when access is denied
    - 인가(Authorization)를 결정하는 AccessDecisionManager에게 접근 권한이 있는지 확인하고 denied인 경우 예외를 던짐.

### 기타 filters

- `WebAsyncManagerIntegrationFilter` 비동기 요청에 대해 Authentication객체를 사용할 수 있도록 처리해주는 필터
- `SessionManagementFilter` 세션 변조 공격 방지 (SessionId를 계속 다르게 변경해서 클라이언트에 내려준다) 유효하지 않은 세션으로 접근했을 때 URL 핸들링.
    - 하나의 세션 아이디로 접속하는 최대 세션 수(동시 접속) 설정
    - 세션 생성 전략 설정
- `HeaderWriterFilter` 응답 Header를 작성하는 필터
- `CsrfFilter` csrf 공격을 방어하는 필터
- `LogoutFilter` 로그아웃 요청을 처리하는 필터
- `RequestCacheAwareFilter` 인증 후, 원래 Request 정보로 재구성하는 필터

[How Spring Security Filter Chain works](https://stackoverflow.com/questions/41480102/how-spring-security-filter-chain-works)

security filter chain은 강력하고, 유연해서 처리할 필터의 종류와 순서를 커스터마이징 할 수 있다.

### Method callstack

예외log callstack에서 호출된 필터를 확인해보자.

- log
    
```
  ...
	java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
	java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
	java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
	java.base/java.lang.reflect.Method.invoke(Method.java:566)
	org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:189)
	org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)
	org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)
	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)
	org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:800)
	org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)
	org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1038)
	org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:942)
	org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1005)
	org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:897)
	javax.servlet.http.HttpServlet.service(HttpServlet.java:634)
	org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:882)
	javax.servlet.http.HttpServlet.service(HttpServlet.java:741)
	org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:320)
	org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:127)
	org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:91)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:119)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:137)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:111)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:170)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.authentication.www.BasicAuthenticationFilter.doFilterInternal(BasicAuthenticationFilter.java:158)
	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.authentication.AbstractAuthenticationProcessingFilter.doFilter(AbstractAuthenticationProcessingFilter.java:200)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:116)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.csrf.CsrfFilter.doFilterInternal(CsrfFilter.java:100)
	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:74)
	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:56)
	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:105)
	org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:334)
	org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:215)
	org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:178)
	org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:357)
	org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:270)
	org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)
	org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)
```


## Authentication

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/096196e7_Untitled.png]]

1. 요청으로 부터 username과 password 추출
2. Username과 password로 Authentication의 구현체인 UsernamePasswordAuthenticationToken 생성 
    - UsernamePasswordAuthenticationToken의 prinipal에는 사용자의 id가, credential에는 password가 대입
3. `AuthenticationManager <<interface>>`의 구현체인 `ProviderManager`에게 인증을 위임
    - `AuthenticationManager` : Authentication 객체를 받아 인증하고 인증이 완료된 객체를 돌려주는 메서드를 구현하도록 하는 인터페이스
    - `ProviderManager` AuthenticationManager의 구현체. 멤버변수로 존재하는 AuthenticationProvider 들에게 인증을 위임하고, 인증 요청을 처리할 수 있는 AuthenticationProvider가 인증에 성공하면 인증이 완료를 알려준다.
    - 인증을 처리할 수 있는지 여부는 AuthenticationProviders의 `support`메서드에 의해 결정된다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/ef18b6d6_Untitled.png]]
    
4. UserDetails 인터페이스를 구현한 사용자vo클래스, UserDetailsService 인터페이스를 구현한 서비스클래스를 필요로한다.

@org.springframework.security.authentication.ProviderManager

<aside>
💡 Open Type in hirerachy`Ctrl + Shift + h` 를 통해 확인해보자.

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/cc1606fe_Untitled.png]]

### 인증 성공/실패 이후 처리

<aside>
💡 `UsernamePasswordAuthenticationFilter` 클래스는  `AbstractAuthenticationProcessingFilter` 를 상속한다.

</aside>

기본적으로는 SecurityContextHolder가 관리하는 SecurityContext(Session, DataBase, Token…)에 Autentication을 저장해두고 필요할 때 사용할 수 있다.

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/aa56ebf4_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/fb8a8afa_Untitled.png]]

principal : 주체 : member

credentials : 비밀번호

authorities : 권한

## 설정

### database 설정

```sql
--======================================
-- spring-security
--======================================
--회원테이블 생성
create table member(
  id varchar2(15),								-- spring-security(필수) principal
  password varchar2(300) not null,						-- spring-security(필수) credential
  name  varchar2(256) not null,
  gender char(1) not null
  birthday date, 
  email varchar2(256), 
  phone char(11)  not null, 
  address varchar2(512),
  hobby varchar2(256),
  enroll_date date default sysdate,
  enabled number default 1,                     		-- spring-security(필수) 회원 활성화 여부
  constraint pk_member_id primary key(member_id),
  constraint ck_member_gender check(gender in ('m','f'))
);

insert into spring.member values ('abcde','1234','아무개','m',to_date('88-01-25','rr-mm-dd'),'abcde@naver.com','01012345678','서울시 강남구','운동,등산,독서',default,default);
insert into spring.member values ('qwerty','1234','김말년','f',to_date('78-02-25','rr-mm-dd'),'qwerty@naver.com','01098765432','서울시 관악구','운동,등산',default,default);
insert into spring.member values ('admin','1234','관리자','f',to_date('90-12-25','rr-mm-dd'),'admin@naver.com','01012345678','서울시 강남구','독서',default,default);

--회원별 복수개의 권한을 관리하는 테이블 authorities
create table authorities(
    id varchar2(20),
    auth varchar2(50), -- ROLE_USER, ROLE_ADMIN, ROLE_SALES, ROLE_HR, ROLE_MANAGER...
    constraint pk_authorities primary key(id, auth),
    constraint fk_authorities_member_id foreign key(id) references member(id)
);

insert into authorities(id, auth) values('abcde', 'ROLE_USER');
insert into authorities(id, auth) values('admin', 'ROLE_USER');
insert into authorities(id, auth) values('admin', 'ROLE_ADMIN');

-- remember-me 관련테이블 persistent_logins
create table persistent_logins (
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null, -- username, password, expiry time 등을 hashing한 값
    last_used timestamp not null
);
```

### security 설정

#### legacy project `xml`

[[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security 설정 - legacy|Spring Security 설정 - legacy]]

#### springboot `@Configuration`

[[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security 설정 - springboot|Spring Security 설정 - springboot]]

### UserDetails

security인증에 사용될 VO클래스는 UserDetails 인터페이스를 직접 구현하거나, User를 상속해 Adapter Pattern으로 처리할 수 있다.

#### 1. 직접 UserDetails interface구현하기

@Member

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member implements Serializable, UserDetails{
	/**
	 * 직렬화/역직렬화
	 * 40BYTE의 객체를 파일입출력단위로 직렬화, 수신측에서 역직렬화시 여러객체를 구분할 고유아이디가 필요하다. 
	 * 없다면, 이후 framework작업에서 에러유발
	 */
	private static final long serialVersionUID = 1L;
	
	private String memberId;
	private String password;
	private String name;
	private String gender;		//PreparedStatement에 setCharacter메소드 없음.
	private Date birthday; 
	private String email;
	private String phone;
	private String address;
	private String[] hobby;
	private Date enrollDate;
	private boolean enabled;	//회원 활성화 여부
	private Set<SimpleGrantedAuthority> authorities;
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getUsername() {
		return memberId;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
}
```

#### 2. User상속한 Adapter클래스 이용

@org.springframework.security.core.userdetails.User

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/2107a6bb_Untitled.png]]

<aside>
💡 UserOnly의 `List<String> authorities`는 User부모생성자 호출시 `Collection<? extends GrantedAuthority>` 으로 변환되어야 한다.
자식 타입  전달되어야 한다.

</aside>

```java
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserOnly implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String password;
	private String name;
	private List<String> authorities;	// 권한을 단순 문자열 list로 보관
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}

@Data
public class UserAdapter extends User
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private UserOnly user;

	public UserAdapter(UserOnly user) {
		super(
			user.getId(), 
			user.getPassword(),
			//List<String> -> List<SimpleGrantedAuthority>로 변환. Collection<? extends GrantedAuthority> 타입 매개변수로 전달.
			user.getAuthorities()
				.stream()
				.map(auth -> new SimpleGrantedAuthority(auth))
				.collect(Collectors.toList())
		);		
		this.user = user;
	}
}
```

### UserDetailsService 구현체

<aside>
💡 Adapter 객체를 사용한다면, 리턴된 user객체를 Adapter객체로 감싸 리턴한다.

</aside>

```java
@Service
@Slf4j
public class SecurityService implements UserDetailsService {

	@Autowired
	SecurityDao securityDao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Member user = securityDao.loadUserByUsername(username);
		log.debug("user = {}", user);

		if(user == null)
            throw new UsernameNotFoundException(username);
        
		return user;
//		return new UserAdapter(user); // adapter객체 사용시
	}

}
```

### mybatis mapper

@src/main/resources/mapper/security/security-mapper.xml

1. member, authorties 테이블에 대한 쿼리 각각 작성
    
```xml
<select id="loadUserByUsername" resultMap="memberMap">
	SELECT
		*
	FROM
		MEMBER
	WHERE
		ID = #{ username }
</select>
<!--
javaType="arraylist"는 생략가능
column속성값은 nestedResultSet에 인수로 전달할 컬럼값이다. parent key로 사용될 컬럼값을 명시한다.
simpleGrantedAuthority는 별도로 typealias 지정할 것
-->
<resultMap id="memberMap" type="member">
	<id column="member_id" property="memberId" />
	<collection property="authorities"
							javaType="arraylist"
							column="member_id"
							ofType="simpleGrantedAuthority"
							select="selectAuthorities" />
</resultMap>

<select id="selectAuthorities" resultMap="simpleGrantedAuthorityMap" >
	SELECT
		*
	FROM
		AUTHORITIES
	WHERE
		MEMBER_ID = #{id}
</select>

<!-- constructor에 대한 처리는 resultMap통해서 할 것. resultType으로 처리불가 -->
<resultMap type="simpleGrantedAuthority"
					 id="simpleGrantedAuthorityMap">
	<constructor>
		<arg column="authority" javaType="string" />
	</constructor>
</resultMap>
```

2. member, authorities 테이블 조인 처리
collection[column_id] 생략가능
    
```xml
<select id="loadUserByUsername" resultMap="memberMap">
	select
		*
	from
		member M
	 left join auth A
		on M.member_id = A.member_id
	where
		M.member_id = #{ username }
</select>

<!-- collection태그를 사용할때 result태그는 생략할 수 없다. -->
<resultMap id="memberMap" type="member">
	<id column="member_id" property="memberId"/>
	<result column="password" property="password"/>
	<result column="name" property="name"/>
	<result column="gender" property="gender"/>
	<result column="birthday" property="birthDay"/>
	<result column="email" property="email"/>
	<result column="phone" property="phone"/>
	<result column="address" property="address"/>
	<result column="hobby" property="hobby"/>
	<result column="enroll_date" property="enrollDate"/>
	<result column="enabled" property="enabled"/>
	<collection property="authorities"
							ofType="simpleGrantedAuthority">
		<constructor>
			<arg column="authority" javaType="string"/>
		</constructor>
	</collection>
</resultMap>
```


## 사용자정보 가져오기

### handler arguments

인증된 사용자 정보를 controller handler에서 다양한 방법으로 가져오기

1. `SecurityContextHolderBean`
    
```java
@GetMapping("/memberDetail.do")
public void memberDetail() {
  //SecurityContextHolder로부터 가져오기
	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	Member principal = (Member) authentication.getPrincipal();
	
	log.debug("authentication = {}", authentication);
	// authentication = org.springframework.security.authentication.UsernamePasswordAuthenticationToken@23abe407: Principal: Member(id=honggd, password=$2a$10$qHHeJGgQ9teamJyIJFXbyOBtl7nIsQ37VP2jrz89dnDA7LgzS.nYi, name=카길동, gender=M, birthday=2021-05-04, email=honggd@naver.com, phone=01012341234, address=서울시 강남구, hobby=[운동,  등산], enrollDate=2021-05-20, authorities=[ROLE_USER], enabled=true); Credentials: [PROTECTED]; Authenticated: true; Details: org.springframework.security.web.authentication.WebAuthenticationDetails@166c8: RemoteIpAddress: 0:0:0:0:0:0:0:1; SessionId: B95C1041773474D93729781512D4490A; Granted Authorities: ROLE_USER
	log.debug("principal = {}", principal);

	Member principal = (Member) authentication.getPrincipal();
	Object credential = authentication.getCredentials();
	Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) authentication.getAuthorities();
	
	log.debug("principal = {}", principal);
	log.debug("credential = {}", credential); // null
	log.debug("authorities = {}", authorities);
	
}
```

2. `Authentication` 타입으로 요청
    
```java
@GetMapping("/memberDetail.do")
public void memberDetail(Authentication authentication) {
	// handler의 매개인자로 authentication객체 요청
	// UsernamePasswordAuthenticationToken
	log.debug("authentication = {}", authentication); 
	
}
```

3. `Principal`타입으로 요청 : Principal은 Authentication이 상속하는 인터페이스이다.
    - `Authentication` 혹은 `UsernamePasswordAuthenticationToken` 으로 형변환 가능
    
```java

@GetMapping("/memberDetail.do")
public void memberDetail(Printcipal principal) {
	UsernamePasswordAuthenticationToken authentication = (UsernamePasswordAuthenticationToken)principal;
	Object _principal = authentication.getPrincipal();
	Member loginMember = (Member)_principal;	
	
}
```

4. `@AuthenticationPrincipal` 인증된 사용자 객체를 직접 요청
    
```xml
<!-- @servlet-context.xml -->

<annotation-driven>
  <argument-resolvers>
		<!-- spring-security @AuthenticationPrincipal DI받기위한 argumentResolver 등록 -->
    <beans:bean class="org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver"/>
  </argument-resolvers>
</annotation-driven>
```

```java
import org.springframework.security.core.annotation.AuthenticationPrincipal 

@GetMapping("/memberDetail.do")
public void memberDetail(@AuthenticationPrincipal Member member) {
	log.debug("member = {}", member);
}
```


### jsp : security-taglibs

jsp에서는 security jstl을 사용해서 인증사용자정보에 손쉽게 접근할 수 있다.

- *hasRole*, *hasAnyRole*
- *hasAuthority*, *hasAnyAuthority*
- *permitAll*, *denyAll*
- *isAnonymous*, *isRememberMe*, *isAuthenticated*, *isFullyAuthenticated*
- *principal*, *authentication*
- *hasPermission*

sec tag를 직접 el안에서 사용할 수 없으므로, `<sec:authentication property="principal" var="principal"/>`와 같이 var 속성으로 변수 선언후 el에서 참조할 수 있다.

```html
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>	
<% 
	/* List.contains메소드를 사용하기 위해 String[] => List로 형변환함.  */
	Member member = 
		(Member) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	System.out.println(member);
	if(member != null){
		String[] hobby = member.getHobby();
		List<String> hobbyList = (hobby != null) ? Arrays.asList(hobby) : null;
		pageContext.setAttribute("hobbyList", hobbyList);		
	}
%>

<div id="update-container">
	<form name="memberUpdateFrm" action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post">
		<input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="id" id="id" value='<sec:authentication property="principal.id"/>' readonly required/>
		<input type="text" class="form-control" placeholder="이름" name="name" id="name" value="<sec:authentication property="principal.name"/>" required/>
		<input type="date" class="form-control" placeholder="생일" name="birthday" id="birthday" value="<sec:authentication property="principal.birthday"/>"/>
		<input type="email" class="form-control" placeholder="이메일" name="email" id="email" value="<sec:authentication property="principal.email"/>" required/>
		<input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="phone" id="phone" maxlength="11" value="<sec:authentication property="principal.phone"/>" required/>
		<input type="text" class="form-control" placeholder="주소" name="address" id="address" value="<sec:authentication property="principal.address"/>"/>
		
		<!-- 인증객체의 principal속성을 pageContext 속성으로 저장 -->
		<sec:authentication property="principal" var="loginMember" />

		<select class="form-control" name="gender" required>
		  <option value="" disabled selected>성별</option>
		  <option value="M" ${principal.gender eq 'M' ? 'selected' : ''}>남</option>
		  <option value="F" ${principal.gender eq 'F' ? 'selected' : ''}>여</option>
		</select>
		<div class="form-check-inline form-check">
			취미 : &nbsp; 
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby0" value="운동" ${hobbyList.contains('운동') ? 'checked' : ''}>
			<label for="hobby0" class="form-check-label" >운동</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby1" value="등산" ${hobbyList.contains('등산') ? 'checked' : ''}>
			<label for="hobby1" class="form-check-label" >등산</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby2" value="독서" ${hobbyList.contains('독서') ? 'checked' : ''}>
			<label for="hobby2" class="form-check-label" >독서</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby3" value="게임" ${hobbyList.contains('게임') ? 'checked' : ''}>
			<label for="hobby3" class="form-check-label" >게임</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="hobby" id="hobby4" value="여행" ${hobbyList.contains('여행') ? 'checked' : ''}>
			<label for="hobby4" class="form-check-label" >여행</label>&nbsp;
		</div>
		<div class="form-check-inline form-check">
			권한 : &nbsp;
			<input type="checkbox" class="form-check-input" name="authority" id="authority1" value="ROLE_USER" <sec:authorize access="hasRole('USER')">checked</sec:authorize>>
			<label for="authority1" class="form-check-label" >일반사용자</label>&nbsp;
			<input type="checkbox" class="form-check-input" name="authority" id="authority2" value="ROLE_ADMIN" <sec:authorize access="hasRole('ADMIN')">checked</sec:authorize>>
			<label for="authority2" class="form-check-label" >관리자</label>&nbsp;
		</div>
		<br />
		<input type="submit" class="btn btn-outline-success" value="수정" >&nbsp;
		<input type="reset" class="btn btn-outline-success" value="취소">
	</form>
</div>

<script>
$(document.memberUpdateFrm).submit((e) => {
	e.preventDefault(); // 제출금지
	
	const csrfHeader = "${_csrf.headerName}";
	const csrfToken = "${_csrf.token}";
	const headers = {};
	headers[csrfHeader] = csrfToken;
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/memberUpdate.do",
		data: $(e.target).serialize(),
		headers,
		method: "POST",
		success(resp){
			console.log(resp);
			// location.reload();
		},
		error: console.log
	});
	
});

</script>
```

## 인증객체 수정하기

@member.controller.MemberController

```java
@PostMapping("/memberUpdate.do")
	public ResponseEntity<?> memberUpdate(@RequestBody Member updateMember, Authentication oldAuthentication){
		log.debug("updateMember = {}", updateMember);
		log.debug("oldAuthentication = {}", oldAuthentication);

		// 1. DB 정보 갱신 (생략)
		
		// 2. Authentication객체 갱신
		Member newPrincipal = (Member) oldAuthentication.getPrincipal();
		newPrincipal.setName(updateMember.getName());
		newPrincipal.setBirthday(updateMember.getBirthday());
		newPrincipal.setEmail(updateMember.getEmail());
		newPrincipal.setPhone(updateMember.getPhone());
		newPrincipal.setAddress(updateMember.getAddress());
		newPrincipal.setGender(updateMember.getGender());
		newPrincipal.setHobby(updateMember.getHobby());
		newPrincipal.setAuthorities((List<SimpleGrantedAuthority>) updateMember.getAuthorities());
		
		Authentication newAuthentication = 
				new UsernamePasswordAuthenticationToken(
						newPrincipal, 
						oldAuthentication.getCredentials(), 
						updateMember.getAuthorities()
				);
		SecurityContextHolder.getContext().setAuthentication(newAuthentication);
		
		// 3. 사용자피드백
		Map<String, Object> map = new HashMap<>();
		map.put("msg", "회원정보 수정 성공!");
		return ResponseEntity.ok(map);
	}
```

## Remember Me

[Remember-Me Authentication](https://docs.spring.io/spring-security/site/docs/3.0.x/reference/remember-me.html#remember-me-persistent-token)

remember-me를 통해 session-timeout시간이상으로 사용자 정보를 관리할수 있다. 인증요청시 `remember-me`값을 전송해야 한다.

```sql
-- remember-me 관련테이블 persistent_logins
create table persistent_logins (
    username varchar2(64) not null,
    series varchar2(64) primary key,
    token varchar2(64) not null, -- username, password, expiry time 등을 hashing한 값
    last_used timestamp not null
);
```

@security-context.xml

```sql
<http auto-config="true"> 		
	<!-- 
		remember-me : session-timeout시간이상으로 사용자 정보를 관리 
		token-validity-seconds : remember-me 토큰 유효시간 60 * 60 * 24 * 14 (초단위)
	-->
	<remember-me
		data-source-ref="dataSource"
		token-validity-seconds="1209600"/>
</http>
```

@memberLogin.jsp

```sql
<form:form
	action="${pageContext.request.contextPath}/member/memberLoginProcess.do"
	method="post">
	...
	<!-- css display: flex -->
	<div class="modal-footer justify-content-between">
		<div>
			<input type="checkbox" class="form-check-input" name="remember-me" id="remember-me"/>
			<label for="remember-me" class="form-check-label">Remember me</label>
		</div>
		<div>
			<button type="submit" class="btn btn-outline-success">로그인</button>
			<button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
		</div>
	</div>
</form:form>
```

로그인후 확인.

<aside>
💡 `JSESSIONID`쿠키를 삭제해도 인증이 유지되는 것을 확인할 수 있다.

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/a38aba59_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/5630ab1e_Untitled.png]]

## 권한 없는 페이지 접근시 처리 사용자화

접근권한이 없는 403응답이 발생한 경우, 지정한 페이지로 이동 처리가능하다.

@security-context.xml

```xml
<http auto-config="true">
	...
	<!-- 권한 없는 페이지 접근시 처리 -->
	<access-denied-handler error-page="/error/accessDenied.do"/>
	
</http>
```

@Controller

```java
@Controller
@Slf4j
public class HomeController {

	@GetMapping("/error/accessDenied.do")
	public void accesDenied() {}
	
}
```

@error/accessDenied.jsp

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류</title>
</head>
<body>
	<h1>접근권한이 없는 페이지입니다.</h1>
	<a href="${pageContext.request.contextPath}">홈으로</a>

</body>
</html>
```

## See Also

[Spring Security Architecture](https://spring.io/guides/topicals/spring-security-architecture)

[[Spring Boot] Spring Security의 동작](https://bamdule.tistory.com/52)

[OKKY | 초보가 이해하는 스프링 시큐리티](https://okky.kr/article/382738)

[spring security 파헤치기 (구조, 인증과정, 설정, 핸들러 및 암호화 예제, @Secured, @AuthenticationPrincipal, taglib)](https://sjh836.tistory.com/165?category=680970)

[Intro to Spring Security Expressions | Baeldung](https://www.baeldung.com/spring-security-expressions)

[Introduction to Spring Security Taglibs | Baeldung](https://www.baeldung.com/spring-security-taglibs)

[Security with Spring | Baeldung](https://www.baeldung.com/security-spring)

[Retrieve User Information in Spring Security | Baeldung](https://www.baeldung.com/get-user-in-spring-security)

[How to reload Spring Security Principal after updating in Hibernate?](https://stackoverflow.com/questions/7889660/how-to-reload-spring-security-principal-after-updating-in-hibernate)

[How to manually set an authenticated user in Spring Security / SpringMVC](https://stackoverflow.com/questions/4664893/how-to-manually-set-an-authenticated-user-in-spring-security-springmvc/4672083#4672083)

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security 설정 - legacy|Spring Security 설정 - legacy]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security 설정 - springboot|Spring Security 설정 - springboot]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
