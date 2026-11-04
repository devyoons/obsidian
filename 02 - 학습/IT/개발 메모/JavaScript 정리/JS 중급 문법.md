---
별칭:
  - "학습 - JS 중급 문법"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/3453b48743254a5db30be1cc755db5c5
---

# 학습: JS 중급 문법

## 세부 내용

### JavaScript

#### 1. variable, hoisting, TDZ

#### 변수의 생성 과정

1. 선언 단계 (delcaration)
2. 초기화 단계 (initialization): "undefined"를 할당해 주는 단계
3. 할당 단계 (assignment)

#### var, let, const

- `var`
    - 생성 과정
        - 선언 단계와 초기화 단계 ("undefined") 가 동시에 이루어짐
        - 선언을 먼저 하고 나중에 할당하는 것을 허용함 (그래서 나중에 값을 바꿀 수 있는 것)
    - 선언
        - 한 번 선언된 변수를 다시 선언할 수 있음
    - hoisting
        - hoisting됨
        - 선언문이 최상위로 끌여올려진 것처럼 동작하기 떄문에 선언하기 전에 사용할 수 있음
        - 단, 선언은 hoisting되지만 할당은 hoisting되지 않음
    - scope
        - function-scoped임 : 유일하게 벗어날 수 없는 scope가 함수 (for문에 지역 변수로 써도 전역 변수로 올려버림)
- `let`
    - 생성 과정
        - 선언 단계는 hoisting되지만 초기화 단계는 실제 code에 도달했을 때 이루어짐
        - 선언을 먼저 하고 나중에 할당하는 것을 허용함 (그래서 나중에 값을 바꿀 수 있는 것)
    - 한 번 선언된 변수를 다시 선언할 수 없음
    - hoisting
        - hoisting됨
        - 하지만 TDZ의 영향을 받아 할당하기 전에 사용할 수 없음
    - scope
        - block-scoped임e.g. 함수, if문, for문, while문, try/catch문 등
- `const`
    - 생성 과정
        - 선언 단계, 초기화 단계, 할당 단계가 한 번에 이루어져야 함
    - 선언
        - 한 번 선언된 변수를 다시 선언할 수 없음
    - hoisting
        - hoisting됨
        - 하지만 TDZ의 영향을 받아 할당하기 전에 사용할 수 없음
    - scope
        - block-scoped임e.g. 함수, if문, for문, while문, try/catch문 등

#### hoisting

scope 내부 어디서든 변수 선언이 최상위에 선언된 것처럼 행동한다.문제는 `var`, `let`, `const`의 scope가 다르다는 점이다.

#### TDZ (Temporal Dead Zone)

이 영역에 선언된 변수는 사용할 수 없다.할당하기 전에 사용할 수 없기 때문에 code가 예측이 가능하며, 잠재적인 bug를 줄일 수 있으므로 `let`과 `const`를 사용하는 것이 좋다.

---

#### 2. constructor function

함수명의 첫 글자를 대문자로 만든다.`new` 연산자로 호출한다.생성자 함수는 붕어빵 틀과 같으니 필요한 재료를 가지고 찍어내기만 하면 된다.생성자 함수를 사용하면 일일이 객체 literal을 만들지 않고 객체를 만들 수 있다.

```jsx
function User(name, age){
  // this = {} : new 함수명();이 실행되면 작동되는 code
  this.name = name;
  this.age = age;
  // return this; : new 함수명();이 실행되면 작동되는 code
}

new 함수명();
```

```jsx
function User(name, age){
  this.name = name;
  this.age = age;
  this.sayName = function () {
    console.log(this.name); // 여기에서 this는 vip를 가리킴
  }
}

let vip = new User("Mai", 40);
vip.sayName(); // "Mai"
```

```jsx
function Item(title, price) {
  // this = {}
  this.title = title;
  this.price = price;
  this.showPrice = function () {
    console.log(`가격은 ${price}원입니다 :)`);
  };
  // return this;
};

const item1 = new Item("공책", 3000);
const item2 = new Item("우산", 5000);
const item3 = new Item("가방", 7000);

console.log(item1, item2, item3);
// ⬇️ Output
// Item {title: "공책", price: 3000, showPrice: 𝒇}
// Item {title: "우산", price: 5000, showPrice: 𝒇}
// Item {title: "가방", price: 7000, showPrice: 𝒇}

item3.showPrice(); // "가격은 7000원입니다 :)"
```

---

#### 3. object methods, computed property

#### methods

- `Object.assign(A, B)`
    - A가 빈 값이라면 ('{}') B 객체를 A 이름으로 복제 (이 method를 쓰지 않고 단순히 '='으로 두 개가 같다고 하는 건 객체가 복제된 게 아니라 둘 다 하나의 객체를 보고 있는 것)
    - A가 빈 값이 아니면서 A와 B의 property가 겹치지 않으면 모든 property가 병합, 겹치면 A의 property는 삭제되고 B의 property로 덮어쓰기

```jsx
// 🎵
// (1)
const user = {
  name : "Mike",
  age : 30
}

const user2 = Object.assign({}, user); // user 객체가 user2의 이름으로 복제됨

Object.assign({ gender : "female" }, user); // : user 객체에 gender라는 property가 생김

// (2)
Object.assign({ name : "May", user }, user); // user 객체의 name property가 덮어쓰기 함 (name : "Mai")

// (3)
Object.assign(user, info1, info2); // info1이 먼저 user와 병합하고, 이것이 info2와 병합됨
```

- `Object.keys()` : 객체의 key를 배열로 반환
- `Object.values()` : 객체의 값을 배열로 반환
- `Object.entries()` : 객체의 key와 값을 모두 배열로 반환
- `Object.fromEntries()` : key와 값이 배열로 묶인 배열을 객체로 반환

```jsx
const user = {
    name: 'Mike'
}
const info1 = {
    age : 30
}
const info2 = {
    gender : 'mail'
}

console.log(Object.assign(user, info1, info2));
console.log(Object.keys(user));
console.log(Object.values(user));
console.log(Object.entries(user));

const arr  = [
    ['name', 'Mike'],
    ['age', 30],
    ['gender','male']
];
console.log(Object.fromEntries(arr));

// 결과
{ name: 'Mike', age: 30, gender: 'mail' }
[ 'name', 'age', 'gender' ]
[ 'Mike', 30, 'mail' ]
[ [ 'name', 'Mike' ], [ 'age', 30 ], [ 'gender', 'mail' ] ]
{ name: 'Mike', age: 30, gender: 'male' }
```

```jsx
// 🎵 어떤 게 key가 될지 모르는 상황에서 객체 만들 때 유용한 code
function makeObj(key, val) {
  return {
    [key]: val,
  };
}

const obj = makeObj('나이', 33);
console.log(obj); // { '나이': 33 }
```

#### computed property

property에 연산된 값이 사용될 수 있다.

```jsx
let a = "age"

const user = {
  name : "Mike",
  [a] : 30 // age : 30
}
```

```jsx
const user = {
  [4 + 7]: 'sum',
  ['Hi, ' + 'this is me']: 'Hello',
};

console.log(user); // { '11': 'sum', 'Hi, this is me': 'Hello' }
```

---

#### 4. symbol : 유일성 보장

key를 숫자나 boolean으로 적을 수 있으나, 결국 문자형으로 반환. 그래서 문자로 활용하면 된다.이 외에 key로 `Symbol()`을 쓸 수도 있다.

