---
별칭:
  - "강의 - JSP & servlet"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/7db480798fe64fe2bdf9dc4ffae92ccc
---

# 강의: JSP & servlet

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/99b78fb2_Untitled.png]]

**웹서버 Web Server**

: 정적인 데이터 처리하는 서버.

단순 이미지나 html파일과 같은 리소스만을 제공하는 서버는 웹서버만 사용하여 빠르고 안정적이게 활용.

**와스 WAS**

: 동적인 데이터 처리하는 서버.

DB로 연결되어 데이터를 주고받거나 자바등을 통해 데이터 조작이 필요한 경우에는 WAS를 활용.

server start 시 가장 먼저 읽어들이는 내용: **Web.xml**

web.xml을 기반으로 서버가 돌아가기 위해 필요한 내용 읽어들인다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3b135d6f_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/2f48acdb_Untitled.png]]

## 📍**JSP**

---

Java Server Page의 약자

Java의 웹서버 프로그램 스펙(서블릿)으로 변환되어 서비스 된다. 

서블릿(Servlet)이라함은 **웹서비스 기능을 해주는 자바 클래스**를 말한다. 

- Java 언어를 기반으로 하는 Server Side 스크립트 언어
- HTML 코드 안에 Java코드
- Servlet을 보완하고 기술을 확장한 스크립트 방식 표준
- Servlet의 모든 기능 + 추가적인 기능

### **1. JSP로 생성된 클래스 파일이 위치하는 곳(WAS - tomcat인 경우)**

```java
01_sum.jsp ==> _01_sum_jsp.java ==> _01_sum_jsp.class
```

### **2. JSP 의 장점**

1. **서블릿(Servlet)보다 쉽고, 작성하기가 빠르다.**
2. view단부분(html)과 로직부분(java)으로 이루어져 있다. 그리고 정보, view단부분(html)과 로직부분(java)을 분리시킬수도 있다. 즉, **요청 결과를 나타내는 HTML 작성하는데 유용하다.**
3. 프로그래머가 직접 코딩한 서블릿(Servlet)보다 최적화된 서블릿(Servlet)으로 생성시켜 주므로 효율적인 코드가 만들어진다.
4. JavaBean 의 사용이 쉽다.
    1. 자바빈이란? jsp에서 객체를 가져오기 위한 기법으로 데이터 전달 오브젝트 파일(DTO)
    2. jsp작업은 **프로그래머와 디자이너가 협업하기 때문에 혼란을 고려하여** 자바 코드를 최대한 줄이기 위해서 자바빈을 사용한다.
5. 웹애플리케이션 상에서 변수의 사용가능한 범위(scope)설정이 쉽다.
6. JSP가 수정된 경우 재배포할 필요가 없이 WAS가 알아서 처리한다.(쉬운 배포)

### **3. JSP를 이루는 구성인자(element)**

1. **지시어(directive)** :
    1. page `<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>`, `<% page import="java.sql.*, java.util.*" %>`
    2. include `<%@include file="today.jsp" %>`
    3. taglib `<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>`
        1. JSP 액션(표준액션, 커스텀액션)과 한쌍
2. **스크립팅 원소(scripting element)** : JSP 페이지에서 자바 코드를 직접 기술할 수 있게 하는 기능.
    1. 선언문(declaration) `<%! 자바코드 %>`
    2. 스크립틀릿(scriptlet) `<% 자바코드 %>`
    3. 출력식, 표현식(expression) `<%= 자바코드 %>`
3. **JSP 액션(표준액션, 커스텀액션)** → 추 후 공부할 예정

### **4. JSP 페이지에서 사용할 수 있는 내장객체변수의 종류**

