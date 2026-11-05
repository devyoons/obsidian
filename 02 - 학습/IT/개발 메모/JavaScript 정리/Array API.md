---
별칭:
  - "학습 - Array API"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/cd421d1fb020498e8977a2858225e584
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: Array API

## 세부 내용

- object타입
- 타입제한/크기제한이 없다. (자바의 `ArrayList<Object>`와 비슷)
- 없는 인덱스를 참조하면 오류 나지 않고, undefined를 리턴
- 배열 생성
    
```jsx
/**
 * 배열
 * - 리터럴로 생성
 * - new Array(요소1, 요소2, ...)
 * - new Array(길기)
 */
function test1(){
  const arr1 = [1, 2, 3];
  const arr2 = new Array('a', 'b', 'c');
  const arr3 = new Array(3); // 크기가 3인 배열 생성(의미 없음)
  console.log(arr1);
  console.log(arr2);
  console.log(arr3);

  arr1[3] = 'x';

  for(let i = 0; i <= arr1.length; i++){
    console.log(i, ":", arr1[i]);
  }

	// 타입에 대한 제한이 없다.
  const arr4 = [1, 2, 3, ['가', '나', '다']];
  console.log(arr4[3][0]);
  console.log(arr4[3][1]);
  console.log(arr4[3][2]);

  // 존재하지 요소를 참조해도 오류가 발생하지 않는다.
  console.log(arr1[100]); // undefined
  console.log(arr1[100].length); // Uncaught TypeError: Cannot read properties of undefined (reading 'length')
}
</script>
```

- 배열 메소드
    
    <aside>
    💡 배열요소를 변경하는 메소드의 경우, 원본배열을 직접 변경하는 지 새배열을 만들어 처리하는 지 구분해야 한다.
    
    </aside>
    
    - indexOf
        
```jsx
const arr = ["apple", "strawberry", "melon", "banana", "melon"];
console.log(arr.indexOf("melon")); // 2
console.log(arr.indexOf("mmmmmmmmmelon")); // -1
console.log(arr.lastIndexOf("melon")); // 4
```

- concat
- 원본배열을 변경하지  않고, 새 배열을 생성해 반환
- ES6  spread operator 전개 연산자를 이용해 처리가능하다.
- 해당 배열요소를 지정한 위치에 배치한다.

```jsx
const arr1 = ['a', 'b', 'c'];
const arr2 = ['A', 'B', 'C'];
const arr3 = arr1.concat(arr2);
const arr4 = [...arr1, ...arr2]; // 전개 연산자

console.log(arr1);
console.log(arr2);
console.log(arr3);
console.log(arr4);

// 동일한 요소를 가진 새로운 배열 생성 (clone)
const arr5 = [...arr2];
console.log(arr5);
```

- join

```jsx
/**
 * join(구분자):string
 */
function test4(){
  const arr = ['사과', '딸기', '바나나', '망고'];
  console.log(arr.join('|')); // 사과|딸기|바나나|망고
  console.log(arr.join()); // 기본구분자 , 사과,딸기,바나나,망고
  console.log(arr.toString()); // 요소확인 가능하도록 오버라이드되어 있음. 사과,딸기,바나나,망고
}
```

- reverse

```jsx
/**
 * reverse
 * - 요소순서를 반대로 뒤집는다.
 * - 원본배열을 수정
 */
function test5(){
  const arr = new Array('가', '나', '다');
  console.log(arr.reverse()); // ['다', '나', '가']
  console.log(arr); // ['다', '나', '가']
}
```

- sort

[Array.prototype.sort() - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort)

```jsx
/**
 * sort(compareFunction)
 * - 원본배열 정렬
 */
function test6(){
  // 기본정렬
  const arr = [3, 2, 4, 5, 1];
  // console.log(arr.sort());
  // console.log(arr);

  const names = ['나영길', '다락방', '가방애'];
  // console.log(names.sort());

  // 기타정렬
  // 숫자내림차순
  // 음수 | 0 | 양수을 반환. 음수반환시에 자리교환.
  arr.sort(function(a, b){
    return b - a; 
  });
  console.log(arr);

  // 문자열 사전등재역순
  names.sort(function(a, b){
    if(a > b) return -1;
    if(a < b) return 1;
    return 0;
  });
  console.log(names); 
}
```

- compareFunction이란?

    각 브라우져의 js엔진이 사용하는 정렬 알고리즘에 의해 호출될 함수. 이 함수가 리턴한 값(양수 | 0 | 음수)에 따라 오름차순/내림차순이 결정된다.

