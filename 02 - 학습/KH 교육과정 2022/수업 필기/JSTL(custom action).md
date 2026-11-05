---
별칭:
  - "강의 - JSTL(custom action)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/583d2d84f03e47058916fc8d54315446
주제:
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
---

# 강의: JSTL(custom action)

## 강의 내용

---

---

## **JSTL (JSP Standard Tag Library)**

JSP 개발을 단순화하기 위한 태그 library

📖[참고 사이트](https://www.tutorialspoint.com/jsp/jsp_standard_tag_library.htm)

### JSTL 다운로드 설정

1. [톰캣 사이트로 이동](https://tomcat.apache.org/)
2. 좌측 Taglibs 클릭 → download
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/05163b83_Untitled.png]]
    
3. 제일 중요한건 Impl 이고 4개 전부 다운로드한다. 
다른 버전 호환성 문제로 같이 사용, 소스코드도 다운로드
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5eca1ea9_Untitled.png]]
    
4. 다운로드한 파일을 lib 폴더하위에 드래그앤드랍해준다. 자동으로 web app libraries에 생성되는걸 확인할 수 있다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/2a567ea5_Untitled.png]]
    
5. 사용하고자 하는 페이지에서 선언해야함.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a6b43042_Untitled.png]]
    
```java
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```


**장점**

1. 빠른 개발 → JSP를 단순화하는 많은 태그를 제공
2. 코드 재사용성 → 다양한 페이지에서 JSTL태그 사용 가능
3. 스크립틀릿 태그를 사용할 필요가 없음(스크립틀릿 태그를 사용하지 않음)
    - 그래도 스크립틀릿으로만 할 수 있는게 있긴 함

### JSTL tag

| 태그이름  | 기술 |
| --- | --- |
| core tags | 변수 지원, URL 관리, 흐름 제어 등을 제공, URL은 http://java.sun.com/jsp/jstl/core , 접두사는 c |
| function tags | 문자열 조작 및 문자열 길이를 지원, URL은 http://java.sun.com/jsp/jstl/functions, 접두사는 fn |
| formatting tags | 메시지 형식화, 번호 및 날짜 형식화 등을 지원, URL은 http://java.sun.com/jsp/jstl/fmt, 접두사는 fmt |
| XML tags | 흐름 제어, 변환 등을 제공, URL은 http://java.sun.com/jsp/jstl/xml, 접두사는 x |
| SQL tags | SQL지원을 제공, URL은 http://java.sun.com/jsp/jstl/sql, 접두사는 sql |

### 01. Core Tags

> **라이브러리를 포함하는 데 사용되는 구문**
> 

```java
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```

| tags | description |
| --- | --- |
| c:out | <% = ... %> 태그 작동 방식과 유사한 표현식의 결과를 표시 |
| c:import | 상대 또는 절대 URL을 검색하여 내용을 'var'의 문자열, 'varReader'의 Reader 또는 페이지에 표시 |
| c:set | 평가중인 표현식의 결과를 'scope'변수에 설정 |
| c:remove | 특정 범위에서 지정된 범위 변수를 제거하는 데 사용 |
| c:catch | 본문에서 발생하는 Throwable 예외를 포착하는 데 사용 |
| c:if | 조건을 테스트하는 데 사용되는 조건부 태그이며 표현식이 참인 경우에만 본문 내용을 표시 |
| c:choose, c:when, c:otherwise | 평가 된 조건이 true 인 경우 본문 내용을 포함하는 간단한 조건부 태그 |
| c:forEach | 기본 반복 태그, 고정 된 횟수 또는 초과 수집 동안 중첩 된 본문 내용을 반복 |
| c:forTokens | 제공된 델리 미터로 분리 된 토큰을 반복 |
| c:param | 포함하는 'import'태그의 URL에 매개 변수를 추가 |
| c:redirect | 브라우저를 새 URL로 리디렉션하고 컨텍스트 기준 URL을 지원 |
| c | url |

#### <c:out> Tag : 출력

---