- `Symbol()`
    - 기존과 달리 'new'를 붙이지 않음
    - `Symbol()`은 유일한 식별자를 만들 때 사용함 그래서 이름이 같더라도 일치연산자나 동등연산자를 사용하면 같지 않다고 나옴
    - 전체 code 중 딱 하나이기 때문에 유일성이 보장됨
    - 특정 개체에 원본 data는 건드리지 않고 속성을 추가할 때 사용함 (property명이 겹치면 안 되니까)
    - 그러나 method를 쓰면 값으로 반환되지는 않음

```jsx
// 🎵
const a = Symbol();
const b = Symbol();

a === b; // false
a == b; // false

// 🎵 property key : 심볼형
const id = Symbol('id');
const user = {
	name : 'Mike',
	age : 30,
	[id] : 'myid'
}

// 🎵 symbol의 이름이 궁금하면 description 사용
const id = symbol("id입니다.");
id.description; // "id입니다."
```

- `Symbol.for()` : 전역 symbol
    - 하나의 symbol만 보장받을 수 있음.
    - 없으면 만들고 있으면 가져옴
    - `Symbol()`은 매번 다른 `Symbol()`을 생성하지만,
    - `Symbol.for()`는 하나를 생성한 뒤 key를 통해 같은 symbol을 공유

```jsx
// 🎵
const id1 = Symbol.for("id");
const id2 = Symbol.for("id");

id1 === id2; /// true

// 🎵 symbol의 이름이 궁금하면 keyfor 사용
Symbol.keyFor("id1") // "id"
```

```jsx
// 🎵 멀리 떨어져있는 객체에 showName이라는 method가 있는지 고민하지 않아도 되고, 다른 사람이 만든 property를 덮어쓰기할 걱정도 할 필요 없이 작업할 수 있는 code

// 다른 개발자가 만들어 놓은 객체
const user = {
  name: 'Mai',
  age: 30,
};

// 내 작업
// user.showName = function () {}; 이렇게 하지 말고
const showName = Symbol('show name');
user[showName] = function () {
  console.log(this.name);
};

// 사용자가 접속하면 보는 message
for (let key in user) {
  console.log(`Her ${key} is ${user[key]}.`);
}
// ⬇️ Output
// "Her name is Mai."
// "Her age is 30."

// 내가 궁금해했던 showName도 적어보면
user[showName](); // "Mai"
```

---

#### 5. numbers / math methods

- `toString()`
    - `()` 안에 아무것도 쓰지 않으면 숫자를 문자로 바꾸어 줌`()` 안에 2를 쓰면 2진법으로, 8을 쓰면 8진법으로, 16을 쓰면 16진법으로 바꾸어 줌
- `Math.PI` : 3.141592653589793
- `Math.ceil()` : 올림
- `Math.floor()` : 내림
- `Math.round()` : 반올림※ 소수점 자리수 끊기

```jsx
// 🎵 아래의 숫자를 소수점 둘째 자리까지 표현하기 (셋째 자리에서 반올림)
let userRate = 30.1234;

// (1) 100 곱한 값에 Math.round method를 쓰고 다시 100으로 나누기
Math.round(userRate * 100) / 100 // 30.12

// (2) toFixed() 사용
userRate.toFixed(2); // "30.12"
Number(userRate.toFixed(2)) // 30.12
```

- `toFixed()` : `()` 안에 쓴 숫자까지 표현 (단, 문자로 반환하므로 주의)

```jsx
let userRate = 30.1234;

userRate.toFixed(0); // "30"
userRate.toFixed(6); // "30.123400"
```

- `isNaN()` : 숫자인지 아닌지 판단할 때 사용함 (그냥 NaN이 아니라 `isNaN()`으로 사용해야 함)

```jsx
x == NaN // false
x === NaN // false
NaN == NaN // false

isNaN(x) // true
isNan(3) // false
```

- `parseInt()`
    - 문자열을 숫자로 바꿔주는 건 `Number()`와 동일하나 `parseInt()`는 문자도 일부 처리함 (`Number()`에 문자를 넣으면 'NaN'임) (단, `parseInt()`도 숫자로 시작하지 않으면 'NaN'을 반환함)
    - 소수점은 무시함
    - comma 뒤에 몇 진수로 바꿀지 적어주면 문자로 시작해도 'NaN'를 반환하지 않음

```jsx
let margin = "10px";
parseInt(margin); // 10
Number(margin); // NaN

let redColor = "f3";
parseInt(redColor); // NaN
parseInt(redColor, 16); // 243

parseInt(11, 2) // 3
```

- `parseFloat()` : `parseInt()`와 거의 동일하지만 부동 소수점 자리도 반환함

```jsx
let padding = "18.5%";
parseInt(padding); // 18
parseFloat(padding); // 18.5
```

- `Math.random()` : 0 ~ 1 무작위 숫자 생성

```jsx
// 🎵 1 ~ 100 중 임의의 숫자 뽑기

Math.floor(Math.random() * 100) + 1
// 🎵 무작위 수 뽑기
// 그 수에 100 곱하기 (1 ~ 50 중 임의의 숫자를 뽑고 싶다면 50 곱하기)
// Math.floor로 소수점 없애기
// 이때 0이 나올 수 있으므로 1 더하기
```

🧐❓ 그럼 `Math.ceil()`을 써서 끝을 '+1'이 아닌 '-1'을 해 줘도 되는 거겠지? 🧐

- `Math.max()` : 최대값
- `Math.min()` : 최소값
- `Math.abs()` : 절대값
- `Math.pow(n, m)` : 거듭제곱

```jsx
// 🎵 2⁴ 구하기
Math.pow(2, 4); // 16
```

- `Math.sqrt(n, m)` : 제곱근

```
// 🎵 √16 구하기
Math.sqrt(16); // 4
```

---

#### 6. string methods

**1) 따옴표**HTML엔 class명 등 큰따옴표로 감싸져있는 내용이 있으므로 작은따옴표를 사용하는 게 편하다.영어로 된 문장은 apostrophe가 있으므로 큰 따옴표로 감싸는 게 편하다.

**2) backtick**backtick 여러 줄을 쓸 수 있지만 따옴표는 한 줄로만 써야 한다. (`\n` 사용)

**3) methods**

- `length`
    - 문자열의 길이를 알 수 있음 (특수문자와 공백을 포함함)
    - 0부터 셈

```jsx
let hi = "안녕하세요.";

hi.length // 6
```

- 배열과 동일하게 대괄호 안에 숫자를 넣어 특정 위치에 접근할 수 있음 (그렇다고 문자를 바꿀 수 있는 건 아님)
    - 0부터 셈

```jsx
hi[2] // "하"
```

- `toUpperCase()` : alphabet을 모두 대문자로 변경함
- `toLowerCase()` : alphabet을 모두 소문자로 변경함
- `str.indexOf(text)`
    - text를 문자로 받아 몇 번째에 위치하는지 반환함 (특수문자와 공백을 포함함)
    - 없으면 '-1'을 반환함
    - text가 여러 개 포함되어 있어도 첫 번째 위치만 반환함
    - 0부터 셈 (`if`문 쓸 때 주의)

```
let hi = "Hi, guys. Nice to meet you.";

if (hi.indexOf("Hi")) {
  console.log("위 결과가 0이고, 0은 if문에서 false이기 때문에 이 문장이 찍히지 않음");
}

// ↓

if (hi.indexOf("Hi")) > -1 {
  console.log("위 결과가 true여서 이 문장을 볼 수 있음");
}
```

