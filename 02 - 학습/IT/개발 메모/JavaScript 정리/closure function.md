---
별칭:
  - "학습 - closure function"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/80cbb78213014046a34fcec34d4e0090
---

# 학습: closure function

## 세부 내용

- 자유변수 Free Variable
    
    함수의 지역범위에 선언되지 않은 변수
    
    <aside>
    💡 자유변수와 전역변수는 다르다. 자유변수가 전역변수일수도 있고, 함수내 지역변수일수도 있다. 혼동하지 말자.
    
    </aside>
    
    ```jsx
    /**
     * 자유변수 Free Variable
     * - 함수내에 선언되지 않은 변수
     */
    const test1 = () => {
      const greeting = '오늘 날씨 정말 좋다~';
      // say의 지역변수 : name, word
      const say = (name) => {
        const word = '안녕,' + name;
        console.log(word); 
        console.log(greeting);
      };
    
      say('영희');
    };
    ```
    
- 클로져함수
    
    ```jsx
    /**
     * 클로져함수 Closure Function
     * - 필요한 환경(지역변수, 자유변수)를 모두 갖고 외부로부터 닫힌 함수
     */
    const test2 = () => {
      const num = 200;
      const too = foo();
      // const too = () => {
      //     console.log(`num = ${num}`);
      // }; // 참조하는 자유변수 num을 가지고 리턴
    
      console.dir(too);
      too(); // 100
    };
    ```
    
- 전역변수 카운터 | 클로져함수 카운터
    
    ```html
    <button onclick="test3();">counter - 전역변수</button>
    <span id="globalCounter">0</span>
    <br>
    <button onclick="test4();">counter - 클로져</button>
    <span id="closureCounter">0</span>
    ```
    
    ```jsx
    /**
     * 전역변수를 활용한 카운터
     */
    let cnt = 0;
    const test3 = () => {
      globalCounter.innerHTML = ++cnt;
    };
    
    /**
     * 클로져를 활용한 카운터
     * - 안전하게 변수를 사용할 수 있다.
     */
    const counterMaker = () => {
      let cnt = 0;
      return () => {
        closureCounter.innerHTML = ++cnt;
      };
    };
    const test4 = counterMaker();
    console.dir(test4); // [[Scope]] 하위에서 Closure 속성에서 자유변수를 확인할 수 있다.
    ```
    
- @실습문제 - 가산기
    
    ```jsx
    <form action="javascript:test5();">
      <fieldset>
        <legend>가산기</legend>
        <input type="number" name="num" id="num">
        <h2>누적합 : <span id="sum">0</span></h2>
      </fieldset>
    </form>
    ```
    
    ```jsx
    const calcMaker = () => {
      let sum = 0;
      return () => {
          sum += Number(num.value);
          document.querySelector("#sum").innerHTML = sum;
          num.value = '';
        };
    };
    const test5 = calcMaker();
    ```
    
    - 초기화 기능 추가 ⭐⭐⭐
        
        ```jsx
        <form action="javascript:test5();">
          <fieldset>
            <legend>가산기</legend>
            <input type="number" name="num" id="num">
            <h2>누적합 : <span id="sum">0</span></h2>
        		<button type="button" onclick="test6();">초기화</button>
          </fieldset>
        </form>
        ```
        
        ```jsx
        const calcMaker = () => {
          let sum = 0;
          return [
            () => {
              console.log('add');
              sum += Number(num.value);
              document.querySelector("#sum").innerHTML = sum;
              num.value = '';
            }, 
            () => {
              console.log('reset');
              sum = 0;
              document.querySelector("#sum").innerHTML = sum;
            }
          ];
        };
        const calcFuncs = calcMaker();
        console.log(calcFuncs); // [f, f]
        const test5 = calcFuncs[0];
        const test6 = calcFuncs[1];
        ```
        
- @실습문제 - 눈코딩
    
    다음 결과를 예상해서 주석을 달고, 실제 결과값과 비교해본다.
    
    ```html
    <h4>@실습문제1 : 눈코딩</h4>
    <button onclick="aoo()();">aoo</button>
    <button onclick="boo()();">boo1</button>
    <button onclick="boo()(999);">boo2</button>
    <button onclick="coo(3)(5);">coo1</button>
    <button onclick="coo()(5);">coo2</button>
    <script>
    const a = 1;
    const aoo = () => {
    	const a = 100;
    	return () => console.log(a);
    }
    
    const b = 9;
    const boo = () => {
    	const b = 99;
    	return (b) => console.log(b);
    }
    
    const coo = (c) => {
    	return (n) => {
    	  console.log(c * n);
    	}
    }
    </script>
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