JSP expression tag와 비슷하지만 expression에서만 사용할 수 있다.<% = ... %>과 유사한 표현식

- **value 속성** : 필수 , 화면에 출력할 값을 적는다. 어떤 값이든 문자열로 바꾸어 출력됨.
- **escaperXml 속성** : true 기본값 , 특수문자를 문자 엔티티 코드로 변환하는 역할 ( 문자 그대로 노출하게 만들어줌)
- **default 속성** : 변수가 null일 경우 대체 출력되는 값

```java
<c:out value="${출력값}" escapeXml="true 나 false" default="출력값"/>
```

- **`EL태그 ${} 보다 <c:out>을 사용해야 하는 이유`**
    - **보안성의 문제**
    - cross-site Scripting 공격은 스크립트를 주입시켜서 사이트를 침입하기 때문에 E:태그보다 c:out태그를 사용할 시에 좀 더 안전하게 페이지를 만들 수 있다.
    
    > **out을 사용하지 않았을 때**
    > 
    
```java
request.setAttribute("xss1", "<style>* {color: red}</style>");
request.setAttribute("xss2", "<script>alert('메롱!');</script>");
```

```html
<ul>
	<li>${xss1}</li> 
	<li>${xss2}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fcf0bee7_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3f41e15f_Untitled.png]]

> `c:out`태그와 `<fn:escapeXml>`태그를 사용했을때
> 
- escapeXml 기본값이 true이기 때문에 생략가능함.

```html
<ul>
		<li>${fn:escapeXml(xss1)}</li>
		<li>${fn:escapeXml(xss2)}</li>
		<li><c:out value="${xss1}" escapeXml="true"/></li>
		<li><c:out value="${xss2}" escapeXml="true"/></li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/cbf37bc9_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/69717702_Untitled.png]]


#### <c:set> Tag : 변수 선언

---

'`scope`'에서 평가된 표현식의 결과를 설정하는 데 사용표현식을 평가하고 결과를 사용하여 java.util.Map 또는 JavaBean 값을 설정하므로 유용jsp:setProperty action 태그와 유사

- **value 속성** : 값을 입력, EL사용가능(jstl 안에서는 EL 사용가능)
- **target 속성** : 프로퍼티를 설정할 빈 또는 맵을 가짐
- **property 속성** : 설정할 프로퍼티
- **var 속성** : 값이 저장되는 변수명
- **scope** : page 기본값 | request | session | application

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1175882a_Untitled.png]]

> **스크립틀릿**
> 
- Object로 넘어온걸 원래 타입인 String으로 변환 후 Integer.parseInt해야 오류X

```java
<% 
		pageContext.setAttribute("no1", request.getParameter("num1"));
		pageContext.setAttribute("no2", request.getParameter("num2"));
		pageContext.setAttribute("sum", 
				  Integer.parseInt((String) pageContext.getAttribute("no1")) 
				+ Integer.parseInt((String) pageContext.getAttribute("no2")));
%>
```

> **JSTL 변수 선언/출력**
> 
- 위 코드와 아래완벽하게 동일함.

```html
<c:set var="no1" scope="page">${param.num1}</c:set> 
<c:set var="no2" value="${param.num2}"/>
<c:set var="sum" value="${pageScope.no1 + pageScope.no2}"/>
생략가능 pageScope
<p>
	<c:out value="${no1}"/>과 <c:out value="${no2}"/>의 합은 <c:out value="${sum}"/>입니다. 
</p>
<p>
	${no1}과 ${no2}의 합은 ${sum}입니다.
</p>
```

#### <c:if> Tag :  조건문

JSTL 조건에서는 `<c:if> ~ </c:if>`로 이루워 있다. 주의할 점은 다른 언어와 다르게 else가 없다는 것이다.

- **test 속성(필수)** : 평가할 조건
- **var 속성** : 조건 결과를 저장할 변수의 이름
- **scope 속성** : 조건 결과를 저장할 변수의 범위 (기본 page)

