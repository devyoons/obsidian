---
별칭:
  - "강의 - JSP Action&EL"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/aea0f4c41d264c2bae1269c92d461ec3
주제:
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 강의: JSP Action&EL

## 강의 내용

---

---

## JSP 요소의 종류

### 1. 지시어

---

#### page **<%@ 문서의 상단에서 지시할 내용 %>**

: JSP 페이지를 **컨테이너에서 처리하는 데 필요한 속성**을 기술하는 부분이며, 대부분 소스코드 맨 앞에 위치합니다.

```java
<%@ page
    contentType="text/html;charset=UTF-8"
    language="java"   // java외에 다른언어는 존재하지 않음. 안써도 됨.
    import="java.util.Scanner"    // import는 여러개를 쓸 수 있음.
    import="java.sql.*"
    session="true"    // default가 true이고 false를 주면 세션 사용 않겠다는 뜻
    buffer="8kb"      // default가 8kb이고 버퍼사이즈를 조정하는 속성
    autoFlush="true"  // out.close()의 역할
    info="jsp 페이지 연습"
    errorPage="error.jsp"    // 에러페이지는 리다이렉션이 아닌 서버에서 바로 푸시하는 방식
		isErrorPage="false"//현재의 페이지가 일반적인 페이지인지 예외를 처리하는 페이지인지 지정
											//기본값 : false이며 예외처리페이지인 경우 true로 설정
%>
```

#### include <%@ include file=”삽입할 파일 이름.jsp” %>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8b0ece1d_Untitled.png]]

```java
<%@ include file="comment.jsp" %>
```

#### taglib <% taglib prefix=”c” uri=”http://java.sun.com/jsp/jstl/core”%>

### 2. 스크립팅 원소(scripting element)

: JSP 페이지에서 자바 코드를 직접 기술할 수 있게 하는 기능

1. 선언문 
2. 스크립틀릿
3. 출력식, 표현식

### 3. JSP 액션(표준액션, 커스텀액션)

#### 액션(action)이란?

XML 기술을 이용해서 기존의 JSP 문법을 확장해준 매커니즘으로 JSP 규격서에 정의되어 있는 기술이다.  **`(XML → JAVA) : 서버단에서 모두 처리 후 결과값만 HTML로 전달`**
이것은 XML 태그 형태를 띄기 때문에 액션태그(action tag)라고도 부르며, 간단히 액션(action)이라고 한다.
왜냐하면 이런 태그가 어떤 동작(action)을 수행하는 역할을 하기 때문이다.

- 서버나 클라이언트에게 어떤 행동을 하도록 명령하는 태그
- JSP 페이지에서 페이지와 페이지 사이 제어
- 다른 페이지의 실행 결과 내용을 현재 페이지에 포함
- 자바 빈즈(JavaBeans)등의 다양한 기능 제공
- XML 형식 <jsp: .../> 사용

#### 액션의 2가지 종류

1. **표준액션(Standard action)** : JSP 페이지에서 바로 사용이 가능함.
    - 표준액션(Standard action)은 모든 태그의 이름 앞에 jsp(namespace) 라는 접두어가 붙음.
    - 예) `<jsp:include page="abc.jsp" />`
    - 추가적인 라이브러리없이 바로 사용가능
    - namespace사용하는 이유는 사용자정의 태그들과 충돌을 막기 위해서 동일 태그 이름이 있을 때 구분을 해줌.
    - 예) `<abc:include page=”abc.jsp” />`
    - 디렉토리구조로 namespace를 사용할 수 있음
        - abc/foo.txt
        - def/foo.txt

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7b5ccc8d_Untitled.png]]

1. **커스텀액션(Custom action) = JSTL** : 별도의 라이브러리를 설치해야만 사용가능함. 라이브러리는 인터넷에서 다운로드 받을수도 있고(JSTL), 사용자가 직접 만들어 사용할수도 있음.
    - 커스텀액션(Custom action)은 모든 태그의 이름 앞에 jsp 이외의 접두어가 붙음.
    - 예) `<c:set var="cnt" value="0" />`
    - core, format, fn… 제일 자주 사용