일반적인 JAVA 프로그램에서는 변수를 사용하기 전에 반드시 선언을 해야 하지만, JSP 페이지에서는 선언을 하지 않고도 사용할 수 있는 변수가 있다. 이러한 변수를 JSP 페이지의 ****내장객체변수(implicit variable)****라고 부른다. 왜냐하면 웹컨테이너(=WAS, 톰캣서버)가 JSP 페이지를 Servlet 클래스로 변환해줄때 자동적으로 변수선언을 해주기 때문에 우리는 변수선언 없이 그냥 사용만 하면 된다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/61253e5e_Untitled.png]]

- pageContext
    - 현재 JSP 페이지의 컨텍스트(Context)
- request(javax.servlet.http.HttpServletRequest)
    - doGet, doPost 메소드의 첫번째 파라미터와 동일한 역할.
    - 웹클라이언트에서 보내온 데이터값을 받아서 처리해주는 변수.
    - 저장소 역할을 할 수 있다.
- response(javax.servlet.http.HttpServletResponse)
    - doGet, doPost 메소드의 두번째 파라미터와 동일한 역할.
    - 웹클라이언트의 요청에 대해 응답결과 처리를 위한 변수
- out(javax.servlet.jsp.jspWriter)
    - 웹브라우저로 HTML 코드를 출력해주는 기능.
    - Servlet 클래스 안에서 response.getWriter() 메소드를 호출해서 얻은 PrintWriter 객체와 동일한 기능을 함.
    - Response 객체는 하나의 요청을 처리하는 스레드에서 모든 JSP와 서블릿이 공유합니다. out은 서블릿에 공유되지 않기 때문에 서블릿에서 바로 클라이언트로 출력해주기 위해서는 PrintWriter의 출력 스트림을 따로 생성해줘야 함.
    
    ```java
    서블릿에서 출력 스트림 생성 방법
    
    PrintWriter out = response.getWriter();
    out.println("출력내용");
    ```
    
- session

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f0ee4474_Untitled.png]]

- 세션이라함은 여러 웹 컴포넌트들이 협력작업을 시작해서 끝내기까지의 기간을 의미한다.
- session 내장객체 속에는 세션을 시작하고 끝내는 기능과 **그 기간동안 웹 컴포넌트(웹서비스하고 있는 어디서나) 들이 데이터를 주고받을 수 있는 기능**이 들어있다.

```java
서블릿에서 HttpSession객체 얻는 방법
HttpSession session = request.getSession();
```

- application
    - JSP 페이지가 속하는 웹어플리케이션에 관련된 기능을 함.
- config
    - JSP 페이지가 속하는 웹어플리케이션의 초기상태와 관련된 기능을 함.

### **5. page 지시어**

현재의 JSP 페이지를 컨테이너에서 처리하는 데 필요한 각종 속성을 기술하는 부분이다. 보통 소스의 맨 앞에 위치한다.

```java
<%@ page 속성1="속성값1" 속성2="속성값2" ... %>
```

page 지시어의 속성중에는 형식 지정을 위한 contentType, 자바 클래스 사용을 위한 import, 오류 페이지 관리를 위한 errorPage, isErrorPage 등을 가장 많이 사용한다.

> 표준스팩 : javax.servlet.jsp.httpJspPage 
톰캣구현 : org.apache.jsper.runtime, HttpJSPBase
> 

#### **directive 상세내용**

