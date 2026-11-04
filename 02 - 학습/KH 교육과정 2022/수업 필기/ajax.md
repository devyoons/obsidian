---
별칭:
  - "강의 - ajax"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/82ee32054e7c4cbaaec5e48d6b1ae21e
---

# 강의: ajax

## 강의 내용

---

---

### ajax란?

Asynchornous JavaScript And XML

: 서버와 비동기적으로 데이터를 주고받는 자바스트립트 기술을 의미함.

:새로고침 없이 서버에게 GET요청하는 작은 JS코드 

:일부만 로드할 수 있게 하는 기법

ex ) 실시간 검색어, 검색어 자동 완성

| 장점 | 단점 |
| --- | --- |
| 새로고침이 없어서 웹페이지 전환이 부드러움 | 한 페이지에 지속적으로 사용시 리소스가 계속 쌓여 페이지가 느려짐 |
| 즉, 웹서버 응답을 기다리지 않고 데이터를 빠르게 처리하는 개발기법 | 스트립트로 되어 있어 에러 발생시 디버깅이 어려움 |

- markdown 정리
    
    ```markdown
    # Ajax
    * Asynchronous JavaScript and XML 이란 용어로써 2005년 2월 제시 제임스 카렛이 처음 사용하면서 알려지게 되었음
    * 서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법으로 비동기식 요청을 보내는데 필요한 기술을 말함
    
    ## 동기식/비동기식이란?
    동기식은 서버와 클라이언트가 동시에 통신하여 프로세스를 수행 및 종료까지 같이함. 
    만약 서버에서 호출된 결과까지의 시간이 지연이 생길 경우 웹에서는 아무런 작동 없이 기다려야함.
    새로운 콘텐츠를 추가, 불러오기 위해서는 페이지를 리로드 하거나 이동해야함.
    
    이에 반해 비동기식은 페이지 리로딩 없이, 동기식의 서버요청 사이사이 추가적인 요청과 처리가 가능함.
    
    * 실시간 검색어 로딩
    * 검색어자동 완성
    * 아이디 중복체크 등...
    
    단점
    
    * 한 페이지에 지속적으로 사용시 리소스가 계속 쌓여 페이지가 느려질 수 있다.
    * 페이지내 복잡도가 기하급수적으로 증가, 에러 발생시 디버깅이 어려움
    
    ## ajax 비동기식과 동기식 처리
    
    1. 비동기식 처리 모델
    먼저 서버에 데이터를 요청 script 문을 실행함. 
    브라우저는 요청한 데이터를 기다리지 않고, 이후 스크립트를 계속 처리함.
    그리고 요청한 데이터가 도착을 하면 그때 이벤트가 발생하면서 지정된 함수가 호출되어 실행되는 방식 
    
    2. 동기식 처리 모델 
    페이지가 로드 되는 동안 브라우저는 script 문을 실행하게 되면 
    그 실행이 종료될 때까지 이후 스크립트는 처리하지 않고 기다리고 있다가 
    서버요청처리가 종료되면 이후 스크립트를 실행함.
    
    ## ajax의 구현
    JavaScript 방식과 jQuery 방식이 있음
    그 중 실제로 많이 사용하는 방식은 jQuery 방식 (코드가 간결하고 사용하기 쉬움)
    
    ## 처리 절차
    1. script문에 요청을 위한 XMLHttpRequest 객체 생성
    2. 서버에 응답을 처리할 함수 생성 및 지정
    	* onreadystatechange에 함수 지정
    3. open메소드로 요청할 방법 및 요청할 대상(Server) 선정
    	* 요청메소드, 요청주소, 동기/비동기 설정, 아이디, 패스워드 설정
    4. send메소드로 대상(Server)에 전송
    	* post일때 파라미터 값 설정 / get 일때는 매개변수 없음 
    5. 응답상태에 따라 상태 확인
    	* readyState(데이터응답) / status(처리결과) 값을 이용
    6. 응답완료 responseText / responseXML 이용 응답처리
    
    # XMLHttpRequest
    백그라운드에서 비동기적으로 웹서버와 통신을 담당하는 객체로서 사용자의 요청을 웹서버에 전송해주고, 웹서버로 부터 받은 결과를 사용자의 웹브라우저에 전달해줌.
    Ajax에서 통신을 담당하고 데이터를 송수신할 수 있는 핵심 객체가 XMLHttpRequest 임
    
    	var xhr;
    	function createHttpRequest(){
    		xhr = new XMLHttpRequest();
    	}
    
    ## 1. XMLHttpRequest 속성(필드)
    
    * onreadystatechange : readyState 속성이 변경될 때 호출되는 메소드를 저장하는 변수
    * readyState : 객체의 상태를 저장하는 변수
    * responseText : 응답(response) 결과를 문자열로 저장하는 변수
    * responseXML : 응답(response) 결과를 XML data로 저장하는 변수
    * status : 전송/응답 결과를 저장하는 변수(코드값)
    * statusText : 전송/응답 결과를 저장하는 변수(문자열)
    
    ### readyState 속성 값
    * 0 (uninitialized): 요청이 시작되지 않은 상태 / open 메소드가 호출되지 않은 상태 
    * 1 (loading) : 서버와 접속된 상태 / send 메소드가 호출되지 않은 상태
    * 2 (loaded) : send 메소드가 호출되고 헤더는 도착하지 않은 상태
    * 3 (interactive) : 일부 데이터를 받은 상태
    * 4 (completed) : 요청을 완료하고 응답하는 상태
    
    ### status 속성 값
    * 200 (OK) : 요청 성공
    * 404 (Not Found) : 페이지 없음
    * 500 (Internal Server Error) : 서버 오류 발생 등...
    
    [http status 값 참조 ](https://www.w3schools.com/tags/ref_httpmessages.asp)
    
    -> 기본적으로 Ajax를 구현할 때는 readyState(값:4) 와 status(값:200)를 비교하여 요청이 모두 
    정상적으로 완료된 것을 확인한 후에 다음 작업을 진행 해야 함
    
    	if(xhr.readyState==4){
    		if(xhr.status==200){
    			//정상 처리 작업
    		}else{
    			//에러 처리 작업
    		}
    	}
    
    ## 2. XMLHttpRequest의 메소드
    * abort()	: 요청을 취소하는 메소드
    * getAllResponseHeaders() : 응답헤더의 정보를 가져오는 메소드
    * getResponseHeader("헤더명") : 특정 헤더정보만 가져오는 메소드
    * open(method,url,async,user,pw) : 요청정보를 설정하는 메소드
    * send() : 서버로 요청을 보내는 메소드 (get방식)
    * send(String) : 서버로 요청을 보내는 메소드 (post방식)
    * setRequestHeader() : 헤더에 이름/값 방식으로 정보를 추가하는 메소드
    
    ## 3. responseText와 responseXML 
    서버로부터 데이터의 내용을 응답받는 방법으로는 2가지를 제공
    * responseText에 의해 일반적인 텍스트 형태로 받는 방법
    * responseXML에 의해 XML 형식으로 받는 방법
    	* responseXML로 반환받으면 자동으로 DOM의 Document객체가 생성되어 직접 XML 파싱 처리를 할 수 있음
    
    ex) 객체 생성후 속성값으로 응답처리
    var httpRequest = getHttpRequest();
    
    var value = httpRequest.responseText;
    또는
    document.getElementById("test").innerHTML = httpRequest.responseText;
    
    <script>
      var httpRequest= getHttpRequest();
      httpRequest.onreadystatechange=test;
      
      function test()
      {
          if(httpRequest.readyState===4)
          {
              if(httpRequest.status===200)
              {
    			doucument.getElementById(“ex”).innerHTML
                       =httpRequest.responseText; //특정 태그에 응답 받은 데이터 처리
              }
          }
       }
    </script>
    
    ## CSV형식의 예제
    CSV(Comma Separated Values)는 여러 데이터를 쉼표로 구분해서 표현하는 방법
    
    CSV 데이터
    
    	홍길동,20,서울
    	김말똥,30,경기
    
    	var responseData = xhttp.responseText;
    	var rows = responseData.split("\n");  	// 개행문자로 행을 구분
    	var cols = rows[0].split(",");		// 쉼표(,)로 열을 구분
    	var rowData = cols[0] + "\t" + cols[1] +"\t\ + cols[2]";
    	alert(rowData);
    
    ## XML형식의 예제
    XML은 데이터를 표현하는 방식으로 사용자가 태그를 정의함 (HTML과 비슷하나 기능적인 태그가 정의된것은 아님)
    
    XML 형식의 데이터
    	
    	<?xml version="1.0" encoding="UTF-8"?>
    	<student>
    		<name>홍길동</name>
    		<age>20</age>
    		<addr>경기</addr>
    	</student>
    
    	var responseData = xhr.responseXML;
    	var names = responseData.getElementsByTagName("name");
    	var name = names[0].firstChild.nodeValue;
    	alert(name);
    
    ## jQuery Ajax
    * ajax 통신은 jQuery로 하게 되면 훨씬 간단하게 할 수 있음
    * 또한 크로스브라우징이슈를 jQuery가 알아서 해결해 줌
    * jQuery Ajax에서 가장 중요한 API는 "$.ajax" 임
    	
    $.ajax의 기본 문법
    
    	jQuery.ajax( [settings ] );
    
    	$.ajax({
    		설정 값1,
    		설정 값2,
    		설정 값3,
    		설정 값4……
    	});
    
    [참고 API](http://api.jquery.com/jquery.ajax/)
    
    Ajax 주요 속성
    * url - 요청 할 server의 url
    * accept - 파라미터의 타입을 설정(사용자 특화 된 파라미터 타입 설정 가능)
    * async	- 서버와의 비동기 처리 방식 설정 여부(기본값 true)
    * beforeSend - ajax 요청을 하기 전 실행 되는 이벤트 callback 함수(데이터 가공 및 header 관련 설정)
    * cache	- 요청 및 결과값을 scope에서 갖고 있지 않도록 하는것(기본값 true)
    * complete - 요청 완료 후 실행되는 메소드(성공, 에러 이 후에 무조건 실행)
    * contents - jquery 에서 response의 데이터를 파싱하는 방식 정의
    * contentType - request의 데이터 인코딩 방식 정의,(보내는 측의 데이터 인코딩)
    * context	- ajax 메소드 내 모든 영역에서 사용 가능한 값
    * converters - object가 포함되었을때 파싱 방식 정의
    * crossDomain - 타 도메인 호출 가능 여부 설정 (기본값 false)
    * data	- 요청 parameter 설정
    * dataFilter - response를 받았을때 정상적인 값을 return 할수 있도록 데이터와 데이터 타입 설정
    * dataType - 서버에서 response 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함.
    	* xml - 트리 형태의 데이터 구조
    	* json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
    	* script - javascript 및 일반 string 형태 데이터 
    	* html - html태그 자체를 return 하는 방식
    	* text - string 데이터
    * error	- ajax통신에 실패했을 때 호출될 이벤트 핸들러
    * global	- 기본 이벤트 사용 여부(ajaxStart, ajaxStop)(버퍼링 같이 시작과 끝을 나타낼때, 선처리 작업)
    * method | type	- 서버 요청 방식(GET, POST, PUT) 기본값 GET
    * password - 서버에 접속 권한(비밀번호)가 필요한 경우
    * processData - 서버로 보내는 값에 대한 형태 설정 여부(기본데이터를 원하는 경우 false 설정)
    * success - ajax통신에 성공했을 때 호출될 이벤트 핸들러
    * timeout - 서버 요청 시 응답 대기 시간(milisecond)
    
    [참고 API:http://api.jquery.com/jquery.ajax/](http://api.jquery.com/jquery.ajax/)
    ```
    
    ```markdown
    # Ajax
    * Asynchronous JavaScript and XML 이란 용어로써 2005년 2월 제시 제임스 카렛이 처음 사용하면서 알려지게 되었음
    * 서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법으로 비동기식 요청을 보내는데 필요한 기술을 말함
    
    ## 동기식/비동기식이란?
    동기식은 서버와 클라이언트가 동시에 통신하여 프로세스를 수행 및 종료까지 같이함. 
    만약 서버에서 호출된 결과까지의 시간이 지연이 생길 경우 웹에서는 아무런 작동 없이 기다려야함.
    새로운 콘텐츠를 추가, 불러오기 위해서는 페이지를 리로드 하거나 이동해야함.
    
    이에 반해 비동기식은 페이지 리로딩 없이, 동기식의 서버요청 사이사이 추가적인 요청과 처리가 가능함.
    
    * 실시간 검색어 로딩
    * 검색어자동 완성
    * 아이디 중복체크 등...
    
    단점
    
    * 한 페이지에 지속적으로 사용시 리소스가 계속 쌓여 페이지가 느려질 수 있다.
    * 페이지내 복잡도가 기하급수적으로 증가, 에러 발생시 디버깅이 어려움
    
    ## ajax 비동기식과 동기식 처리
    
    1. 비동기식 처리 모델
    먼저 서버에 데이터를 요청 script 문을 실행함. 
    브라우저는 요청한 데이터를 기다리지 않고, 이후 스크립트를 계속 처리함.
    그리고 요청한 데이터가 도착을 하면 그때 이벤트가 발생하면서 지정된 함수가 호출되어 실행되는 방식 
    
    2. 동기식 처리 모델 
    페이지가 로드 되는 동안 브라우저는 script 문을 실행하게 되면 
    그 실행이 종료될 때까지 이후 스크립트는 처리하지 않고 기다리고 있다가 
    서버요청처리가 종료되면 이후 스크립트를 실행함.
    
    ## ajax의 구현
    JavaScript 방식과 jQuery 방식이 있음
    그 중 실제로 많이 사용하는 방식은 jQuery 방식 (코드가 간결하고 사용하기 쉬움)
    
    ## 처리 절차
    1. script문에 요청을 위한 XMLHttpRequest 객체 생성
    2. 서버에 응답을 처리할 함수 생성 및 지정
    	* onreadystatechange에 함수 지정
    3. open메소드로 요청할 방법 및 요청할 대상(Server) 선정
    	* 요청메소드, 요청주소, 동기/비동기 설정, 아이디, 패스워드 설정
    4. send메소드로 대상(Server)에 전송
    	* post일때 파라미터 값 설정 / get 일때는 매개변수 없음 
    5. 응답상태에 따라 상태 확인
    	* readyState(데이터응답) / status(처리결과) 값을 이용
    6. 응답완료 responseText / responseXML 이용 응답처리
    
    # XMLHttpRequest
    백그라운드에서 비동기적으로 웹서버와 통신을 담당하는 객체로서 사용자의 요청을 웹서버에 전송해주고, 웹서버로 부터 받은 결과를 사용자의 웹브라우저에 전달해줌.
    Ajax에서 통신을 담당하고 데이터를 송수신할 수 있는 핵심 객체가 XMLHttpRequest 임
    
    	var xhr;
    	function createHttpRequest(){
    		xhr = new XMLHttpRequest();
    	}
    
    ## 1. XMLHttpRequest 속성(필드)
    
    * onreadystatechange : readyState 속성이 변경될 때 호출되는 메소드를 저장하는 변수
    * readyState : 객체의 상태를 저장하는 변수
    * responseText : 응답(response) 결과를 문자열로 저장하는 변수
    * responseXML : 응답(response) 결과를 XML data로 저장하는 변수
    * status : 전송/응답 결과를 저장하는 변수(코드값)
    * statusText : 전송/응답 결과를 저장하는 변수(문자열)
    
    ### readyState 속성 값
    * 0 (uninitialized): 요청이 시작되지 않은 상태 / open 메소드가 호출되지 않은 상태 
    * 1 (loading) : 서버와 접속된 상태 / send 메소드가 호출되지 않은 상태
    * 2 (loaded) : send 메소드가 호출되고 헤더는 도착하지 않은 상태
    * 3 (interactive) : 일부 데이터를 받은 상태
    * 4 (completed) : 요청을 완료하고 응답하는 상태
    
    ### status 속성 값
    * 200 (OK) : 요청 성공
    * 404 (Not Found) : 페이지 없음
    * 500 (Internal Server Error) : 서버 오류 발생 등...
    
    [http status 값 참조 ](https://www.w3schools.com/tags/ref_httpmessages.asp)
    
    -> 기본적으로 Ajax를 구현할 때는 readyState(값:4) 와 status(값:200)를 비교하여 요청이 모두 
    정상적으로 완료된 것을 확인한 후에 다음 작업을 진행 해야 함
    
    	if(xhr.readyState==4){
    		if(xhr.status==200){
    			//정상 처리 작업
    		}else{
    			//에러 처리 작업
    		}
    	}
    
    ## 2. XMLHttpRequest의 메소드
    * abort()	: 요청을 취소하는 메소드
    * getAllResponseHeaders() : 응답헤더의 정보를 가져오는 메소드
    * getResponseHeader("헤더명") : 특정 헤더정보만 가져오는 메소드
    * open(method,url,async,user,pw) : 요청정보를 설정하는 메소드
    * send() : 서버로 요청을 보내는 메소드 (get방식)
    * send(String) : 서버로 요청을 보내는 메소드 (post방식)
    * setRequestHeader() : 헤더에 이름/값 방식으로 정보를 추가하는 메소드
    
    ## 3. responseText와 responseXML 
    서버로부터 데이터의 내용을 응답받는 방법으로는 2가지를 제공
    * responseText에 의해 일반적인 텍스트 형태로 받는 방법
    * responseXML에 의해 XML 형식으로 받는 방법
    	* responseXML로 반환받으면 자동으로 DOM의 Document객체가 생성되어 직접 XML 파싱 처리를 할 수 있음
    
    ex) 객체 생성후 속성값으로 응답처리
    var httpRequest = getHttpRequest();
    
    var value = httpRequest.responseText;
    또는
    document.getElementById("test").innerHTML = httpRequest.responseText;
    
    <script>
      var httpRequest= getHttpRequest();
      httpRequest.onreadystatechange=test;
      
      function test()
      {
          if(httpRequest.readyState===4)
          {
              if(httpRequest.status===200)
              {
    			doucument.getElementById(“ex”).innerHTML
                       =httpRequest.responseText; //특정 태그에 응답 받은 데이터 처리
              }
          }
       }
    </script>
    
    ## CSV형식의 예제
    CSV(Comma Separated Values)는 여러 데이터를 쉼표로 구분해서 표현하는 방법
    
    CSV 데이터
    
    	홍길동,20,서울
    	김말똥,30,경기
    
    	var responseData = xhttp.responseText;
    	var rows = responseData.split("\n");  	// 개행문자로 행을 구분
    	var cols = rows[0].split(",");		// 쉼표(,)로 열을 구분
    	var rowData = cols[0] + "\t" + cols[1] +"\t\ + cols[2]";
    	alert(rowData);
    
    ## XML형식의 예제
    XML은 데이터를 표현하는 방식으로 사용자가 태그를 정의함 (HTML과 비슷하나 기능적인 태그가 정의된것은 아님)
    
    XML 형식의 데이터
    	
    	<?xml version="1.0" encoding="UTF-8"?>
    	<student>
    		<name>홍길동</name>
    		<age>20</age>
    		<addr>경기</addr>
    	</student>
    
    	var responseData = xhr.responseXML;
    	var names = responseData.getElementsByTagName("name");
    	var name = names[0].firstChild.nodeValue;
    	alert(name);
    
    ## jQuery Ajax
    * ajax 통신은 jQuery로 하게 되면 훨씬 간단하게 할 수 있음
    * 또한 크로스브라우징이슈를 jQuery가 알아서 해결해 줌
    * jQuery Ajax에서 가장 중요한 API는 "$.ajax" 임
    	
    $.ajax의 기본 문법
    
    	jQuery.ajax( [settings ] );
    
    	$.ajax({
    		설정 값1,
    		설정 값2,
    		설정 값3,
    		설정 값4……
    	});
    
    [참고 API](http://api.jquery.com/jquery.ajax/)
    
    Ajax 주요 속성
    * url - 요청 할 server의 url
    * accept - 파라미터의 타입을 설정(사용자 특화 된 파라미터 타입 설정 가능)
    * async	- 서버와의 비동기 처리 방식 설정 여부(기본값 true)
    * beforeSend - ajax 요청을 하기 전 실행 되는 이벤트 callback 함수(데이터 가공 및 header 관련 설정)
    * cache	- 요청 및 결과값을 scope에서 갖고 있지 않도록 하는것(기본값 true)
    * complete - 요청 완료 후 실행되는 메소드(성공, 에러 이 후에 무조건 실행)
    * contents - jquery 에서 response의 데이터를 파싱하는 방식 정의
    * contentType - request의 데이터 인코딩 방식 정의,(보내는 측의 데이터 인코딩)
    * context	- ajax 메소드 내 모든 영역에서 사용 가능한 값
    * converters - object가 포함되었을때 파싱 방식 정의
    * crossDomain - 타 도메인 호출 가능 여부 설정 (기본값 false)
    * data	- 요청 parameter 설정
    * dataFilter - response를 받았을때 정상적인 값을 return 할수 있도록 데이터와 데이터 타입 설정
    * dataType - 서버에서 response 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함.
    	* xml - 트리 형태의 데이터 구조
    	* json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
    	* script - javascript 및 일반 string 형태 데이터 
    	* html - html태그 자체를 return 하는 방식
    	* text - string 데이터
    * error	- ajax통신에 실패했을 때 호출될 이벤트 핸들러
    * global	- 기본 이벤트 사용 여부(ajaxStart, ajaxStop)(버퍼링 같이 시작과 끝을 나타낼때, 선처리 작업)
    * method | type	- 서버 요청 방식(GET, POST, PUT) 기본값 GET
    * password - 서버에 접속 권한(비밀번호)가 필요한 경우
    * processData - 서버로 보내는 값에 대한 형태 설정 여부(기본데이터를 원하는 경우 false 설정)
    * success - ajax통신에 성공했을 때 호출될 이벤트 핸들러
    * timeout - 서버 요청 시 응답 대기 시간(milisecond)
    
    [참고 API:http://api.jquery.com/jquery.ajax/](http://api.jquery.com/jquery.ajax/)
    ```
    
    ```markdown
    # Ajax
    * Asynchronous JavaScript and XML 이란 용어로써 2005년 2월 제시 제임스 카렛이 처음 사용하면서 알려지게 되었음
    * 서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법으로 비동기식 요청을 보내는데 필요한 기술을 말함
    
    ## 동기식/비동기식이란?
    동기식은 서버와 클라이언트가 동시에 통신하여 프로세스를 수행 및 종료까지 같이함. 
    만약 서버에서 호출된 결과까지의 시간이 지연이 생길 경우 웹에서는 아무런 작동 없이 기다려야함.
    새로운 콘텐츠를 추가, 불러오기 위해서는 페이지를 리로드 하거나 이동해야함.
    
    이에 반해 비동기식은 페이지 리로딩 없이, 동기식의 서버요청 사이사이 추가적인 요청과 처리가 가능함.
    
    * 실시간 검색어 로딩
    * 검색어자동 완성
    * 아이디 중복체크 등...
    
    단점
    
    * 한 페이지에 지속적으로 사용시 리소스가 계속 쌓여 페이지가 느려질 수 있다.
    * 페이지내 복잡도가 기하급수적으로 증가, 에러 발생시 디버깅이 어려움
    
    ## ajax 비동기식과 동기식 처리
    
    1. 비동기식 처리 모델
    먼저 서버에 데이터를 요청 script 문을 실행함. 
    브라우저는 요청한 데이터를 기다리지 않고, 이후 스크립트를 계속 처리함.
    그리고 요청한 데이터가 도착을 하면 그때 이벤트가 발생하면서 지정된 함수가 호출되어 실행되는 방식 
    
    2. 동기식 처리 모델 
    페이지가 로드 되는 동안 브라우저는 script 문을 실행하게 되면 
    그 실행이 종료될 때까지 이후 스크립트는 처리하지 않고 기다리고 있다가 
    서버요청처리가 종료되면 이후 스크립트를 실행함.
    
    ## ajax의 구현
    JavaScript 방식과 jQuery 방식이 있음
    그 중 실제로 많이 사용하는 방식은 jQuery 방식 (코드가 간결하고 사용하기 쉬움)
    
    ## 처리 절차
    1. script문에 요청을 위한 XMLHttpRequest 객체 생성
    2. 서버에 응답을 처리할 함수 생성 및 지정
    	* onreadystatechange에 함수 지정
    3. open메소드로 요청할 방법 및 요청할 대상(Server) 선정
    	* 요청메소드, 요청주소, 동기/비동기 설정, 아이디, 패스워드 설정
    4. send메소드로 대상(Server)에 전송
    	* post일때 파라미터 값 설정 / get 일때는 매개변수 없음 
    5. 응답상태에 따라 상태 확인
    	* readyState(데이터응답) / status(처리결과) 값을 이용
    6. 응답완료 responseText / responseXML 이용 응답처리
    
    # XMLHttpRequest
    백그라운드에서 비동기적으로 웹서버와 통신을 담당하는 객체로서 사용자의 요청을 웹서버에 전송해주고, 웹서버로 부터 받은 결과를 사용자의 웹브라우저에 전달해줌.
    Ajax에서 통신을 담당하고 데이터를 송수신할 수 있는 핵심 객체가 XMLHttpRequest 임
    
    	var xhr;
    	function createHttpRequest(){
    		xhr = new XMLHttpRequest();
    	}
    
    ## 1. XMLHttpRequest 속성(필드)
    
    * onreadystatechange : readyState 속성이 변경될 때 호출되는 메소드를 저장하는 변수
    * readyState : 객체의 상태를 저장하는 변수
    * responseText : 응답(response) 결과를 문자열로 저장하는 변수
    * responseXML : 응답(response) 결과를 XML data로 저장하는 변수
    * status : 전송/응답 결과를 저장하는 변수(코드값)
    * statusText : 전송/응답 결과를 저장하는 변수(문자열)
    
    ### readyState 속성 값
    * 0 (uninitialized): 요청이 시작되지 않은 상태 / open 메소드가 호출되지 않은 상태 
    * 1 (loading) : 서버와 접속된 상태 / send 메소드가 호출되지 않은 상태
    * 2 (loaded) : send 메소드가 호출되고 헤더는 도착하지 않은 상태
    * 3 (interactive) : 일부 데이터를 받은 상태
    * 4 (completed) : 요청을 완료하고 응답하는 상태
    
    ### status 속성 값
    * 200 (OK) : 요청 성공
    * 404 (Not Found) : 페이지 없음
    * 500 (Internal Server Error) : 서버 오류 발생 등...
    
    [http status 값 참조 ](https://www.w3schools.com/tags/ref_httpmessages.asp)
    
    -> 기본적으로 Ajax를 구현할 때는 readyState(값:4) 와 status(값:200)를 비교하여 요청이 모두 
    정상적으로 완료된 것을 확인한 후에 다음 작업을 진행 해야 함
    
    	if(xhr.readyState==4){
    		if(xhr.status==200){
    			//정상 처리 작업
    		}else{
    			//에러 처리 작업
    		}
    	}
    
    ## 2. XMLHttpRequest의 메소드
    * abort()	: 요청을 취소하는 메소드
    * getAllResponseHeaders() : 응답헤더의 정보를 가져오는 메소드
    * getResponseHeader("헤더명") : 특정 헤더정보만 가져오는 메소드
    * open(method,url,async,user,pw) : 요청정보를 설정하는 메소드
    * send() : 서버로 요청을 보내는 메소드 (get방식)
    * send(String) : 서버로 요청을 보내는 메소드 (post방식)
    * setRequestHeader() : 헤더에 이름/값 방식으로 정보를 추가하는 메소드
    
    ## 3. responseText와 responseXML 
    서버로부터 데이터의 내용을 응답받는 방법으로는 2가지를 제공
    * responseText에 의해 일반적인 텍스트 형태로 받는 방법
    * responseXML에 의해 XML 형식으로 받는 방법
    	* responseXML로 반환받으면 자동으로 DOM의 Document객체가 생성되어 직접 XML 파싱 처리를 할 수 있음
    
    ex) 객체 생성후 속성값으로 응답처리
    var httpRequest = getHttpRequest();
    
    var value = httpRequest.responseText;
    또는
    document.getElementById("test").innerHTML = httpRequest.responseText;
    
    <script>
      var httpRequest= getHttpRequest();
      httpRequest.onreadystatechange=test;
      
      function test()
      {
          if(httpRequest.readyState===4)
          {
              if(httpRequest.status===200)
              {
    			doucument.getElementById(“ex”).innerHTML
                       =httpRequest.responseText; //특정 태그에 응답 받은 데이터 처리
              }
          }
       }
    </script>
    
    ## CSV형식의 예제
    CSV(Comma Separated Values)는 여러 데이터를 쉼표로 구분해서 표현하는 방법
    
    CSV 데이터
    
    	홍길동,20,서울
    	김말똥,30,경기
    
    	var responseData = xhttp.responseText;
    	var rows = responseData.split("\n");  	// 개행문자로 행을 구분
    	var cols = rows[0].split(",");		// 쉼표(,)로 열을 구분
    	var rowData = cols[0] + "\t" + cols[1] +"\t\ + cols[2]";
    	alert(rowData);
    
    ## XML형식의 예제
    XML은 데이터를 표현하는 방식으로 사용자가 태그를 정의함 (HTML과 비슷하나 기능적인 태그가 정의된것은 아님)
    
    XML 형식의 데이터
    	
    	<?xml version="1.0" encoding="UTF-8"?>
    	<student>
    		<name>홍길동</name>
    		<age>20</age>
    		<addr>경기</addr>
    	</student>
    
    	var responseData = xhr.responseXML;
    	var names = responseData.getElementsByTagName("name");
    	var name = names[0].firstChild.nodeValue;
    	alert(name);
    
    ## jQuery Ajax
    * ajax 통신은 jQuery로 하게 되면 훨씬 간단하게 할 수 있음
    * 또한 크로스브라우징이슈를 jQuery가 알아서 해결해 줌
    * jQuery Ajax에서 가장 중요한 API는 "$.ajax" 임
    	
    $.ajax의 기본 문법
    
    	jQuery.ajax( [settings ] );
    
    	$.ajax({
    		설정 값1,
    		설정 값2,
    		설정 값3,
    		설정 값4……
    	});
    
    [참고 API](http://api.jquery.com/jquery.ajax/)
    
    Ajax 주요 속성
    * url - 요청 할 server의 url
    * accept - 파라미터의 타입을 설정(사용자 특화 된 파라미터 타입 설정 가능)
    * async	- 서버와의 비동기 처리 방식 설정 여부(기본값 true)
    * beforeSend - ajax 요청을 하기 전 실행 되는 이벤트 callback 함수(데이터 가공 및 header 관련 설정)
    * cache	- 요청 및 결과값을 scope에서 갖고 있지 않도록 하는것(기본값 true)
    * complete - 요청 완료 후 실행되는 메소드(성공, 에러 이 후에 무조건 실행)
    * contents - jquery 에서 response의 데이터를 파싱하는 방식 정의
    * contentType - request의 데이터 인코딩 방식 정의,(보내는 측의 데이터 인코딩)
    * context	- ajax 메소드 내 모든 영역에서 사용 가능한 값
    * converters - object가 포함되었을때 파싱 방식 정의
    * crossDomain - 타 도메인 호출 가능 여부 설정 (기본값 false)
    * data	- 요청 parameter 설정
    * dataFilter - response를 받았을때 정상적인 값을 return 할수 있도록 데이터와 데이터 타입 설정
    * dataType - 서버에서 response 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함.
    	* xml - 트리 형태의 데이터 구조
    	* json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
    	* script - javascript 및 일반 string 형태 데이터 
    	* html - html태그 자체를 return 하는 방식
    	* text - string 데이터
    * error	- ajax통신에 실패했을 때 호출될 이벤트 핸들러
    * global	- 기본 이벤트 사용 여부(ajaxStart, ajaxStop)(버퍼링 같이 시작과 끝을 나타낼때, 선처리 작업)
    * method | type	- 서버 요청 방식(GET, POST, PUT) 기본값 GET
    * password - 서버에 접속 권한(비밀번호)가 필요한 경우
    * processData - 서버로 보내는 값에 대한 형태 설정 여부(기본데이터를 원하는 경우 false 설정)
    * success - ajax통신에 성공했을 때 호출될 이벤트 핸들러
    * timeout - 서버 요청 시 응답 대기 시간(milisecond)
    
    [참고 API:http://api.jquery.com/jquery.ajax/](http://api.jquery.com/jquery.ajax/)
    ```
    