### 4. EL : ${ }

**Expression Language 표현식 언어**

jsp 2.0부터 추가된 스펙으로 `<%= %>`를 더 간결히 작성하기 위한 문법.
(Scripting Expression 스크립팅표현식과 헷갈리지 말것)

JSP 2.0 버전에서 추가된 것으로 `<%= %>`, `out.print()`와 같이 JSP에 쓰이는 Java
코드를 간결하게 사용하는 방법으로, 화면에 표현하고자 하는 코드를 `${value}`의 형식으로 표현하여 작성하는 것을 말한다.

**EL은 단순출력 용도이다.**

#### EL내장객체

`${requestScope.변수이름.name}`

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9bfd8a92_Untitled.png]]

- **첫번째 변수는 다음 스코프별 내장객체(map)이다.(각 스코프는 생략가능))**
    - pageScope
    - requestScope
    - sessionScope
    - applicationScope
        - 스코프가 생략되었다면, page/request/session/application생존범위의 속성이 바로 올수 있다.
- **사용자입력값(map)**
    - param
    - paramValues
- **요청 header정보(map)**
    - header
    - headerValues
- **쿠키관련(map)**
    - cookie
- **초기화 파라미터(map)**
    - initParam : 컨텍스트파라미터(애플리케이션 전체에 공유)를 가져옴. 이름이 직관적이지 않으므로 주의할 것.
- **포인터객체(실제참조)**
    - pageContext 내장객체 주 유일하게 맵이 아님(pageContext는 자바빈). 참조형객체

<aside>
🔻 ${키값이 동일하면} 
`pageScope`->`requestScope`->`sessionScope`->`applicationScope` 순으로 찾음

</aside>

<aside>
🔻 - el은 NPE(nullpointException)을 던지지 않는다.
- el은 찾는 값이 없을때 null이 아닌 ""빈문자열을 반환한다.
- 존재하지 않는 인덱스 참조시 ""빈문자열을 반환한다.

</aside>

<aside>
🔻 bracket notion 사용가능 (javascript)
- 특수문자 공백이 포함된 key값처리에 유용
- key값 처리에 쌍따옴표, 홑따옴표 모두 가능

</aside>

#### 표준액션 수업내용(EL경로지정,서블릿데이터jsp연결,useBean,include)

#### 01. EL 로 contextPath경로 지정하기

```jsx
스크립틀릿
<a href="<%= reqeust.getContextPath() %>/standard/useBean.do">
EL로 변경
<a href="${pageContext.request.contextPath}/standard/useBean.do">
```

#### 02. getter, setter

- boolean형 getter는 is로 시작하는 관례가 있음
    - 예) isMarried

#### 03. 서블릿에서 생성한 데이터를 JSP로 넘겨주는걸 표준액션으로 사용하기

- 페이지 지시어 하위에 표준액션 작성
1. useBean 태그
    - id 속성(필수) : 반환(생성)되는 인스턴스를 저장하기 위한 이름(변수명)을 속성값으로 설정. 내장객체에 저장된 속성값의 속성명(식별자,key값)으로 사용한다.
    - class 속성(필수) : 반환(생성)되는 인스턴스의 자료형(클래스)를 속성값으로 설정한다. → 패키지포함 풀네임
    - scope 속성(선택) : 내장객체에 저장된 속성값의 사용범위를 속성값으로 설정한다.
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f254cfc0_Untitled.png]]
        
        - page(기본) | request | session | application
2. getProperty 태그
    - useBean 태그의 종속태그, useBean태그에 의해 제공된 인스턴스의 필드값을 반환하는 태그임 (javaBean클래스의 getter메소드를 호출하는 명령과 유사)
    - name 속성(필수) : useBan태그로 제공되는 인스턴스의 식별자(id 속성값)를 속성값으로 설정한다.
    - property속성(필드) : useBean 태그로 제공되는 인스턴스의 필드명을 속성값으로 설정한다. 필드에 대한 getter 메소드를 호출하여 인스턴스의 필드값 반환한다.
        - getter의 get을 제외하고, 소문자로 시작하는 이름 작성
        - OGNL스펙 (Object Graph Navigation Language)
            - getter / setter이름을 참조