```html
<c:set var="no1" scope="page">${param.num1}</c:set> 
<c:set var="no2" value="${param.num2}"/>

<h2>크기 비교</h2>
	<c:if test="${Integer.parseInt(no1) > Integer.parseInt(no2)}">
		<p>${no1}이 ${no2}보다 큽니다.</p>	
	</c:if>
	<c:if test="${Integer.parseInt(no2) > Integer.parseInt(no1)}">
		<p>${no2}이 ${no1}보다 큽니다.</p>
	</c:if>
	<c:if test="${no1 eq no2}">
		<p>${no1}과 ${no2}는 같습니다.</p>	
	</c:if>
```

<aside>
🔻 산술연산시에는 숫자로 자동연산을 하지만,
**크기 비교시에는 사전등재순으로 비교 → 타입을 변경해줘야함.**

</aside>

#### <c:choose><c:when><c:otherwise> Tag :  조건문

---

`<c:choose>`는 Java 언어의 switch~ case와 비슷하게 여러 조건중에 하나를 선택한다. 

`<c:choose>`는 switch에 해당되고 `<c:when>`는 case에 해당되며, `<c:otherwise>`
는 default에 해당된다

- `<c:choose>` 태그는 어떠한 속성도 없다.
- `<c:when>` 태그에는 아래에 나열된 하나의 속성이 있다.
    - **test 속성(필수)** : 평가할 조건
- `<c:otherwise>` 태그는 어떠한 속성도 없다.

<aside>
🔻 `<c : when>` 및 `<c : otherwise>`는 if-else 문처럼 작동합니다. 
그러나 `<c : choose>` 태그 안에 배치해야합니다.

</aside>

```html
<h2>경품뽑기 <span style="color:#fff">${param.rnum}</span></h2>
	<c:choose>
		<c:when test="${param.rnum % 5 == 0}">
			<p>축하드립니다. 다이슨 공기청정기 드립니다.</p>
		</c:when>
		<c:when test="${param.rnum % 5 == 1}">
			<p>축하드립니다. 스타벅스 커피상품권을 드립니다.</p>
		</c:when>
		<c:otherwise>
			<p>꽝입니다. 다음에 다시 도전해주세요 :)</p>
		</c:otherwise>	
	</c:choose>
```

- 위에서 아래로 검사하고 값이 아니라 조건식으로 처리되며, 검사에 걸린 처음것만 실행 후 아래 코드는 실행하지 않음

#### <c:forEach> Tag :  반복문

`<c:forEach>`는 목록을 입력 받아서 목록의 갯수만큼 반복하는 반복문이다.

**var 속성(필수)** : 사용할 변수명

**items 속성(필수)** : Collection객체(List, Map 등) 

**begin 속성** : 반복 시작 index. 정의되지 않을 경우 0

**end 속성** : 반복 종료 index

**step 속성** : 반복할 때 마다 건너 뛸 index개수

**varStatus 속성** : 반복 상태를 알 수 있는 변수

| 값  | 리턴 | 설명 |
| --- | --- | --- |
| index | int | items에 정의한 항목을 가리키는 index번호이다. 0부터 시작 |
| count | int | 현재 몇번째 반복인지 나타낸다. 1부터 시작 |
| first | boolean | 현재 반복이 첫번째인지 여부 |
| last | boolean | 현재 반복이 마지막인지 여부 |

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1300e1f9_Untitled.png]]

```html
<h2>반복처리</h2>
	<div class="wrapper" style="border:1px solid #000; padding: 5px;">
		<c:forEach var="i" begin="1" end="6">
			<h${i}>Hello World ${i}</h${i}>	
		</c:forEach>
	
		<hr />
		<c:forEach var="i" begin="1" end="100" step="1">
			<p>${101 - i}</p>
		</c:forEach>
	</div>
```

<aside>
🔻

100부터 1을 찍으려고하면 안됌. → step은 0보다 작거나 같을 수 없기 때문

</aside>

#### <c:forTokens> Tag :  문자열 분리(토근을 이용한 반복문)