#### **동기식**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9ab4c87063240840.png]]

- 요청 후 응답을 받아야만 다음 동작이 이루어짐
- **문서를 받아옴 (HTML)**
- 모든 **form요청은 동기요청**임

#### **비동기**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5b8f30d119077c93.png]]

- 요청을 보낸 후 응답과는 상관없이 다음동작진행
- **이미 뿌려져있는 HTML 위에서 이루어지는 통신**이기 때문에 text | html | json | xml 로 처리가 가능하나 **단순데이터를 주고 받는걸 더 자주 사용함.**

#### ajax 연습용 
: 새 프로젝트 생성 (다이나믹웹프로젝트)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/98eb4f74_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5208ee16_Untitled.png]]

<aside>
🔻 폴더에 ! 오류시
1. 프로젝트 속성에 Java Build Path 에서 JRE라이브러리 버전 확인 후 수정
2. Project Facets 자바버전확인

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b3fe5ea8_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4d321f5a_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f1a86866_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c2a9669a_Untitled.png]]

![언어설정 -Duser.language=en -Duser.region=US
](../../../attachments/5c48d75d-64f5-453f-8528-8010398f19f1/Untitled.png)

언어설정 -Duser.language=en -Duser.region=US

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8e591f7b_Untitled.png]]

### Javascript(Ajax)

