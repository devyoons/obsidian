---
별칭:
  - "학습 - function"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/5c9ecd4f66d94f1ca2db9bba13dc9d5b
---

# 학습: function

## 세부 내용

- 함수 작성 방법
    
    함수는 두가지 방식으로 선언 가능하다.
    
    1. 함수 선언식 Function Declaration : hoisting 처리됨.
    2. 함수 표현식 Function Expression
    
    <aside>
    🙂 hoisting이란?
    함수 또는 전역 안에 있는 선언들을 모두 끌어올려서 해당 함수 유효 범위의 최상단에서 자동으로 선언하는 것.
    
    </aside>
    
    ```jsx
    test1(); // test1 정상 작동
    /**
     * 함수 선언식 Function Declaration
     * - hoisting처리됨. 선언전에 호출가능
     * - hoisting이란? 함수선언식, var로 선언된 변수등을 우선적으로 선언처리하는 것
     */
    function test1(){
      console.log("test1");
    }
    
    // test2(); // Uncaught ReferenceError: Cannot access 'test2' before initialization
    /**
     * 함수 표현식 Function Expression
     * - 변수에 익명함수를 대입
     * - 전달하는 함수에 이름이 있어도 무시된다. 
     * - 끝에 세미콜론 작성할 것
     * - hoisting처리되지 않으므로 선언전에 호출불가
     */
    const test2 = function foo(){
      console.log("test2");
    };
    ```
    
- 즉시 실행함수 IIFE
    
    Immediately Invoked Function Expression
    
    다음 두가지 호출 문법을 모두 지원한다.
    
    `(function(){})()` 
    
    `(function(){}())`
    
    ```jsx
    /**
     * 즉시실행함수 iife Immediately Invoked Function Expression
     * - 선언/호출을 한번에 처리
     * - 전역변수의 위험을 지역변수 대체하면서 실행할 용도
     */
    (function(){
      console.log("iife1 호출!");  
    })();
    
    (function(){
      console.log("iife2 호출!");  
    }());
    
    (function(name){
      console.log(`${name}님, 안녕하세요~`);
    })('홍길동');
    ```
    
- 매개인자 | 매개변수
    
    매개인자 | 매개변수 처리가 엄격하지 않다. 
    
    - 존재하지 않는 매개변수에 매개인자 전달해도 오류나지 않는다.
    - 존재하는 매개변수에 매개인자를 전달하지 않아도 오류나지 않는다.
    
    <aside>
    🙂 `arguments`란
    함수호출시 전달된 모든 매개인자를 가진 유사배열 객체이다.
    
    일반함수 안에서 사용할 수 있다.(화살표함수에서는 사용불가)
    
    </aside>
    
    ```jsx
    /**
     * 매개인자 argument 함수호출부 값
     * 매개변수 parameter 함수선언부 변수(공간)
     *  - 매개변수의 개수는 function.length로 참조가능하다.
     */
     const test3 = function(){
      console.log(add1(3, 5));
      console.log(add1(3, 5, 7)); // 매개변수가 없는 경우 무시
      console.log(add1(3)); // 매개인자가 없는 경우, 해당 매개변수는 undefined
    
      console.log(add2(1, 2)); // 3
      console.log(add2(1, 2, 3, 4, 5)); // 15
    };
    
    const add1 = function(a, b){
      console.log(`add(${a}, ${b})`);
      return a + b;
    };
    
    /**
     * arguments 숨은 참조변수. 호출부에서 전달한 매개인자를 가진 유사배열.
     * - 화살표함수에서는 이용불가
     */
    const add2 = function(){
      console.log(arguments);
      let sum = 0;
      for(let n of arguments){
        console.log(n); // 요소
        sum += n;
      }
      console.log(`sum = ${sum}`);
    
    };
    ```
    
    - 나머지 파라미터 Rest Parameter  ES6
        
        ```jsx
        /**
         * 나머지 파라미터 Rest Parameter
         * - 매개변수 선언부에서 사용. 남은 매개인자를 모두 모아서 배열로 처리가능.
         * - 전개연산자와 모양은 같다.
         */
        const test5 = function(){
          bar('홍길동', 33, '축구', '농구', '배구'); // ['축구', '농구', '배구']
          bar('신사임당', 33, '클라이밍'); // ['클라이밍']
          bar('윤봉길', 33); // []
        };
        
        const bar = function(name, age, ...hobby){
          console.log(`name = ${name}`);
          console.log(`age = ${age}`);
          console.log(`hobby = ${hobby} (${typeof hobby})`, hobby);
        };
        ```
        
