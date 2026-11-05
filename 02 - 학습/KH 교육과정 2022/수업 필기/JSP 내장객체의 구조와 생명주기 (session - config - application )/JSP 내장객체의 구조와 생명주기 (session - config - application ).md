---
별칭:
  - "강의 - JSP 내장객체의 구조와 생명주기 (session / config / application )"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/6485b063a88c4e508c8167862ee1fb63
주제:
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
---

# 강의: JSP 내장객체의 구조와 생명주기 (session / config / application )

## 강의 내용

---

[[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/JSP application - session - cookie|JSP application / session / cookie]]

---

참고

Context 라는 단어는 프로젝트와 동일 개념이라고 생각하시면 된다. 

프로젝트를 두 개 생성해서 server.xml 파일의 Context 정보를 확인해보면 아래와 같이 나온다. 

하나의 프로젝트 단위임을 알 수 있다. 

웹 어플리케이션이라는 단어도 사전적 의미는 모호하지만 일반적으로 하나의 웹 서비스를 의미하므로 같은 범위로 생각하면 될 것 같다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/2795cd93_Untitled.png]]

### 1. request, response, out

---

**사용자 요청별로 생성됐다 처리되면 사라지는 객체**

- `request` (javax.servlet.http.HttpServletRequest)
- `response` (javax.servlet.http.HttpServletResponse)
- `out` (javax.servlet.jsp.jspWriter)

브라우저에서 서버로 요청을 하고 서버에서 브라우저로 회신해주고 나면 이 객체들은 모두 사라진다. 

`Request`, `Response` 객체는 하나의 요청을 처리하는 스레드에서 모든 JSP와 서블릿이 공유한다. 

`out`은 서블릿에 공유되지 않기 때문에 서블릿에서 바로 클라이언트로 출력해주기 위해서는 `PrintWriter`의 출력 스트림을 따로 생성해줘야 한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/6c1e35c0_Untitled.png]]

#### 서블릿에서 출력 스트림 생성 방법

```java
PrintWriter out = response.getWriter();
out.println("~~");
```

### 2. 사용자(브라우저)별로 유지되는 객체

- `session`(javax.servlet.http.HttpSession)

`session`은 브라우저가 완전히 꺼질 때까지 **해당 브라우저의 고유 식별자(id)를 서버에 저장**해두고 **같은 브라우저에서 요청이 왔는지 알아볼 수 있게 해주는 객체**입니다. 

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/b9c435d0_Untitled.png]]

- 서버에서 사용자의 정보(상태)를 저장한다.
- 쿠키와 같이 서버와의 관계를 유지하기 위한 수단이다.
- 클라이언트의 요청이 발생하면 자동 생성된다.
- 쿠키와 달리 클라이언트의 특정 위치에 저장되는 것이 아니라, 서버 상에 객체로 존재한다.
- 쿠키와 달리 서버에서만 접근이 가능하여 보안이 좋다.
- Session의 영역상 브라우저의 X 버튼을 누를 때까지 유지된다.
- e.g.) 로그인 정보나 사용자 환경설정, DB커넥션 등 정보를 유지하는 것들에 사용된다.

#### **javax.servlet.http.HttpSession 세션관련메소드**

| ★void setAttribute(String name, Object value) | name으로 지정한 이름에 value 값을 할당 |
| --- | --- |
| ★Object getAttribute(String name) | 지정한 이름의 객체의 속성 데이터 값 반환 |
| ★void invalidate() | 현재 생성된 세션을 무효화(해제) 시킴 |
| Enumeration getAttributeNames() | 속성의 이름들을 Enumeration 타입으로 반환 |
| String getId() | 세션에 할당된 유일한 식별자(ID)를 String 타입으로 반환 |
| void setMaxInactiveInterval(int interval) | 세션 유효시간을 정수(초)로 설정 |
| boolean isNew() | 세션이 새로 만들어졌으면 true, 
이미 만들어진 세션이면 false 반환 |
| Long getCreationTime() | 세션이 시작된 시간을 반환, 1970년 1월 1일을 시작으로 하는 밀리초 |
| long getLastAccessedTiem() | 마지막 요청 시간, 1970년 1월 1일을 시작으로 하는 밀리초 |
| void removeAttribute(String name) | name으로 지정한 속성의 값을 제거(이것보단 invalidate()사용) |

> **서블릿에서 HttpSession 객체 얻는 방법**
> 

```java
HttpSession session = request.getSession();
```

> **`getAttribute` 메서드**
> 
- 세션에 저장된 자료는 다시 getAttribute(String name) 메서드를 이용해 조회한다.
- 반환 값은 Object 유형이므로 저장된 객체로 자료유형 변환이 필요하다.
- 메서드 setAttribute()에 이용한 name인 "id"를 알고 있다면 다음과 같이 바로 조회한다.

```java
String value = (String)session.getAttribute("id");
```

