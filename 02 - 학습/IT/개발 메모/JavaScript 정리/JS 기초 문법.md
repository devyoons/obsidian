---
별칭:
  - "학습 - JS 기초 문법"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/04d20cabe2a34efb98a19c8e85e29774
---

# 학습: JS 기초 문법

## 세부 내용

---

---

### 변수

변수는 어떤 정보에 이름을 붙여서 저장하고 싶을 때 사용한다.name="Mike";age=30;

- 자바스크립트에서 문자는 항상 따옴표로 감싸져있어야 한다.
- 변수 이름으로 예약어는 불가능.

#### let, const

자바스크립트에서 변수를 선언할때는,**변할 수 있는 값은 let**으로 선언,**변하지 않는 값은 const**로 선언.

**cosnt**: 절대로 바뀌지 않는 **상수**수정X

```
const PI=3.14;
const SPEED_LIMIT = 50;
const BIRTH_DAY = '2020-01-01';
```

#### 변수 정할 시 주의사항

1. 변수는 문자와 숫자, $와 _만 사용.
2. 첫글자는 숫자가 될 수 없다.
3. 예약어는 사용할 수 없다.
4. 가급적 상수는 대문자로 알려주세요.
5. 변수명은 읽기 쉽고 이해할 수 있게 선언.

### 자료형

#### 문자열 string

```
const name = "Mike";//문자열 string
const name = 30;

const name1= "Mike"
const name2= 'Mike'
const name3= `Mike`const message = "I'm a boy.";
const message2 = 'I\'m a boy.';

const message3 = `My name is ${name}`;
```

#### 숫자형 Number

```
const age = 30; //숫자형 Number
const PI = 3.14;

console.log(1+2);//더하기
console.log(10-3);//빼기
console.log(3*2);// * 곱하기
console.log(6/3);// / 나누기
console.log(6%4);// % 나머지

// NaN = Not a number
```

#### Boolean

```
const a = true; //참
const b = false; //거짓
```

#### Null, Undefined

- Null: 존재하지 않는 값.
- Undefined: 값이 할당되지 않았다.

```
let age;
console.log(age) //undefined

let user = null; //유저는 존재하지 않는다.
```

#### typeof 연산자

```
const name = "Mike";

console.log(typeof 3);//"number"
console.log(typeof name);//"string"
console.log(typeof true);//"boolean"
console.log(typeof "xxx");//"string"
console.log(typeof null);//"object"
console.log(typeof undefined);//"undefined"
```

> typeof 연산자를 사용하는 경우다른 개발자가 작성한 변수의 타입을 알아야 하거나, API 통신을 통해 받아온 데이터를 타입에 따라 다르게 처리해야 할 때 사용.
> 

```
typeof null;//"object" 객체형
```

그러나 **null =/= 객체**

### 대화상자

#### alert, prompt, confirm

- alert: 알려줌
- prompt: 입력 받음
- confirm: 확인 받음

#### prompt

```
const name = prompt("이름을 입력하세요.");
//alert ("환영합니다, " + name + "님");
alert(`안녕하세요, ${name}님, 환영합니다.`);
```

prompt는 디폴트값도 입력 가능.

```
const name = prompt("예약일을 입력해주세요.","2020-10-");
//디폴트값도 입력 가능.
```

#### confirm

```
const isAdult = confirm("당신은 성인입니까?");
console.log(isAdult)

// 결제 하시겠습니까?
// 정말 삭제하시겠습니까?
```

#### 대화상자 단점

1. 스크립트 일시 정지
2. 스타일링 불가능

### 형 변환

- **String()** -> 문자형으로 변환
- **Number()** -> 숫자형으로 변환
- **Boolean()** -> 불린형으로 변환
- prompt 입력한 값 -> 문자형
- 자동 형변환

```
"6"/"2"=3
"9080"/2=4540
```

- 자동 형변환은 에러의 원인이 될 수 있음. **명시적 형변환**을 하는 것이 좋음!

#### String()

#### Number()

```
console.log(
	Number(true),
  	Number(false)
)
//값 true = 1, false = 0
```

#### Boolean()

**false**

- 숫자 0
- 빈 문자열''
- null
- undefined
- NaN

이 외에는 모두 true로 된다.

#### 주의사항(기억!)

```
Number(null)//0
Number(undefined)//NaN

Number(0)//false
Number('0')//true

Number('')//false (빈 문자열)
Number(' ')//true (공백이 들어가면 true)
```

### 연산자

#### 나머지(%)를 어디에 쓸까?

홀수: X%2=1짝수: Y%2=0