- arguments
    - 숨은 참조 arguments를 통해서 호출시 전달된 모든 인자에 접근할 수 있다.
    - arguments는 모든 인자를 담은 유사배열
    - 화살표함수 안에서는 사용할 수 없다.
    
    ```jsx
    const test4 = function(){
      console.log(addAll(1, 2, 3));
      console.log(addAll(10, 20));
      console.log(addAll('hello', 'world', 'byebye', 'world'));
    };
    
    /**
     * 숨은 참조 arguments를 통해서 호출시 전달된 모든 인자에 접근할 수 있다.
     * - arguments는 모든 인자를 담은 유사배열
     */
    const addAll = function(){
      let sum = (typeof arguments[0] === 'number') ? 0 : '';
      // console.log(arguments);
      [...arguments].forEach(function(elem, index){
        // console.log(elem, index);
        sum += elem;
      });
      return sum;
    };
    ```
    
- 나머지 파라미터  ES6
    - 모양은 전개연산자와 동일하지만, 사용위치가 다르다.
    - 변수 선언부에만 사용. <u>공간</u>으로 사용
        - 전개연산자는 <u>값</u>으로 사용하는 것과 대비된다.
    - 전달된 인자를 하나의 배열에 모아서 처리
    - 마지막에 한번만 사용가능하다.
    
    ```jsx
    /**
     * 나머지파라미터 Rest Parameter (ES6)
     * - 모양은 전개연산자와 동일하지만, 사용위치가 다르다.
     * - 매개변수 선언부 사용. 공간으로 사용
     * - 전달된 인자를 하나의 배열에 모아서 처리
     * - 마지막에 한번만 사용가능하다.
     */
    const test6 = function(){
      info('홍길동', 33, '농구', '축구');
      info('신사임당', 44, '뜨개질', '칼질', '물수제비');
      info('세종대왕', 55);
    };
    
    const info = function(name, age, ...hobbies){
      console.log(hobbies);
      console.log(`이름 : ${name}
    나이 : ${age}    
    취미 : ${hobbies}`);
    
      // 전개연산자는 배열요소를 배치시킬때 사용. 값으로 사용
      const copy = [...hobbies];
    };
    ```
    
- 매개변수 기본값
    
    해당자리에 매개인자가 전달되지 않았을 경우 기본값으로 처리
    
    ```jsx
    /**
     * 매개변수부의 기본값처리
     * - 해당자리에 매개인자가 전달되지 않았을 경우 기본값으로 처리
     */
    const test7 = function(){
      sayName('신사임당'); // 신사임당님, 반갑습니다.
      sayName(); // 홍길동님, 반갑습니다.
    };
    
    const sayName = function(name = '홍길동'){
      console.log(`${name}님, 반갑습니다.`);
    };
    ```
    
- 리턴값 처리
    
    ```jsx
    /**
     * 모든 함수는 리턴값이 있다.
     * 명시적으로 선언하지 않았다면, undefined를 리턴한다.
     */
    const test4 = function(){
      console.log(`리턴값 : ${foo()}`);
    };
    
    const foo = function(){
      // return undefined;
      return 'foooooooooooooooooo';
    };
    ```
    
