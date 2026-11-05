---
별칭:
  - "학습 - String API"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/1b66fb9276ea459c830fffa8f68664bc
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: String API

## 세부 내용

`" "` `' '`로 묶여 있는 리터럴은 `String.prototype` 자바스크립트의 내장객체로부터 상속받은 메소드를 사용할 수 있다. Javascript는 prototype기반의 상속모델을 가지고 있고, `String.prototype`가 바로 부모객체이다.

[String - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)

[JavaScript String Reference](https://www.w3schools.com/jsref/jsref_obj_string.asp)

```jsx
/**
 * string타입 변수/값은 String 프로토타입의 메소드를 사용할 수 있다.
 */
function test1(){
  const str = "Apple Samsung PineApple";

	// 대소문자로 변환
  console.log("toUpperCase : ", str.toUpperCase());
  console.log("toLowerCase : ", str.toLowerCase());

	// 특정문자열의 index를 반환
  console.log("indexOf : ", str.indexOf("Sam")); // 6
  console.log("indexOf : ", str.indexOf("SSSSSSS")); // -1
  console.log("indexOf : ", str.indexOf("Apple")); // 0
  console.log("lastIndexOf : ", str.lastIndexOf("Apple")); // 18

	// 해당인덱스의 문자를 반환
  console.log("charAt : ", str.charAt(6)); // S
  console.log("str[index] : ", str[6]); // S

	// 해당인덱스의 문자의 ascii코드를 리턴
	console.log("charCodeAt : ", str.charCodeAt(0)); // 67

	// 문자열 잘라내기
  // substring(start, end) - start(inclusive), end(exclusive)
  console.log("substring : ", str.substring(6, 9)); // Sam
  console.log("substring : ", str.substring(6)); // Samsung PineApple

  // substr(start, length)
  console.log("substr : ", str.substr(6, 3)); // Sam
  console.log("substr : ", str.substr(6)); // Samsung PineApple

	// 문자열 대체
  console.log("replace : ", str.replace('Apple', '사과'));
  console.log("replace : ", str.replace('Apple', ''));
  console.log("replace : ", str.replace(/Apple/g, '')); // 정규표현식
	
	// 정규표현식 없이 다음처럼 반복문을 통해 처리가능
	// let result = str;
  // while(result.indexOf('Apple') > -1){
  //   result = result.replace('Apple', '');
  // }
  // console.log(result);

  // 문자열 split : 배열 반환
	console.log("split : ", str.split(" ")); // ["Apple", "Samsung", "PineApple"]

	// 채우기 
  console.log("23".padStart(5, "0")); // 00023
  console.log("23".padEnd(5, "0")); // 23000
}

/**
* @실습문제 : 
* 사용자에게 임의의 문자열을 입력받고(prompt), 유효한 경우만 alphabet의 개수을 세어서 출력하세요.
* 
* (java의 char타입처럼 asciicode로 변환되어 처리되지 않지만, 크기비교는 가능하다.)
* - "a" == 95 // false
* - "a" < "b" // true
* 
* 실행 예시 : 
* - 안녕 : 0
* - abcdef : 6
* - 잘가라 bye 바이 bye : 6
*/ 
function test2(){
	const str = prompt("문자열을 입력하세요.").toLowerCase();
	if(str == null) return;

	let cnt = 0;
	for(let i = 0; i < str.length; i++){
		// js의 문자열 크기비교는 사전등재순으로 결정.
	  if(str[i] >= "a" && str[i] <= "z")
			cnt++;
	}

	alert(`입력하신 문자열중 알파벳의 개수는 ${cnt}개입니다.`);
}
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