- `str.slice(n, m)`
    - n부터 m까지의 문자를 반환
    - n은 시작점, m은 도착점인데, m 번째를 포함하지는 않음 (그 전까지 셈)
    - m이 없으면 문자열 끝까지 반환
    - 음수면 끝에서부터 셈

```
let desc = "abcdefg";

desc.slice(2) // "cdefg"
desc.slice(0, 5) // "abcde"
desc.slice(2, -2) // "cde"
```

- `str.substring(n, m)`
    - `str.slice(n, m)`과 비슷하지만 n과 m을 바꿔도 동작함
    - 음수는 인식하지 않아서 0으로 받아들임
- `str.substr(n, m)` : n부터 시작해 m개를 반환하며 m 번째를 포함하지는 않고 그 전까지 셈)
- `str.trim()`
    - 앞 뒤 공백을 제거
    - 사용자로부터 값을 입력받을 때 자주 사용
- `str.repeat(n)` : 문자열을 n번 반복함
- `str.slice(n, m)`
- `str.includes()` : 순서에 상관 없이 괄호 안의 문자가 포함되어 있는지 확인

**4) 문자열 비교**ASCII 표대로 비교할 수 있다.a < z, 소문자 < 대문자

```
"a" < "c" // true
"a".codePointAt(0); // 97
String.fromCodePoint(97) // "a"
```

문자열에 쓸 수 있는 methods를 이용해 풀어보기

```
// 🎵 list에서 숫자를 제외하고 문자만 newList에 반환하기
let list = [
  "01. 들어가며",
  "02. JS의 역사",
  "03. 자료형",
  "04. 함수",
  "05. 배열"
  ];

let newList = [];

for (let i = 0 ; i < list.length ; i++) {
  newList.push(list[i].slice(4));
}

console.log(newList); // ["들어가며","JS의 역사","자료형","함수","배열"]
```

```
// 🎵 hasCola의 매개 변수에 금칙어인 '콜라'가 포함되어 있는지 확인하기
// (1)
function hasCola(str) {
  if (str.indexOf("콜라")) {
    console.log("금칙어 있음");
  } else {
    console.log("통과");
  }
}
hasCola("사이다가 짱이지"); // if문에서 -1은 true이기 때문에 결과가 "금칙어 있음"
hasCola("사이다 지지 콜라 짱"); //
hasCola("콜라"); // if문에서 0은 false이기 때문에 if에 못 들어가고 else로 나가져서 "통과"

// ↓ 바꿔주면

// (2)
function hasCola(str) {
  if (str.indexOf("콜라") > -1) {
    console.log("금칙어 있음");
  } else {
    console.log("통과");
  }
}
hasCola("사이다가 짱이지"); // "통과"
hasCola("사이다 지지 콜라 짱"); // "통과"
hasCola("콜라"); // "금칙어 있음"

// (3)
function hasCola(str) {
  if (str.includes("콜라")) {
    console.log("금칙어 있음")
  } else {
    console.log("통과");
  }
}
hasCola("사이다가 짱이지"); // "통과"
hasCola("사이다 지지 콜라 짱"); // "금칙어 있음"
hasCola("콜라"); // "금칙어 있음"
```

---

#### 7. array methods 01

1) 복습

- `push()` 뒤에 삽입, `pop()` 뒤를 삭제, `unshift()` 앞에 삭제, `shift()` 앞을 삭제

2) 그 외 methods

- `arr.splice(n, m)` : n ~ m의 요소를 지움 (m 번째를 포함하지는 않음 (그 전까지 셈))
- `arr.splice(n, m, x)` : n ~ m의 요소를 지우고 x를 추가함

```
// 🎵
// (1)
let arr = [1, 2, 3, 4, 5];
arr.splice(1, 3, 100, 200); // index 1부터 3까지는 지우고 그 자리에 100과 200을 삽입
console.log(arr); // [1, 100, 200, 5]

// (2) 두 번째 인수에 0을 넣으면 아무것도 삭제되지 않고 추가되기만 함
let arr = ["나는", "이국종", "입니다."];

arr.splice(1, 0, "대한민국", "의사");
console.log(arr); // ["나는","대한민국","의사","이국종","입니다."]
```

- `arr.splice()` : 삭제된 요소를 반환함

```
let arr = [1, 2, 3, 4, 5];
let result = arr.splice(1, 2);

console.log(arr); // [1, 4, 5]
console.log(result); // [2, 3]
```

- `arr.slice(n, m)`
    - n ~ m의 요소를 반환 (m 번째를 포함하지는 않음 (그 전까지 셈))
    - m을 쓰지 않으면 배열 끝까지 반환함
    - 괄호 안에 아무것도 적지 않으면 배열이 복사됨

```
let arr = [1, 2, 3, 4, 5];
arr.slice(1, 4); // 2, 3, 4
```

- `arr.concat(arr2, arr3 ...)` : 인자로 주어진 배열이나 값을 합쳐서 새 배열로 반환함

```
let arr = [1, 2];
arr.contact([3, 4]); // [1, 2, 3, 4]
arr.contact([3, 4], [5, 6]); // [1, 2, 3, 4, 5, 6]
arr.contact([3, 4], 5, 6); // [1, 2, 3, 4, 5, 6]
```

- `arr.forEach(𝑓)`
    - `for`문이나 `for ... of`문 외에 `forEach`로도 반복할 수 있음
    - 𝑓에 세 개의 매개변수가 있음① 해당 요소② 해당 요소의 index③ 해당 배열 자체 (사용 빈도 낮음)

```
let arr = ["Ian", "Mai", "H & C"];

arr.forEach((name, index) => { // index는 생략해도 됨
  console.log(`${index + 1}. ${name}`);
});
```

- `arr.indexOf`
    - 첫 번째로 발견한 문자열의 index를 반환함 (없으면 '-1'을 반환함)
    - 인수가 두 개일 때 두 번째 인수는 찾기 시작하는 위치임 (index가 거기서부터라는 말은 아님)

```
let arr = [1, 2, 3, 4, 5, 1, 2, 3];

arr.indexOf(3); // 2
arr.indexOf(3, 3) // 7
arr.lastIndexOf(3) // 7
```

- `arr.lastIndexOf()` : 마지막으로 발견한 문자열의 index를 반환함 (없으면 '-1'을 반환함)
- `arr.includes()` : index 없이 포함하는지만 확인하고 싶을 때 사용 (true or false)
- `arr.find(𝑓)`
    - 찾는다는 의미는 동일하지만 조금 더 복잡한 연산을 할 수 있음
    - 첫 번째 true만 반환하고 끝나므로 주의해야 함
    - 없으면 undefined를 반환함

```
let arr = [1, 2, 3, 4, 5, 6];
const result = arr.find((item) => {
  return item % 2 === 0;
});

console.log(result); // 2 (4와 6은 반환하지 않음)
```

```
// 🎵 미성년자인 user 반환하기
let userList = [
  { name : "Mai", age: 37 },
  { name : "Ian", age: 38 },
  { name : "H & C", age: 7 }
];

const result = userList.find((user) => {
  if (user.age < 19) {
    return true;
  }
  return false;
});
console.log(result); // {"name": "H & C", "age": 7}
```