```jsx
function compare(a, b) {
  if (a is less than b by some ordering criterion) {
		// a가 b보다 먼저 나와야 하는 경우
    return -1;
  }
  if (a is greater than b by the ordering criterion) {
		// a가 b보다 나중에 나와야 하는 경우
    return 1;
  }
  // a must be equal to b
  return 0;
}
```

- @실습문제 - 영화

```jsx
<button onclick="test7()">@실습문제</button>
<ul id="movies"></ul>
<script>
/**
 * @실습문제 
 * - 사용자로부터 좋아하는 영화제목을 ,로 구분해 입력받고, 이를 배열로 변환후 가나다순 출력하기
 */
function test7(){
  const _movies = prompt("영화제목을 작성하세요.", "쇼생크탈출,까모메식당,본아이덴티티");
  if(!_movies) return;
  const moviesArr = _movies.split(",");
  // 좌우 공백제거
  for(let i = 0; i < moviesArr.length; i++){
    moviesArr[i] = moviesArr[i].trim();
  }
  // 정렬
  moviesArr.sort();
  console.log(typeof moviesArr, moviesArr); // object 

  // 화면 렌더링
  movies.innerHTML = "";
  for(let i = 0; i < moviesArr.length; i++){
    movies.innerHTML += `<li>${moviesArr[i]}</li>`;
  } 
}
</script>
```

- push | pop | unshift | shift

```jsx
/**
 * push 마지막에 요소추가
 * pop 마지막 요소제거
 * unshift 0번지에 요소추가
 * shift 0번지 요소제거
 */
function test8(){
  const arr = [];
  arr.push(1);
  arr.push(2);
  arr.push(3);
  console.log(arr.pop()); // 3
  console.log(arr.pop()); // 2
  console.log(arr.pop()); // 1

  arr.unshift(1);
  arr.unshift(2);
  arr.unshift(3);
  console.log(arr.shift()); // 3
  console.log(arr.shift()); // 2
  console.log(arr.shift()); // 1

  // queue 
  // 맨뒤에서 추가, 맨 앞에서 제거
  arr.push('a');
  arr.push('b');
  arr.push('c');
  while(arr.length)
    console.log(arr.shift()); // c b a

  // stack
  // 맨뒤에서 추가, 맨뒤에서 가져오기 
  // 다 나 가
  arr.push('가');
  arr.push('나');
  arr.push('다');
  while(arr.length)
    console.log(arr.pop()); // 다 나 가
}
```

- slice

```jsx
/**
 * slice(start, end)
 * - 배열의 substring
 * - 원본배열 변경하지 않는다.
 * - start 포함
 * - end 미포함
 */
function test9(){
  const arr = ['java', 'javascript', 'python', 'sql'];
  // const other = arr.slice(1, 3);
  const other = arr.slice(1); // end생략시 마지막요소까지 반환
  console.log(arr, other);

  // 배열복제
  const copy = arr.slice(); // start, end생략시 복제
  const cocopy = [...arr];
  console.log(copy, cocopy);
}
```

- splice

```jsx
/**
 * splice(start, delCount, [newItem1, newItem2, ...])
 * - 요소를 제거 또는 추가
 * - 원본배열 변경
 */
function test10(){
  const arr = ['a', 'b', 'c'];
  // [제거, 삽입] b를 제거, '가', '나', '다'를 추가
  // arr.splice(1, 1, '가', '나', '다');

  // [제거] b만 제거
  // arr.splice(1, 1);

  // [삽입] 1번지 '가', '나', '다'를 추가
  arr.splice(1, 0, '가', '나', '다');

  console.log(arr);
}
```

- @실습문제 - 무지개테이블

```jsx
/**
 * @실습문제 - 무지개테이블
 * 
 * '빨', '주', '노', '초', '파', '남', '보'
 * '주', '노', '초', '파', '남', '보', '빨'
 * '노', '초', '파', '남', '보', '빨', '주'
 * '초', '파', '남', '보', '빨', '주', '노'
 * '파', '남', '보', '빨', '주', '노', '초'
 * '남', '보', '빨', '주', '노', '초', '파'
 * '보', '빨', '주', '노', '초', '파', '남'
 */
const test = function(){
	const rainbow = ['빨','주','노','초','파','남','보'];
	for(let i = 0; i < rainbow.length; i++){
		console.log(rainbow.join()); // 또느 toString()
		rainbow.push(rainbow.shift());
	}	
}
```

- 유사배열
    