- language 사용할 스크립트 언어를 지정하는 속성. languege = "java"
- import 자바 import 와 동일한 기능을 한다. `<% page import="java.sql.*, java.util.*" %>`
- session 세션은 웹 브라우저와 웹 서버가 지속적으로 상대를 인식하기 위해 필요한 정보를 임시로 저장해두는 방법. 세션사용여부를 지정 기본값 true `<%@ page session="true" %>`
- buffer jsp페이지 내용을 출력하려면 JspWriter 객체인 out변수를 사용한다. 이때 out객체로 사용할 버퍼 크기를 지정할 수 있다. 
`<%@ page buffer="8KB" %>` 버퍼는 데이터를 좀 더 효율적이고 안전하게 전송하기 위한 프로그래밍 기법으로 전송할 데이터를 미리 확보한 다음조금씩 전송하는 방법이다.
- autoFlush 버퍼를 자동으로 비울것인지를 지정하는 속성이다. 
기본값 true `<%@ page autoFlush="true" %>`
- isThreadSafe 서블릿의 장점은 각 사용자 접속에 대한 요청을 프로세스가 아닌 스레드로 처리하는데 있다. 스레드를 이용하면 좀 더 효율적으로 시스템을 운영할 수 있으나, 각 스레드가 자원을 공유하기 때문에 이들 데이터에 대한 안정성을 보장할 수 없게 된다. isThreadSafe 옵션은 스레드 상태에서 데이터의 안정성을 보장하는 옵션으로, 기본값은 true이다. 
`<% page isThreadSafe="true" %>`
- info 해당 **JSP 설명 부분으로 일종의 주석**이다. `<% page info="JSP Example" %>`
- errorPage, isErrorPage errorPage 속성은 현재 JSP 페이지에서 오류가 발생할 경우 호출할 페이지를 지정한다. isErrorPage는 errorPage 속성에 설정된 오류 처리 파일로, 다른 용도로는 사용할 수 없고 오류 처리에만 이용된다. 
`<%@ page errorPage="error.jsp" %> <%@ page isErrorPage="true" %>` 
`<%@ page errorpage="ErrorPage.jsp" %>`
- contentType 현재JSP 내용에 대한 유형을 설정하는 옵션이다. 원하는 MIME Type을 기입하면 된다. `<%@ page contentType="text/html" %>`
- pageEncoding : contentType 과 동일한 기능을 한다 (ISO-8891-1)
- extends : 현재 JSP 페이지를 특정 클래스를 상속한 클래스로 작성함

## 📍**Servlet**

---

### **서블릿(Servlet)이란?**

웹서비스를 위한 자바클래스를 서블릿(Servlet)이라고 함.(스펙)

- 웹 기반의 요청에 대한 동적인 처리가 가능한 Server Side에서 돌아가는 Java Program
- Java코드 안에 HTML 코드(하나의 클래스)
- 웹 개발을 위해 만든 표준

### **서블릿의 동작 구조**

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/34cecc36_Untitled.png]]

### **서블릿의 상속관계**

서블릿(Servlet) 클래스는 반드시 javax.servlet.http.HttpServlet 클래스를 부모 클래스로 상속을 받아야 한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0b15cc94_Untitled.png]]

```
javax.servlet.Servlet 인터페이스 (Servlet, ServletConfig 인터페이스)
javax.servlet.GenericServlet 추상클래스
javax.servlet.http.HttpServlet 추상클래스
----------------------------------------
서블릿 API는 Servlet과 ServletConfig 인터페이스를 구현해 제공하며 
GenericServlet 추상클래스가 이 두 인터페이스의 추상 메서드를 구현한다.
```

**ServletConfig의 기능** 

- ServletContext의 객체를 얻는 기능
- 서블릿에 대한 초기화 작업가능

**서블릿을 초기화하는 방법**

- @WebServlet 어노테이션을 이용하는 방법
- web.xml에 설정하는 방법

### **메소드별 오버라이딩**

웹클라이언트의 요청 방식이 GET 방식으로 요청을 해오면 doGet() 메소드로 응답

javax.servlet.http.HttpServlet에 각 요청메소드별 메소드가 정의 되어 있다.

**전송방식**

- doDelete
- **doGet**
    - 사용자 입력값 처리 → 응답메세지 html(setContextType MIME타입)
- doHead
- doOptions
- **doPost**
    - 인코딩 처리 → 사용자 입력값 처리 → 업무로직처리 → 응답메세지 처리html(setContextType MIME타입)/ jsp+servlet : jsp(view)에 위임
- doPut
- doTrace