---

문자열을 특정기호로 잘라내어 반복하는 반복문이다. Java에서의 StringTokenizer에 비슷하게 동작한다.

- **delims 속성(필수)** : 문자열을 분리를 위한 특정 기호
- `items`에 문자열을 넣고, `delims`에는 분리할 기호를 넣는다.
- 각 토큰별로 분리된 문자열은 var로 지정된 변수로 얻어 올 수 있다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/35a10473_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/37a686fd_Untitled.png]]

#### loop 예제코드

> **names**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e71e7ca0_Untitled.png]]

```java
서블릿
String[] names = {"홍길동", "신사임당", "윤봉준", "정약용"};
request.setAttribute("names", names);
```

```html
jsp
<h2>names</h2>
	<ul>
		<c:forEach items="${names}" var="name">
			<li>${name}</li>
		</c:forEach>
	</ul>
-> ${requestScope.names} : requestScope생략가능
-> 하나씩 꺼냈을 때 변수명을 var에 지정
```

> **persons**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/779799b4_Untitled.png]]

```java
서블릿
List<Person> persons = Arrays.asList(
				new Person("홍길동", '남', 33, false),
				new Person("신사임당", '여', 48, true),
				new Person("세종대왕", '남', 77, true));
request.setAttribute("persons", persons);
```

```html
jsp
<h2>persons</h2>
	<table>
		<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>성별</th>
				<th>나이</th>
				<th>결혼여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${persons}" var="person" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>${person.name}</td>
					<td>${person.gender}</td>
					<td>${person.age}</td>
					<td>
						<input type="checkbox" onclick="return false;" ${person.married ? "checked" : ""}/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
```

- readOnly : `onclick =”return false;”`
    - 체크박스는 읽기기능이 안먹기 때문에 onclick에서 false를 리턴

> **nums**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/486a2025_Untitled.png]]

```java
서블릿
Set<Double> nums = new HashSet<>();
		nums.add(21431.453256);
		nums.add(12.345);
		nums.add(4321.2345);
		nums.add(823945.352);
request.setAttribute("nums", nums);
```

```html
jsp
<h2>nums</h2>
	<c:forEach items="${nums}" var="num" varStatus="vs">
		${num} 
		<%-- <c:if test="${not vs.last}">|</c:if> --%>
		${not vs.last ? "|" : ""}
	</c:forEach>
```

> **map**
> 
- map은 특정요소를 접근해서 사용할 일이 있음 **순서가 정해져있지 않기 때문에 map의 전체요소를 조회하는데 사용할 일이 많지는 않음** → 순서가 자유로우려면 `linkedhashmap` , `treemap`

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fbac88e0_Untitled.png]]

```java
서블릿
Map<String, Object> map = new HashMap<>();
		map.put("name", "kh");
		map.put("today", new Date());
		map.put("item", Arrays.asList("기계식키보드", "애플팟", "사다리차"));
		map.put("세 종", new Person("세종대왕", '남', 77, true));
request.setAttribute("map", map);
```

```html
jsp
<h2>map</h2>
	<ul>
	<c:forEach items="${map}" var="entry">
		<li>${entry}
			<ul>
				<li>${entry.key}</li>
				<li>${entry.value}</li>
			</ul>
		</li>
	</c:forEach>
	</ul>
```

> **csv 구분자 넣기**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6a7c4c4a_Untitled.png]]

```java
String csv = "a,b,c,d,e,f,g";
request.setAttribute("csv", csv);
```

```html
<h2>csv</h2>
	<c:forTokens items="${csv}" delims="," var="ch">
		<mark>${ch}</mark>
	</c:forTokens>
```

#### <c:url> Tag : img 경로

---

> **사용법**
> 

```html
<c:url var="변수이름" value="url경로" var="변수명" scope="영역"/>
```