---

- 실제로 이 방법을 사용하지 않음
    - 길고 복잡해서 사용X
- `XMLHttpRequest` 의 존재를 알고 있어야함.
- 연결상태에 따라 readyState 속성
- onreadystatechange : on으로 시작하면 이벤트핸들러

```jsx
let xhr; // XMLHttpRequest객체 대입할 변수
// 1. XMLHttpRequest객체 생성
xhr = new XMLHttpRequest();
// 2. xhr객체 연결상태 변화에 따른 핸들러함수 바인딩
if(this.readyState == 4 && this.status == 200 {
	console.log(xhr.responseText)
}
// 3. open 연결
xhr.open("GET", "url", true);
// 4. sned 요청전송
xhr.send();
```

#### GET

```jsx
let xhr; // XMLHttpRequest객체를 대입할 변수 
	document.searchFrm.addEventListener('submit', (e) => {
		e.preventDefault(); // 제출금지. 폼제출 동기요청
		
		// 1. XMLHttpRequest객체 생성
		xhr = new XMLHttpRequest();
		console.log(xhr);
		
		// 2. xhr객체 연결상태 변화에 따른 핸들러함수 바인딩
		xhr.onreadystatechange = readyStateChangeHandler;
		
		// 3. open 연결
		// open(전송방식, url?querystring)
		xhr.open("GET", "<%= request.getContextPath() %>/vanilla-js/search?q=" + e.target.q.value);
		
		// 4. sned 요청전송
		xhr.send();
		
	});
	
	const readyStateChangeHandler = (e) => {
		switch(xhr.readyState) {
		case 0 : console.log('0 : uninitialized'); break; // xhr객체 생성. 핸들러 호출하지 않음.
		case 1 : console.log('1 : loading'); break; // open 연결중
		case 2 : console.log('2 : loaded'); break; // send 요청
		case 3 : console.log('3 : interactive'); break; // 응답메세지 수신시작
		case 4 : console.log('4 : completed'); break; // 응답메세지 수신완료
		}
		
		if(xhr.readyState === 4){
			if(xhr.status === 200){
				// 정상처리
				console.log(xhr.responseText);
				result.innerHTML = xhr.responseText;
			}
			else {
				// 오류
				alert("오류가 발생했습니다.");
			}
		}
	};
```