#### 04. jsp에서 스크립틀릿대신 jsp표준액션태그 useBean 사용

```java
------------servlet--------------
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException {
	// jsp에서 사용할 데이터 생성
	Person person = new Person("홍길동", '남', 30, true);
	// view단 forwarding
	request.serAttribute("person", person);
	request.getRequestDispatcher("/WEB-INF/views/standard/useBean.jsp).forward(request.response);
}
-----------------jsp------------
<<useBean을 사용하지 않을 경우>>
- 클래스 import문 필요
<%
	Person person = (Person) request.getAttribute("person"); 
%>

<<useBean을 사용하는 경우>>
페이지지시어 하위에 작성함 : 표준액션
<jsp:useBean id="person" class="com.kh.person.model.dto.Person" scope="request"/>

<jsp:useBean id="sinsa" class"com.kh.person.model.dto.Person"/>
<jsp:setProperty property="name" value="신사임당" name="sinsa" />
<jsp:setProperty property="gender" value="여" name="sinsa" />
<jsp:setProperty property="age" value="나이" name="sinsa" />
<jsp:setProperty property="married" value="결혼여부" name="sinsa" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>useBean</title>
</head>
<body>
	<h1>useBean</h1>
	<h2>홍길동</h2>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="person" /></li>
		<li>성별 : <jsp:getProperty property="gender" name="person" /></li>
		<li>나이 : <jsp:getProperty property="age" name="person" /></li>
		<li>결혼여부 : <jsp:getProperty property="married" name="person" /></li>
	</ul>

<!-- sinsa 이름으로 찾고 없으면 만들어줌 -->
	<h2>신사임당</h2>
	<ul>
		<li>이름 : <jsp:getProperty property="name" name="sinsa"/></li>
		<li>성별 : <jsp:getProperty property="gender" name="sinsa"/></li>
		<li>나이 : <jsp:getProperty property="age" name="sinsa"/></li>
		<li>결혼여부 : <jsp:getProperty property="married" name="sinsa"/></li>
	</ul>
</body>
```

#### 05. 표준액션태그 include 사용

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a0ca8c74_Untitled.png]]

```java
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/standard/header.jsp"></jsp:include>
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eos minima rem ea iusto reiciendis commodi suscipit animi ad odit velit explicabo dolore rerum corrupti! Mollitia expedita tempore odit vel autem.</p>
<jsp:include page="/WEB-INF/views/standard/footer.jsp"></jsp:include>
```

- `<%@ include file=”…”%>` : 변환된 서블릿 코드안에 include 한 파일내용이 그대로 들어오는 방식
- `<jsp:include page=”…”/>` : 실시간으로 매번 호출하는 방식
- 확인하는 방법
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d6420e0d_Untitled.png]]
    
```
서버 overview → configuration → arguments → Dcatalina주소 복사 
→ 탐색기에서 복사한 주소로 이동 → work(jsp는 work디렉토리 하위에 있음) 
→ Catalina → localhost → application이름폴더 → 쭉 타고들어가서 WEB-INF폴더 찾기 
→ main_jsp.java 내용확인
```

- include지시어와는 내용이 다르다 그때는 include할 head.jsp내용이 들어오는데
jsp태그는 호출코드로 변경됨. out으로 직접 출력을 하고 있음.


### 4-1. EL scope 내장객체(page,request,response,session,application)

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/cdba5010_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e88f0053_Untitled.png]]

- OGNL property방식으로 처리되고 있는 것.  getter의 get을 제외하고 소문자로 시작

