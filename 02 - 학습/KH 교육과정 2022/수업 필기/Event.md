---
별칭:
  - "강의 - Event"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/427dba62d3d94908aefea2340b1be867
---

# 강의: Event

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c8a1c682_Untitled.png]]

## Event

- 웹페이지에서 일어나는 사용자의 action, 네트워크상의 처리상태변화 등이 모두 하나의 이벤트로 관리된다.
- 이벤트가 발생하면 미리 등록된 이벤트핸들러(이벤트리스너)에 의해 다음 처리가 일어난다.
- A ======> B

### 이벤트핸들러 다루는 방법 세가지

1. html요소의 **inline이벤트 속성에 작성**
    1. 이벤트객체변수명은 event로 고정 
    2. `onclick="test1(e); 에러 작명불가` ⇒ `onclick="test1(event);`
2. html요소의 이벤트 속성에 **함수바인딩하기**
3. html요소**.addEventListner(event, listener) - n개의 listener등록가능**

event : 이벤트 관련 정보를 가진 객체

- event 정보 확인하는방법 : 리스너 안에서 확인할 수 있다.

```jsx
btn5.onclick = function(e){
    console.log(e);
    const {target} = e;
    console.log(target); // 이벤트발생객체 #btn
    console.log(this); //이벤트발생객체 #btn
    console.log(target === this); //true
}
```

event target : 

- event target 정보확인하는 방법 :

```jsx
btn5.onclick = function(e){
	  console.log(e);
	  //이벤트 발생 객체의 정보가져오기
	  console.log(target.value);
	  console.log(this.value);
}
```

#### 1. inline이벤트 속성에 작성

```jsx
<button id="btn1" onclick="test1();">클릭미 #btn1</button>
const test1 = () => {
    console.log("test1"); // 핸들러의 몸통이 된다.
    console.log(btn1.onclick);
};
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f0561de1_Untitled.png]]

#### 2. 이벤트 속성에 함수 바인딩하기

- 함수를 호출해서 전달하지 않는다.

```jsx
<button id="btn2">클릭미 #btn2</button>
btn2.onclick = () => { // 핸들러의 
    console.log("test2");
    console.log(btn2.onclick);
}
// 이벤트핸들러 제거
document.querySelector('#btn2-1').onclick = () => {
    console.log("#btn2 이벤트핸들러 제거!", btn2.onclick);
    btn2.onclick = undefined;
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8792cfac_Untitled.png]]

> 호출해서 연결하면 안되고 함수자체를 연결
> 

```jsx
const bar = () => { // 핸들러의 
        console.log("test2");
        console.log(btn2.onclick);
    }
    // btn2.onclick = bar(); //bar호출결과(리턴값)를 onclick에 바인딩
    btn2.onclick = bar; // bar 함수 자체를 연결
    document.querySelector('#btn2-1').onclick = () => {
        console.log("#btn2 이벤트핸들러 제거!", btn2.onclick);
        btn2.onclick = undefined;
    }
```

#### 3. **addEventListner(event, listener)**

- 이벤트 핸들러 추가, 제거

```jsx
<button id="btn3">클릭미 #btn3</button>
<button id="btn4">#btn3 이벤트핸들러 제거</button>
const f = () => {
    console.log("test3-1");
}
btn3.addEventListener('click', f);
btn3.addEventListener('click', () => {
    console.log("test3-2");
});

// 이벤트핸들러 제거
document.querySelector('#btn3-1').addEventListener('click', () => {
	console.log('이벤트 핸들러 제거 : ', f);
	//제거할 함수를 함께 전달
	btn3.removeEventListener('click', f);
})
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/23de2dc3_Untitled.png]]

<aside>
📖 이벤트핸들러 확인해보기
크롬개발도구 : `getEventListeners(document.querySelector('#btn3'));`

</aside>

### window.onload : html문서의 DOM등록 완료시 발생하는 이벤트

- 문서처리 순서를 알기 위한 예제
- **`window.onload`**와 **`body.onload`** 동일하다.

```jsx
//방법 1
window.onload = () => {
    alert('페이지 로딩이 완료되었습니다.');
}

//방법 2
window.addEventListener('load', () => {
    alert('페이지 로딩이 완료되었습니다.');
});

//방법 3
const init = () => {
    alert('페이지 로딩이 완료되었습니다.');
};
<body onload="init();"> //body태그에 작성
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6912fae1_Untitled.png]]

```jsx
window.onload = () => {
    alert('페이지 로딩이 완료되었습니다.');
    f();
}
const f = () => {
    console.log("test3-1");
}
btn3.addEventListener('click', f);
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/65477725_Untitled.png]]

#### @실습문제 : 이미지 동적로딩

- 동적으로 이미지태그를 생성하고, 이미지 로딩이 완료되면 '이미지가 로딩되었습니다.' alert처리할 것.
- document.createElement로 img태그 생성할 것
- sample/image/???.

```jsx
btn4.onclick = () => {
    const img = document.createElement("img");
    img.src = "../sample/image/hyunta.jpg";
    img.style.width = '100%';
    img.style.borderRadius = '50%'
    // DOM등록이 완료되고 랜더 전
    img.onload = () => {
        alert('이미지가 로딩되었습니다.')
    };
    document.querySelector("div.img-wrapper").append(img);
}
```

## 이벤트객체 | 이벤트발생객체

- 이벤트객체 - 이벤트 관련정보(타입, 발생위치, ...)를 가진 객체
- 이벤트발생객체 - 이벤트객체.target속성 참조
- this용법6. 이벤트핸들러함수(일반함수)안의 this는 이벤트발생객체를 가리킨다.

```jsx
<button id="btn5">이벤트객체 | 이벤트발생객체</button>
btn5.onclick = function(e){
    console.log(e);
}
```

- 이벤트객체가 첫번째 인자로 들어옴
- altKey: false ⇒ alt누르면서 클릭하면 true
- timeStamp : 이페이지를 연 후 언제 클릭했는지

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e95613cf_Untitled.png]]

```jsx
btn5.onclick = function(e){
    console.log(e);
    const {target} = e;
    console.log(target); // 이벤트발생객체
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/02aa7f06_Untitled.png]]

