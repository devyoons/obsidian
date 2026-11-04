---
별칭:
  - "학습 - Casting | Operator"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/44bcedf4908f4b3e81c20117bc4ef9e1
---

# 학습: Casting | Operator

## 세부 내용

- 문자열과 숫자 산술연산
    
    ```jsx
    /**
     * 문자열과 산술/비교연산
     */
    function test1(){
      const a = "3";
      const b = 3;
    
      // 숫자가 문자열로 형변환
      console.log(typeof(a + b), a + b); // string 33
    
      // 문자열이 숫자로 형변환
      console.log(typeof(a - b), a - b); // number 0
      console.log(typeof(a * b), a * b); // number 9
      console.log(typeof(a / b), a / b); // number 1
      console.log(typeof(a % b), a % b); // number 0
    
      const c = "abc"; // 숫자로 변환 불가능한 문자열
      console.log(typeof(c * b), c * b); // number NaN
    
      let bool = true; // true는 산술연산시 1로 변환
      console.log(typeof(bool / b), bool / b); // number 0.3333333333333333
    
      bool = !bool; // false는 산술연산시 0으로 변환
      console.log(typeof(bool / b), bool / b); // number 0
    
      console.log(typeof(a == b), a == b); // boolean true
      console.log(typeof(a != b), a != b); // boolean false
    
      // 엄격비교연산자 
      // === 타입/값이 모두 같은면 true, 하나라도 다르면 false
      // !== 타입/값중에 하나라도 다르면 true, 모두 같으면 false
      console.log(typeof(a === b), a === b); // boolean false
      console.log(typeof(a !== b), a !== b); // boolean true
    }
    ```
    
- 숫자로 명시적 형변환
    - `Number` 숫자로 변환. 변환불가한 문자가 하나라도 있으면 NaN을 반환.
    - `parseInt` 변환불가한 문자가 나오기 전까지 변환후 정수반환.
    - `parseFloat` 변환불가한 문자가 나오기 전까지 변환후 실수반환.
    
    ```jsx
    /**
     * 문자열을 숫자로 명시적 형변환
     */
    function test2(){
      const n = "1234.56";
      console.log(Number(n)); // 1234.56
      console.log(parseInt(n)); // 1234
      console.log(parseFloat(n)); // 1234.56
    
      const won = "1234.56원";
      console.log(Number(won)); // NaN
      console.log(parseInt(won)); // 1234 
      console.log(parseFloat(won)); // 1234.56
    
    }
    ```
    
- `input[type=number]` 의 배신
    
    <aside>
    🙂 숫자입력을 받는 `input[type=number]`의 value속성값의 타입은 늘 언제나 <u>문자열</u>이다.
    
    </aside>
    
    ```jsx
    <fieldset>
      <legend>두수의 합 구하기</legend>
      <!-- input:number#num$[placeholder=num$]*2 -->
      <input type="number" name="nums" id="num1" placeholder="num1">
      <input type="number" name="nums" id="num2" placeholder="num2">
      <input type="button" value="계산" onclick="test3();">
    </fieldset>
    <script>
    /**
     * #num1 #num2 사용자입력값의 합을 경고창에 출력
     * - 두 input태그에 모두 값이 입력되지 않은 경우 알림처리 "수를 먼저 입력하세요."
     * - 계산후에는 입력값을 삭제처리
     */
    function test3(){
      const num1Val = num1.value;
      const num2Val = num2.value;
    
      // 유효성 검사
      if(!num1Val || !num2Val){
        alert("수를 먼저 입력하세요.");
        return; // 조기리턴 - 이하코드는 실행하지 않고, 중단
      }
      
      alert(`입력하신 두 수의 합은 ${Number(num1Val) + Number(num2Val)} 입니다.`);
    
      // 초기화
      num1.value = "";
      num2.value = "";
    
    }
    ```
    
- 논리형으로의 형변환
    - 값이 있는 것은 true로 변환 `"abc"`, `100`, `-10`, `23.4`, `{}`, `[]`, `Infinity`
    - 값이 없는 것은 false로 변환 `""`, `0`, `0.0`, `undefined`, `null`, `NaN`
    
    ```jsx
    /**
     * 값이 있는 것은 true로 변환 : "abc", 100, -10, 23.4, {}, []
     * 값이 없는 것은 false로 변환 : "", 0, 0.0, undefined, null, NaN
     */
    function test4(){
      console.log(Boolean("abc"), !!"abc");
      console.log(Boolean(100), !!100);
      console.log(Boolean(-100), !!(-100));
      console.log(Boolean(1.23), !!1.23);
      console.log(Boolean({}), !!{});
      console.log(Boolean([]), !![]);
    
      console.log(Boolean(""), !!"");
      console.log(Boolean(0), !!0);
      console.log(Boolean(0.0), !!0.0);
      console.log(Boolean(undefined), !!undefined);
      console.log(Boolean(null), !!null);
      console.log(Boolean(NaN), !!NaN);
    
      const elem = document.querySelector("#xyz");
      if(elem){
        // elem이 존재하는 경우
      }
      else {
        // elem이 존재하지 않는 경우 (null이 반환)
      }
    
      foo(elem);
    
      // elem이 존재하면 k에 대입
      // elme이 존재하지 않으면(false로 평가되면) 우항의 요소를 대입
      const k = elem || document.createElement("h2");
      console.log(k);
    }
    
    function foo(x){
      if(x){
        // x가 존재하는 경우
      }
      else {
        // x가 존재하지 않는 경우
      }
    }
    ```
    
- 짧은 조건문
    - `a && b`  a가 true로 평가되면 b를 실행
    - `a || b`  a가 false로 평가되면 b를 실행
    
    ```jsx
    /**
     * 짧은 조건문
     * a && b : a가 true로 평가되면 b를 실행
     * a || b : a가 false로 평가되면 b를 실행
     */
    function test5(){
      const num = Number(prompt("정수를 입력하세요"));
      // num % 2 == 0 && alert("짝수입니다.");
      num % 2 == 0 || alert("홀수입니다.");
    }
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/JavaScript 정리/JavaScript 정리|JavaScript 정리]]