- `arr.findIndex(𝑓)`
    - 찾는다는 의미는 동일하지만 조금 더 복잡한 연산을 할 수 있음
    - 있으면 index를 반환하고, 없으면 -1을 반환함
    - 첫 번째 true만 반환하고 끝나므로 주의해야 함

```
// 🎵 미성년자인 user의 index 반환하기
let userList = [
  { name : "Mai", age: 37 },
  { name : "Ian", age: 38 },
  { name : "H & C", age: 7 }
];

const result = userList.findIndex((user) => {
  if (user.age < 19) {
    return true;
  }
  return false;
});
console.log(result); // 2
```

- `arr.filter(𝑓)`
    - 조건을 만족하는 모든 요소를 반환함
    - 사용법은 `arr.find(𝑓)`와 동일함

```
const arr = [1, 2, 3, 4, 5, 6];

const result = arr.filter((item) => {
  return item % 2 === 0;
});

console.log(result); // [2, 4, 6]
```

🧐❓ `find`는 숫자로 반환되더니 `filter`는 배열로 반환되네...? 같은 array methods인데... 2와 [2]는 같지 않은데... 헷갈리게! 이렇게 정한 이유가 있을 텐데 그게 뭔지 모르겠다ㅠㅠ 🧐

- `arr.reverse()` : 역순으로 재정렬함 (최근에 가입한 user 순으로 정렬할 때, 최근에 작성된 글 순으로 정렬할 때 자주 쓰임)
- `arr.map(𝑓)` : 함수를 받아 특정 기능을 시행하고 새로운 배열을 반환함

```
let userList = [
  { name : "Mai", age: 37 },
  { name : "Ian", age: 38 },
  { name : "H & C", age: 7 }
];

let newUserList = userList.map((user, index) => {
  return Object.assign({}, user, {
    id : index + 1,
    isAdult : user.age > 19,
  });
});

console.log(newUserList);
```

- `arr.join()`
    - 배열을 합쳐서 문자열로 반들 때 사용함
    - 인수로 구분자를 받음

```
let arr = ["안녕", "나는", "메이호야"];
let result = arr.join("❤︎");
console.log(result); // "안녕❤︎나는❤︎메이호야"
```

- `arr.split()` : 문자열을 나눠서 배열로 만들어줌

```
// (1)
const users = "Mai, Ian, H & C";
const result = users.split(",");
console.log(result); // ["Mai"," Ian"," H & C"]

// (2)
let str = "Hello, this is KARI.";
const result = str.split("");
console.log(result); // ["H","e","l","l","o",","," ","t","h","i","s"," ","i","s"," ","K","A","R","I","."]
```

- `Array.isArray()`
    - 배열인지 아닌지 판단할 때 사용함
    - JavaScript는 배열을 객체라고 판단하기 때문에 배열과 객체에 `typeof`를 적용하면 모두객체라고 반환하므로 배열인지 아닌지 알고 싶을 때 사용하면 됨

```
let me = {
  name : "Mai",
  age : 31
};

let us = ["Mai", "Ian", "H & C"];

console.log(typeof me); // "object"
console.log(typeof us); // "object"

console.log(Array.isArray(me)); // false
console.log(Array.isArray(us)); // true
```

---

#### 8. array methods 02 - sort, reduce

- `arr.sort(𝑓)`
    - 배열을 재정렬함 (배열 자체가 변경되므로 주의)
    - 함수를 인수로 받음

```
// 🎵 '27, 8, 5, 13'을 오름차순으로 정렬하기
let arr = [27, 8 , 5, 13];

arr.sort();
console.log(arr); // [13, 27, 5, 8] : 앞자리가 1, 2여서 13과 27이 앞에 옴

// ↓

// (1) 함수를 arr 외부에 작성
let arr [27, 8, 5, 13];

function fn(a, b) {
  return a-b; // 'a-b'가 양수면 a가 b 뒤에, 0이면 그대로, 음수면 a가 b 앞에 오도록 정렬하기 위해 필요하 함수
}

arr.sort(fn);
console.log(arr); // [5, 8, 13, 27]

// (2) 함수를 arr 내부에 작성
let arr [27, 8, 5, 13];

arr.sort((a-b) => {
  // 여기에 'console.log'를 찍어보면 배열의 요소들이 두 수씩 묶여 있음 (앞 숫자가 a, 뒤 숫자가 b)
  return a-b;
});
console.log // [5, 8, 13, 27]

// (3) Lodash 활용
// '<script src="lodash.js"></script>' 작성하고 써야 함

let arr = [27, 8 , 5, 13];

_.sortBy(arr);
console.log(arr);// [5, 8, 13, 27]
```

- arr.reduce(𝑓)
    - (누적 계산 값, 현재 값) => { return 계산 값 };
    - 함수를 인수로 받음
    - `arr.map(𝑓)`이나 `arr.filter(𝑓)` 대신 써서 배열을 반환할 수 있음

```
// 🎵 배열의 모든 수 합치기
let arr = [1, 2, 3, 4, 5];

const result = arr.reduce((prev, crr) => {
  return prev + crr;
}, 0); // 여기에서 '0'은 초기값인데, 원하는 것을로 바꾸어도 됨 e.g. 100, [] 등
console.log(result); // 15

// 🎵 성인의 이름만 도출하기
let userList = [
  { name : "Ian", age: 45 },
  { name : "Mai", age: 44 },
  { name : "H", age: 18 },
  { name : "C", age: 16 }
];

let result = userList.reduce((prev, cur) => {
  if (cur.age > 18) {
    prev.push(cur.name);
  }
  return prev;
}, []);
console.log(result); // ["Ian","Mai"]

// 🎵 사용자의 나이의 합 구하기
let userList = [
  { name : "Ian", age: 45 },
  { name : "Mai", age: 44 },
  { name : "H", age: 18 },
  { name : "C", age: 16 }
];

let result = userList.reduce((prev, cur) => {
  return (prev += cur.age);
}, 0);
console.log(result); // 123

// 🎵 이름의 길이가 세 글자인 사람 구하기
let userList = [
  { name : "Ian", age: 45 },
  { name : "Mai", age: 44 },
  { name : "H", age: 18 },
  { name : "C", age: 16 }
];

let result = userList.reduce((prev, cur) => {
  if (cur.name.length === 3) {
    prev.push(cur.name);
  } return prev;
}, []);
console.log(result); // ["Ian","Mai"]
```

cf. `arr.reduceRight()` 도 `arr.reduce`와 비슷하나 배열의 끝에서부터 시작됨

---

#### 9. 구조 분해 할당 estructuring assignment

- 정의
    - 구조 분해 할당 구문은 배열이나 객체의 속성을 분해해서 그 값을 변수에 담을 수 있게 하는 표현식
- 배열 구조 분해

```jsx
let str = "Ian - Mai - H - C";
let [user1, user2, user3, user4] = str.split(" - ");
console.log(user1); // "Ian"
console.log(user2); // "Mai"
console.log(user3); // "H"
console.log(user4); // "C"
```

- 기본 값
    - 기본 값이 없으면 값이 없을 때 'undefined'를 반환하므로 기본 값을 넣어주면 오류를 줄일 수 있음

```jsx
let [a, b, c] = [1, 2];
console.log(a); // 1
console.log(b); // 2
console.log(c); // undefined

// ↓

let [a=3, b=4, c=5] = [1, 2];
console.log(a); // 1
console.log(b); // 2
console.log(c); // 5
```

