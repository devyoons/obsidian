---
별칭:
  - "학습 - 구조분해 할당  ES6"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/a50b3a9bd7c04557b83792e49aae665c
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: 구조분해 할당  ES6

## 세부 내용

[구조 분해 할당 - JavaScript | MDN](https://developer.mozilla.org/ko/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#%EB%B0%B0%EC%97%B4_%EA%B5%AC%EC%A1%B0_%EB%B6%84%ED%95%B4)

- 배열 구조분해할당
    - 기본
        
```jsx
/**
 * 구조분해할당
 * Destructuring Assignment
 * - 배열/객체의 요소를 손쉽게 변수에 옮겨담는 문법
 */
const test1 = () => {
  const arr = [1, 2, 3];
  // const a = arr[0];
  // const b = arr[1];
  // const c = arr[2];

  // const [a, b, c] = arr;
	// console.log(a, b, c); // 1 2 3

  // const [a, b] = arr; // 필요없는 번지수는 생략가능
	// console.log(a, b); // 1 2

  // const [a, , b] = arr; // 변수 생략시 해당인덱스값은 버림
	// console.log(a, b); // 1 3

  // const [a, b, c, d] = arr; // 존재하지 않는 인덱스는 undefined 대입(오류 X)
	// console.log(a, b, c, d); // 1 2 3 undefined

  // const [a, b, c = 99, d = 999] = arr; // 존재하지 않는 인덱스는 기본값 처리 가능
	// console.log(a, b, c, d); // 1 2 3 999

  const [a, ...brr] = arr; // 나머지파라미터(변수) - 1번지 이후 brr배열에 대입
  console.log(arr, a, brr); // 1 [2, 3]

  // 변수 값교환
  let x = 10;
  let y = 20;
  [x, y] = [y, x];
  console.log(x, y); // 20, 10
};
```

- 나머지 파라미터  ES6  | 전개연산자  ES6
- 나머지파라미터 - <u>변수부</u>작성, <u>마지막에 딱 한번만 사용가능</u>
- 전개연산자 - 배열요소(<u>값</u>)을 전달할때 사용. <u>여러번 사용가능</u>

```jsx
// 나머지파라미터 vs 전개연산자
const foo = ['가','나','다'];
const bar = ['라','마','바'];

const koo = [...foo, ...bar]; // 전개연산자
console.log(foo, bar); // ['가', '나', '다'] ['라','마','바'] 
console.log(koo); // ['가', '나', '다', '라', '마', '바']

const [a, b, c, ...roo] = koo;
console.log(a, b, c, roo); // '가' '나' '다' ['라', '마', '바']
```

- 활용

```jsx
/**
 * 배열 구조분해할당 - 활용
 */
const test2 = () => {
  // 매개변수부
  console.log(process1([1, 2, 3]));
  console.log(process1([10, 20, 30, 40]));

  // 리턴값
  const [a, b] = process2();
  console.log(a, b);
};

const process1 = ([a, b, c, d = 0.5]) => {
  console.log(a, b, c, d);
  return (a * b) / c + d;
}

const process2 = () => {
  const a = Math.floor(Math.random() * 100) + 1;
  const b = Math.floor(Math.random() * 100) + 101;
  return [a, b];
}
```

- @실습문제 - 합 차 곱 몫 나머지

```jsx
/**
 * @실습문제 - 산술연산
 * - 두수를 전달받아 합, 차, 곱, 몫, 나머지를 동시에 리턴 함수 작성
 * 
 * calc([10, 3])
 * calc([5, 7])
 */
const test3 = () => {
  calc([10, 3]);

	// 실행결과를 다음 변수에 담아 각각 출력
  console.log(sum); // 13
  console.log(diff); // 7
  console.log(product); // 30
  console.log(quotient); // 3
  console.log(remainder); // 1
};
```

- @실습문제풀이

```jsx
/**
 * @실습문제 - 산술연산
 * - 두수를 전달받아 합, 차, 곱, 몫, 나머지를 동시에 리턴 함수 작성
 * 
 * calc([10, 3])
 * calc([5, 7])
 */
const test3 = () => {
  const [sum, diff, product, quotient, remainder] = calc([10, 3]);

	// 실행결과를 다음 변수에 담아 각각 출력
  console.log(sum); // 13
  console.log(diff); // 7
  console.log(product); // 30
  console.log(quotient); // 3
  console.log(remainder); // 1
};
const calc = ([x, y]) => [x + y, x - y, x * y, Math.floor(x / y), x % y];
```

- @실습문제 - 학생정보

```jsx
/**
 * @실습문제 - 학생점수
 * 다음 data 문자열을 다음과 같이 출력하세요.
 * - 홍길동(남) 평균 80.0점
 * - 신사임당(여) 평균 79.3점
 * - 전봉준(남) 평균 70.7점
 * 
 */
const test4 = () => {
  const data = "홍길동,남,90,80,70|신사임당,여,88,100,50|전봉준,남,55,80,77";

};
```

- @실습문제풀이

```jsx
/**
 * @실습문제 - 학생점수
 * 다음 data 문자열을 다음과 같이 출력하세요.
 * 
 * 1. 홍길동(남) 평균 80.0점
 * 2. 신사임당(여) 평균 79.3점
 * 3. 전봉준(남) 평균 70.7점
 * 
 */
const test4 = () => {
  const data = "홍길동,남,90,80,70|신사임당,여,88,100,50|전봉준,남,55,80,77";
	// 데이터 전처리
	data.split("|")
		.map((s, i) => s.split(","))
		.forEach((arr, index) => printStudentInfo(arr, index));
};

const printStudentInfo = ([name, gender, ...scores], index) => {
	// 평균점수 계산 및 출력
	const sum = scores
      .map((n) => Number(n))
      .reduce((sum, score) => sum + score);
  const avg = Math.round((sum / scores.length) * 10) / 10;
  console.log(`${index + 1}. ${name}(${gender}) - ${avg}점`);
}
```

- 정규식을 이용한 값해제

```jsx
/**
 * (심화) 정규식을 활용한 값해체
 */
const test5 = () => {
  console.log(parseProtocol("https://developer.mozilla.org/en-US/Web/JavaScript")); // "https"
}

const parseProtocol = (url) => {
    const parsedURL = /^(\w+)\:\/\/([^\/]+)\/(.*)$/.exec(url);
    if (!parsedURL) {
      return false;
    }
    console.log(parsedURL); // ["https://developer.mozilla.org/en-US/Web/JavaScript", "https", "developer.mozilla.org", "en-US/Web/JavaScript"]
    const [, protocol, host, filepath] = parsedURL; // 0번지 데이터는 제외
    return protocol;
  }

</script>
```

- 객체 구조분해할당
    - 기본
        
```jsx

```

- 중첩객체 및 활용

```jsx

```

- @실습문제 - Academy Info

```jsx
/**
 * @실습문제 - academy info
 * - getAcademyInfo함수에서 제공하는 정보를 활용해 다음 정보를 출력
 * - 교육원이름, 대표url, 대표전화번호
 * - 각지원별 대표주소와 대표강의장외 개수
 *    - 강남지원 : 서울특별시 강남구 테헤란로 14길 6 남도빌딩, A 외 12 강의장
 *    - 종로지원 : 서울특별시 중구 남대문로 120 대일빌딩, 201 외 2 강의장
 *    - 당산지원 : 서울특별시 영등포구 선유동2로 57 이레빌딩(구관), 1901 외 4 강의장
 */
const test7 = () => {
const {name, url : [mainUrl], tel: [mainTel], branches} = getAcademyInfo();
  console.log(name);
  console.log(mainUrl);
  console.log(mainTel);
  branches.forEach((branch) => {
	    const {branchname, addr, classrooms} = branch;
	    console.log(branchname);
	    console.log(typeof addr === 'string' ? addr : addr[0]);
	    console.log(`${classrooms[0]} 외 ${classrooms.length - 1} 강의장`);
	});
}
const getAcademyInfo = () => ({
  name : 'KH정보교육원',
  url : ['https://iei.or.kr', 'https://khcampus.or.kr'],
  tel : ['1544-9970', '1544-9971'],
  branches : [
		{
			branchname : '강남지원',
			addr : [
				'서울특별시 강남구 테헤란로 14길 6 남도빌딩',
				'서울특별시 강남구 테헤란로 10길 9 그랑프리빌딩',
				'서울특별시 강남구 테헤란로 130 호산빌딩'
			],
			classrooms : ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M']
		},
		{
			branchname : '종로지원',
			addr : '서울특별시 중구 남대문로 120 대일빌딩',
			classrooms : ['201', '202', '203']
		},
		{
			branchname : '당산지원',
			addr : '서울특별시 영등포구 선유동2로 57 이레빌딩(구관)',
			classrooms : ['1901', '1902', '1903', '2001', '2002']
		},
	]
});
```

- @실습문제 - 가족관계

```jsx
/**
 * @실습문제 - 가족관계 출력
 * - 이름 : 홍길동, 아빠 : 홍석천, 엄마 : 홍진경, 형제자매 : 홍수아
 * - 이름 : 신사임당, 아빠 : 신동엽, 엄마 : 고두심, 형제자매 : 신하균
 */ 
const test8 = () => {
	const {name, family: {father, mother, ...siblings}} = person;
  console.log(`이름 : ${name}, 아빠 : ${father}, 엄마 : ${mother}, 형제자매 : ${Object.values(siblings)}`);
};

const getPeople = () => [
  {
    name : '홍길동',
    family : {
      father : '홍석천',
      mother : '홍진경',
      sister : '홍수아',
    }, 
    age : 35
  },
  {
    name : '신사임당',
    family : {
      father : '신동엽',
      mother : '고두심',
      brother : '신하균',
    }, 
    age : 25
  },
	{
    name : '이순신',
    family : {
      father : '이경영',
      mother : '이영자',
      brother : '이승환',
      sister : '아이유',
    }, 
    age : 33
  },
  {
    name : '유관순',
    family : {
      father : '유재석',
      mother : '유인나',
      brother : ['유오성', '유지태', '유상무'],
      sister : ['유지민', '유정']
    }, 
    age : 33
  }
];
```

- @실습문제풀이

```jsx
const test8 = () => {
  getPeople().forEach((person) => {
    const {name, family: {father, mother, sister, brother}} = person;
    console.log(`이름 : ${name}, 아빠 : ${father}, 엄마 : ${mother}, 형제자매 : ${sister || brother}`);
  });
};
```

- 계산된 속성과 구조분해할당

```jsx
// 계산된 속성 이름과 구조 분해할당
// 계산된 속성 이름(computed property name)은, 객체 리터럴과 비슷하게 구조 분해에도 사용될 수 있습니다.
let key = "name";
let { [key]: val } = { name : "홍길동" };

console.log(val); // "홍길동"
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
