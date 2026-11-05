---
별칭:
  - "강의 - hello-spring : 1일차"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/aaefe17fd5a14f5c886b173b0ce60cda
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 강의: hello-spring : 1일차

## 강의 내용

---

---

## 1. 프로젝트 설정

- 강사님 공유파일
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/style.css|style.css]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/index.jsp|index.jsp]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/file.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/logo-spring.png]]
    
    []()
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/Untitled.txt|Untitled]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/86e72fbe_Untitled.txt|Untitled]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/96014575_Untitled.txt|Untitled]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/첨부/af46017f_Untitled.txt|Untitled]]
    

`ctrl + Alt + shift + L : 퀵서치`

- 프로젝트 생성
    1. 레거시 프로젝트 생성
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d84a5dba_Untitled.png]]
        
    2. 프로젝트 이름 설정 & MVC 프로젝트 템플릿
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7be030b0_Untitled.png]]
        
        이 설정을 해줌으로써 pom.xml 에서 많은걸 해줌.
        
    3. 템플릿 다운로드 받기 
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e3f022c4_Untitled.png]]
        
    4. 3레벨로 작성하는게 일반적이며 세번째에 작성한 이름이 contextPath가 될 예정
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/caced13e_Untitled.png]]
        
- 프로젝트 설정
    1. 빌드패스 라이브러리에 java 버전 설정
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/14cd843f_Untitled.png]]
        
    2. project facets → java 버전 설정 , 다이나믹 웹 모듈 버전은 추후 변경(서블릿버전)
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/00e415a6_Untitled.png]]
        
        다이나믹 웹 모듈은 추후에 버전업할 예정
        
- 지역서버 생성
    1. create 서버 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fd2e0e09_Untitled.png]]
    
    1. 서버 오버뷰 설정
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1b86bf90_Untitled.png]]
        
```
1. Serve modules without publishing 체크 안함- tomcat 세팅에서 설정된 server path > deploy path로 의존하는 모듈들이 퍼블리싱된다.- 메인 프로젝트는 의존하는 모듈을 참조한다.- class 파일 이외에 다른 파일들은 퍼블리싱 안될 수 있다.
2. Server modules without publishing 체크함- 메인 프로젝트는 의존하는 모듈(프로젝트 등)을 퍼블리싱 하지 않고 직접 참조한다.
```

1. /spring 이름으로 모듈(웹) 연결이 되어있음

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a0607b65_Untitled.png]]


- home.jsp : 태그라이브러리 삭제
    1. 태그 라이브러리 삭제
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5549ac29_Untitled.png]]
        
    2. 지시어 입력
        
```java
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
```

- 추가 파일들
    1. JS : jquery파일 추가
        - CDN으로 추가시
        
```java
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
```

2. WEB-INF 하위에 lib 파일 생성 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5f8c9271_Untitled.png]]

- jstl jar 파일 추가

[[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b89843ab_Untitled.txt|Untitled]]

[[02 - 학습/KH 교육과정 2022/수업 필기/첨부/88d0cc13_Untitled.txt|Untitled]]

[[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c70fbc81_Untitled.txt|Untitled]]

[[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e0e21ac7_Untitled.txt|Untitled]]


<aside>
📖 **web app libraries 설정없이 참조가 가능한 이유**
: 프로젝트 우클릭 설정에 들어가면 Deployment Assembly에서 확인가능
maven 참조되는 것들도 결국엔 WEB-INF/lib 로 배포되어 들어감.

</aside>


<aside>
📖 **src/main/resources 와 src/main/webapp/resources는 하는 역할이 전혀 다름!
- src/main/webapp/resources : static 파일 관리하는 곳 (css, images, js)
- src/main/resources : 정적파일 관리하는 곳**

</aside>

> **스프링 프로젝트 설정**
> 

#### #1. java-version 1.8 / servlet 4.0.1 / jsp 2.3.1 / spring 5.1.5.RELEASE

