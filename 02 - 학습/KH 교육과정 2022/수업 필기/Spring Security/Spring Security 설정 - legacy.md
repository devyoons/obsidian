---
별칭:
  - "강의 - Spring Security 설정 - legacy"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/12308d91779744619f0599328d613bb9
---

# 강의: Spring Security 설정 - legacy

## 강의 내용

@pom.xml

```xml
<properties>
	...
	<org.springframework.security-version>5.1.5.RELEASE</org.springframework.security-version>
	...
</properties>

<!-- #1. 스프링  security 프레임워크 의존 -->
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
<!-- 
	org.apache.jasper.JasperException: 
	The absolute uri: [http://www.springframework.org/security/tags] cannot be resolved in either web.xml or the jar files deployed with this application 
	security taglib 오류시, 해당 jar를 직접 WebApp Libraries에 추가할 것.
-->
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

@web.xml

<aside>
💡 sprint-security는 springSecurityFilterChain빈을 참조하므로 application-context에서만 작동한다.

</aside>

**filter등록후에는 spring-security.xml에 http, authentication-manager태그를 작성후 테스트 가능**

<aside>
💡 spring-security는 필터를 시작으로 작동한다. DelegatingFilterProxy 필터태그만 주석하면, security관련기능을 모두 끌수 있다.

</aside>

application-context에 security-context.xml 파일 추가.
(`/WEB-INF/spring/*-context.xml` 와일드카드를 활용해, 두 설정파일을 한번에 등록가능)

```xml
<!-- #2. 공용 applicationContext관련 설정파일에 security-context.xml 추가 -->
	<!--  /WEB-INF/spring/*-context.xml 와 같이 wildcard 사용가능 -->
	<!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
	<context-param>
		<param-name>contextConfigLocation</param-name>
		<param-value>
			/WEB-INF/spring/application-context.xml
			/WEB-INF/spring/security-context.xml
		</param-value>
	</context-param>

<!-- #3. Spring Security Filter 등록 --> 
<!-- 
	1. DelegatingFilterProxyRegistrationBean이 DelegatingFilterProxy필터클래스를 "springSecurityFilterChain"이라는 이름의 Filter로 등록
		- legacy project에서는 web.xml에서 DelegatingFilterProxy필터  등록시 application-context에 빈으로 등록됨.
	2. DelegatingFilterProxy클래스는 FilterChainProxy 클래스에게 처리를 위임 
		- FilterChainProxy는 AuthenticationFilter 들을 리스트로 보관하고 있는 클래스 
 -->
<filter>
	<filter-name>springSecurityFilterChain</filter-name>
	<filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
</filter>
<filter-mapping>
	<filter-name>springSecurityFilterChain</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>

```

@security-context.xml

<aside>
💡 application-context에서 UserDetailsService구현체 빈에 접근해야 하므로 별도의 package com.kh.security하위에 service, dao빈을 관리한다.

servlet-context의 빈을 사용한다면, service, dao빈이 application-context, servlet-context에 하나씩 존재하게 된다.

</aside>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/security"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/security http://www.springframework.org/schema/security/spring-security-4.2.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
	<!--  기본 namespace security로 설정  -->
	
	<!-- #4. 패스워드암호화관련 빈등록 -->
	<beans:bean id="bcryptPasswordEncoder"
				class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder" />
	
	<!-- #5. 정적자원 요청은 security 인증/인가에서 제외한다. -->			
	<http security="none" pattern="/resources/**"/>
	
	<!-- #6. HttpSecurity 설정 -->
	<http auto-config="true">
		<intercept-url pattern="/" access="permitAll" />
		<intercept-url pattern="/index.jsp" access="permitAll" /> <!-- forwarding 하는 path도 등록함. -->
		<intercept-url pattern="/member/memberLogin.do" access="isAnonymous()" />
		<intercept-url pattern="/member/**" access="isAuthenticated()"/>
		<intercept-url pattern="/board/**" access="hasRole('USER')"/>
	  <intercept-url pattern="/admin/**" access="hasRole('ADMIN')" />	    
	  <intercept-url pattern="/**" access="isAuthenticated()" />
	    
	  <!-- login-page="/member/memberLogin.do" GET 로그인폼페이지   -->
        <!-- login-processing-url="/member/memberLogin.do" POST 로그인폼 제출 url. 이 속성은 반드시 작성하되, 이를 처리할 핸들러메소드는 작성할 필요없음.-->
	    <!-- default-target-url="/" 로그인성공후 redirect url. 지정하지 않으면, 자동으로 root -->
	    <!-- always-use-default-target="false" 로그인전 접근 페이지로 리다이렉트 설정(default-target-url을 override함.) -->
	    <!-- authentication-success-forward-url="/member/memberLoginSuccess.do" 를 등록해 로그인 성공후 처리로직 작성가능 -->
		<form-login login-page="/member/memberLogin.do"
					login-processing-url="/member/memberLogin.do"
					default-target-url="/"
					always-use-default-target="false"  
					username-parameter="id" 
					password-parameter="password"
					/>
					
        <!-- logout-url은 로그아웃 POST 요청할 url로 핸들러 메소드 작성불필요 -->
        <!-- invalidate-session="true" 기본값 true -->
        <!-- logout-success-url="/" 기본값 /login?logout-->
		<logout logout-url="/member/memberLogout.do"
				invalidate-session="true"
				delete-cookies="JSESSIONID"
				logout-success-url="/"/>
				
		<!-- remember me 설정 -->
		<remember-me  
			data-source-ref="dataSource" 
			token-validity-seconds="1209600"/> <!-- 초단위 기입 1209600(60*60*24*14 : 2 주) -->

		<!-- 접근권한이 없는 경우, forwarding할 url -->
		<access-denied-handler error-page="/error/accessDenied.do"/>
		
		<!-- csrf[disabled=false] 기본값. 모든 post요청은 csrf토큰 값을 인증해야 한다. -->
	    <csrf disabled="false"/>
	</http>
	
	<authentication-manager>
		<!-- UserDetailsService 구현체. 같은 application-context에 등록된 빈이어야 함. -->
		<authentication-provider user-service-ref="securityService" >			
			<password-encoder ref="bcryptPasswordEncoder"/>
		</authentication-provider>
	</authentication-manager>
	
	<!-- com.kh.security 패키지 빈으로 등록 -->
	<!-- application-context에 등록된 빈으로 servlet-context의 빈은 참조불가하다. -->
	<context:component-scan base-package="com.kh.security"/>

</beans:beans>
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Security/Spring Security|Spring Security]]