> **세션 종료 invalidate()**
> 
- 바로 소멸시킨다는 의미가 아니다.
- 아이디 값을 제외한 나머지 정보를 접근할 수 없다.
- invalidate() 후 세션의 아이디 값은 받아 올 수 있지만 나머지 정보나 속성 등은 접근할 수가 없다.

(아이디 값을 받아 올 수 있다는 의미는 현재 페이지에서 세션이 사라진 것은 아니다.

- session.getSession() 메서드를 사용해서 다음 페이지에 얻어 와야 하는 세션을 미리 얻어올 수 있다.

#### 세션은 클라이언트가 서버에 접속하는 순간 생성

- 특별히 지정하지 않으면 세션의 유지 시간은 기본 값으로 30분 설정
- 세션의 유지 시간이란 서버에 접속한 후 서버에 요청을 하지 않는 최대 시간
- 30분 이상 서버에 전혀 반응을 보이지 않으면 세션이 자동으로 끊어짐
- 이 세션 유지 시간은 web.xml 파일에서 설정 가능

#### 세션의 유효시간을 설정하는 2가지 방법

---

- session.getLastAccessedTime() : 접근시간을 가져온다.
- 지정한 유효시간 동안 요청이 없다면 자동 종료된다.

**1. 첫 번째 방식(web.xml 설정 파일) - 단위(분)**

- 확인할 때 `127.0.0.1:포트번호(9090)` ⇒ 이것도 localhost와 같이 내 컴퓨터를 가르키는 것

```java
<session-config>
	<session-timeout>30</session-timeout>
</session-config>
```

**2. 두 번째 방식(메서드 방식)- 단위(초)**

```java
<%
    session.setMaxInactiveInterval(60 * 60)
%>
```

- **<session-timeout>의 값을 0이나 음수로 설정하면 유효시간 없이 무제한으로 유지한다.**단점은 세션 객체가 계속 메모리에 남게 되어 메모리 부족 현상이 발생한다.
- **★반드시 세션 타임아웃 시간을 지정해주어야 한다.**

#### 세션 사용자 수 확인하는 방법

---

```java
1. web.xml 에 <listner>를 등록하여 설정가능
<listener>
	<listener-class>common.listener.SessionCounterListener</listener-class>
</listener>
---------------------------------
어노테이션 설정
//@WebListener
public class SessionCounterListener implements HttpSessionListener {

}
```

#### 서버 이벤트

---

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/02f84b57_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/c8ed6d7d_Untitled.png]]

### JSP/서블릿마다 하나씩 생성되는 객체

- config(javax.servlet.ServletConfig)

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/572f7a78_Untitled.png]]

ServletConfig 객체는 web.xml 파일에서 특정 JSP/서블릿에 초기화 파라미터를 매핑시켜둔 값을 가지고 있는 객체입니다. JSP/서블릿이 메모리에 로드되는 시점에 실제 생성되는 객체인데, 동일 JSP/서블릿은 딱 하나의 ServletConfig 객체를 가집니다. 따라서 따로 다른 클래스나 JSP에 객체 또는 값을 전달하지 않는 한 해당 객체는 지정된 JSP/서블릿에서만 사용할 수 있는 딱 하나의 객체입니다. 같은 요청을 처리하는 동일 스레드에서도 다른 클래스나 JSP끼리 자동으로 공유되고 그러지 않습니다. 각자 하나씩 가지고 있습니다.

JSP나 서블릿이 수정돼서 다시 컴파일을 거친 후 메모리에 로드되면 이 객체도 다시 생성되는데, 어차피 web.xml 파일의 값은 컨테이너를 재가동 시켜야 다시 가져올 수 있으므로 초기화 파라미터 값은 변하지 않아 별 의미는 없습니다. 그냥 생명주기도 컨테이너의 생명주기와 같다고 생각하면 됩니다.

> 서블릿에서 ServletConfig 객체 얻는 방법 (상속받은 HttpServlet에 있는 메소드)
> 

```java
ServletConfig conf = this.getServletConfig();
```

### 컨테이너 구동시 생성되는 객체

- application (javax.servlet.ServletContext)

![[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/첨부/bf9838a1_Untitled.png]]

ServletContext 객체는 어플리케이션(프로젝트 단위)이 딱 하나만 가지고 있는 객체입니다. 컨테이너에서 프로젝트를 구동시킬 때 프로젝트 단위로 딱 하나씩 만들어서 줍니다. 따라서 이 객체는 프로젝트 단위 내의 모든 JSP와 서블릿에서 공유되는 객체입니다.

기본적으로는 컨테이너의 내외부 환경에 대한 정보를 가지고 있는데 Attribute 객체를 임의로 추가할 수 있어서 정보 공유의 수단으로 많이 사용됩니다.

- 서블릿에서 ServletContext 객체 얻는 방법 (ServletConfig 객체의 메소드로 얻을 수 있음)

```java
ServletConfig conf = this.getServletConfig();
ServletContext application = conf.getServletContext();
```

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/JSP application - session - cookie|JSP application / session / cookie]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
