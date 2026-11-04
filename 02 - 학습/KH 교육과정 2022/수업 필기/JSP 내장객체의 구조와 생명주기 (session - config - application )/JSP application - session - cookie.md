---
별칭:
  - "강의 - JSP application / session / cookie"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/e551457b1a044d1eb3250b82e959be4e
---

# 강의: JSP application / session / cookie

## 강의 내용

---

---

### 상태 저장을 위한 값의 저장소의 특징

#### 1. application

---

사용 범위 : **전역 범위**에서 사용하는 저장 공간

생명 주기 : **WAS** 가 시작해서 종료할 때 까지

저장 위치 : WAS 서버의 메모리

서블릿 컨텍스트(Context)로, 서블릿들 간의 문맥을 저장할 수 있는 곳이자, 자원을 공유할 수 있는 저장소이다. application은 사이트를 방문한 누구나 상태값을 서버(웹 어플리케이션)에 application 객체를 저장하여 사용하도록 한다.

```java
ServletContext application = request.getServletContext();
// application 객체를 생성하여 클라이언트의 정보를 저장한다.

String v_ = request.getParameter("v");
String op = request.getParameter("operator");
int v=0;	

if(!v_.equals("")) v = Integer.parseInt(v_);
	//계산
	if(op.equals("=")) {
		int x = (Integer)application.getAttribute("value");	//이전에 사용자가 전달한 값
		int y = v; //지금 사용자가 전달한 값
		String operator =(String) application.getAttribute("op");
		
		int result = 0;
		
		if(operator.equals("+")) {
			result = x+y;
		out.printf("result is %d\\\\n", result);
		} else {
			result = x-y;
			
		out.printf("result is %d\\\\n", result);
		}
	} //값을 저장
	else {
		application.setAttribute("value", v_); // map과 흡사
		application.setAttribute("op", op); // 값을 저장
	}
	
}
```

이처럼 getAttribute() 메소드와 setAttribute() 메소드를 사용하여 사용자가 전달한 값을 서버에 저장하고, 서블릿에서 사용하게 된다.

#### 2. Session

---

사용 범위 : **세션 범위**에서 사용하는 저장 공간

생명 주기 : **세션이** 시작해서 종료할 때 까지

저장 위치 : WAS 서버의 메모리

Session은 웹 서버가 현재 사용자를 구분하는 방식이라고 할 수 있다.

Session은 application과 거의 같은데, 쓸 수 있는 범위가 다르다.

was에서 누구나 저장해놓을 수 있는 공간이 application이라면, 그 중 개인별로 사물함을 제공한 것이 session이라고 할 수 있다. 

**즉, 세션은 현재 접속한 사용자마다 개별적으로 공간을 부여받도록 하여 값을 저장한다.**

클라이언트가 사이트에 **처음 방문했을 경우 그 사용자를 위한 세션은 존재하지 않는다.** 

사이트에서 나갈 때 세션(SID, Session ID)를 발급해주게 된다.

이후 다시 사용자가 사이트에 방문하여 SID를 가져오면 세션의 값을 넣어서 사용할 수 있다. 

**브라우저마다 세션값이 다르게 발급**되어 동일 컴퓨터에서 같은 사이트를 사용하더라도 브라우저(크롬 or 익스플로러) 의 세션값은 다르게 나타나는 것이다.

```java
@WebServlet("/calc2")
public class Calc2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	    HttpSession session = request.getSession();//세션
	    
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();

		String v_ = request.getParameter("v");
		String op = request.getParameter("operator");
		int v=0;
		
		if(!v_.equals("")) v = Integer.parseInt(v_);
		//계산
		if(op.equals("=")) {
			int x = (Integer)session.getAttribute("value");//이전에 사용자가 전달한 값
			int y =v; //지금 사용자가 전달한 값
			String operator =(String) session.getAttribute("op");
			int result = 0;
			
			if(operator.equals("+")) {
				result = x+y;
			out.printf("result is %d\\n", result);
			} else {
				result = x-y;
			out.printf("result is %d\\n", result);
			}
		} //값을 저장
		else {
			session.setAttribute("value", v_);//like map
			session.setAttribute("op", op);//값을 저장
		}
		
	}
}
```

- 저장소를 비울 때 사용되는 메소드 → void invalidate() 세션에서 사용되는 session 객체들을 무효화(invalidate)시킨다.
- 로그인 세션에 대해 타임아웃이 있으며, 이를 위한 메소드들이 있다.