```java
-------------------servlet----------------------------
@WebServlet("/el/basic.do")
public class BasicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jsp에 전송할 데이터 생성
		// request
		request.setAttribute("coffee", "예가체프");
		request.setAttribute("num", 1234567890);
		request.setAttribute("honggd", new Person("홍길동", '남', 33, false));
		request.setAttribute("book", "오브젝트");
		
		List<String> items = Arrays.asList("탁상시계", "머그잔", "USB선풍기", "블루투스마이크");
		Map<String, Object> map = new HashMap<>();
		map.put("name", "세종대왕");
		map.put("today", new Date());
		map.put("Dr.Zang", new Person("장영실", '남', 55, true));
		request.setAttribute("items", items);
		request.setAttribute("map", map);
		
		// session
		HttpSession session = request.getSession();
		session.setAttribute("book", "죽음의 수용소에서");
		
		// application
		ServletContext application = getServletContext();
		application.setAttribute("movie", "듄");
		
		// view단처리
		request.getRequestDispatcher("/WEB-INF/views/el/basic.jsp").forward(request, response);
	}
}
```

```html
-------------------jsp----------------------------
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("book", "협상의 기술");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Basic</title>
</head>
<body>
	<h1>EL Basic</h1>
	<h2>pageContext</h2>
	<ul>
		<li>${pageScope.book}</li>
	</ul>
	
	<h2>request</h2>
	<ul>
		<li>${requestScope.coffee}</li>
		<li>${requestScope.num}</li>
		<li>${requestScope.honggd}
			<ul>
				<li>${requestScope.honggd.name}</li>
				<li>${requestScope.honggd.gender}</li>
				<li>${requestScope.honggd.age}</li>
				<li>${requestScope.honggd.married}</li>
			</ul>
		</li>
		<li>${items}
			<ul>
				<li>${items[0]}</li>
				<li>${items[1]}</li>
				<li>${items[2]}</li>
				<li>${items[3]}</li>
				<li>${items[4]}</li><%-- 존재하지 않는 인덱스 참조시 "" 반환--%>
			</ul>
		</li>
		<li>${map}
			<ul>
				<li>${map.name}</li>
				<li>${map.today}</li>
				<%-- 
					bracket notion 사용가능
					- 특수문자 공백이 포함된 key값처리에 유용
					- key값 처리에 쌍따옴표, 홑따옴표 모두 가능
				 --%>
				<li>${map['Dr.Zang']}
					<ul>
						<li>${map['Dr.Zang']['name']}</li>
						<li>${map['Dr.Zang'].gender}</li>
						<li>${map['Dr.Zang'].age}</li>
						<li>
							<input type="checkbox" ${map['Dr.Zang'].married ? "checked" : ""}/>
						</li>
					</ul>
				</li> 
			</ul>
		</li>
	</ul>
	
	<h2>session</h2>
	<ul>
		<li>${book}</li> <%-- 키값이 동일하면 pageScope -> requestScope -> sessionScope -> applicationScope --%>
		<li>${sessionScope.book}</li>
		<li>${xyz}</li> <%-- el은 찾는 값이 없을때 null이 아닌 ""을 반환한다. --%>
		<li>${x.yz}</li> <%-- el은 NPE(nullpointException)을 던지지 않는다. --%>
	</ul>
	
	<h2>application</h2>
	<ul>
		<li>${applicationScope.movie}</li>
	</ul>
</body>
</html>
```

### 4-2. EL (param, paramValues, header, headerValues, cookie, initParam,pageContext)

**param (사용자입력값)**

---

:pname=아이패드&pcount=5&option=red&option=128gb

- 복수개의 값은 `${param.option}`으로 가져오면 첫번째 값만 계속 가져옴 paramValues로 가져와야함.