- 공백과 comma를 이용한 반환 값 무시

```jsx
let [user1, , user2, user3, user4] = ["Ian", "Mai", "H", "C"];
console.log(user1); // "Ian"
console.log(user2); // "Mai"
console.log(user3); // "H"
console.log(user4); // "C"
```

- 객체 구조 분해

```jsx
let user = {name: "Mai", age: 30};
let {name, age} = user; // 'let {age, name} = user;'라고 순서를 바꿔도 'let name = user.name, let age = user.age'인 것에 변함 없음
console.log(name); // "Mai"
console.log(age); // 30
```

- key 변경 가능

```jsx
let user = {name: "Mai", age: 30};
let {name:userName, age:userAge} = user;
console.log(userName); // "Mai"
console.log(userAge); // 30
```

- 기본 값
    - 기본 값이 없으면 값이 없을 때 'undefined'를 반환하므로 기본 값을 넣어주면 오류를 줄일 수 있음
    - 결과가 'undefined'일 때만 기본 값이 사용되므로 이미 객체에 값이 있다면 기본 값은 무시됨

```jsx
let user = {name: "Mai", age: 30};
let {name, age, gender} = user;
console.log(name); // "Mai"
console.log(age); // 30
console.log(gender); // undefined

// ↓

let user = {name: "Mai", age: 30};
let {name, age, gender = "gender"} = user;
console.log(name); // "Mai"
console.log(age); // 30
console.log(gender); // "gender"
```

---

#### 10. 나머지 매개변수, 전개구문 : rest parameters, spread syntax

- arguments를 사용해도 되나 ES6에선 나머지 매개변수를 사용할 것을 권장함
    - 나머지 매개변수는 정해지지 않은 개수의 인수를 배열로 나타냄
    - arguments와 달리 배열 methods를 사용할 수 있음
    - 나머지 매개변수를 항상 마지막에 있어야 함

```jsx
function showName(...names){
  console.log(names);
}

showName(); // []
showName("Ian"); // ["Ian"]
showName("Ian, Mai"); // ["Ian", "Mai"]

// 🎵 전달 받은 수 모두 더하기 (1)
function add(...numbers) {
  let result = 0; // 초기 값은 0
  numbers.forEach((num) => (result += num));
  console.log(result);
}

add(1, 2, 3); // 6
add(1, 2, 3, 4, 5, 6, 7, 8, 9, 10); // 55

// 🎵 전달 받은 수 모두 더하기 (2)
function add(...numbers) {
  let result = numbers.reduce((prev, cur) => prev + cur);
  console.log(result);
}

add(1, 2, 3); // 6
add(1, 2, 3, 4, 5, 6, 7, 8, 9, 10); // 55

// 🎵 user 객체를 만들어 주는 생성자 함수 만들기
function User(name, age, ...skills) {
  this.name = name;
  this.age = age;
  this.skills = skills;
}

const user1 = new User("Ian", 30, "TS", "React");
const user2 = new User("Mai", 29, "Three", "React");
const user3 = new User("H", 16, "English");
const user4 = new User("C", 14, "French");
console.log(user1);
console.log(user2);
console.log(user3);
console.log(user4);
```

- 전개 구문
    - `arr.push()`, `arr.splice()`, `arr.concat()` 이런 method를 사용하면 번거로운데 전개 구문을 사용하면 쉬움
    - 객체에서도 `Object.assign` 쓸 필요 없음

```jsx
let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

let result = [...arr1, ...arr2]; // '...arr1' = 1, 2, 3이고 '...arr2' = 4, 5, 6
console.log(result); // [1, 2, 3, 4, 5, ,6]

// 🎵 arr1을 [4, 5, 6, 1, 2, 3]으로 만들기
// (1)
let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

arr2.reverse().forEach((num) => {
  arr1.unshift(num);
});
console.log(arr1);

// (2)
let arr1 = [1, 2, 3];
let arr2 = [4, 5, 6];

arr1 = [...arr2, ...arr1];
console.log(arr1);

// 🎵 fe와 lang을 skills로 하여 객체 만들기
// (1)
let user = { name: "Mai"};
let info = { age: 30 };
let fe = ["Three", "React"];
let lang = ["Korean", "English"];

user = Object.assign({}, user, info, {
  skills: [],
});

fe.forEach((item) => {
  user.skills.push(item);
});
lang.forEach((item) => {
  user.skills.push(item);
});
console.log(user);

// (2)
let user = { name: "Mai"};
let info = { age: 30 };
let fe = ["Three", "React"];
let lang = ["Korean", "English"];

user = {
  ...user,
  ...info,
  skills : [
  ...fe, ...lang],
};
console.log(user);
```

---

#### 11. closure

※ 변수, hoisting, 함수 선언문의 특징에 대한 선행 학습 필요

- 정의
    - 함수와 어휘적 환경 (lexical environment) 의 조합 (JS는 어휘적 환경임)
    - 함수가 생성될 당시의 외부 변수를 기억하며, 생성된 이후에도 계속해서 그 변수에 접근할 수 있음 (외부 함수의 실행이 끝나서 외부 함수가 소멸된 이후에도 내부 함수가 외부 함수에 접근할 수 있음)

🧐❓ 오... 어렵다.. 다시 봐야겠다... 🧐

```jsx
function makeCounter() {
  let num = 0; // 2️⃣ 그 숫자는 외부 함수의 변수임, 5️⃣ '은닉화'에 성공한 것 (오직 counter를 증가시키고 반환받을 수만 있음)

  return function () {
    return num++;
  };
}

let counter = makeCounter(); // 1️⃣ counter에 makeCounter가 return하는 함수인 function () { return num++; };을 넣음, 이 함수는 숫자를 반환하는데 4️⃣ 이렇게 counter가 생성된 이후에 계속 기억하고 있기 때문에 0, 1, 2, 이렇게 증가할 수 있는 것임
console.log(counter()); // 0 3️⃣ 초기 값인 0 이후에 1씩 더해지는 건 내부 함수에서 (return num++) 외부 함수인 makeCounter() { let num = 0; 즉 외부 함수의 num에 접근하는 것
console.log(counter()); // 1
console.log(counter()); // 2
```

---

#### 12. scheduling functions - setTimeout, setInterval

- 공통 특징
    - 현재 실행 중인 script가 종료된 후 scheduling 함수를 실행함
    - brower는 기본적으로 4ms 정도의 대기 시간이 있어서 time이 0이어도 바로 실행되지 않을 수 있음
- `setTimeout(𝑓, time);`
    - 일정 시간이 지난 후 함수를 실행
    - 인수가 필요하면 'time' 뒤에 기재

```jsx
// 🎵 함수를 3초 후에 실행하기
function fn() {
  console.log(3)
}

setTimeout(fn, 3000); // 3000는 3초임

// ↓ 이렇게 적어도 됨
setTimeout(function() {
  console.log(3)
}, 3000);

// 🎵 인수 추가하기
function showName(name) {
  console.log(name);
}

setTimeout(showName, 3000, "Mai"); // 순서대로 함수, 시간, 인수이며 이 인수는 showName 함수의 첫 번째 인수 (name) 로 전달됨
```

- `clearTimeout(tId)` : 예정된 작업을 없앰

```jsx
// 🎵 showName 함수 실행하지 않기
const tId = function showName(name) {
  console.log(name);
  clearTimeout(tId);
}

setTimeout(showName, 3000, "Mai");
```