- @실습문제 - 계산기
    
    ```jsx
    /**
     * @실습문제 - 계산기
     * - 다음 calc 호출구문을 만족하는 calc함수를 작성하세요.
     */
    const test9 = () => {
      console.log(calc('add', 10, 20)); // 30
      console.log(calc('add', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)) // 55
      console.log(calc('subtract', 100, 70)); // 30
      console.log(calc('multiply', 11, 2, 5)); // 110
      console.log(calc('multiply', 9, 5)); // 45
      console.log(calc('divide', 100, 3)); // 33
    };
    
    // 풀이 1
    const calc = (type, ...nums) => {
      let result = nums[0];
      switch(type){
        case 'add': 
          for(let i = 1; i < nums.length; i++)
            result += nums[i];
          break;
        case 'subtract':
          for(let i = 1; i < nums.length; i++)
            result -= nums[i];
          break;
        case 'multiply': 
        for(let i = 1; i < nums.length; i++)
            result *= nums[i];
          break;
        case 'divide' : 
          for(let i = 1; i < nums.length; i++)
            result = Math.floor(result / nums[i]);
          break;
      }
      return result;
    };
    
    // 풀이 2 reduce
    const calc = (type, ...nums) => {
      return nums.reduce((arr, num) => {
        switch(type){
          case 'add': return arr + num;
          case 'subtract': return arr - num;
          case 'multiply': return arr * num;
          case 'divide' : return Math.floor(arr / num);
        }
      });
    };
    ```
    
- 화살표함수 Arrow Function  ES6
    - 익명함수를 간단히 작성하는 문법
    - `function(){}`를 완전히 대체하지는 않는다. (this 사용법이 다르다)
    - arguments 참조변수 사용불가
    - 생성자함수로 사용불가
    - <u>자신의 this가 없고, 부모스코프의 this를 가져와 binding.</u>
    - <u>선언시 binding된 this를 변경할 수 없다.</u>
    
    ```jsx
    /**
     * 화살표 함수 Arrow Function (ES6)
     * - 익명함수를 간단히 작성하는 문법
     * - function(){}를 완전히 대체하지는 않는다.
     * 
     * - arguments 참조변수 사용불가
     * - 생성자함수로 사용불가
     * - 자신의 this가 없고, 부모스코프의 this를 가져와 binding.
     * 
     */
    const test8 = () => {
      f1(100);
      console.log(f2(30, 50));
      console.log(f3('홍길동', 33));
      f4(200);
    };
    // 매개변수가 하나인 경우, 소괄호 생략가능
    const f1 = a => {
      console.log(a);
    };
    // 함수몸통부가 한줄인 경우, { return } 생략가능
    const f2 = (a, b) => a + b;
    const f3 = (_name, _age) => ({name : _name, age : _age}); // 객체를 반환하는 경우 소괄호 작성
    
    // 실행부가 한줄인 경우, {} 생략가능
    const f4 = a => console.log(a);
    ```
    
- 함수 안에 함수 선언
    
    자바스크립트에서 함수는 값을 처리할 수 있으므로 함수안의 변수에 함수 선언이 가능하다.
    
    ```jsx
    /**
     * 중첩된 함수
     * - 함수 안에 선언할 수 있다.
     */
    const test = (a) => {
      const f = (n) => (n < 10 ? `0${n}` : n);
      console.log(f(5));
      console.log(f(10));
    };
    
    // f(5); // Uncaught ReferenceError: f is not defined
    ```
    
