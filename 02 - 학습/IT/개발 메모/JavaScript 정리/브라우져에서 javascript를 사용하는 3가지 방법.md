---
별칭:
  - "학습 - 브라우져에서 javascript를 사용하는 3가지 방법"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/c4067a75b95a44d6b3a247673be2d39d
---

# 학습: 브라우져에서 javascript를 사용하는 3가지 방법

## 세부 내용

- html 태그의 inline event 속성에 작성
    
    <aside>
    💡 window 내장함수 또는 문서상의 선언한 함수를 호출할 수 있다.
    html태그의 인라인 이벤트속성의 `“”`안은 javascript영역이다.
    
    </aside>
    
    ```sql
    <button onclick="alert('버튼 클릭함');">클릭미!</button>
    ```
    
- html 내부 script태그 작성
    
    <aside>
    💡 `<script></script>` 는 head태그 안이나, `</body>` 종료태그 앞에 작성하는 것이 좋다.
    브라우져는 위에서 아래로 html문서를 해석하면서, 해당 script를 바로 실행한다.
    
    </aside>
    
    ```jsx
    <head>
    	<script>
    	// 자바스크립트 작성 영역1
    	// 한줄 주석
    	/* 
    	  여러줄 주석
    	*/
    
    	const a = 123;
    	alert(a);
    	
    	// 함수 선언
    	function foo(){
    	  console.log('foo 실행!'); // 브라우져 개발도구 console탭에 출력
    	}
    	foo(); // 함수 호출!
    	</script>
    </head>
    
    <body>
      ...
      <script>
      // 자바스크립트 작성 영역2
      // const b = 456;
      // alert(b);
    
      </script>
    </body>
    ```
    
- 외부 js파일 작성후 현재 페이지에서 가져오기
    - @js/main.js
        
        ```jsx
        // 자바스크립트 영역
        console.log(1);
        console.log('abc');
        
        function bar(){
          console.log('bar실행!');
        }
        ```
        
    - @index.html
        
        ```jsx
        <head>
        	<script src="js/main.js"></script>
          <script>
          bar();  // main.js에서 선언후에 호출할 수 있다.
        	</script>
        </head>
        ```
        
    
    - CDN 사용방식
        
        <aside>
        🙂 [CDN](https://ko.wikipedia.org/wiki/%EC%BD%98%ED%85%90%EC%B8%A0_%EC%A0%84%EC%86%A1_%EB%84%A4%ED%8A%B8%EC%9B%8C%ED%81%AC)을 이용해서 인터넷상의 js파일 또한 바로 로드해서 사용할 수 있다.
        
        </aside>
        
        ```jsx
        <head>
        	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
          <script>
          $(() => {
        		console.log("hello world");
          });
        	</script>
        </head>
        ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