웹클라이언트의 요청 방식이 POST 방식으로 요청을 해오면 doPost() 메소드로 응답 그러므로 반드시 doGet() 메소드와 doPost() 메소드는 Overriding(재정의)를 해주어야 한다.

- 첫번째 파라미터는 `HttpServletRequest` 타입.
- 두번째 파라미터는 `HttpServletResponse` 타입.

### **요청/응답처리 객체**

#### **HttpServletRequest**

- 클라이언트 플랫폼정보 및 브라우져정보 : String request.getHeader("User-Agent")
- Request 관련 쿠키 : `Cookie[] cookies = request.getCookies();`
- 클라이언트 세션정보 : `HttpSession session = request.getSession();`
- HTTP 메소드 : `String method = reques.getMethod();`
- Request 입력스트림 : `InputStream input = request.getInputstream();`

#### **HttpServletResponse**

- 클라이언트에게 돌려보낼 setContentType()을 정한다.
    
    ```java
    // HttpServletResponse의 객체인 response로 setContentType() 메소드를 호출
    
    resp.setContentType("text/html; charset=utf-8");
    
    클라이언트에게 응답할 페이지에 대한 환경설정을 결정해 주어야 한다. 
    응답 방식이 text/html로 지정되어 있으므로 text나 html로 보여주겠다는 의미이다.
    ```
    
- 출력스트림을 이용하여(`PrintWriter`(charactor기반), `ServletOutputStream`(bite기반)) HTML 등을 작성함.
    
    ```java
    // 응답메세지 MIME타입 
    response.setContentType("text/html; charset=UTF-8")
    // response.getWriter() 메소드로 출력 스트림 객체를 얻어오기.
    PrinterWriter out = response.getWriter();
    ```
    
- `RequestDispatcher` : 객체는 다른 페이지로 이동하는 forward() 또는 include() 메소드를 가지고 있는 객체이다. (이때 다른 페이지로 이동한다는 것은 다른 뷰페이지 파일을 출력 해주는 것)
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/eb4df81d_Untitled.png]]
    
    ```java
    getRequestDispatcher("/이동할 페이지의 경로")
    방법1
    RequestDispatcher reqDispatcher = request.getRequestDispatcher("/servlet/test.jsp");
    reqDispatcher.forward(request, response);
    
    방법2
    request.getRequestDispatcher("/servlet/test.jsp");.forward(request, response);
    
    forward() : 
    이동하면서 현재 페이지에서 사용하던 HttpServletRequest와 HttpServletResponse 객체를 
    인자값으로 전달하는데 내장 객체인 request와 response를 넘겨줌
    
    .getRequestDispatcher() : 
    메서드 안에 들어가는 문자열에는 뷰페이지경로.jsp가 들어간다.
    ```
    
- 그밖에 헤더정보 설정, 오류를 발생시키거나, 쿠키를 추가함.

#### **Servlet Lifecycle**

Servlet객체의 생명주기 WAS에 의해 **singleton pattern**으로 운영됨. 프로그램 운영중에 **단하나의 객체만 만들어져서 매요청에 재사용**된다.

: 개념만 알고있고 우리가 할 일이 아님. 톰캣과의 약속을 공부하는 것일뿐

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7a983375_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/98efa63e_Untitled.png]]

1. **`ServletLifeCycle()`** - 생성자호출
2. **`@PostConstruct`** - 서블릿이 생성되기 전에 준비하는 단계
3. **`init(ServletConfig)`** - 서블릿이 생성(초기화)되는 단계
    - 초기화 클래스로 **웹 컨테이너에 의해서 처음 서블릿 인스턴스가 생성될 때 단 한번 호출**된다.
4. **`service(HttpServletRequest, HttpServletResponse)`**
    - 개발자가 구현한 방식으로 서블릿이 일을 하는 단계 (doGet(),doPost() 등을 호출)
    - doGet(HttpServletRequest, HttpServletResponse)
    - doPost(HttpServletRequest, HttpServletResponse)
    - 전송방식에 따라 override된 메소드호출