- 함수 고급 - 1급객체로써의 함수
    - 함수를 값이다.
        
        <aside>
        💡 js에서 함수는 1급객체. 함수를 값으로써 사용한다.
        
        </aside>
        
        - 변수에 대입
            
            ```jsx
            // 함수를 변수에 대입
            const a = () => console.log('안녕');
            const b = a;
            a(); // 안녕
            b(); // 안녕
            ```
            
        - 배열의 요소
            
            ```jsx
            const arr = [
              () => console.log('a'),
              () => console.log('b'),  
              () => console.log('c'),
            ];
            
            arr[0](); // a
            arr[1](); // b
            arr[2](); // c
            
            arr.forEach((f) => f());
            // a
            // b
            // c
            ```
            
    - 함수를 매개인자로 사용하기
        
        ```jsx
        /**
         * 함수고급 - 함수를 매개인자로 사용
         * - 함수는 1급객체. 함수를 값으로써 사용한다. 
         */
        const test10 = () => {
          // 함수를 변수에 대입
          const a = () => console.log('안녕');
          const b = a;
          a();
          b();
        	
        	// const f = () => console.log('안녕');
          const f = (n) => console.log(`안녕${n}`);
          runner(f); // 매개인자(값)
        };
        
        const runner = (f) => {
          // console.log(typeof f, f);
          // f();
        
          for(let i = 0; i < 10; i++)
            f(i);
        };
        
        const test11 = () => {
          console.log(calculator((a, b) => a + b, 10, 20)); // 30
          console.log(calculator((a, b) => a - b, 10, 3)); // 7
          console.log(calculator((a, b) => a * b, 3, 5)); // 15
          console.log(calculator((a, b) => a / b, 10, 3)); // 3.3333
        };
        
        const calculator = (f, a, b) => {
          return f(a, b);
        }
        ```
        
        - @실습문제 - 인자값이 여러개인 산술연산
            
            ```jsx
            /**
             * @실습문제 - 인자값이 여러개인 산술연산
             * - 다음 연산을 일관되게 처리할 수 있도록 기존 코드를 개선하세요.
             * - 10, 20 합 -> 30
             * - 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 합 -> 55
             * - 10, 3 차 -> -7
             * - 100, 90, 50 차 -> -40
             * - 3, 5 곱 -> 15
             * - 11, 2, 5 곱 -> 110
             * - 10, 3 몫 -> 3.33333333333333
             */
            const test = () => {
            	const add = (...nums) => nums.reduce((agg, num) => agg + num);
            	const subtract = (...nums) => nums.reduce((agg, num) => agg - num);
            	const multiply = (...nums) => nums.reduce((agg, num) => agg * num);
            	const divide = (...nums) => nums.reduce((agg, num) => agg / num);
            	console.log(calculator(add, 10, 20)); // 30
            	console.log(calculator(add, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)); // 55
            	console.log(calculator(subtract, 10, 3)); // 7
            	console.log(calculator(subtract, 100, 90, 50)); // -40
            	console.log(calculator(multiply, 3, 5)); // 15
            	console.log(calculator(multiply, 11, 2, 5)); // 110
            	console.log(calculator(divide, 10, 3)); // 3.3333
            };
            
            const calculator = (f, ...nums) => f(...nums);
            ```
            
    - 함수를 리턴값으로 사용하기
        
        ```jsx
        /**
         * 함수 호출 결과가 함수 일수 있다.
         */
        const test = () => {
          const f = m();
          console.log(typeof f, f);
          for(let i = 0; i < 10; i++)
            f(i); // 매개인자 i
        
          const hello = funcMaker('안녕');
          hello('철수');
          
          const helpMe = funcMaker('돈 좀 꿔줘~');
          helpMe('철수');
        
          const bye = funcMaker('잘가');
          bye('철수');
        
          const friends = ['철수', '영희', '진구', '태양'];
          friends.forEach((name, index) => helpMe(name));
          // friends.forEach(helpMe); // 가능
        
        };
        
        const funcMaker = (word) => {
          return (name) => {
            console.log(`${name}야~ ${word}`);
          };
        };
        
        const m = () => {
          return (i) => {
            console.log(`qoo${i}`);
          };
        };
        ```
        
        - @실습문제 - tag생성하기
            
            ```jsx
            <button onclick="test11();">@실습문제 - tagMaker</button>
            <div id="target"></div>
            <script>
            /**
             * @실습문제 - tag생성하기
             * - 특정태그를 생성할 수 있는 함수를 생성해주는 tagMaker함수를 이용해 다음 함수를 생성하고
             * - div#target에 생성된 태그를 차례로 추가하세요.
             * 
             *  writeP('안녕') : <p>안녕</p>
             *  writeMark('여보세요') : <mark>여보세요</mark>
             *  writeButton('클릭미') : <button>클릭미</button>
             * 
             *  
             */
            const test11 = () => {
              // 태그안에 들어갈 내용
              const data = ['안녕', '여보세요', '클릭미']; 
              
              // 함수 생성
              const writeP = tagMaker("p");
              const writeMark = tagMaker("mark");
              const writeButton = tagMaker("button");
            	
            	target.innerHTML = writeP('안녕');
            	target.innerHTML += writeMark('여보세요');
            	target.innerHTML += writeButton('클릭미');
            };
            
            const tagMaker = (tagName) => {
              return (data) => {
                return `<${tagName}>${data}</${tagName}>`;
              };
            };
            </script>
            ```
            