- context path를 자동으로 포함시키므로 서버 소스를 수정함에 따른 변화를 자동으로 적용
- 클라이언트의 브라우저가 쿠키사용을 금지하면 로그인 유지가 힘들어진다. 이때 세션을 유지하기 위해 링크 뒤에 특정값(sessionId)을 부여해줘서 로그인을 유지해준다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8895aba7_Untitled.png]]

```html
<h2>url</h2>
	<div>
		<img src="${pageContext.request.contextPath}/images/hyunta.jpg" alt="" />
		<img src='<c:url value="/images/hyunta.jpg"/>' alt="" />
	</div>
```

#### <c:redirect> Tag : 특정 페이지로 리다이렉트

- response.sendRedirect()와 같이 url 지정해 특정 페이지로 리다이렉트를 시켜주는 기능

> **사용방법**
> 

```html
<c:redirect url="url경로" context="컨텍스트 경로"/>
- context 생략가능
```

```html
<c:if test="${empty param.login || param.login == false}">
	<c:redirect url="/" />
</c:if>
```

### 02. **JSTL Formatting tags : 날짜, 숫자 관련**

---

서식 태그는 메시지 형식, 번호 및 날짜 형식 등을 지원

국제화 된 웹 사이트에서 텍스트, 시간, 날짜 및 숫자를 표시하고 형식화하는 데 사용

> **라이브러리를 포함하는 데 사용되는 구문**
> 

```java
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
```

| **Formatting Tags** | **Descriptions** |
| --- | --- |
| fmt:parseNumber | 통화, 백분율 또는 숫자의 문자열 표현을 구문 분석하는 데 사용 |
| fmt:timeZone | 본문 또는 시간대에 중첩 된 구문 분석 조치를 시간 형식화에 지정 |
| fmt:formatNumber | 특정 형식 또는 정밀도로 숫자 값을 형식화하는 데 사용 |
| fmt:parseDate | 시간과 날짜의 문자열 표현을 구문 분석 |
| fmt:bundle | 태그 본문에서 사용될 ResourceBundle 객체를 만드는 데 사용 |
| fmt:setTimeZone | 시간대 구성 변수 내에 시간대를 저장 |
| fmt:setBundle | 자원 번들을 로드하고이를 번들 구성 변수 또는 명명 된 범위 변수에 저장variable or the named scoped variable. |
| fmt:message | 국제화 된 메시지를 표시 |
| fmt:formatDate | 제공된 패턴 및 스타일을 사용하여 시간 및 / 또는 날짜를 형식화함 |

#### <**fmt:parseNumber**> Tag :  숫자 값을 형식화

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5aa6256c_Untitled.png]]

- # : 해당자리 숫자가 없을때 공란으로 처리
- 0 : 해당자리 숫자가 없을때 0으로 처리
- 기본적으로 반올림처리함.
- `<fmt:setLocale>` : 원화처리
    - 원화표시가 잘 안나오면 `value =”ko_kr”` 로 강제화
- `maxFractionDigits` : 기본값은 0 , 필요하면 소수점 이하자리수까지 표현할 수 있음

```html
<h2>숫자</h2>
	<c:set var="num1">123.4567</c:set>
	<c:set var="num2">1.2</c:set>
	<c:set var="won">1234567890</c:set>
	<c:set var="pct">0.015</c:set>
	<ul>
		<li>
			<fmt:formatNumber value="${num1}" pattern="#.##"/>
		</li>
		<li>
			<fmt:formatNumber value="${num2}" pattern="#.##" /> 
			<fmt:formatNumber value="${num2}" pattern="0.00" />
		</li>
		<li>
			<fmt:formatNumber value="${won}" pattern="#,###"/>
		</li>
		<li>
			<fmt:setLocale value="ko_kr"/>
			<fmt:formatNumber value="${won}" type="currency"/>
		</li>
		<li>
			<fmt:formatNumber value="${pct}" type="percent" maxFractionDigits="1"/>	
		</li>
	</ul>
```

#### <fmt:formatDate> Tag :  시간과 날짜 형식을 지정

---