> this용법6 이벤트핸들러함수(일반함수)안의 this는 이벤트발생객체를 가리킨다.
> 
- 화살표함수는 전역에서 쓰는 부모 window가 나옴.
- 일반 함수일 때 한에서 this는 이벤트발생객체임
    - this를 사용하지 않을 때는 화살표 함수를 사용하고 this가 필요하다면 일반함수사용
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4b3378cb_Untitled.png]]
    

```jsx
btn5.onclick = function(e){
    console.log(e);
    const {target} = e;
    console.log(target); // 이벤트발생객체 #btn
    console.log(this); //이벤트발생객체 #btn
    console.log(target === this); //true
}
```

> 이벤트 발생 객체의 정보가져오기
> 

```jsx
<button id="btn5" value="123">이벤트객체 | 이벤트발생객체</button>
btn5.onclick = function(e){
    
    console.log(target.value); //123
    console.log(this.value); //123
}
```

#### focus | blur 이벤트

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1a04b98d_Untitled.png]]

다른 곳을 누르면 focus가 사라지고 blur이벤트가 발생한다. ⇒ 사용자값이 유효한지 검사해주도록 설정을 많이 함

#### key관련 이벤트

- keyup 제일 많이 사용

```jsx
username.addEventListener('keydown', (e) => {
    console.log(e.type);
    if(e.keyCode === 13)
    e.preventDefault(); //이벤트 작동방지!
});
username.addEventListener('keypress', (e) => {
    // keypress는 한글무시, 기능키 무시(ctrl,shift..)
    // console.log(e.type);
});
username.addEventListener('keyup', (e) => {
    console.log(e.type, e.keyCode, e.key, e.code);
    console.log(e);

    // 사용자입력값 처리
    // usernameCopy.value = e.target.value;
    
    // 엔터입력 감지
    if(e.keyCode === 13){
        usernameCopy.value = e.target.value;
        // alert("엔터를 입력하셨습니다.")
    }
});
```

- form 안에서 엔터 했을때 자동제출을 방지하기 위해서는 keydown에 이벤트작동방지 코드를 작성해야한다.

```jsx
username.addEventListener('keyup', (e) => {
    console.log(e.type);
    console.log(e);
});
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1929b2a0_Untitled.png]]

<aside>
📖 form 안에 `submit`은  `form default button`
**implicit-submission**

</aside>

- keyCode 65 ascii code
- key a
- code keyA Enter 키별상수값

```jsx
username.addEventListener('keyup', (e) => {
    console.log(e.type, e.keyCode, e.key, e.code);
    console.log(e);

    // 사용자입력값 처리
    // usernameCopy.value = e.target.value;
    
    // 엔터입력 감지
    // if(e.keyCode === 13){ // keyCdoe
    if(e.key === 'Enter') { //code
        usernameCopy.value = e.target.value;
        // alert("엔터를 입력하셨습니다.")
    }
});
```

## Form submit 이벤트(유효성검사)

- 실제 서버로 제출되기 전에 발생
- 사용자 입력값에 대한 유효성 검사
- form[name]은 document 하위에 바로 관리된다.

```jsx
// document.querySelector("form[name=usernameFrm]") == document.usernameFrm 동일코드
document.usernameFrm.onsubmit = (e) => {
    console.log(e.type);

    // 입력값 검사!
    if(username.value.length == 0){
        alert('username을 입력해주세요.');
        return false; // 폼제출방지
     // e.preventDefault(); => addEventListener(이벤트의 기본작동방식을 하지않게 폼제출방지)
    }
};
```

## Event Propagation이벤트 전파

- **`bubbling`** : **자식요소에서** 발생한 이벤트가 **부모로 전파**된다. (기본방식)
- **`capturing`** 옵션 : 버블링시에 **핸들러 호출순서가 부모 → 자식전환**

```jsx
<div id="bubble1" class="bubble bubble1">
   <div id="bubble2" class="bubble bubble2">
       <div id="bubble3" class="bubble bubble3"></div>
   </div>
</div>
<style>
.bubble {border: 1px solid black; padding: 20px;}
.bubble1 {background-color: lightblue;}
.bubble2 {background-color: lightcoral;}
.bubble3 {background-color: lightgreen;}
</style>
<script>
document.querySelector("body").onclick = (e) => {
   console.log("body 클릭!", e.target);

   if(e.target === bubble1){
      console.log(".bubble1 클릭!");
   }
   else if(e.target === bubble2){
       console.log(".bubble2 클릭!");
   }
   else if(e.target === bubble3){
       console.log(".bubble3 클릭!");
   }
}
document.querySelector('.bubble1').onclick = (e) => {
  console.log('.bubble1 클릭!', e.target);
}
document.querySelector('.bubble2').onclick = (e) => {
  console.log('.bubble2 클릭!', e.target);
}
document.querySelector('.bubble3').onclick = (e) => {
  console.log('.bubble3 클릭!', e.target);
  // 전파방지
  e.stopPropagation(); // .bubble3 클릭!
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1bd2da0d_Untitled.png]]

전파방지 e.stopPropagation(); → .bubble3만 실행

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
