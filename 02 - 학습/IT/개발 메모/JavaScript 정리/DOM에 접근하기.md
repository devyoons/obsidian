---
별칭:
  - "학습 - DOM에 접근하기"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/d1e57f0f0a884f50bfff4ec958b3fb37
---

# 학습: DOM에 접근하기

## 세부 내용

```jsx
<div>
  <ul>
    <li id="hw1" class="group1" title="HelloWo1">HelloWorld1</li>
    <li id="hw2" class="group1">HelloWorld2</li>
    <li id="hw3" class="group2" title="HelloWorld3">HelloWorld3</li>
    <li id="hw4" class="group2">HelloWorld4</li>
    <li id="hw5" class="group1 group2">HelloWorld5</li>
  </ul>
</div>
<div>
  <input type="checkbox" name="fruit" id="apple" value="사과">
  <label for="apple">사과</label>
  <input type="checkbox" name="fruit" id="banana" value="바나나">
  <label for="banana">바나나</label>
  <input type="checkbox" name="fruit" id="peach" value="복숭아">
  <label for="peach">복숭아</label>
	&nbsp;&nbsp;
  <input type="checkbox" id="fruitCheckAll" onchange="test4a();"><label for="fruitCheckAll">모두 선택/해제</label>
  <br>
  <input type="text" name="username" id="username">
  <br>
  <input type="range" name="point" id="point" min="0" max="100" step="5" oninput="test6();">
	<span id="pointView">0</span>점
</div>
```

- `document.getElementById(id:string)`
    
    <aside>
    🙂 `const hw1 = document.getElementById('hw1');` 
    위 코드를 작성하지 않아도 hw1으로 li#hw1에 접근이 가능하다. 해당 id값을 가진 tag객체가 유일하므로 선언없이 접근할수 있는 편의를 제공한다.
    단, 새로 변수를 덮어쓰지 않았을 경우만이다.
    
    </aside>
    
    ```jsx
    /**
     * getElementById
     * - 해당 id를 가진 tag객체를 반환
     * - 존재하지 않는 경우 null 반환
     */
    function test1(){
        const hw1 = document.getElementById('hw1');
        console.log(typeof hw1, hw1);
        console.dir(hw1); // HTMLLIElement
        console.log('id : ', hw1.id);
        console.log('class : ', hw1.className);
        console.log('title : ', hw1.title);
        console.log('innerHTML : ', hw1.innerHTML);
    
        const notExist = document.getElementById("notExist");
        console.log(typeof notExist, notExist); // object null
        // 타입은 object인데, 값이 없는 경우 null
        console.log(notExist.id); // Uncaught TypeError: Cannot read properties of null (reading 'id')
        console.log(12345); // 이 코드는 실행되지 않는다.
      }
    ```
    
- `document.getElementsByTagName(tagName:string)`
    
    ```jsx
    /**
     * getElementsByTagName
     * - 해당 태그객체를 포함하는 배열(가짜)를 반환
     * - 하나도 존재하지 않는 경우 빈 배열 반환
     */ 
    function test2(){
      const list = document.getElementsByTagName("li");
      // console.log(typeof list, list); // HTMLCollection
    
      for(let i = 0; i < list.length; i++){
        const li = list[i];
        console.dir(li); // HTMLLIElement
        console.log(li.id, li.className, li.innerHTML);
        
    		li.style.backgroundColor = 'hotpink';
        li.style.color = 'white';
        li.style.fontSize = '32px';
      }
    }
    ```
    
- `document.getElementsByClassName(className:string)`
    
    ```jsx
    /**
     * getElementsByClassName
     * - 해당 클래스를 가진 태그객체를 배열(가짜)로 반환
     */
    function test3(){
      const group1 = document.getElementsByClassName("group1");
      console.log(typeof group1, group1);
      for(let i = 0; i < group1.length; i++){
        const li = group1[i];
        li.style.textDecoration = 'underline';
        li.innerHTML = li.innerHTML.replace('Helloworld','안녕세계');
      }
    }
    ```
    
- `document.getElementsByName(name:string)`
    
    ```jsx
    /**
     * getElementsByName
     * - 해당 name값을 가진 input/select태그를 배열(가짜)로 반환
     * - 매칭되는 태그가 없을시 빈 배열을 반환
     */
    function test4(){
      const fruits = document.getElementsByName('fruit');
      console.log(typeof fruits, fruits);
      const arr = [];
      for(let i = 0; i < fruits.length; i++){
        const fruit = fruits[i];
        // console.dir(fruit);
        // console.log("%s : %s", fruit.id, fruit.checked); // getter로써 사용
        // fruit.checked = true; // setter로써 사용
        if(fruit.checked){
    	    arr.push(chk.value); // 배열의 마지막 요소로 추가하기
        }
      }
      alert(arr + "을 선택했습니다."); // alert는 ,로 값을 나열할 수 없다.
    }
    
    /**
     * 전체선택/해제
     */ 
    function test4a(){
      const fruitCheckAll = document.getElementById("fruitCheckAll");
      // console.log(fruitCheckAll.checked);
    
      const fruits = document.getElementsByName("fruit");
      for(let i = 0; i < fruits.length; i++)
        fruits[i].checked = fruitCheckAll.checked;
    }
    ```
    
- @실습문제 - `input#username[name=username]`의 사용자입력값을 alert로 출력
    
    ```jsx
    /**
     * @실습문제 
     * - input#username[name=username]의 사용자입력값을 alert로 출력
     */ 
    function test5(){
      // const username = document.getElementsByName('username')[0];
      const username = document.getElementById('username');
      // console.log(username);
      alert(username.value);
    }
    ```
    
- `input[range]` value값 표시하기
    
    ```jsx
    <input type="range" name="point" id="point" min="0" max="100" value="0" oninput="test6();">
    <span id="pointView">0</span>점
    ```
    
    ```jsx
    /**
     * input#point input이벤트핸들러(리스너)
     * - A 사용자값 값입력(핸들 조정)
     * - B span#pointView 값표시(test6함수)
     */
    function test6(){
      // const point = document.getElementById('point');
      const pointVal = point.value;
      console.log(pointVal);
      // const pointView = document.getElementById('pointView');
      pointView.innerHTML = pointVal;
    }
    ```
    
- `querySelector(selector:string)`
    
    ```jsx
    /**
     * querySelector
     * - css 선택자를 통해 DOM 요소를 접근할 수 있다.
     * - 선택자와 일치하는 하나의 요소 반환
     *   (복수개에 해당하는 선택자여도 첫 요소만 반환)
     */
    function test7(){
      // const elem = document.querySelector('#username');
      const elem = document.querySelector('[name=fruit]');
      console.log(typeof elem, elem);
      console.dir(elem);
    }
    ```
    
- `querySelectorAll(selector:string)`
    
    ```jsx
    /**
     * querySelectorAll
     * - css 선택자를 통해 DOM 요소를 접근할 수 있다.
     * - 선택자와 일치하는 모든 요소 유사배열에 반환
     */
    function test8(){
      // const elems = document.querySelectorAll('[name=fruit]');
      const elems = document.querySelectorAll('ul li');
      console.log(typeof elems, elems);
      for(let i = 0; i < elems.length; i++){
        console.log("%s : %s", elems[i].id, elems[i].checked);
      }
    }
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/JavaScript 정리/JavaScript 정리|JavaScript 정리]]