```jsx
/**
 * 유사배열
 * - Array.prototype을 상속하지 않는 배열객체
 * - index, length는 있지만 Array.prototype의 메소드는 사용할 수 없다.
 * - getElementsByXXX, querySelectoAll의 리턴객체
 */
function test12(){
  const buttons = document.getElementsByTagName("button");
  console.log(buttons);
  // console.log(buttons.pop()); // Uncaught TypeError: buttons.join is not a function

  // 유사배열 - 진짜배열로 변환
  // const arr = Array.from(buttons);
  const arr = [...buttons];
  console.log(arr);
  console.log(arr.pop());
}
```

- 반복문 처리
    
```jsx
/**
 * 배열의 반복처리
 */
function test13(){
  const arr = ['a', 'b', 'c'];
  
  // 일반for
  // for(let i = 0; i < arr.length; i++)
  //   console.log(i, arr[i]);

  // for..in : 열거속성이 true인 요소를 반환. 배열 인덱스반환
  for(let i in arr){
    console.log(i, arr[i]);
  }

  // for..of 해당객체가 iterator를 구현한 경우 사용가능. 배열은 사용가능
  for(let ch of arr){
    console.log(ch);
  }

  // forEach 메소드 - 매요소별로 콜백함수 호출
  arr.forEach(function(ch, index, arr){
    console.log(ch, index, arr);
  });
  /*
    a 0 (3) ['a', 'b', 'c']
    b 1 (3) ['a', 'b', 'c']
    c 2 (3) ['a', 'b', 'c']
  */

}
```

- map | filter | reduce
    - map
        
```jsx
/**
 * map 현재배열요소에 어떤작업후 변환된 값을 새배열에 추가.
 */
function test14(){
  const arr = [1, 2, 3];  // [1, 4, 9]
  const result = arr.map(function(n, index){
    console.log(n, index);
    return `<mark>${n * n}</mark>`;
  });
  console.log(arr, result); // [1, 2, 3] ['<mark>1</mark>', '<mark>4</mark>', '<mark>9</mark>']
  result.forEach(function(mark, index){
    foo.innerHTML += mark + " ";
  });
}
```

- filter

```jsx
/**
 * filter 현재배열요소중 조건에 맞는 요소만 추려내 새배열에 추가
 */
function test15(){
  const nums = [1,2,3,4,5,6,7,8,9,10]; 
  const evens = nums.filter(function(n, index){
    return n % 2 == 0;
  });
  console.log(evens); // [2,4,6,8,10]

  const str = ["안녕", "34", "700원", "$35.5", "77", "4달라", "123", "2밤"];
  const nums = 
		str
			.filter(function(str, index){
	      return !isNaN(Number(str));
	    }) // ["34", "77", "123"]
			.map(function(str){
	      return Number(str);
	    });
  console.log(nums); // [34, 77, 123]
}
```

- reduce

```jsx
/**
 * reduce 모든 요소를 대상으로 특정작업후 하나의 값(객체)을 반환
 * - reduce(콜백함수, 초기값)
 */
function test16(){
  const arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  const sum = arr.reduce(function(agg, n, index){
    console.log(agg, n);
    return agg + n;
  }, 0);
  console.log('합계 : ', sum); // 55 

	// map처럼 사용하기
  console.log(
    arr.reduce(function(ar, n, index){
      ar.push(n * n);
      return ar;
    }, [])
  );

  // filter처럼 사용하기
  console.log(
    arr.reduce(function(ar, n, index){
      n % 2 == 0 && ar.push(n);
      return ar;
    }, [])
  ); 
}
/*
	0 1
	1 2
	3 3
	6 4
	10 5
	15 6
	21 7
	28 8
	36 9
	45 10 
	합계 :  55

	[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
	[2, 4, 6, 8, 10]
	*/
```

- @실습문제 - drink

```jsx
/**
 * @실습문제 - 음료
 * #drink하위의 음료목록으 모두 읽어와서 대문자로 변환, 오름차순정렬 후 다시 #drink하위에 추가
 */
function test17(){
  document.querySelector("#drink").innerHTML = 
    Array.from(document.querySelectorAll("ul#drink li")) // 유사배열을 찐배열 변환
        .map(function(li, index){
          return li.innerText.toUpperCase();
        }) // ["JUICE", "COFFEE", "COCKTAIL", "BEER", "WHISKEY"]
        .sort() // ["BEER", "COCKTAIL", "COFFEE", "JUICE", "WHISKEY"]
        .reduce(function(html, drink, index){
          // console.log(index, html, drink);
          return `${html}<li>${drink}</li>`
        }, ""); // <li>BEER</li><li>COCKTAIL</li><li>COFFEE</li><li>JUICE</li><li>WHISKEY</li>
}
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