어떤 값이 들어와도 5를 넘기면 안 돼X % 5 = 0~4 사이의 값만 반환

#### 거듭제곱

```
const num = 2**3;
console.log(num); //8
```

#### 우선 순위

- / **>** +-

#### 연산자 줄여서 쓰기

```
let num = 10;
//num= num + 5;
num += 5;

console.log(num);
```

#### 증가 연산자, 감소 연산자

: 값을 1만큼 증가 또는 감소.

```
let num= 10;
num++; //혹은 num--;

console.log(num);
```

```
let num= 10;
let result= num++;

console.log(result); //값: 10
```

```
let num= 10;
let result= ++num;

console.log(result); //값: 11
```

### 비교 연산자, 조건문

#### 비교 연산자

**<, >, <=, >=, ==, !=**

```
console.log(10>5); //true
console.log(10 == 5); //false //동등 연산자
console.log(10 != 5); //true
```

#### 동등 연산자, 일치 연산자

```
const a = 1;
const b = "1";

console.log(a == b); //true

//=을 3개쓰면 타입까지 비교. -> 일치 연산자

console.log(a === b); //false // 일치 연산자
```

**가급적 동등 연산자보다 일치 연산자를 쓰는 것이 좋다.**

#### if, else, else if

```
const age=30;

if(age>19){
	console.log('환영합니다.');
} else if(age === 19){
	console.log('수능 잘치세요.');
} else {
	console.log('안녕히 가세요.');
}
```

### 논리 연산자

#### || (OR), && (AND), ! (NOT)

- || (OR): 여러 개 중 하나라도 true 면 true. 즉, 모든 값이 false일 때만 false를 반환. a||b
- && (AND): 모든 값이 true면 true. 즉, 하나라도 false면 false를 반환. a&&b
- ! (NOT): true면 false, false면 true. !a

#### 평가

- OR는 첫번째 true를 발견하는 즉시 평가를 멈춤.
- AND는 첫번째 false를 발견하는 즉시 평가를 멈춤.

```
//OR
// 이름이 TOM이;거나, 성인이면 통과.

const name = "Mike";
const age = 30;

if(name==='Tom'||age>19){
	console.log('통과');
 } else {
 	console.log('돌아가.');
 }
```

```
//NOT
//나이를 입력 받아 성인 아니면 돌아가라고...

const age = prompt('나이가...?');
const isAdult = age >19;

if(!isAdult){
  console.log('돌아가.');
   }
```

#### 우선순위 AND > OR

```
//우선순위
//남자이고,이름이 Mike이거나 성인이면 통과

const gender='F';
const name='Jane';
const isAdult = true;

if(gender==='M' && name === 'Mike' || isAdult){
  console.log('통과')
   }else {
   console.log('돌아가')
   }//통과
//Why?
//if(gender==='M' && name === 'Mike' || isAdult)
//=if((gender==='M' && name === 'Mike') || isAdult)

//의도한 대로 만들어주려면
//if(gender==='M' && (name === 'Mike' || isAdult))이렇게 만들어줘야한다.
```

### 반복문 loop

: 동일한 작업을 여러번 반복

#### for

