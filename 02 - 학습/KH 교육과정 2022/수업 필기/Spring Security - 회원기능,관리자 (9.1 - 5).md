---
별칭:
  - "강의 - Spring Security : 회원기능,관리자 (#9.1 - 5)"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f0ef30e9d6564037921b224786a04d13
---

# 강의: Spring Security : 회원기능,관리자 (#9.1 - 5)

## 강의 내용

---

---

> **스프링 흐름~**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fb9dfd64_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7a90ca24_Untitled.png]]

- 로그인, 로그아웃, 등 사용만들지 않아도 시큐리티가 다 해줌
    - GET 방식 페이지 연결하는건 필요함
    - 권한 있는 사용자 필터링도 해줌.
- 여지껏 만들었던 member 컨트롤러 사용안할 예정

## 1. 스프링 시큐리티

#### 1 - 1. **Spring Security란?**

---

Spring Security는 Spring기반의 어플리케이션의 보안(인증과 권한을 담당하는 프레임워크이다.)

**Spring Security는 Filter기반으로 동작**한다.

Filter는 Dispatcher Servlet으로 가기전에 적용되므로 가장 먼저 URL의 요청을 받지만, Interceptor는 Dispatcher와 Controller사이에 위치한다.

<aside>
📌 **쉬운설명** 
스프링 시큐리티는 특정 사이트로 들어오는 접근을 가로채서 로그인이 되어있는지 등을 검증한 다음 로직을 실행시켜주는 구조입니다. 원래 JSP에서는 "필터"를 이용해서 구현 가능했지만 스프링에서는 빈 컨테이너에서 관련 자원들을 같이 관리하기 떄문에 이미 작성된 빈들을 연계한 여러가지 인증 방식을 쉽고 간편하지만 복잡한 구조로 관리할 수 있습니다.

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b81e0e44_Untitled.png]]

- 인증(Authentication): 해당 사용자가 본인이 맞는지를 확인하는 절차
- 인가(Authorization): 인증된 사용자가 요청한 자원에 접근 가능한지를 결정하는 절차
- Principal(접근 주체): 보호받는 Resource에 접근하는 대상
- Credential(비밀번호): Resource에 접근하는 대상의 비밀번호

Http Body에 username과 password를 가져오면

AuthenticationFilter를 거쳐 username과 password로 UsernamePasswordAuthenticationToken을 만든다.

AuthenticationManager가 토큰을 받아서 Authentication 객체를 만든다.

Authentication을 어떻게 만드냐면 UsernamePasswordAuthenticationToken를 UserDetailsService로 던지고 username을 가지고 DB에서 해당 유저가 있는지 확인후 있으면 Authentication을 만든다.

### 1 - 2. Security 관련 의존 설정 [#9.1 - 2]

---

- 이전 수업내용까지 작성한 부분들이다.

<aside>
📌 #9.1 시큐리티는 전역에서 관리되어야 하므로 root-context에 설정

</aside>

- **#9. pom.xml : 시큐리티 관련의존 dependency 추가**
    - **시큐리티가 제공하는 JSTL**
    
    ```java
    <properties>
    	<java-version>1.8</java-version>
    	<org.springframework-version>5.1.5.RELEASE</org.springframework-version>
    	<org.springframework.security-version>5.1.5.RELEASE</org.springframework.security-version>
    	<org.aspectj-version>1.6.10</org.aspectj-version>
    	<org.slf4j-version>1.6.6</org.slf4j-version>
    </properties>
    
    <!-- #9. spring-security관련 의존 -->
    <!-- 필수 core/web/config --> 
    <dependency>
    	<groupId>org.springframework.security</groupId>
    	<artifactId>spring-security-core</artifactId>
          <version>${org.springframework.security-version}</version>		
    </dependency>
    <dependency>
    	<groupId>org.springframework.security</groupId>
    	<artifactId>spring-security-web</artifactId>
          <version>${org.springframework.security-version}</version>		
    </dependency>
    <dependency>
    	<groupId>org.springframework.security</groupId>
    	<artifactId>spring-security-config</artifactId>
          <version>${org.springframework.security-version}</version>		
    </dependency>
    <dependency>
          <groupId>org.springframework.security</groupId>
          <artifactId>spring-security-taglibs</artifactId>
          <version>${org.springframework.security-version}</version>		
    </dependency>
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-test</artifactId>
        <version>${org.springframework.security-version}</version>		
    </dependency>
    ```
    