- this
    - 일반함수 안의 this
        
        <aside>
        💡 일반함수안에서 this는 window전역객체를 가리킨다.
        
        </aside>
        
        ```jsx
        /**
         * [this용법] 일반함수안에서 this는 window전역객체를 가리킨다.
         */
        function test(){
          console.log(this); // window
          console.log(window === this); // true
        }
        ```
        
    - 화살표함수 안의 this
        
        <aside>
        💡 화살표함수는 this가 없다. 부모스코프의 this를 가져와 바인딩한다. 
        즉, 화살표함수가 선언된 위치에 따라 this가 달라진다.
        
        </aside>
        
        ```jsx
        /**
         * [this용법] 화살표함수는 this가 없다. 부모스코프의 this를 가져와 바인딩한다.
         * - 부모스코프는 화살표함수의 선언위치를 의미한다.
         */
        const test = () => {
          console.log(this); // window
        };
        ```
        
        ```html
        <!-- 다음 버튼을 누를때 콘솔에 출력된 this는 button#btn태그이다. --> 
        <button id="btn" onclick="(() => console.log(this))(); ">this - 화살표함수</button>
        ```
        
- @실습문제 - 변수 scope
    
    다음 script를 실행전 콘솔출력값을 예상해보고, 실제 결과값과 비교해보자.
    
    ```jsx
    <script>
    //1
    let z = 50;
    (() => {
        let z = 55;
        z += 45;
        console.log(`z = ${z}`);
    })();              
    console.log(`z = ${z}`);   
    
    //2
    let y = 99;
    (() => {
        let x = 100;
        let y = 9;
        z = 1;
        console.log(`x + y + z = ${x + y + z}`);
    })();
    console.log(`y + z = ${y + z}`);
    console.log(`x + y + z = ${x + y + z}`);
    
    //3
    let i; // 전역 i
    for (i = 1; i <= 10; i++) {
    	console.log(i); // 1~10까지 출력
    }
    
    (() => {
    	console.log(`i = ${i}`); 
    })();
        
    //4 
    function foo(){
        const num = 100;
        return () => {
            console.log(`num = ${num}`);
        }
    }
    const num = 200;
    const too = foo();
    too();
    </script>
    ```
    
    - 답안
        
        ```jsx
         //1
        let z = 50; // 전역 global scope
        (() => {
            let z = 55; // 지역 local scope
            z += 45;
            console.log(`z = ${z}`); // 100
        })();              
        console.log(`z = ${z}`); // 50
        
        //2
        let y = 99; // 전역 
        (() => {
            let x = 100;
            let y = 9; // 지역
            z = 1; // 전역 z
            console.log(`x + y + z = ${x + y + z}`); // 110
        })();
        console.log(`y + z = ${y + z}`); // 100
        // console.log(`x + y + z = ${x + y + z}`); // Uncaught ReferenceError: x is not defined
        
        //3 
        let i; // 전역 i
        for (i = 1; i <= 10; i++) {
            console.log(i); // 1~10까지 출력
        }
        
        (() => {
            console.log(`i = ${i}`); // 11
        })();
        
        // var 변수 유효범위(scope)는 block-scope가 아니라 function-scope이다.
        // function안에서만 유효. function바깥의 block은 모두 무시.
        // 전역에 선언된 var는 전역객체 window의 속성으로 등록된다.
        for (var j = 1; j <= 10; j++) {
            console.log(j); // 1~10까지 출력
        }
        (() => {
            console.log(`j = ${j}`); // j = 11
        })();
        
        //4 closure 예습 문제
        function yoo(){
            const num = 100;
            return () => {
                console.log(`num = ${num}`);
            }
        }
        const num = 200;
        const too = yoo(); // closure함수
        console.log(too);
        too(); // 100
        ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