for(let i=0;i<10;i++){//반복할 코드}

for(1.초기값 ; 2. 조건 ;3. 코드 실행 후 작업){//반복할 코드}

```
//1부터 10까지 로그

for(let i = 0; i <10 ; i++){
	console.log(i+1)
}

for(let i = 1; i <= 10 ; i++){
	console.log(i)
}

for(let i = 1; i <11 ; i++){
	console.log(i)
}
```

#### while

let i = 0;while(i<10){//코드i++;}

```
let i = 0;

while(i<10){
	console.log(i);
  	i++;
} //0~9까지 로그
```

#### do..while

let i =0;do{//코드i++;}while(i<10)

- while 반복문과 다른 점?do..while반복문은 코드가 먼저 실행됨!

#### break, continue

- break: 멈추고 빠져나옴
- continue: 멈추고 다음 반복으로 진행

```
//break

while(true){
	let answer = confirm('계속 할까요?');
  	if(!answer){
    	break;
    }
}
```

```
//continue
//짝수만

for(let i=0; i<10; i++){
	if(i%2){
    	continue;
    }
  console.log(i)
}
```

### switch

```
switch(평가){
  case A:
    //A일때 코드
  case B:
    //B일때 코드
  ...
}
```

```
//위의 switch문과 동일
if(평가 == A){
	//A일때 코드
}else if(평가 ==B){
	//B일때 코드
}
```

```
let fruit = prompt('무슨 과일을 사고 싶나요?');

switch(fruit){
  case '사과':
    console.log('100원입니다.');
    break;
  case '바나나':
    console.log('200원입니다.');
    break;
  case '키위':
  case '수박':
    console.log('300원입니다.');
    break;
  default:
    console.log('그런 과일은 없습니다.');
}
```

### 함수(function)

```
function sayHello(name){
	console.log(`Hello,${name}`);
}
```

function: 함수sayHello: 함수명(name): 매개변수

```
//함수작성
function showError(){
	alert('에러가 발생했습니다. 다시 시도해주세요.');
}

showError();
//매개변수는 없어도 되고, 2개 이상이어도 된다.
```

```
//함수 작성
// 매개변수가 있는 함수

function sayHello(name){
	const msg=`Hello, ${name}`;
  	console.log(msg);
}

sayHello('Mike');

```

```
//함수 작성
// 매개변수가 있는 함수

function sayHello(name){
	let msg=`Hello`;
  	if(name){
    	msg=`Hello, ${name}`;
    }
  	console.log(msg);
}

sayHello('Mike');

```

```
function sayHello(name){
	let msg=`Hello`;
  	if(name){
    	msg += ', ' + name;
    }
  	console.log(msg);
}

sayHello('Mike');
```

```
function sayHello(name){
	let msg=`Hello`;
  	if(name){
    	msg += ', ' + name;
    }
  	console.log(msg);
}

sayHello('Mike');
```

#### 전역 변수, 지역 변수

- 전역 변수(global varable)
- 지역 변수(local varable)

```
//전역 변수와 지역 변수

let msg="welcome"; //전역 변수
console.log(msg) //"welcome"

function sayHello(name){
	let msg="Hello" //지역 변수
    console.log(msg+ ' ' +name);
}

sayHello('Mike'); //"Hello Mike"
console.log(msg) //"welcome"

```

```
//OR

function sayHello(name){
	let newName = name || 'friend';
  	let msg = `Hello, ${newName}`
    console.log(msg)
}

sayHello();//"Hello, friend"
sayHello('Jane');//"Hello, Jane"
```

```
//default value

function sayHello(name = 'friend'){
	let msg = `Hello, ${name}`
    console.log(msg)
}

sayHello();
sayHello();
```

```
//return으로 값 변환

function add(num1, num2){
	return num1 + num2;
}

const result=add(2,3);
console.log(result)
```

#### 함수(function) tip

- 한번에 한 작업에 집중
- 읽기 쉽고 어떤 동작인지 알 수 있게 네이밍showError //에러를 보여줌getName // 이름을 얻어옴creatUserData //유저데이터 생성checkLogin //로그인 여부 체크

### 함수 표현식 화살표 함수

#### 함수 선언문 vs 함수 표현식

```
//함수 선언문

function sayHello(){
	console.log('Hello');
}
```

```
//함수 표현식
let sayHello = function(){
	console.log('Hello');
}
```

- 함수 선언문: 어디서든 호출 가능
- 함수 표현식: 코드에 도달하면 생성

#### 그래서 뭐가 더 좋음?

: 대부분의 상황에서는 어떻게 쓰든 상관 없음. 하지만 더 자유롭고 편하게 코딩할 수 있는건 함수 선언문.

#### 화살표 함수(arrow function)

```
showError();

function showError(){
	console.log('error');
}
```

```
let showError = () => {
	console.log("error");
}
```

### 객체 object

객체는 중괄호{}로 작성하고 key와 value로 구성된 프로퍼티가 들어간다. 프로퍼티는 쉼표로 구분한다.

#### Object -접근, 추가, 삭제

```
const superman={
	name:'clark',
  	age:33,
}

//접근
superman.name // 'clark'
superman['age']//33

//추가
superman.gender='male';
superman['hairColor']='black';

//삭제
delete superman.hairColor;
```

#### Object - 단축 프로퍼티

```
const name ='clark';
const age=33;

const superman={
	name, //name:name
  	age, //age:age
  	gender:'male',
}
```

#### Object - 프로퍼티 존재 여부 확인

```
const superman={
	name;'clark',
  	age:33,
}

superman.birthDay; //undefined

'birthDay'in superman; // false
'age' in superman; //true
```

#### for...in 반복문

```
//객체

const superman = {
	name:'clark',
  	age:30,
}

superman.hairColor='balck';
superman['hobby']='football';
delete superman.age;
console.log(superman)
```

```
function makeObject(name, age){
	return{
    	name,
      	age,
      	hobby: 'football'
    }
}

const Mike = makeObject("Mike",30);
console.log(Mike);

//객체 in
console.log("age" in Mike); //true
console.log("birthday" in Mike); //false
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