- **#9.1. web.xml : root-context에 security-context.xml 설정파일 추가**
    
    ```java
    <context-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
    		/WEB-INF/spring/root-context.xml
    		/WEB-INF/spring/security-context.xml 
    	</param-value>
    	<!-- <param-value>/WEB-INF/spring/*-context.xml</param-value> -->
    </context-param>
    ```
    
- **#9.2. security-context.xml : 비밀번호 암호화처리에 사용할 메소드를 가진 클래스 추가**
    - member 클래스에 UserDetails를 inplements해야함
    - 권한 관리하는 객체
    - 오버라이드 5개
    
    ```java
    <?xml version="1.0" encoding="UTF-8"?>
    <beans:beans xmlns="http://www.springframework.org/schema/security"
    	xmlns:beans="http://www.springframework.org/schema/beans"
    	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    	xmlns:context="http://www.springframework.org/schema/context"
    	xsi:schemaLocation="http://www.springframework.org/schema/security http://www.springframework.org/schema/security/spring-security-4.2.xsd
    		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
    		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
    
    <!-- #9.2. bcryptPasswordEncoder빈 등록 -->
    <beans:bean id="bcryptPasswordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"/>
    ```
    

#### 1 - 2 - 1. 시큐리티 jstl 사용하기! `sec` | `form`  [#9] (lib 추가)

---

1. **header.jsp 태그 추가하기** 
    - `sec`, `form` 태그라이브러리 uri 추가하기!
        - 이 태그 uri가 아래 spring-security-taglivs-5.1.5.RELEASE.jar 안에 security.tld 내용을 가리킴. 근데 멍청해서 제대로 참조를 못함
        
        ```java
        <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        ```
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5a02eb33_Untitled.png]]
        
        package Explorer → Maven Dependencies → spring-security-taglivs-5.1.5.RELEASE.jar
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/dd5c996b_Untitled.png]]
        
    
2. **🙀 maven libarary를 참조하지 못하는 고질병으로 인한 jar파일 lib 폴더 하위에 추가해주기**
    - src/main/webapp/WEB-INF/lib
        - 직접 참조하도록 .jar 파일을 lib파일에 넣어준다.
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d5e623f1_Untitled.png]]
        
        C:\Users\chlqk\.m2\repository\org\springframework\security\spring-security-taglibs\5.1.5.RELEASE
        
    

> **사용해야하는 이유**
> 

<aside>
📌 페이지 내에서 로그인한 회원과 로그인 하지 않은 회원에게 보여줄 내용이 다를 때 사용하는 태그로 쉽게 구현이 가능하다

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7d859bd8_Untitled.png]]

> **권한에 따른 조건문**
> 

```java
<!-- 표현식이 지정한 권한에 맞을 때만 출력 -->
<sec:authorize access="isAnonymous()">
   로그인
   회원가입
</sec:authorize>

<sec:authorize access="isAuthenticated()">
   로그아웃
   회원정보보기
</sec:authorize>

<sec:authorize access="hasRole('admin')">
  관리자 페이지
</sec:authorize>
```

> **표현식**
> 

| `hasRole('role')` | 해당 권한이 있을 경우  |
| --- | --- |
| `hasAnyRole(’role1’,’role2’)` | 포함된 권한 중 하나라도 있을 경우 |
| `isAuthenticated()` | 권한에 관계없이 로그인 인증을 받은 경우 |
| `isFullyAuthenticated()` | 권한에 관계없이 인증에 성공했고, 자동 로그인이 비활성인 경우 |
| `isAnonymous()` | 권한이 없는 익명의 사용자일 경우 |
| `isRememberMe()` | 자동 로그인을 사용하는 경우 |
| `permitAll` | 모든 경우 출력함 |
| `denyAll` | 모든 경우 출력하지 않음 |

### 1 - 3. Security Filter 등록 및 인증/권한 설정 [#9.3-4]

---

- **#9.3 web.xml : Security Filter 등록 [** 🙀**security의 진짜 시작은 여기서부터]**
 👉🏻 **시큐리티에는 많은 필터가 있는데 그걸 묶어서 관리하는 클래스를 추가하는 작업이다. 전역에 등록해놔야함**
    
    <aside>
    📌 **시큐리티를 사용하지 않을 때 이 부분만 주석하면 작동하지 않는다. project땐 적용하기**
    
    </aside>
    
    ```xml
    <filter>
    	<filter-name>springSecurityFilterChain</filter-name>
    	<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
    </filter>
    <filter-mapping>
    	<filter-name>springSecurityFilterChain</filter-name>
    	<url-pattern>/*</url-pattern> <!-- 모든 요청에 대해서 필터를 거쳐가게 함 -->
    </filter-mapping>
    ```
    