```html
object.jsp
<h2>param</h2>
	<ul>
		<li>${param.pname}</li>
		<li>${param.pcount}개</li>
		<li>Option :
			<ul>
				<li>${paramValues.option[0]}</li>
				<li>${paramValues.option[1]}</li>
			</ul>
		</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1a6f76c6_Untitled.png]]

**header (요청헤더) EL로 접근하기**

---

```java
jsp
@WebServlet("/el/object.do")
public class ObjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/el/object.jsp").forward(request, response);

		// 요청 헤더값 
		Enumeration<String> headerNames = request.getHeaderNames();
		while(headerNames.hasMoreElements()) {
			String headerName = headerNames.nextElement();
			String headerValue = request.getHeader(headerName);
			System.out.println(headerName + " = " + headerValue);
		}
	}
}
// 결과값
**host = localhost:9090
connection = keep-alive
cache-control = max-age=0
sec-ch-ua = ".Not/A)Brand";v="99", "Google Chrome";v="103", "Chromium";v="103"
sec-ch-ua-mobile = ?0
sec-ch-ua-platform = "Windows"
upgrade-insecure-requests = 1
user-agent = Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36
accept = text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
sec-fetch-site = same-origin
sec-fetch-mode = navigate
sec-fetch-user = ?1
sec-fetch-dest = document
referer = http://localhost:9090/action/
accept-encoding = gzip, deflate, br
accept-language = ko-KR,ko;q=0.9,en-US;q=0.8,en;q=0.7
cookie = JSESSIONID=B5FFBF8D74D00A5AFA630D291D405B29**
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6f5c7d5f_Untitled.png]]

```html
<h2>header</h2>
	<ul>
		<li>${header.host}</li>
		<li>${header['user-agent']}</li> <!-- '-' braket notation이용 -->
		<li>${header['referer']}</li>
	</ul>
```

**cookie**

---

- 없는 쿠키값을 조회해도 “” 빈문자열 반환

```html
<h2>cookie</h2>
	<ul>
		<li>${cookie.JSESSIONID.value}</li>
		<li>${cookie.abcdefg.value}</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4233269d_Untitled.png]]

**initParam**

---

- web.xml 에 application객체에 등록될 key/value
- tomcat시작시 application에 등록 server끝날때까지 유지

```xml
<context-param>
	<param-name>tel</param-name>
	<param-value>070-1234-5678</param-value>  	
  </context-param>
  <context-param>
	<param-name>email</param-name>
	<param-value>admin@iei.or.kr</param-value>  	
  </context-param>
</web-app>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c48b3910_Untitled.png]]

```html
<h2>initParam</h2>
	<ul>
		<li>Tel : ${initParam.tel}</li>
		<li>email : ${initParam.email}</li>
	</ul>
```

**pageContext (요청방식출력)**

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/94cb5888_Untitled.png]]

- `request.getMethode()`와 `requestScope.method()` 는 전혀 다름
- requestScope는 EL이 만든 map 임 
reqeust 내장객체가 EL에는 존재하지 않고, requestScope는 단순 request 생존 범위에 묶여 있는 속성에 대한 단순 맵이기 때문에 requestScope.methode()사용불가 
위 코드 처럼 request.setAttribute해야 사용가능

```html
<h2>pageContext</h2>
	<ul>
		<li><%= request.getMethod() %></li>
		<li>${pageContext.request.method}</li>
		<li><%= request.getContextPath() %></li>
		<li>${pageContext.request.contextPath}</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/95c58ca4_Untitled.png]]

- **EL 에서는 application, session,request를 바로 참조할 수 없다. pageContext를 통해서만 참조할 수 있음**
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1528f574_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/06957b6e_Untitled.png]]
    
    <aside>
    🔻 **EL 에서는 application, session,request를 바로 참조할 수 없다.** pageContext만 참조할 수 있고 다른걸 직접적으로 필요하다면 **pageContext를 통해서만 참조할 수 있음**
    
    </aside>
    

### 4-3. EL Operator

**산술연산자**

---

- 단순한 출력 용도의 EL이지만, 산술연산/논리연산 지원.
- 키워드 지원
- 문자열은 더할 수 없음 NumberFormatException
    - “123” → 이런건 숫자로 변환해서 처리해줌. “안녕”→이런건 안됌
- java 에서는 int / int = 몫 만 출력되지만 여기서는 내부적으로 실수로 변환되서 나옴

```java
	String str1 = "안녕";
	String str2= new String("안녕");	
	List<String> list3 = Arrays.asList("123", "456", "789");
	int x = 100;
	int y = 30;
	pageContext.setAttribute("str1", str1);
	pageContext.setAttribute("str2", str2);
	pageContext.setAttribute("x", x);
	pageContext.setAttribute("y", y);
	pageContext.setAttribute("list3", list3);