#### POST

```jsx
document.signupFrm.addEventListener('submit', (e) => {
		e.preventDefault(); // 폼제출방지
		
		// 1. XMLHttpRequest객체 생성
		xhr = new XMLHttpRequest(); 
		
		// 2. readystatechange 핸들러 바인딩
		xhr.onreadystatechange = signupHandler;
		
		// 3. open 연결생성 - content-type지정(필수)
		xhr.open("POST", "<%= request.getContextPath() %>/vanilla-js/signup");
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		
		// 4. send 요청 - 사용자입력값 전달 (message body에 작성)
		// 직렬화하는 과정 : ajax는 알아서 직렬화해서줘서 그게 더 편한거임
		const usernameVal = e.target.username.value;
		const emailVal = e.target.email.value;
		const param = `username=\${usernameVal}&email=\${emailVal}`;
		xhr.send(param); // 데이터 직렬화처리후 전송
		
	});
	
	const signupHandler = (e) => {
		if(xhr.readyState == 4 && xhr.status === 200) {
			// 정상처리
			alert(xhr.responseText);
			console.log(xhr);
		}
		if(xhr.readyState == 4 && xhr.status !== 200) {
			// 오류처리
			console.log(xhr);
			result.innerHTML = xhr.responseText;
		}
	};
```