---

- **pom.xml**
    
```xml
<properties>
		<java-version>1.8</java-version>
		<org.springframework-version>5.1.5.RELEASE</org.springframework-version>
		<org.aspectj-version>1.6.10</org.aspectj-version>
		<org.slf4j-version>1.6.6</org.slf4j-version>
	</properties>
---------------------------------------------------------------------
<!-- Servlet : maven사이트에서 가져온 코드-->
<dependency>
	<groupId>javax.servlet</groupId>
	<artifactId>javax.servlet-api</artifactId>
	<version>4.0.1</version>
	<scope>provided</scope>
</dependency>
<dependency>
	<groupId>javax.servlet.jsp</groupId>
	<artifactId>javax.servlet.jsp-api</artifactId>
	<version>2.3.1</version>
	<scope>provided</scope>
</dependency>
<!-- jstl 삭제 : 어차피 작동안돼서 삭제 -->
---------------------------------------------------------------------
<plugin>
    <groupId>org.apache.maven.plugins</groupId>
    <artifactId>maven-compiler-plugin</artifactId>
    <version>2.5.1</version>
    <configuration>
        <source>${java-version}</source>
        <target>${java-version}</target>
        <compilerArgument>-Xlint:all</compilerArgument>
        <showWarnings>true</showWarnings>
        <showDeprecation>true</showDeprecation>
    </configuration>
</plugin>
```

→ 설정 후 maven이 자동으로 업데이트가 되어야하는데 안됄 때가 있음!

- 명시적으로 maven 업데이트하는 방법

    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1de75d4e_Untitled.png]]

- **web.xml**
    
    : 기존 시작 web-app 태그를 변경해준다. (기존 2.5 | 변경 후 4.0)
    
```xml
<web-app 
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
	xmlns="http://xmlns.jcp.org/xml/ns/javaee" 
	xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" 
	id="WebApp_ID" 
	version="4.0">
```


#### #2. 전역 context 설정

---

❓[[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring - 1일차|전역 context 설명 참고]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ce1b5dac_Untitled.png]]

#### #3. DispatcherServlet관련 context 설정

- 경로
    
    src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml
    

---

```xml
<annotation-driven /> 
```

- Spring MVC 컴포넌트들을 디폴트 설정을 통해 활성화한다.
- Spring MVC @Controller에 요청을 보내기 위해 필요한 **HandlerMapping**과 **HandlerAdapter**를 Bean으로 등록한다.
    - HandlerMapping : HTTP 요청정보를 이용해서 컨트롤러를 찾아주는 기능
    - HandlerAdapter : HandlerMapping을 통해 찾은 컨트롤러를 직접 실행하는 기능을 수행
- Bean을 생성하기 위해 xml 파일에 **context:component-scan을 명시하면 이 태그를 포함하지 않아도 MVC 어플리케이션을 작동한다.**

```xml
<resources mapping="/resources/**" location="/resources/" />
```