```

```html
<h2>산술연산</h2>
	<ul>
		<li>${x + y}</li>
		<li>${list3[0] + x}</li>
		<%-- <li>${str1 + str2}</li> --%>
		<li>${str1}${str2}</li>
		<li>${x - y}</li>
		<li>${x * y}</li>
		<li>${x / y} ${x div y}</li>
		<li>${x % y} ${x mod y}</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1cafa359_Untitled.png]]

**비교연산자**

---

- [`==` 또는 `eq` ] [`!=` 또는 `ne`] [`<` 또는 `lt`] [`>` 또는 `gt`] [`<=` 또는 `le`] [`>=` 또는 `ge`]

```java
	int x = 100;
	int y = 30;
	pageContext.setAttribute("x", x);
	pageContext.setAttribute("y", y);
```

```html
<h2>비교연산</h2>
	<ul>
		<li>${x > y} ${x gt y}</li>
		<li>${x >= y} ${x ge y}</li><%-- greater than or equal to --%>
		<li>${x < y} ${x lt y}</li>
		<li>${x <= y} ${x le y}</li>
		<li>${x == y} ${x eq y}</li>
		<li>${x != y} ${x ne y}</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f1dd5326_Untitled.png]]

**동등비교연산**

---

- el안의 ==, eq 모두 내부적으로 equals 처리
    - java 에서는 == 는 주소값 비교, EL에서는 equals처리
- 두개의 객체를 비교할 때 필드값이 동일하면 true로 나오게하려면 override를 해줘야함.

```java
	String str1 = "안녕";
	String str2= new String("안녕");	
	pageContext.setAttribute("str1", str1);
	pageContext.setAttribute("str2", str2);
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/dd1e843e_Untitled.png]]

```html
<h2>동등비교연산</h2>
	<ul>
		<li><%= str1 == str2 %> ${str1 == str2} ${str1 eq str2}</li>
		<li>Person : ${honggd1 eq honggd2}</li>
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4aac84b5_Untitled.png]]

![equals와  hashCode 같이 오버라이드해야함.
equals가 true → same hashCode (같은 주소값을 가지고 있어야함)](../../../attachments/cc8e6dbc-a4e9-47dd-8b8a-684d224e131d/Untitled.png)

equals와  hashCode 같이 오버라이드해야함.
equals가 true → same hashCode (같은 주소값을 가지고 있어야함)

**empty**

---

- 배열, 컬렉션(多사용), 일반객체에 대해서 null여부, 요소존재여부(배열/컬렉션) 검사
- 요소가 없으면 true 있으면 false

```java
	List<String> list1 = null;
	List<String> list2 = Collections.emptyList(); //null은 아니지만 요소가 하나도 없음.
	List<String> list3 = Arrays.asList("123", "456", "789");
	pageContext.setAttribute("list1", list1);
	pageContext.setAttribute("list2", list2);
	pageContext.setAttribute("list3", list3);
```

```html
<ul>
		<li>${empty list1}</li>
		<li>${empty list2}</li>
		<li>${empty list3}</li>
		<li>${empty ""}</li>
		<li>${!empty list1} ${not empty list1}</li><!-- 반전 -->
	</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/343e7f90_Untitled.png]]

**논리연산자**

---

```html
<h2>논리연산자</h2>
    <ul>
    	<li>${true && true} ${true and true}</li>
    	<li>${true || false} ${true or false}</li>
    </ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/930cc593_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