- **#9.4. 인증/권한 설정 security-context.xml**
    - 📢 **security 네임스페이스 설정하기!!**
        - 해당 xml에서는 bean보다 security를 더 많이 사용할 예정이라 기본 네임스페이스를 변해주는게 편하다.
            1. Namespaces에서 security를 추가해준다. 
                
                ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/cb454a92_Untitled.png]]
                
            2. 폴더 상위 내용을 변경해준다.
                - 추가된 시큐리티를 상위로 올려서 기본네임스페이스로 지정해준다.
                - 기본 네임스페이스였던 beans는 이제 알아서 쓰라고 태그설정
                - `schemaLocation` : 표시된 버전을 변경하기 `5.1` → `4.2`
                - 하위에 작성됐던 bean관련 태그들은 `beans/beans` 혹은 `beans/bean` 로 변경
            
            ```xml
            기본 네임스페이스 변경
            - 버전 확인
            <?xml version="1.0" encoding="UTF-8"?>
            <beans:beans 
            	xmlns="http://www.springframework.org/schema/security" 
            	xmlns:beans="http://www.springframework.org/schema/beans"
            	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            	xsi:schemaLocation="
            					http://www.springframework.org/schema/security 
            					http://www.springframework.org/schema/security/spring-security-4.2.xsd
            					http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd">
            ```
            
        
    
    ### 1. isAuthenticated() **: 인증받은 사용자만 모든 페이지에 접근할 수 있는 태그**
    
    ---
    
    - 단어뜻모음
        
        `isAuthenticated` :인증됨 
        
        `intercept` :가로채다
        
        `permit` : 허용하다
        
        `isAnonymous` : 익명이에요
        
        `isAuthenticated` : 인증됨
        
        `hasRole` : 역할
        
        `Forbidden` : 금지됐다
        
    
    `isAuthenticated()` : 현재 사용자가 로그인된 사용자라면 true를 반환합니다.
    
    ```java
    <http auto-config="true"> <!-- 귀찮은 설정들을 한번에 해주니까 해두기 -->
    	<intercept-url pattern="/**" access="isAuthenticated()"/>
    </http>
    ```
    
    ### 1-2. secutiry=”none” : 검사하지 마라! (파일, 비회원 접근 가능 페이지)
    
    ---
    
    - 📢 **static자원** **css | image | js 는 시큐리티 설정을 해제해야한다!!!**
        - auto-config 태그 위로 작성해주면 됀다.
        
        ```java
        <security:http pattern="/**/*.js" security="none" />
        <security:http pattern="/**/*.css" security="none" />
        <security:http pattern="/images/**" security="none" />
        ----------------<http auto-config="true">--------------
        ```
        
        ```java
        <http security="none" pattern="/resources/**"/>
        ----------------<http auto-config="true">--------------
        ```
        
    
    - `http` : 여러개 사용가능
    - http 하위에 `intercept-url` : 여러개 사용가능
        
        
        | `permitAll` | 모두 접근 가능 (항상 true) |
        | --- | --- |
        | `isAnonymous()` | 현재 사용자가 비회원사용자이면 true를 반환 |
        | `isAuthenticated()` | 로그인 정보 기억이 아니라 id/pw를 입력하여 로그인 했다면 true |
        | `hasRole(['role'])` | - 현재 로그인된 사용자가 지정된 role을 가지고 있으면 true를 반환
        - 제공된 role이 ‘ROLE_’로 시작하지 않으면 기본적으로 ‘ROLE_’을 추가
        - 이것은 DefaultWebSecurityExpressionHanfler에서 defaultRolePrefix를 수정하여 커스터마이즈 가능 |
    
    📌 [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security - 회원기능,관리자 (9.1 - 5)|이 설정을 하면서 아래에 매니저도 추가해줘야함! (2. **Authentication Manager)**]]
    
    - 위에서 아래로 검사하기 때문에 특별한게 위로 ( ex: /index.jsp |  /admin/** )
        - 실무앱을 보면 권한만 수백개….. 별도 관리가 필요한 부분
    - 일반적인게 아래로
    - `http` : `HttpSecurity`
    
    ```java
    <http auto-config="true">
    		<intercept-url pattern="/" access="permitAll"/>
    		<intercept-url pattern="/index.jsp" access="permitAll"/>
    		<intercept-url pattern="/admin/**" access="hasRole('ADMIN')"/>
    		<intercept-url pattern="/member/memberEnroll.do" access="isAnonymous()"/>
    		<intercept-url pattern="/member/memberLogin.do" access="isAnonymous()"/>
    		<intercept-url pattern="/member/checkIdDuplicate.do" access="isAnonymous()"/>
    		<intercept-url pattern="/board/boardList.do" access="permitAll"/>
    		<intercept-url pattern="/board/boardDetail.do" access="permitAll"/>
    		
    		<intercept-url pattern="/**" access="isAuthenticated()"/>
    	</http>
    ```
    
    `403 : Forbidden (금지됐다)` 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/31dbd519_Untitled.png]]
    
    - 위 intercept를 통해 제한된 상태로 설정된 페이지로 가려고 한다면 뜨는 오류!
    
    ### 2. **Authentication Manager : 위 인증을 처리할 매니저가 필요**
    
    ---
    
    - **메모리상 사용자를 등록하고 인증해보기**
        
        ```java
        <authentication-manager>
        	<authentication-provider>
        		<password-encoder ref="bcryptPasswordEncoder"/>		
        		<user-service>
        			<user 
        				name="honggd"
        				password="$2a$10$oDUuqgA16JOHn39iSwq.GeIYzPvj5MyjlA01buPbC6K.ikxFobXGi"
        			 	authorities="ROLE_USER"/>
        			<user 
        				name="sinsa"
        				password="$2a$10$oDUuqgA16JOHn39iSwq.GeIYzPvj5MyjlA01buPbC6K.ikxFobXGi"
        			 	authorities="ROLE_USER, ROLE_ADMIN"/>
        		</user-service>	
        	</authentication-provider> 
        </authentication-manager>
        ```
        
    
    **DB 회원인증**
    
    ```java
    <authentication-manager>
    	<authentication-provider user-service-ref="securityService">
    		<password-encoder ref="bcryptPasswordEncoder"/>
    	</authentication-provider>
    </authentication-manager>
    ```
    
    - oauth 규격을 따름.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/464c04ae_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/17f47b99_Untitled.png]]
    

## 2. 커스텀 로그인 & 로그아웃 페이지 만들기

### 2 - 1. 로그인 & 로그아웃 커스텀 페이지

---

스프링 시큐리티에서는 기본적인 로그인 페이지를 제공한다.

하지만 로그인 페이지를 예쁘게 꾸미고 싶다면 로그인 페이지를 직접 만들고 시큐리티 설정을 바꿔야 한다.

#### 2 - 1 - 1. 로그인관련 설정

---

> **표현식**
> 

| login-page | 로그인 페이지 주소를 지정
- GET방식 로그인폼페이지 요청(핸들러 작성필요) |
| --- | --- |
| username-parameter | 로그인 페이지 form에 있는 username을 저장한 변수이름 지정 |
| password-parameter | 로그인 페이지 form에 있는 password을 저장한 변수이름 지정 |
| login-processing-url | 로그인 페이지 form action에 입력할 주소 지정
- POST방식 로그인처리 요청(핸들러 작성 불필요) |
| default-target-url | 로그인 성공인 경우 호출할 주소 지정 |
| authentication-failure-url | 로그인 실패인 경우 호출할 주소 지정 |
| logout-url | 로그아웃을 요청할 경로이고 기본값은 /logout
- 사용자가 원하는 경로를 지정할 수 있으며 기본적으로 POST methode로 요청할 수 있고 csrf가 적용되어있다. |
| logout-success-url | 로그아웃이 처리된 후 이동될 경로이고 기본값은 /login?logout이다. 사용자가 임의로 지정할 수 있다. |
| delete-cookies | 로그아웃시 제거할 쿠키이름을 지정한다. (JSESSIONOD) |
- 중복 로그인을 방지하기 위한 설정
    
    
    | max-sessions | 중복 로그인이 가능한 세션수/1 로 지정해야 중복 로그인을 방지 |
    | --- | --- |
    | expired-url | 중복 로그인 발생시, 먼저 로그인한 세션이 끊어지고 끊어진 상태에서 모든 url을 호출할 경우 끊어진 원인을 알려줄 주소를 지정 |
    | error-if-maximum-exceeded | 원래는 먼저 로그인한 사용자의 세션이 끊어지지만 true로 설정할 경우 첫번재 로그인이 아닌 세션이 살아 있는 상태에서의 로그인은 거부된다. |
    
    ```java
    <session-management>
    	<concurrency-control max-sessions="1" expired-url="/login_duplicate"/>
    </session-management>
    ```
    

커스터마이징을 위한  security-context.xml 를 다음과 같이 바꿔야함.

```xml
<http auto-config="true">
				... 생략
<intercept-url pattern="/**" access="isAuthenticated()"/>

<!-- 
	login-page GET방식 로그인폼페이지 요청(핸들러 작성필요)
	login-processing-url POST방식 로그인처리 요청(핸들러 작성 불필요)
	authentication-success-forward-url 로그인 후에 (핸들러 작성)
 -->
<form-login
	login-page="/member/memberLogin.do"
	login-processing-url="/member/memberLogin.do"
	username-parameter="memberId"
	password-parameter="password"/>

<!-- 
	logout-url POST logout요청 (핸들러 작성 불필요)
	- 설정 주소로가면 로그아웃하면서 세션정보 삭제
	success-handler-ref 로그아웃 성공시 후처리
 -->
<logout 
	logout-url="/member/memberLogout.do" 
	logout-success-url="/"/>
	
<!-- 
	disabled="true" csrf공격 대비 기능 사용안함
	csrf : cross site request forgery공격 (악성코드를 통해 권한있는 사용자의 폼제출 유도) 
	모든 POST방식의 폼제출에 csrf공격대비 토큰 검증
 -->			
<csrf disabled="false"/>

</http>
```

- 토큰값을 비교하지 않게하려면 true로 하면되는데 추천하지 않음
- 로그아웃이 post 요청이라 주소창에서는 작동하지 않음.
- 시큐리티는 csrf 설정이 되어있고 이게 기본적으로 켜져있음

`csrf` : cross site request forgery공격 

- 악성코드를 통해 권한 있는 사용자의 폼 제출 유도하는 공격
    - ~ 의 비밀번호를 변경해주세요
- 모든 POST방식의 폼제출에 csrf공격대비 토큰 검증

#### 2 - 1 - 2. 로그아웃 방법 2가지

---

1. `form:form` 태그
    
    <aside>
    📌 기존 **로그아웃**은 GET방식으로 했는데 **csrf토큰 인증을 위해 POST방식으로 폼제출**을 해야함! `<form:form method=”POST”>`
    
    </aside>
    
2. 직접 토큰 값 받기 
    - csrf 토큰을 동적으로 생성해주는데 이때 `div` 로 감싸있음
    - `div` 빼고 주세요~ 가 안돼니까 토큰을 직접 넣는 방법도 있음!!
    
    ```html
    <form action="${pageContext.request.contextPath}/member/memberLogout.do" method="post">
    	<button 
      	class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />			    	
    </form>
    ```
    

### 2 - 2. **토큰 보내주는 방법 (csrf : 공격대비 토큰검증) → lib추가**

#### XSS는 공격대상이 Client이고, CSRF는 Server이다.

XSS은 사용자가 특정 웹사이트를 신용하는 점을 노린 것이라면,

CSRF는 특정 웹사이트가 사용자의 웹 브라우저를 신용하는 상태를 노린것!

- 토큰을 동적으로 뿌려주는 기능이 이미 스프링 폼태그에 있음!
1. 로그인.jsp 에 taglib 추가
    
    ```java
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    ```
    
2. lib 하위에 추가해주기
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6abb4539_Untitled.png]]
    
    C:\Users\chlqk\.m2\repository\org\springframework\spring-webmvc\5.1.5.RELEASE
    
- `form` 태그를 `form:form`태그로 변환해서 사용 (ex. 로그인.jsp예시사진)
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7f61cec5_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/93610cca_Untitled.png]]
    
    hidden으로 토큰값을 동적으로 생성해줌!
    

header.jsp 토큰 넣기 

1. 태그라이브러리 추가

```java
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
```

1. 폼에 폼태그로 로그아웃 버튼을 GET에서 post 로 변경 

혹은, 명시적으로 토큰값을 받으면 됀다.

```java
<form:form action="${pageContext.request.contextPath}/member/memberLogout.do" method="post">
<button 
	class="btn btn-outline-success my-2 my-sm-0" type="submit">로그아웃</button>
	<input type="hidden" name="${_csrf.parameterName }" value="_csrf.token" />
</form:form>
```

### 2 - 3. 로그인 실패시 ?.error

---

실패시 스큐리티가 “`?error`”가 붙은 페이지로 이동하게 됀다. 

이걸 이용하여 작성해주면 됌

```java
<c:if test="${param.error != null}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <span class="text-danger">아이디 또는 비밀번호가 일치하지 않습니다.</span>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
</c:if>
```

## 3. DB데이터로 로그인

### 3 - 1. 회원 + 권한테이블추가

---

- 기존 회원권한 테이블이 없었을 땐 회원정보만 insert했었음
- 이제는 회원등록시 회원정보와 권한을 트랜잭션처리

#### 3 - 1 - 1. 회원등록

---

- Service 구현체
    
    ```java
    // serviceImpl
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertMember(Member member) {
    	int result = memberDao.insertMember(member);
    	Map<String, Object> map = new HashMap<>();
    	map.put("memberId", member.getMemberId());
    	map.put("auth", MemberService.ROLE_USER); // 상수로 관리
    	result = memberDao.insertAuthority(member); // ROLE_USER
    	return result;
    }
    ```
    
- mapper
    
    ```java
    // mapper
    <insert id="insertMember">
    	insert into 
    		member 
    	values (
    		#{memberId},
    		#{password},
    		#{name},
    		#{gender},
    		#{birthday},
    		#{email},
    		#{phone},
    		#{address},
    		#{hobby},
    		default, 
    		null, 
    		default)
    </insert>
    <insert id="insertAuthority">
    	insert into 
    		authority
    	values(
    		#{memberId}, #{auth})	
    </insert>
    ```
    

#### 3 - 1 - 2. 회원권한 + 회원정보 관련 DTO

---

- 단어뜻
    
    `SimpleGrantedAuthority` : 단순 부여권한
    
    `authority` : 권한
    

- **Member**클래스가 **MemberEntity**클래스를 상속
    - Member.java
        
        ```java
        @Data
        @NoArgsConstructor
        @ToString(callSuper = true)
        public class Member extends MemberEntity implements UserDetails {
        
        	List<SimpleGrantedAuthority> authorities;
        	
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
        
    - MemberEntity.java
        - 자식클래스에서 자유롭게 접근할 수 있도록 protected 접근제한자사용
            - 자식에서 getter 아니고 직접 참조 가능
        
        ```java
        @Data
        @NoArgsConstructor
        @AllArgsConstructor
        @RequiredArgsConstructor
        public class MemberEntity {
        
        	@NonNull
        	protected String memberId;
        	@NonNull
        	protected String password;
        	@NonNull
        	protected String name;
        	protected Gender gender;
        	@DateTimeFormat(pattern = "yyyy-MM-dd")
        	protected LocalDate birthday;
        	protected String email;
        	@NonNull
        	protected String phone;
        	protected String address;
        	protected String[] hobby;
        	protected LocalDateTime createdAt;
        	protected LocalDateTime updatedAt;
        	protected boolean enabled;
        	
        }
        ```
        
    
- **Member** 클래스에서 `UserDetails` 인터페이스를 구현
    - `getAuthorities()` : 사용자가 가지고 있을 하나이상의 권한을 달라
        - DB에서 반환하는 “`ROLE_USER`”,”`ROLE_ADMIN`” 권한을 `SimpleGrantedAuthority` 의  `authorities` 객체로 만들어서 관리할 예정
        - `GrantedAuthority`의 자식 클래스 `SimpleGrantedAuthority`
        - `SimpleGrantedAuthority` : 문자열로 관리
        
        ```java
        // 하나이상의 권한을 관리할 필드를 제공해주면 됨.
        List<SimpleGrantedAuthority> authorities; 
        	
        	@Override
        	public Collection<? extends GrantedAuthority> getAuthorities() {
        		return authorities;
        	}
        ```
        
    - `getUsername()` : 유저네임 달라
        - 우리가 사용하는 유저의 네임값을 return해주면 됌!
    - `isAccountNonExpired()` : 계정이 만료되지 않았니? → true 아니다! 만료되지 않았다
    - `isAccountNonLocked()` : 계정이 잠기지 않았니? → true 아니다! 잠기지 않았다
    - `isCredentialsNonExpired()` : 비밀번호 유효기간이 만료되지 않았니? → true 아니다! 유효하다
    
    > **시큐리티가 요구하는 4가지**
    > 
    > - memberId -> principal.username
    > - password -> credential
    > - authorities
    > - enabled
    

#### 3 - 2 - 3. Service 관련 설정

---

- SecurityService.java
    - UserDetailsService 인터페이스 구현
    - Override할 메서드는 하나 `loadUserByUsername`
        - 시큐리티가 호출할 수 있도록 준비만 해주는거임
    - 유저가 없다면 시큐리티한테 알려줘야함
        - `UsernameNotFoundException`
    
    ```java
    @Service
    @Slf4j
    public class SecurityService implements UserDetailsService {
    
    	@Autowired
    	SecurityDao securityDao;
    	
    	@Override
    	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    		log.debug("username = {}", username);
    		Member member = securityDao.loadUserByUsername(username);
    		log.debug("member = {}", member);
    		if(member == null) // 조회될 유저가 없다면 꼭 UsernameNotFoundException를 던져줘야함.
    			throw new UsernameNotFoundException(username);
    		return member;
    	}
    
    }
    ```
    
- security-mapper.xml
    - Member에 `authorities`에 추가할 내용
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3eec96ac_Untitled.png]]
    
    - setAuthorities → `property="authorities"`
    - `ofType="simpleGrantedAuthority"` : collection의 제일 중요한 속성 → 한행한행이 뭐냐
        - 별칭등록 필수!
    - `arg column="auth"` : DB컬럼명
    - `javaType="string"` : 타입 반드시 작성
    
    ```xml
    <?xml version="1.0" encoding="UTF-8" ?>
    <!DOCTYPE mapper
      PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
      "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
    <mapper namespace="com.kh.security.model.dao.SecurityDao">
    
    	<select id="loadUserByUsername" resultMap="memberMap">
    		select
    		    *
    		from
    		    member m join authority a
    		        on m.member_id = a.member_id
    		where
    		    m.member_id = #{username}
    	</select>
    	
    	<resultMap type="member" id="memberMap">
    		<id column="member_id" property="memberId"/>
    		<result column="password" property="password"/>
    		<result column="name" property="name"/>
    		<result column="gender" property="gender"/>
    		<result column="birthday" property="birthday"/>
    		<result column="email" property="email"/>
    		<result column="phone" property="phone"/>
    		<result column="address" property="address"/>
    		<result column="hobby" property="hobby"/>
    		<result column="created_at" property="createdAt"/>
    		<result column="updated_at" property="updatedAt"/>
    		<result column="enabled" property="enabled"/>
    		<collection property="authorities" ofType="simpleGrantedAuthority">
    			<constructor>
    				<arg column="auth" javaType="string"/>
    			</constructor>
    		</collection>
    	</resultMap>
    </mapper>
    ```
    

#### 3 - 2 - 4. security-mapper 별칭 등록

---

1. src/main/resources/mybatis-config.xml 별칭등록하기
    
    ```xml
    <typeAliases>
    	<typeAlias 
    		type="org.springframework.security.core.authority.SimpleGrantedAuthority" 
    		alias="simpleGrantedAuthority"/>
    	<package name="com.kh.spring"/>
    </typeAliases>
    ```
    
2. 등록한 별칭 security-context한테 알려주기
    
    ```xml
    <authentication-manager>
    	<authentication-provider user-service-ref="securityService">
    		<password-encoder ref="bcryptPasswordEncoder"/>
    	</authentication-provider>
    </authentication-manager>
    ```
    
3. 위 상태까지 진행 후 securityService가 등록되지 않는다. 
**@Component 클래스를 빈으로 등록해주는 역할을 하는 context의 설정태그** 
    
    ```java
    <context:component-scan base-package="com.kh.spring" />
    ```
    

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/adbfa4f9_Untitled.png]]

시큐리티 빈을 servlet-context에 등록을 하면 사용할 수 없음! 
왜❓
root-context에서 servlet-context에 있는걸 참조할 수 없기 때문

📌결론

시큐리티빈은 별도로 관리해야함.

1. servlet-context에서 설정한 @Component클래스를 빈으로 등록해주는 태그를 security-context에 추가해주기
    
    ```xml
    <context:component-scan base-package="com.kh.security" />
    ```
    
    - 오류난다면?
        - 네임스페이스가 등록이 안돼어 있는거라서 context네임스페이스 추가해주면 됌.

#### ❓mybatis가 mapper를 못찾는다고 한다면 ? #8.1. 설정 package 설정을 변경해준다.

```java
// root-context
<!-- #8.1. @Mapper 인터페이스를 관리 -->
// 변경 전
<mybatis-spring:scan base-package="com.kh.spring.**.dao"/>
// 변경 후
<mybatis-spring:scan base-package="com.kh.**.dao"/>
```

### 3. 회원정보 상세보기

---

SecurityContexHolder - SecurityContext - Authentication에 보관중인 로그인한 사용자 정보 가져오기

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/첨부/fb8a8afa_Untitled.png]]

- Principal : 주체(사용자member)
- Credentials : 비밀번호
- Authorities : 권한

> **사용방법**
> 

```java
@GetMapping("/memberDetail.do")
public void memberDetail(Authentication authentication) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member principal = (Member) authentication.getPrincipal();
		log.debug("principal = {}", principal); // Member(super=MemberEntity(memberId=honggd, password=$2a$10$yUoOBdlJJosqdlR0vrbwG.4.2gOHVS0EnWWnrpp..PVgrCNjiEk8K, name=홍길동, gender=M, birthday=1999-09-09, email=honggd@naver.com, phone=01012341234, address=null, hobby=[등산], createdAt=2022-07-18T00:47:51, updatedAt=null, enabled=true), authorities=[ROLE_USER])
			
		Object credentials = authentication.getCredentials();
		log.debug("credentials", credentials); // null
		
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) authentication.getAuthorities();
		log.debug("authorities = {}", authorities); // [ROLE_USER]
}
```

> **자주 사용할 사용자정보 가져오는 방법 (#9.5. 설정필수)**
> 

```java
@GetMapping("/memberDetail.do")
public void memberDetail(@AuthenticationPrincipal Member member) {
		log.debug("member = {}", member);
}
```

- **사용자정보 인자로 바로 받을 수도 있음!**

#### #9.5. AuthenticationPrincipal UserDetails 구현체를 전달받기 위한 설정

servlet-context.xml

: 기존 annotation-driven 내용을 추가함!

```java
<annotation-driven>
	<argument-resolvers>
		<beans:bean class="org.springframework.security.web.method.annotation.AuthenticationPrincipalArgumentResolver"/>
	</argument-resolvers>
</annotation-driven>
```

### 4. 관리자 회원관리

---

### 5. remember-me (로그인 유지 시간 부하없이 늘리기)

---

- db에서 인증정보를 불러서 로그인을 계속 유지해주는 기능

<aside>
📌 [remember-me API](https://docs.spring.io/spring-security/site/docs/3.0.x/reference/remember-me.html#remember-me-persistent-token)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a65d53ef_Untitled.png]]

</aside>

---

- **#1. API를 참고한 DB에 저장할 테이블**
    
    ```sql
    -- remember-me 테이블
    create table persistent_logins (
        username varchar(64) not null, 
        series varchar(64) primary key, 
        token varchar(64) not null, 
        last_used timestamp not null
    );
    ```
    
    1. username
    2. series
    3. token
    4. last_used 
- **#2. security-context api 코드 추가**
    
    ```sql
    <!-- 
    	root-conext db 연결정보 ref=dataSource
    	token-validity-seconds 토큰유효시간(초) 60 *60 * 24 * 14 (2주) 
    -->
    	<remember-me 
    		data-source-ref="dataSource"
    		token-validity-seconds="1209600"/>
    ```
    
- **#3. 관리할 페이지에 remember-me name값으로 받기**
    
    **로그인.jsp** 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/784edddd_Untitled.png]]
    
    ```html
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
    ```
    
- **#4. web.xml에 session을 만료시간 지정해서 기능확인하기 (1분)**
    
    ```xml
    <session-config>
    	<session-timeout>1</session-timeout>
    </session-config>
    ```
    
- **결과확인(개발자 도구 + DB)**
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/56e55aac_Untitled.png]]
    
    쿠키값을 삭제하고 새로고침을해도 로그인이 유지되어있다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6f1e6c5c_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