#### 3. Cookie

---

사용 범위 : **Web Browser**별 지정한 **path 범주** 공간

생명 주기 : **Browser에 전달한 시간**부터 **만료시간**까지

저장 위치 : Web Browser의 메모리 또는 파일

application과 session이 서버 측에 저장된 것과 달리, **Cookie는 클라이언트 측에 저장되어 사용**된다.

> **`addCookie` → 쿠키 클라이언트 측에 저장하기**
> 

```java
Cookie cookie = new Cookie("c", c); 
// 쿠키 생성. 쿠키 값은 문자열로 보내야 하는데, json을 사용하면 다양한 값을 쓸 수 있다고 한다.
response.addCookie(cookie); 
//was에서 클라이언트에 쿠키를 보낸다.
```

> **`getCookie()` → 쿠키를 클라이언트로 부터 받아 사용**
> 

```java
// 클라이언트가 쿠키 받음
Cookie[] cookies = request.getCookies();  //쿠키는 배열값으로 리퀘스트됨
String _c = "c";
	if(cookies !=null){ // was 측에서 쿠키를 받기 위한 식. 배열이므로 for문을 사용한다.
	for(Cookie cookie : cookies){
		if("c".equals(cookie.getName()))
			_c = cookie.getValue();
		}
	}
}
```

> **쿠키의 path 옵션**
> 

서블릿은 필요에 따라 여러 개 만들어진다. 여러 서블릿을 통해 브라우저는 서블릿마다 다른 쿠키를 가져가게 될 것이다. 따라서 **쿠키에 url을 설정함으로써 쿠키를 해당 url과 관련된 서블릿에만 사용되도록 할 수 있다.**

- 사용범위: web Browser별 지정한 path 범주 공간

```java
setPath(String url) // 쿠키가 어느 경우에 사용자에게 전달되어야 하는지 사용범위 설정
```

> **쿠키의 maxAge 옵션**
> 
- 기간을 설정하면 그 기간 동안 값을 유지하는 것.
- 설정하지 않으면 브라우저가 닫혔을 때, cookie의 생존주기가 같으므로 사라지게 된다.
- 지속적인 쿠키의 값을 유지하기 위하여 쿠키에 maxAge옵션 설정
    - 설정해주면 쿠키는 브라우저 메모리에 연결된 외부 메모리에 저장됨.
    - 브라우저 닫고 열어도 저장된 쿠키를 사용할 수 있다.
- 생명주기: Browser에 전달한 시간부터 만료시간까지

```java
setMaxAge(int second) // 쿠키의 생명주기를 설정
```

```java
// 예시 코드(계산)

@WebServlet("/calc2")
public class Calc2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cookie[] cookies = request.getCookies(); //쿠키 배열을 클라이언트에게 받음

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		String v_ = request.getParameter("v");
		String op = request.getParameter("operator");
		int v = 0;

		if (!v_.equals(""))
			v = Integer.parseInt(v_);
		// 계산
		if (op.equals("=")) {

			int x = 0;
			
			String operator = "";
			for (Cookie c : cookies) {
				if (c.getName().equals("value")) {
					x = Integer.parseInt(c.getValue());
					break;
				}
			}
			int y = v; // 지금 사용자가 전달한 값
			
			int result = 0;
			for (Cookie c : cookies) {
				if (c.getName().equals("op")) {
					operator = c.getValue();
					break;
				}
			}
			if (operator.equals("+")) {
				result = x + y;
				out.printf("result is %d\\n", result);
			} else {
				result = x - y;
				out.printf("result is %d\\n", result);
			}
		} // 값을 저장
		else {
				Cookie cookie = new Cookie("Cookie", ck); //쿠키의 이름="Cookie", 값=ck 로 설정
				cookie.setMaxAge(24*60*60)//매개변수 → 시간 의미단위로 명확하게 표현
				cookie.SetPath("/의미있는url"); // "/"->모든 url, 뒤에 의미 있는 url 붙여줌
				response.addCookie(cookie); //쿠키를 클라이언트에게 전달해줌
		}

	}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JSP 내장객체의 구조와 생명주기 (session - config - application )/JSP 내장객체의 구조와 생명주기 (session - config - application )|JSP 내장객체의 구조와 생명주기 (session / config / application )]]