🧐❓ mozilla를 보니 cancel property같은 곳에 사용하는 듯함 🧐

- `setInterval`
    - 일정 시간 간격으로 함수를 반복
    - `setTimeout`과 사용 방법 동일
    - 반복을 중단하려면 `clearInterval(tId)`를 사용하면 됨

```jsx
// 🎵 3초마다 Mai 나오게 하기
function showName(name) {
  console.log(name);
}

const tId = setInterval(showName, 3000, "Mai");

// 🎵 사용자가 접속한 지 얼마나 지났는지 1초에 한 번씩 5초 동안 불러오기
let num = 0;

function showTime() {
  console.log(`접속한 지 ${num++}초가 지났습니다.`);
  if (num > 5) {
    clearInterval(tId);
  }
}

const tId = setInterval(showTime, 1000);
```

---

#### 13. this 값을 바꾸는 함수들 - call, apply, bind

JS에서는 함수를 어디에서 어떻게 호출했는지와 상관 없이 `this`가 무엇인지 지정할 수 있다.

- `call`
    - 모든 함수에서 사용할 수 있으며, `this`를 특정 값으로 지정할 수 있음
    - 차례대로 매개변수에 들어가야 함

```jsx
// 🎵 이름 불러오기
const mai = {
  name : "Mai",
};

const ian = {
  name : "Ian",
};

function showThisName() {
  console.log(this.name);
}

showThisName(); // (빈 값) : 여기에서 this는 window를 가리키는데, window.name은 빈 값이라서 아무것도 뜨지 않음
showThisName.call(mai) // Mai : 이때, 함수를 호출하면서 call을 사용하고 this로 사용할 객체인 mai를 전달하면 해당 함수가 주어진 객체의 method인 것처럼 사용할 수 있음. call의 첫 번째 매개변수는 this로 사용할 값이고, 매개변수가 더 있으면 그 매개변수로 호출하는 함수로 전달됨 (this가 mai가 된 것)
showThisName.call(ian) // Ian : this가 ian이 됨

// 🎵 이름에 주소와 직업 추가하기
const mai = {
  name : "Mai",
};

const ian = {
  name : "Ian",
};

function update(address, occupation) { // update는 address와 occupation을 받아서 객체 정보를 새로운 date로 update해줌
  this.address = address;
  this.occupation = occupation;
};

update.call(mai, "Swiss", "professor"); // 첫 번째 매개변수는 this로 사용될 값, 두 번째와 세 번째는 함수가 사용할 매개변수를 순서대로 기재한 것
console.log(mai);

update.call(ian, "Italy", "photographer");
console.log(ian);
```

- `apply`
    - 함수 매개변수를 처리하는 방법을 제외하면 `call`과 동일함
    - `call`은 일반적인 함수와 마찬가지로 매개변수를 받지만, `apply`는 매개변수를 배열로 받음
    - `apply`는 배열 요소를 함수의 매개변수로 사용할 때 용이함
    - 두 번째 매개변수로 배열을 전달하면 차례대로 그 배열의 요소들을 인수로 사용함

```jsx
// 🎵 위와 동일한 값을 얻되 call이 아닌 apply 사용하기
const mai = {
  name : "Mai",
};

const ian = {
  name : "Ian",
};

function update(address, occupation) {
  this.address = address;
  this.occupation = occupation;
};

update.call(mai, ["Swiss", "professor"]); // 배열로 적어야 함
console.log(mai);

update.call(ian, ["Italy", "photographer"]); // 배열로 적어야 함
console.log(ian);

// 🎵 다음 수의 최소값과 최대값 구하기
const nums = [3, 10, 1, 6, 4];

// (1)
const minNum = Math.min(...nums);
const maxNum = Math.max(...nums);

// (2)
const minNum = Math.min.call(null, ...nums);
const maxNum = Math.max.call(null, ...nums);
//  = Math.max.apply(null, [3, 10, 1, 6, 4])

// (3)
const minNum = Math.min.apply(null, nums);
const maxNum = Math.max.apply(null, nums);
//  = Math.max.call(null, 3, 10, 1, 6, 4)

console.log(minNum);
console.log(maxNum);
```

- `bind` : 함수의 this 값을 영구히 바꿀 수 있음

```jsx
// 🎵 "hello, Mai" 도출하기
const user = {
  name: "Mai",
  showName: function () {
    console.log(`hello, ${this.name}`);
  },
};

// (1)
user.showName(); // "hello, Mai"

let fn = user.showName;
fn(); // 반면 이렇게 하면 "hello, "만 나오는데 그 이유는 method는 점 앞에 있는 게 this인데 위에서 (let fn = ) fn을 할당할 때 this를 잃어버렸고 호출할 때 fn()만 호출하니까 this가 없는 것

//(2)
fn.call(user); // "hello, Mai"

// (3)
fn.apply(user); // "hello, Mai"

// (4)
let boundFn = fn.bind(user);

boundFn(); // "hello, Mai"
```

🧐❓ 왜 그냥 `fn.bind(user);`는 안 되지? 🧐

---

#### 14. 상속, prototype