5. **`destroy()`** - 서블릿이 일을 마치고 소멸되는 단계
    - 서블릿 인스턴스가 웹 컨테이너에서 제거 될 때 호출 된다. 따라서 init 메서드에서 구현했던 초기화 작업을 반납 처리 작업 시에 사용된다
6. **`@PreDestroy`** - 서블릿 소멸 뒤 정리하는 단계

`@PostContruct`,`@PreDestroy` 는 개발자가 어노테이션을 붙여 별도의 메소드를 선언해야 한다.

```java
public class ServletEx extends HttpServlet { 
	// servlet 실행 단계 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException { 
		System.out.println(" -- doGet() -- "); 
	} 
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException { 
		doGet(request, response); 
	} 
	
	@PostConstruct public void postConstruct() { 
		System.out.println(" -- postConstruct() -- "); 
	} 

	//servlet 생성 단계 
	@Override public void init() throws ServletException { 
		System.out.println(" -- init() -- "); 
	} 

	//servlet 종료 단계 
	@Override public void destroy() { 
		System.out.println(" -- destroy() -- "); 
	} 

	@PreDestroy public void preDestory() { 
	System.out.println(" -- preDestory() -- "); 
	} 
}
```

#### 매핑

현재는 **@WebServlet 어노테이션**으로 URL 매핑을 하지만 (**URL 매핑이란 서블릿을 실행하기 위해 자바의 클래스명 대신 사용하는 문자열**)기존에는 web.xml에서 매핑을 했기 때문에 다소 불편했음.

WebServlet이란 URL매핑을 보다 쉽게 자바클래스에서 설정할 수 있도록 제공되는 어노테이션

```java
<기존 web.xml>

<servlet>
	<servlet-name>TestPerson</servlet-name>
	<servlet-class>com.kh.web.servlet.TestPersonServlet</servlet-class>
</servlet>
<servlet-mapping>
	<servlet-name>TestPerson</servlet-name>
	<url-pattern>/testPerson.do</url-pattern>
</servlet-mapping>
```

### 📍Servlet과 JSP의 관계

---

#### **JSP만을 이용하는 모델 => 모델1**

![](https://blog.kakaocdn.net/dn/09Iof/btqEwRSnXkH/vUqOGvCmE1goaTQv2ozwPK/img.png)

JSP가 사용자의 요청을 받아 Java Bean(DTO, DAO)을 호출하여 적절한 동적인 페이지를 생성한다.

**동작 과정**

- JSP로 작성된 프로그램은 내부적으로 WAS에서 Servlet 파일로 변환
- JSP 태그를 분해하고 추출하여 다시 순수한 HTML 웹 페이지로 변환
- 클라이언트로 응답

**특징**

개발 속도가 빠르다.

배우기 쉽다.

프레젠테이션 로직(View)과 비즈니스 로직(Controller)이 혼재한다.

JSP 코드가 복잡해져 유지 보수가 어려워진다.

#### **JSP와 Servlet을 모두 이용하는 모델 ([MVC Architecture](https://swk3169.tistory.com/161?category=711222)) => 모델2**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a3464b45_Untitled.png]]

![](https://blog.kakaocdn.net/dn/bcCblK/btqEyeS83gx/b6XuBDFNB5BqWrvXaajTBK/img.png)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c3fd071f_Untitled.png]]

JSP와 Servlet을 모두 사용하여 프레젠테이션 로직(View)과 비즈니스 로직(Controller)을 분리한다.

View(보여지는 부분)는 HTML이 중심이 되는 JSP를 사용

Controller(다른 자바 클래스에 데이터를 넘겨주는 부분)는 Java 코드가 중심이 되는 Servlet을 사용

Model은 Java Beans로, DTO와 DAO를 통해 Mysql과 같은 Data Storage에 접근

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/76a8fa76_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