```html
<fmt:formatDate value="date" 
        [type="{time|date|both}"]
        [dateStyle="{default|short|medium|long|full}"] 
        [timeStyle="{default|short|medium|long|full}"]
        [pattern="customPattern"] 
        [timeZone="timeZone"] 
        [var="varName"]
        [scope="{page|request|session|application}"]/>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/35f31475_Untitled.png]]

- 사용자 정의 형식 패턴에 따라 시간과 날짜 형식을 지정하는 데 사용

```html
<h2>날짜</h2>
	<%-- <c:set var="now" value="<%= new Date() %>"/> --%>
	--> 위코드와 동일 코드
	--> pageContext.setAttribute("now", new Date());
	<fmt:parseDate var="now" value="2022-01-19 09:30:33" pattern="yyyy-MM-dd HH:mm:ss"/>
	<ul>
		<li>
			<fmt:formatDate value="${now}" type="date"/>
		</li>
		<li>
			<fmt:formatDate value="${now}" type="time"/>
		</li>
		<li>
			<fmt:formatDate value="${now}" type="both"/>
		</li>
		<li>
			<fmt:formatDate value="${now}" pattern="yyyy/MM/dd(E) HH:mm:ss"/>
		</li>
		<li>
			<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 (E요일)"/>
		</li>
	</ul>
```

### 02. **JSTL function tags : 출력을 위한 문자열 관련 함수**

---

많은 표준 함수를 제공, 대부분은 일반적인 문자열 조작 함수

JSTL 함수 라이브러리를 포함시키는 데 사용되는 구문

```java
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
```

| **JSTL Functions** | **Description** |
| --- | --- |
| fn:contains() | 프로그램에서 지정된 하위 문자열을 포함하는 입력 문자열인지 테스트하는 데 사용 |
| fn:containsIgnoreCase() | 입력 문자열에 대소 문자를 구분하지 않고 지정된 하위 문자열이 포함되어 있는지 테스트하는 데 사용 |
| fn:endsWith() | 입력 문자열이 지정된 접미어로 끝나는 지 테스트하는 데 사용 |
| fn:escapeXml() | XML 마크업으로 해석되는 문자를 escape |
| fn:indexOf() | 지정된 하위 문자열이 처음 나타나는 문자열 내에서 인덱스를 반환 |
| fn:trim() | 문자열의 양쪽 끝에서 공백을 제거 |
| fn:startsWith() | 주어진 문자열이 특정 문자열 값으로 시작되는지 여부를 확인하는 데 사용. |
| fn:split() | 문자열을 하위 문자열 배열로 분할 |
| fn:toLowerCase() | 문자열의 모든 문자를 소문자로 변환 |
| fn:toUpperCase() | 문자열의 모든 문자를 대문자로 변환 |
| fn:substring() | 주어진 시작 및 끝 위치에 따라 문자열의 하위 집합을 반환 |
| fn:substringAfter() | 특정 하위 문자열 다음에 문자열의 하위 집합을 반환 |
| fn:substringBefore() | 특정 하위 문자열 앞의 문자열 하위 집합을 반환 |
| fn:length() | 문자열 내부의 문자 수 또는 컬렉션의 항목 수를 반환 |
| fn:replace() | 모든 문자열을 다른 문자열 시퀀스로 바꿈 |
- **JSTL에서 문자열 연결하기** <**문자열은 연산이 안됌!! ( ${},${}  | concat(,))>**
    - concat : String 클래스에서 제공하는 기본 메서드이며 동작 방법은 합친 문자열을 String으로 생성한다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6ef34e9a_Untitled.png]]
    
```html
<%
	request.setAttribute("str1", "Hello world, Hello jstl");
	request.setAttribute("str2", "Hello EL");
