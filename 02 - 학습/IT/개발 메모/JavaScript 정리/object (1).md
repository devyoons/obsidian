---
별칭:
  - "학습 - object (1)"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/faf97c062c1545f7a8f43b0b091d05c7
---

# 학습: object (1)

## 세부 내용

> <u>**자바스크립트의 객체는 키(key)과 값(value)으로 구성된 프로퍼티(Property)들의 집합이다.**</u> 

프로퍼티의 값으로 자바스크립트에서 사용할 수 있는 모든 값을 사용할 수 있다. 자바스크립트의 함수는 일급 객체이므로 값으로 취급할 수 있다. 따라서 프로퍼티 값으로 함수를 사용할 수도 있으며 프로퍼티 값이 함수일 경우, 일반 함수와 구분하기 위해 메소드라 부른다.

자바스크립트는 객체(object) 기반의 스크립트 언어이며 자바스크립트를 이루고 있는 거의 “모든 것”이 객체이다. 원시 타입(Primitives)을 제외한 나머지 값들(함수, 배열, 정규표현식 등)은 사실 모두 객체이다.
> 
- 객체생성
    1. 리터럴 `{}`
    2. new 연산자 `new Object()`
    
    ```jsx
    /**
     * 객체생성
     * 1. 리터럴 {}
     * 2. new 연산자 new Object()
     */
    const test1 = () => {
      const obj1 = {
        id : 'honggd',
        name : '홍길동',
        age : 33,
        married : true,
        hobby : ['축구', '야구', '농구'],
        pet : {
          name : '구리구리',
          breed : '푸들',
          age : 5
        },
        'phone number' : '01012341234',
        'ss-number' : '900909-1234567',
        123 : 456
      }; // 리터럴
      
      const obj2 = new Object();
      obj2.name = '세종대왕';
    
      console.log(obj1);
      console.log(obj2);
    };
    ```
    
- 속성관리
    1. dot notation `.속성명`
    2. bracket notation `[속성명문자열]`
    
    <aside>
    💡 객체는 동적으로 속성을 추가하거나 삭제할 수 있다.
    
    </aside>
    
    ```jsx
    /**
     * 1. dot notation .속성명
     * 2. bracket notation [속성명문자열]
     */
    const test1 = () => {
      const obj1 = {
        id : 'honggd',
        name : '홍길동',
        age : 33,
        married : true,
        hobby : ['축구', '야구', '농구'],
        pet : {
          name : '구리구리',
          breed : '푸들',
          age : 5
        },
        'phone number' : '01012341234',
        'ss-number' : '900909-1234567',
        123 : 456
      }; // 리터럴
      
      const obj2 = new Object();
      obj2.name = '세종대왕';
    
      console.log(obj1);
      console.log(obj2);
    
      // 속성참조
      // 1. dot notaion
      // 2. bracket notation
      // console.log(obj1.id);
      // console.log(obj1.name);
      // console.log(obj1.age);
      // console.log(obj1.married);
      // console.log(obj1.hobby[0], obj1.hobby[1], obj1.hobby[2]);
      // console.log(obj1.pet.name, obj1.pet.breed, obj1.pet.age);
      // console.log(obj1.123, obj1.phone number, obj1.ss-number); // dot-notation 참조불가
    
      console.log(obj1['id']);
      console.log(obj1['name']);
      console.log(obj1['age']);
      console.log(obj1['married']);
      console.log(obj1['hobby'][0], obj1['hobby'][1], obj1['hobby'][2]);
      console.log(obj1['pet']['name'], obj1['pet'].breed, obj1['pet'].age); 
      console.log(obj1[123], obj1['123'], obj1['phone number'], obj1['ss-number']); // 456 456 '01012341234' '900909-1234567'
      console.log(obj1.car); // undefined
      // console.log(obj1.car.name); // 오류! Uncaught TypeError: Cannot read properties of undefined (reading 'name')
    
      // 동적으로 속성추가
      obj1.friend = {
        name : '신사임당'
      };
    
      // 속성 제거
      obj1.age = undefined; // 값만 제거
      delete obj1.age; // 속성 제거
    };
    ```
    
    - 계산된 속성  ES6
        
        Computed Property Name
        
        속성명을 중괄호`[]`로 감쌀 경우 <u>해당 표현식의 계산된 값</u>을 속성명으로 사용한다. 
        
        중괄호`[]`안에는 모든 표현식이 들어갈 수 있다.
        
        ```jsx
        const name = 'a';
        const obj = {
        	[name] : 1
        };
        console.log(obj); // { a : 1 }
        
        obj['na' + 'me'] = '홍길동';
        console.log(obj); // { a : 1, name : '홍길동' }
        ```
        
- 메소드
    
    <aside>
    💡 객체의 속성타입이 함수일때, 이를 <u>메소드</u>라 한다.
    
    </aside>
    
    <aside>
    💡 메소드(일반함수)안에서 `this`는 현재객체이다.
    
    </aside>
    
    ```jsx
    /**
     * 객체의 속성타입이 함수일때, 이를 메소드라 한다.
     */
    const test2 = () => {
      const pet = {
        petname : '복실이',
        run : function(){
          // this용법. 메소드(일반함수)안에서 this는 현재객체이다.
          console.log(this); // 현재객체 pet
          console.log(`${this.petname}가 달린다.`);
        },
        // 메소드 작성시에는 화살표함수를 지양한다.
        jump : () => {
          // this - window
          console.log(`${this.petname}가 점프한다.`);
        },
        bark(){
          // 메소드 단축문법
          console.log(`${this.petname}가 짖는다.`);
        },
        eat(food){
          console.log(`${this.petname}가 ${food}를 먹는다.`);
        }
      };
      console.log(typeof pet.run, pet.run);
      // console.log(typeof pet['run'], pet['run']);
      pet.run(); // 복실이가 달린다.
      // pet['run']();
    
      pet.jump(); // undefined가 점프한다.
      pet.bark(); // 복실이가 짖는다.
      pet.eat('개껌'); // 복실이가 개껌을 먹는다.
    
    };
    ```
    
- Object API
    - 속성 순회하기
        1. for ..in
        2. `Object.keys(obj)` 속성명만 배열로 반환
        3. `Object.values(obj)`
        
        ```jsx
        /**
         * Object API
         */
        const test3 = () => {
          const obj = {
            name : '아이폰',
            price : 1_000_000,
            color : ['red', 'black', 'white'],
          }
          // 객체속성 순회
          // for..in
          for(const name in obj){
            console.log(name, obj[name]);
          }
        
          // Object.keys():[]
          const keys = Object.keys(obj);
          console.log(keys); // ['name', 'price', 'color']
          keys.forEach((key) => console.log(key, obj[key]));
          /*
        		name 아이폰
        		price 1000000
        		color ['red', 'black', 'white'] 
          */
        
          // Object.values():[]
          const values = Object.values(obj);
          console.log(values); // ['아이폰', 1000000, Array(3)]
        }
        ```
        
- 단축속성문법  ES6
    
    ```jsx
    /**
     * 단축속성문법 ES6
     * - 속성명 : 속성값 
     * - 속성으로 변수를 전달하면, 자동으로 변수명: 값으로 처리된다.
     */
    const test5 = () => {
      const name = '홍길동';
      const lang = 'Javascript';
    
      // const dev = {
      //   name : name,
      //   lang : lang
      // };
    
      const dev = {
        name, 
        lang,
        career : 10
      };
    
      console.log(dev); // {name: '홍길동', lang: 'Javascript', career: 10}
    };
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