| uninitialized | xhr객체 생성 |
| --- | --- |
| loading | open 연결중 |
| loaded | send 요청 |
| interactive | 응답메세지 수신시작 |
| completed | 응답메세지 수신완료 |

### 요즘 JS방식

---

```jsx
fetch("url") // 자동으로 GET요청을 날려서 데이터가져옴
	.then((response) => { // 데이터출력.then(콜백함수)
		if (!response.ok) {// 정확한 에러 잡기
			throw new Error('400 아니면 500 에러남');
		}
		return response.json()//서버가보낸데이터
	})
	.then((결과) => {
		console.log(결과)
	})
	.catch(() => {
		console.log("에러발생")
	})
```

```jsx
async function 데이터가져오는함수() {
	var response = await fetch("url")
	if (!response.ok) {
		throw new Error('400 아니면 500 에러남');
	}
	var result = await response.json();
	console.log('에러발생')
});
```

- jquery 안에 $.ajax() 함수가 기본적으로 있어서 이걸 사용해도 됨.
- 리액트나 뷰환경에서는 axios 를 많이 사용함.

```jsx
axios을 사용한 방법

axios.get('url')
	.then((result) => {
		console.log(result.data) //서버에서 받아온 데이터
	}).catch(() => {
		console.log('에러남')
}
```

**** ajax 사용시 자주보는 에러**

- CORS 관련 에러
    - naver.com → kakao.com (ajax요청불가능)
        - 보안이슈로 보면됨.

### Jquery

![URL : 
method : 어떤방식으로
객체를 post로 보내면 바디에 작성됨
dataType : 생략도 가능 (알아서 파싱처리함) → json , xml …
beforeSend : 메소드 데이터 보내기전에 열어두는 것
success : 인자로 responseText 로 넘어감 실제로 응답을 받고 일련의 처리 후에 여기에 전달함
error : 
complete :](../../../attachments/baa1eef4-3af5-411e-8bbc-a19c35462565/Untitled.png)

URL : 
method : 어떤방식으로
객체를 post로 보내면 바디에 작성됨
dataType : 생략도 가능 (알아서 파싱처리함) → json , xml …
beforeSend : 메소드 데이터 보내기전에 열어두는 것
success : 인자로 responseText 로 넘어감 실제로 응답을 받고 일련의 처리 후에 여기에 전달함
error : 
complete :

** 서버단은 동기 비동기 구분을 하지않아서 HTML도 가능

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