![](https://velog.velcdn.com/images%2Fmaimade%2Fpost%2F857ef711-2f97-4a57-bc2c-986856f8928b%2F%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-02-28%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%204.20.48.png)

[출처 : 자바스크립트 중급 강좌 #14 상속, 프로토타입(Prototype)](https://youtu.be/ddJcDZHBRm0?t=204)

```jsx
// 🎵 for ... in으로 객체의 property 순회하기
const car = {
  wheels: 4,
  drive() {
    console.log("drive..");
  },
};

const bmw = {
  color: "red",
  navigation: 1,
};

bmw.__proto__ = car; // bmw 변수에는 없지만 car에 있는 wheels와 drive 정보도 bmw가 갖게 됨

const x5 = {
  color: "white",
  name: "x5",
};

x5.__proto__ = bmw;

for(p in x5) {
  console.log(p);
}
// ⬇️ Output
// "color"
// "name"
// "navigation"
// "wheels"
// "drive"

// 하지만 key, value 등 객체 관련 method는 상속된 property는 안 나옴
Object.keys(x5); // ["color", "name"]
Object.values(x5); // ["white", "x5"]

// 🎵 for ... in으로 객체의 property 유무 확인하기
for (p in x5) {
  if (x5.hasOwnProperty(p)) {
    console.log("o", p);
  } else {
    console.log("x", p);
  }
}
// ⬇️ Output
// "o" "color"
// "o" "name"
// "x" "navigation"
// "x" "wheels"
// "x" "drive"

// 🎵 비슷한 객체를 간단하게 만들 수 있는 생성자 함수와 사용하기
const car = {
  wheels: 4.
  drive() {
    console.log("drive..");
  },
};

const Bmw = function (color) {
  this.color = color;
};

const x5 = new Bmw("red");
const z4 = new Bmw("blue");

x5.__proto__ = car;
z4.__proto__ = car;

// ↓ 같은 동작인데 일일이 '__proto__' 안 써도 되게 code 변경

const Bmw = function (color) {
  this.color = color;
};

Bmw.prototype.wheels = 4;
Bmw.prototype.drive = function () {
  console.log("drive..");
};

const x5 = new Bmw("red");
const z4 = new Bmw("blue");
```

- `instanceof`
    - 생성자 함수가 새로운 객체를 만들 때 그 객체는 생성자의 instance라고 불리는데, 이를 확인할 수 있는 연산자임
    - 객체와 생성자를 비교하고, 객체가 그 생성자로부터 생성된 것인지 확인할 수 있음

```
const Bmw = function (color) {
  this.color = color;
};

Bmw.prototype.wheels = 4;
Bmw.prototype.drive = function () {
  console.log("drive..");
};

const x5 = new Bmw("red");
const z4 = new Bmw("blue");

z4 instanceof Bmw // true
z4.constructor === Bmw // true : 생성자로 만들어진 instance 객체에는 constructor라는 property가 존재함

// ↓ 같은 동작인데 한 번에 쓰도록 code를 변경...할 수 있으나 이렇게 덮어쓰기 하면 constructor가 사라짐. 그래서 위와 같이 쓰든지, 아니면 따로 constructor를 적어주어야 함. 즉 JS는 constructor를 명확하게 보장하지 않아서 개발자에 의해 언제든 수정될 수 있음.

Bmw.prototype = {
  constructor: Bmw, // 추가로 적은 것
  wheels: 4,
  drive() {
    console.log("drive..");
  },
};
```

```
// 🎵 closure를 사용해 초기에 설정한 color 값을 받을 수만 있고 변경은 못 하게 하기
const Bmw = function (color) {
  this.color = color;
};

const x5 = new Bmw("red");
// 위 code는 x5.color = "black" 등으로 color를 바꿀 수 있음

// ↓ closure를 써서 변경하면

const Bmw = function (color) {
  const c = color;
  this.getColor = function () {
    console.log(c);
  };
};

const x5 = new Bmw("red"); //getColor 함수가 생성될 당시의 context 기억하고 있음
```

---

#### 15. class

- `class`
    - 생성자 함수처럼 객체를 생성할 수 있음
    - 생성자 함수와 달리 `new`를 작성하지 않았을 때 "undefined"에 그치는 게 아닌, "TypeError"가 발생함 (error를 인지할 수 있음)
    - 생성자 함수와 달리 constructor에 class라는 게 명시됨
    - `for ... in`문에서 제외됨
    - 상속 시 `extends` keyword를 사용함
    - ES6에서 추가됨

```
// 🎵 class로 car를 만들고 extends로 bmw에 상속하기
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("STOP!");
  }
}

class Bmw extends Car {
  park() {
    console.log("PARK");
  }
}

const z4 = new Bmw("blue"); // __proto__에 f park()가 있고, __proto__의 __proto__에 drive와 stop이 있음
```

- method overriding
    - `super`
        - 만약 Bmw에 Car에서 정의한 method와 동일한 method가 존재한다면, Bmw의 method가 나옴 (Bmw의 method가 Car의 method를 덮어쓴 것)
        - 이렇게 동일한 method가 있을 때, Bmw의 것이 Car의 것을 덮어쓰는 게 아닌, 합쳐서 확장하고 싶다면 super를 사용

```
// 🎵 자식 class에 있는 함수도 사용하고, 부모 class에 있는 함수도 사용하기
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("STOP!");
  }
}

class Bmw extends Car {
  park() {
    console.log("PARK");
  }
  stop() {
    super.stop(); // 부모 class인 Car의 stop함수를 사용하는 것
    console.log("OFF");;
  }
}

const z4 = new Bmw("blue");
```

- constructor overriding

```
class Car {
  constructor(color) {
    this.color = color;
    this.wheels = 4;
  }
  drive() {
    console.log("drive..");
  }
  stop() {
    console.log("STOP!");
  }
}

class Bmw extends Car {
  constructor(color) { // 자식 생성자는 부모 생성자를 호출해야 하므로 constructor와 super을 적어서 this.property로 할당해 주어야 함, constructor와 super에 color를 받아 Car에 넘겨주어야 z4의 color 정보까지 잘 나옴
    super(color);
  }
  park() {
    console.log("PARK");
  }
}

const z4 = new Bmw("blue");
```

---

#### 16. promise

- `promise`
    - `const pr = new Promise((resolve, reject) => { code });`resolve : 성공한 경우reject : 실패한 경우✔️ `callback 함수` : 어떤 일이 완료된 이후에 실행하는 함수[출처 : 자바스크립트 중급 강좌 #16 프로미스(Promise)](https://youtu.be/3Ao3OroqQLQ?t=89)
        
        ![](https://velog.velcdn.com/images%2Fmaimade%2Fpost%2Facab64c9-c80e-4287-b129-a1d34183ed80%2F%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-02-28%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2010.24.58.png)
        

```
// 🎵 3초 후 결과에 따른 함수 보여주기
const pr = new Promsie ((resolve, reject) => {
  setTimeout(() => {
    resolve("OK")
  }, 3000)
});

pr.then(
  function (result) {}, // 이행되었을 때 실행
  function (reject) {} // 거부되었을 때 실행
  finally () {} // 이행이든 거부된 처리가 완료되면 실행
);

// ↓ 아래와 같이 적는 게 가독성에 좋고, 첫 번째 함수를 실행했다가 나는 error도 잡기 쉬움

const pr = new Promise ((resolve, reject) => {
  setTimeout(() => {
    resolve("OK")
  }, 3000)
});

pr.then(
  function (result) {},
).catch(
  function (reject) {},
).finally(
  function () {
    console.log("--- 주문 끝 ---") // loading 화면같은 걸 없앨 때 유용함
  }
)
```

```
// 🎵 1번부터 3번까지 순서대로 제품 주문하기
// (1) callback hell 형식으로 작성
const f1 = (callback) => {
  setTimeout(function () {
    console.log("1번 주문 완료");
    callback();
  }, 1000);
};

const f2 = (callback) => {
  setTimeout(function () {
    console.log("2번 주문 완료");
    callback();
  }, 3000);
};

const f3 = (callback) => {
  setTimeout(function () {
    console.log("3번 주문 완료");
    callback();
  }, 2000);
};

console.log("시작");
f1(function () {
  f2(function () {
    f3(function () {
      console.log("끝");
    });
  });
});

// (2) promise chaining 형식으로 작성 (약 6초 정도 걸림)
const f1 = () => {
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("1번 주문 완료");
    }, 1000);
  });
};

const f2 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("2번 주문 완료");
    }, 3000);
  });
};

const f3 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("3번 주문 완료");
    }, 2000);
  });
};

console.log("시작");
f1()
  .then((res) => f2(res))
  .then((res) => f3(res))
  .then((res) => console.log(res))
  .catch(console.log)
  .finally(() => {
    console.log("끝");
});

// (3) Promise.all을 사용하여 작성 (세 제품이 동시에 주문되면 가장 오래 걸리는 제품을 봤을 때 최대 3초가 걸리기 때문에 결과가 빨리 도출됨)
const f1 = () => {
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("1번 주문 완료");
    }, 1000);
  });
};

const f2 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("2번 주문 완료");
    }, 3000);
  });
};

const f3 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("3번 주문 완료");
    }, 2000);
  });
};

console.time("x"); // 아래 console.timeEnd()와 같이 소요 시간을 측정할 수 있음
Promise.all([f1(), f2(), f3()]) // f1(), f2(), f3()가 모두 완료되어야 then 부분이 실행됨
.then(res => {
  console.log(res);
  console.timeEnd("x");
});
```

- `Promise.all()`
    - 하나라도 reject가 있으면 전체가 실행되지 않음
    - 하나의 정보라도 누락되면 전체를 보여주지 않아야 할 때 사용 (다 보여주거나, 하나도 보여주지 않거나)
- `Promise.race()`
    - `Promise.all()`은 모든 작업이 완료될 때까지 기다리지만, `Promise.race()`는 하나라도 1등으로 완료되면 끝냄
    - 용량이 큰 image들을 loading하는데 그 중 하나라도 완료되면 그 image를 보여주고 싶을 때 사용

```
// 위 예제에 이어서
// (4)
Promise.race([f1(), f2(), f3()]) // f1(), f2(), f3()가 모두 완료되어야 then 부분이 실행됨
.then(res => {
  console.log(res);
});
```

---

#### 17. async, await

`async`나 `away`를 통해 `promise` 함수를 chain으로 호출하는 것보다 가독성이 좋아진다.

- `async` : `function` 앞에 붙여주면 항상 `promise`를 반환함

```
// (1)
async function getName () {
  return "Mai";
}

console.log(getName()); // Promise { 'Mai' }
getName().then((name) => {
  console.log(name); // "Mai"
});

// (2)
async function getName () {
  return Promise.resolve("Mai");
}

getName().then((name) => {
  console.log(name); // "Mai"
});

// (3)
async function getName () {
  throw new Error("err...");
}

getName().catch((err) => {
  console.log(err); // Error: 'err...'
});
```

- `await`
    - 항상 `async` 함수 내부에서만 사용할 수 있음 (다른 데선 error 발생함)
    - `await` 함수 옆에 `Promise`가 오고, 이게 다 처리될 때까지 기다림
    - `Promise ... then`보다 `await`로 쓰는 게 가독성이 더 좋음

```
// 🎵 1초 후에 "Mai"가 찍힘
function getName(name) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(name);
    }, 1000);
  });
}

async function showName() {
  const result = await getName("Mai");
  console.log(result);
}

console.log("시작");
showName();
```

```
// 🎵 1번부터 3번까지 순서대로 제품 주문하기
// (5) await, async를 사용하여 작성
const f1 = () => {
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("1번 주문 완료");
    }, 1000);
  });
};

const f2 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("2번 주문 완료");
      // rej(new Error("err..."));
    }, 3000);
  });
};

const f3 = (message) => {
  console.log(message);
  return new Promise((res, rej) => {
    setTimeout(() => {
      res("3번 주문 완료");
    }, 2000);
  });
};

console.log("시작");
async function order() {
  try { // async await를 쓸 때 오류를 대비해 감싸주는 try ... catch문
    const result1 = await f1();
    const result2 = await f2(result1);
    const result3 = await f3(result2);
    console.log(result3);
  } catch (e) {
    console.log(e); // 이 부분에서 적절한 error를 처리해주고 넘어가면 됨
  }
  console.log("종료");
}
order();

// Promise.all과 함께 사용하기
// 위 예제에 이어서
console.log("시작");
async function order() {
  try {
    const result = await Promise.all([f1(), f2(), f3()]);
    console.log(result);
  } catch (e) {
    console.log(e);
  }
  console.log("종료");
}
order(); // [ '1번 주문 완료', '2번 주문 완료', '3번 주문 완료' ]
```

---

#### 18. generator

- generator 객체
    - 함수의 실행을 중간에 멈췄다가 재개할 수 있음
        - 다른 작업을 하다가 다시 돌아와서 next() 해주면 진행이 멈췄던 부분부터 이어서 실행
        - Redux Saga에서 많이 쓰임
    - `function` 바로 옆에 '*'를 붙임
    - `yield`에서 함수의 사용을 멈출 수 있음
    - `next()` method가 있으며 사용하면 가장 가까운 yield까지 가고 멈춤
    - value와 done이라는 property를 가짐
        - value는 `yield` 오른쪽 값임 (값을 생략하면 "undefined"임)
        - done : 함수가 끝났는지 나타내며 실행이 끝났으면 "true", 안 끝났으면 "false"임
    - `next()` 외에 `return()`과 `throw()` method를 가지고 있음
        - 함수가 끝나기 전에 return() method를 사용하면 done이 true가 되며, 그 이후에 next method를 실행해도 계속 value가 undefine, done이 true가 됨
    - 반복이 가능함 (iterable)
    - `Symbol.iterator` method가 구현되어 있어야 함
        - 이 method로 호출한 결과가 iterator인데, 이 iterator는 value와 done이라는 property를 가지는 객체를 반환하는 method인 next가 있어야 함
    - generator는 값을 미리 만들어두지 않고 필요한 값만 그때끄때 생성함
        - 일반적인 함수로느 어떤 값을 구할 때 모든 값을 미리 계산해 놔야 하고, 쓸지 안 쓸지 정해지지 않은 상황에서도 그 값을 유지해야 함
        - 필요한 순간까지 계산을 미루고, 필요할 때 연산해서 값을 주기 때문에 memory 관리 측면에서 효율적임
        - `while (true)`문을 사용하면서 `break`를 쓰지 않아도 됨
- ✔️ 배열의 반복성
    - 배열도 prototype을 보면 "Symbol(Symbol.iterator)"가 있음
    - 배열은 Symbol.iterator method를 가지고 있고, 이 method가 반환하는 값이 iterator임이므로 배열은 iterable (반복 가능한) 객체임
    - `for ... of`문으로 순회할 수 있음

```
// 🎵 it라는 변수 안에 arr가 가지고 있는 Symbol.iterator method를 실행하기
const arr = [1, 2, 3, 4, 5];

const it = arr[Symbol.iterator]();

it.next(); // {value: 1, done: false} ...

// 🎵 for ... of문으로 순회하기
for (let num of arr) {
  console.log(num)
};
```

```
// 🎵
function* fn() {
  yield 4;
  yield 5;
  yield 6;
}

const a = fn();

a[Symbol.iterator]() === a; // true : a라는 generator에 Symbol.iterator라는 method를 실행한 값이 자기 자신과 같다는 말

for (let num of a) { // for ... of가 시작되면 a[Symbol.iterator]()를 호출하고  이게 없으면 error가 발생한 후 반환된 iterator에 next method를 호출하면서 done이 true가 될 때까지 반복함
  console.log(num);
} // 4, 5, 6
```

```
// 🎵 next() method에 인수 전달하기
function* fn() {
  const num1 = yield "첫 번째 숫자를 입력해 주세요.";
  console.log(num1);

  const num2 = yield "두 번째 숫자를 입력해 주세요.";
  console.log(num2);

  return num1 + num2;
}

const a = fn();

a.next() // {value: "첫 번째 숫자를 입력해 주세요.", done: false}
a.next(4) // 인수가 num1에 저장됨, {value: "두 번째 숫자를 입력해 주세요.", done: false}
a.next(7) // 인수가 num2에 저장됨, {value: 7, done: true}
```

```
// 🎵 반복문을 사용해도 무리 가지 않는 generator
function* fn() {
  let index = 0;
  while (true) {
    yield index++;
  }
}

const a = fn(); // a.next();를 사용할 때만 연산돼서 break가 없는 무한 반복문임에도 뻗지 않음
```

```
// 🎵 yield로 다른 generator 부르기
function* gen1() {
  yield "W";
  yield "O";
  yield "R";
  yield "L";
  yield "D";
}

function* gen2() {
  yield "Hello,";
  yield* gen1();
  yield "!";
}

console.log(...gen2()); // "Hello," "W" "O" "R" "L" "D" "!"
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