- resources/** 의 의미 : resources하위에 몇개의 계층이던 포함하는 와일드카드

```xml
<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
	<beans:property name="prefix" value="/WEB-INF/views/" />
	<beans:property name="suffix" value=".jsp" />
</beans:bean>
```

- controller에서 jsp를 찾아가는 룰
- …Resolver : 관련 일을 처리하는 애 (해결사클래스)
    - 뷰네임 줘봐! 앞에 prefix + 내가 지정하는 경로 + suffix = 완성된 jsp 경로를 돌려줌

```xml
<context:component-scan base-package="com.kh.spring" />
```

- component 어노테이션이 붙은 애들 찾아서 Bean으로 등록하는 설정
- 특정 패키지 내의 클래스를 스캔하고 Annotation(`@Component` `@Controller` `@Service` `@Repository`)을 확인한 후 Bean 인스턴스로 생성한다.
- 이를 이용하면 `@Autowired`와 `@Qualifier Annotation`을 인식할 수 있다.
- **context:component-scan을 선언했다면 context:annotation-config를 선언할 필요가 없다.**

#### #4. 인코딩 설정 UTF-8 필터

- 경로
    
    src/main/webapp/WEB-INF/web.xml
    

---

```xml
<filter>
	<filter-name>encodingFilter</filter-name>
	<filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
	<init-param>
		<param-name>encoding</param-name>
		<param-value>utf-8</param-value>
	</init-param>
	<init-param> 
     		<param-name>forceEncoding</param-name> 
       	<param-value>true</param-value> 
    </init-param>
</filter>
<filter-mapping>
	<filter-name>encodingFilter</filter-name>
	<url-pattern>/*</url-pattern>
</filter-mapping>
```

#### #5. hotswapping 기능을 지원하는 의존 (스프링 로리드)

---

📎[[02 - 학습/KH 교육과정 2022/수업 필기/STS 다운로드 & 설정|설정방법]]

<aside>
📖 톰캣 구동시 필요함. jdk 11에서는 지원하지 않아서 jdk1.8사용함.

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1d234906_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b384056f_Untitled.png]]

- 프로젝트를 톰캣이 실행 가능한 상태로 묶어서 전달하는게 `.war`
- 전달받은 `.war`를 가지고 톰캣이 프로젝트를 실행해주는 구조

❓해야하는 이유

: 프로젝트 작업하고 .war로 패키징하고 배포하고.. `package n deploy`가 매번 일어나야함. 소스코드 조금만 바뀌어도 매번 이 작업을 해야하기 때문에 너무 힘들어서 “지역서버 너가 그냥 web app 바로 읽어~” 하고 개발시에만 사용하는 기능!

소스코드가 바뀌면 톰캣이 실행시 동시에 변경된 소스코드 리로드 해주는 기능이 있는데 스프링에서는 내부적으로 충돌이 있어서 스프링 로리드라는 별도의 jar를 이용하는 것.

## 2. 프로젝트 흐름

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9ad34c8c_Untitled.png]]

컨트롤러는 서비스를 의존

서비스는 dao를 의존

## ✔ 알아야할 내용

### 1. welcome 파일관련

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/54efdfc9_Untitled.png]]

`@RequestMapping` : welcome파일이 이 어노테이션보다 우선순위가 높음. 

```java
@RequestMapping("/") 
으로 실행하게 된다면 controller에 메소드가 실행되지 않고 welcome파일이 먼저 처리.
```

### 2. 페이지별로 title 변경하고 싶을 때

---

```java
// index.jsp
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="헬로우 스프링" name="title"/>
</jsp:include>

// header.jsp
<title>${param.title}</title>
```

위 코드처럼 한글로 전달하려고 하면 깨진다. 아래 코드처럼 설정하나가 더 필요함

```java
<fmt:requestEncoding value="utf-8" />
```

### 3. pom.xml → jstl dependency 작동안함

---

### 4. 레거시프로젝트 context 2개

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c729bd02_Untitled.png]]

root-context = application-context

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/45002095_Untitled.png]]

> **root-context**
> 
- root-context에 등록되는 빈들은 모든 컨텍스트에서 사용할 수 있습니다. (공유 가능)
- service나 dao를 포함한, 웹 환경에 독립적인 빈들을 담아둡니다.
- 서로 다른 servlet-context에서 공유해야 하는 빈들을 등록해놓고 사용할 수 있습니다.
- **servlet-context 내 빈들은 이용이 불가능합니다.**

> **servlet-context**
> 
- servlet-context에 등록되는 빈들은 해당 컨테스트에서만 사용할 수 있습니다.
- DispatcherServlet이 직접 사용하는 컨트롤러를 포함한 웹 관련 빈을 등록하는 데 사용합니다.
- **독자적인 컨텍스트들을 가지며, root-context 내 빈 사용이 가능합니다.**

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