%>
~~<li>${str1 + str2}</li>~~  -> numberFormatException 발생!
<li>${str1}, ${str2}</li>
<li>${str1.concat(", ").concat(str2)}</li>
```


#### <fn:toUpperCase()> Tag :  대문자 변환

---

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
		<li>${fn:toUpperCase(requestScope.str1)}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/749b78c3_Untitled.png]]

#### <fn:toLowerCase()> Tag :  소문자 변환

---

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
		<li>${fn:toLowerCase(str1)}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b91db5e0_Untitled.png]]

#### <fn:length()> Tag :  문자 수 또는 컬렉션의 항목 수 반환

---

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
		<li>${fn:length(str1)}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c42f38f3_Untitled.png]]

#### <fn:indexOf()> Tag :  인덱스 반환

---

- 존재하지 않는 문자열을 찾아달라고 했을 경우에는 ‘-1’을 반환

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
		<li>${fn:indexOf(str1, "world")} 
${fn:indexOf(str1, "wwwwwworld")}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0b1f3fa2_Untitled.png]]

#### <fn:contains()> Tag :  문자열 포함 여부

---

- 존재하지 않는 문자열을 찾아달라고 했을 경우에는 ‘-1’을 반환
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fcf7a1cf_Untitled.png]]
    

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
	<li>${fn:contains(str1, 'world')}
		<c:if test="${fn:contains(str1, 'world')}">world가 있습니다.</c:if>
		<c:if test="${not fn:contains(str1, 'world')}">world가 없습니다.</c:if>
	</li>
</ul>
```

#### <fn:substring()> Tag :  지정 인덱스 문자열 반환

---

- start는 포함 | end 미포함

> **Servlet**
> 

```java
request.setAttribute("str1", "Hello world, Hello jstl");
```

> **JSP**
> 

```html
<ul>
	<li>${fn:substring(str1, 6, 11)}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/bf51b8f1_Untitled.png]]

#### <fn:escapeXml()> Tag :  Cross-Site Scripting 공격대비

---

- **`EL태그 ${} 보다 <**fn:escapeXml()**>을 사용해야 하는 이유**`
    - **보안성의 문제**
    - cross-site Scripting 공격은 스크립트를 주입시켜서 사이트를 침입하기 때문에 E:태그보다 c:out태그를 사용할 시에 좀 더 안전하게 페이지를 만들 수 있다.
    
    > **out을 사용하지 않았을 때**
    > 
    
```java
request.setAttribute("xss1", "<style>* {color: red}</style>");
request.setAttribute("xss2", "<script>alert('메롱!');</script>");
```

```html
<ul>
	<li>${xss1}</li>
	<li>${xss2}</li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fcf0bee7_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3f41e15f_Untitled.png]]

> `c:out`태그와 `<fn:escapeXml>`태그를 사용했을때
> 

```html
<ul>
		<li>${fn:escapeXml(xss1)}</li>
		<li>${fn:escapeXml(xss2)}</li>
		<li><c:out value="${xss1}" escapeXml="true"/></li>
		<li><c:out value="${xss2}" escapeXml="true"/></li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/cbf37bc9_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/69717702_Untitled.png]]

- 이스케이핑처리를 알아서 해주기 때문에 `<style>, <script>` 태그가 적용될 수 없게 함.
- 사용자 입력값 부분에 이 기능을 적용해주면 공격을 막을 수있다.

> **Servlet**
> 

```java
request.setAttribute("xss1", "<style>* {color: red}</style>");
request.setAttribute("xss2", "<script>alert('메롱!');</script>");
```

> **JSP**
> 

```html
<ul>
	<li>${fn:escapeXml(xss1)}</li>
	<li>${fn:escapeXml(xss2)}</li>
	<li><c:out value="${xss1}" escapeXml="true"/></li>
	<li><c:out value="${xss2}" escapeXml="true"/></li>
</ul>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1a5cfc82_Untitled.png]]

```html
<li>&lt;style&gt;* {color: red}&lt;/style&gt;</li>
<li>&lt;script&gt;alert(&#039;메롱!&#039;);&lt;/script&gt;</li>
<li>&lt;style&gt;* {color: red}&lt;/style&gt;</li>
<li>&lt;script&gt;alert(&#039;메롱!&#039;);&lt;/script&gt;</li>
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
