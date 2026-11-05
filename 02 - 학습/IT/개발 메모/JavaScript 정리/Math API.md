---
별칭:
  - "학습 - Math API"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/566c9a49fc034530ac838a2654b4d027
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: Math API

## 세부 내용

[Math - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math)

```jsx
/**
 * Math static api
 * - Math.ceil
 * - Math.round
 * - Math.floor | Math.trunc
 * - Math.random
 */ 
function test2(){
  console.log("Math.abs : ", Math.abs(-123)); // 123 부호없는 절대값
  console.log("Math.ceil : ", Math.ceil(1234.5)); // 1235
  console.log("Math.round : ", Math.round(1234.5)); // 1235
  console.log("Math.floor : ", Math.floor(1234.5)); // 1234
  console.log("Math.trunc : ", Math.trunc(1234.5)); // 1234

	// 반올림해서 소수점이하 둘재자리까지 표현 : 부동소수점방식으로 처리
  const n = 1234.565432;
  console.log(Math.round(n * 100) / 100); // 123456.5432 -> 123457 -> 1234.57
  
  // 0.0 이상 1.0미만의 난수 생성
  const rnd = Math.random();
  console.log(rnd);
  // 1 ~ 10 사이의 정수형 난수 : 버림(난수 * 경우의 수) + 최소값 
  // 버림이 아닌, 반올림을 사용하면 범위가 1~11이 됨. round 사용하지 말것.
  console.log(Math.floor(rnd * 10) + 1);

	// Math 상수
	console.log(Number.MIN_SAFE_INTEGER); // -9007199254740991
	console.log(Number.MAX_SAFE_INTEGER); // 9007199254740991
	console.log(Number.MAX_VALUE); // 1.7976931348623157e+308
	console.log(Number.MIN_VALUE); // 5e-324
}
```

- @실습문제 : li태그 난수채우기
    
```jsx
<!-- emmet이용 ul#test>li*100 --> 
<ul id="test">
	<li></li>
	...
</ul>

<style>
.even {
  color: hotpink;
}
</style>

<script>
/**
 * ul#test li태그에 1 ~ 1000사이의 난수를 대입하고, 짝수인 경우 color를 변경하는 함수
 * - 매 실행시마다 초기화되어야 함.
 */
function test3(){
  const list = document.querySelectorAll("ul#test li");
  for(let i = 0; i < list.length; i++){
    const li = list[i];
    li.classList.remove('even');
    const n = Math.floor(Math.random() * 1000) + 1;
    li.innerText = n;
    if(n % 2 == 0){
      li.classList.add('even');
    }
  }
}
</script>
```

- 다른 풀이

```jsx
/**
 * class값이 아닌 직접 style객체 제어하기
 */
function test(){
	var elems = document.getElementsByTagName("li");
	//console.log(elems);
	for (var i = 0; i < elems.length; i++) {
		var num = Math.floor(Math.random() * 1000) + 1;
		elems[i].innerHTML = num;
		
		//짝수인경우 배경색 난수 지정
		elems[i].style.backgroundColor = "#fff";//16진수로 컬러값 초기화
		if(num % 2 == 0){
			var r =  Math.floor(Math.random() * 256);
			var g =  Math.floor(Math.random() * 256);
			var b =  Math.floor(Math.random() * 256);
			elems[i].style.backgroundColor = `rgb(${r},${g},${b})`;
		}
	}
}

/**
 * div#test 하위에 동적으로  ul>li*100을 생성하는 함수
 *
 */
function setRndNumber2(){
	const container = document.querySelector("div#test");
	// 0.기존 자식요소제거
	const prevChild = container.querySelector("ul");
	prevChild != null && container.removeChild(prevChild);

	// 태그를 동적으로 생성 : js object먼저 생성후, DOM에 추가
	const ul = document.createElement("ul"); // <ul></ul>

	for(let i = 0; i < 100; i++){
	  const li = document.createElement("li"); // <li></li>
	  let n = Math.floor(Math.random() * 100) + 1;
	  const textContent = document.createTextNode(n);
	  
	  li.append(textContent); // <li>34</li>
	  ul.append(li);
	}

	container.append(ul);
}
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
