---
별칭:
  - "학습 - Event"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/b7359153cf6049cc9693419d8b4b6e46
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
  - "[[00 - 대시보드/주제/HTML·CSS|HTML·CSS]]"
병합된 노트:
  - "Event"
---

# 학습: Event

## 세부 내용

[HTML Event Attributes](https://www.w3schools.com/tags/ref_eventattributes.asp)

[https://developer.mozilla.org/ko/docs/Learn/JavaScript/Building_blocks/Events](https://developer.mozilla.org/ko/docs/Learn/JavaScript/Building_blocks/Events)

> 이벤트(event)란 여러분이 프로그래밍하고 있는 시스템에서 일어나는 사건(action) 혹은 발생(occurrence)인데, 이는 여러분이 원한다면 그것들에 어떠한 방식으로 응답할 수 있도록 시스템이 말해주는 것
> 

웹페이지에서 일어나는 모든 사용자의 action(키보드, 마우스), 네트워크상의 처리상태변화 등이 모두 하나의 이벤트로 관리된다.
이벤트가 발생하면 미리 등록된 이벤트핸들러(이벤트리스너)에 의해 처리되고, 연결된 핸들러가 없는 이벤트는 유실된다.

- Event Handler Binding
    1. html요소의 inline 이벤트속성에 작성 
        1. <u>핸들러 함수를 직접 작성하는 것이 아닌 미리 작성된 핸들러 함수의 몸통부를 작성하는 것이다.</u>
        2. 이벤트객체 전달시 변수명은 `event`로 고정
    2. html요소의 이벤트속성에 핸들러바인딩 
    3. `html요소.addEventListener('eventName', listener)` - n개의 listener등록가능
        - 세번째인자 options.once : true지정시 1회용 리스너 바인딩이 가능하다. 기본값 false
    - html inline event 속성
        
```html
<button id="btn1" onclick="test1();">클릭미 #btn1</button>
<script>
  /**
   * handler binding 1
   * - inline 이벤트속성에 작성한 내용이 핸들러함수의 몸통에 전달된다. 
   */
  const test1 = () => {
    console.log(btn1.onclick); // ƒ onclick(event) { test1(); }
  }
</script>
```

- html event 속성

<aside>
🙂 익명함수가 아닌 등록된 함수를 binding하는 경우, 호출하지 않고 함수 자체를 전달해야 한다.

```jsx
const bar = () => {
  console.log("#btn2 clicked!");
  console.log(btn2.onclick);
}; 
// btn2.onclick = bar(); // bar호출결과(리턴값)를 onclick에 바인딩
btn2.onclick = bar;      // bar 함수 자체를 연결
```

</aside>

```jsx
<button id="btn2">클릭미 #btn2</button>
<script>
/**
 * handler binding 2
 * - 태그객체의 이벤트속성에 핸들러를 직접 지정
 * - 하나의 핸들러만 등록가능
 */
btn2.onclick = () => {
  // console.log(btn2.onclick); // () => { console.log(btn2.onclick); }
  console.log('#btn2 clicked! - 1');
};
btn2.onclick = () => {
  console.log('#btn2 clicked! - 2');
  btn2.onclick = null; // 등록된 함수 제거
};
</script>
```

- addEventListener

[‣](https://app.notion.com/p/fd70f51488084edfa30951c00dd64242) 에서 등록된 모든 이벤트리스너 확인

<aside>
🙂 크롬 개발도구에서만 리스너 확인 가능하다.
`getEventListeners(document.querySelector("#btn3"));`

</aside>

```html
<button id="btn3">클릭미 #btn3</button>
<button id="btn-once">1회용 이벤트핸들러</button>
<script>
/**
 * handler binding 3
 * - addEventListener(이벤트명, 핸들러)
 * - 복수개의 핸들러를 등록가능
 */
const foo1 = () => console.log('#btn3 clicked! - 1');
const foo2 = () => {
  console.log('#btn3 clicked! - 2');
  btn3.removeEventListener('click', foo2); // 삭제할 핸들러 명시
};
btn3.addEventListener('click', foo1);
btn3.addEventListener('click', foo2);

/**
 * 1회용 핸들러
 */
document.querySelector("#btn-once").addEventListener('click', () => {
  console.log('#btn-once clicked!');
}, {
  once: true
})
</script>
```

- 페이지 load 이벤트
    - window.onload
        - body.onload
    - window.addEventListener
    
```jsx
<head>
<script>
/**
 * 문서가 모두 로딩되었을때 window의 load이벤트 발생!
 * - window.onload와 body.onload는 동일하다.
 * - head태그안의 script에서 DOM요소를 참조하는 경우 load handler안에 작성해야 에러없이 참조할 수 있다.
 */
window.onload = () => {
  target.innerHTML = 'Hello Friday~'; // OK
};
// target.innerHTML = 'Hello Friday~'; // Uncaught ReferenceError: target is not defined

window.addEventListener("load", () => {
  console.log("문서 로드 완료! - 1");
});
window.addEventListener("load", () => {
  console.log("문서 로드 완료! - 2");
});
</script>
</head>
<body onload="console.log('Page Loading Complete!');">
	<div id="target"></div>
</body>
```

- @실습문제 : 이미지 동적로딩

```jsx
<button id="btn4">@실습문제 : 이미지 동적로딩</button>
<div class="img-wrapper" style="border: 1px solid gray; margin: 10px 0; width: 300px;"></div>
<script>
/**
 * @실습문제 : 이미지 동적로딩
 * - 동적으로 이미지태그를 생성하고, 이미지 로딩이 완료되면 '이미지가 로딩되었습니다.' alert처리할 것.
 * - document.createElement로 img태그 생성할 것
 * - sample/image/???.
 */
btn4.onclick = () => {
  const img = document.createElement('img');
  img.src = '../sample/image/flower1.PNG';
  img.style.width = '100%';
  img.style.borderRadius = '50%';
  img.onload = () => {
    alert('이미지가 로딩되었습니다.');
  };
  document.querySelector("div.img-wrapper").append(img);
}
</script>
```

- Event객체 | Event발생객체
    - 이벤트객체 - 이벤트관련정보(타입, 발생위치, ...)를 가진 객체
        - 이벤트 객체 주요 속성
            - `type` 이벤트타입 (click, load, focus, blur, ...)
            - `target` 이벤트를 발생시킨 객체에 대한 참조. 보통은 엘레먼트객체
            - `timestamp` 이벤트발생 시각정보. UTC기준. system에서 제공하지 않을수 있음.
            - `keyCod` 사용자가 누른 키정보
            - `clientX` 이벤트발생 click 위치 현재 윈도우기준 fromLeft *client영역은 viewport를 가리킨다.
            - `clientY` 이벤트발생 click 위치 현재 윈도우기준 fromTop
            - `x` clientX와 동일
            - `y` clientY와 동일
            - `offsetX` 타겟엘리먼트 left에서 얼마나 떨어진곳을 클릭했나.
            - `offsetY` 타겟엘리먼트 top에서 얼마나 떨어진곳을 클릭했나.
            - `screenX` 이벤트발생 click 위치 화면 기준 fromLeft
            - `screenY` 이벤트발생 click 위치 화면 기준 fromTop
            - `pageX` 전체문서 기준 x좌표(scroll영역 포함)
            - `pageY`  전체문서 기준 y좌표(scroll영역 포함)
            - `touches` 터치디바이스에서 몇개의 터치가 발생했나
    - 이벤트발생객체 - `이벤트객체.target` 속성으로 참조가능한 실제 이벤트가 발생한 태그객체
    
    <aside>
    💡 이벤트핸들러 함수안의 this는 이벤트 발생객체를 가리킨다. 단 화살표함수가 아닌 function키워드를 사용한 일반함수여야 한다.
    [‣](https://app.notion.com/p/910a0c28d4ef4c839a89fc9706b438ff) <u>6. 이벤트핸들러함수안 this → event-target객체</u>  참고할 것.
    
    </aside>
    
```jsx
<button id="btn5" value="123">이벤트객체 | 이벤트발생객체</button>
<script>
  /**
   * this용법6. 이벤트핸들러함수(일반함수)안의 this는 이벤트발생객체를 가리킨다.
   */
  btn5.onclick = function(e){
    console.log(e); // 이벤트객체 PoinerEvent
    const {target} = e;
    console.log(target); // 이벤트발생객체 #btn5
    console.log(this);  // 이벤트발생객체 #btn5
    console.log(target === this); // true

    // 이벤트발생객체의 정보가져오기
    console.log(target.value);
    console.log(this.value);
  }
  </script>
```

- Form 관련 Event
    
```html
<form action="javascript:signup();" name="signupFrm">
  <fieldset>
    <legend>회원가입</legend>
    <label for="username">아이디 : </label>
    <input type="email" name="username" id="username">
    <br>
    <label for="password">비밀번호 : </label>
    <input type="password" name="password" id="password">
    <br>
    <label for="password-check">비밀번호 : </label>
    <input type="password" id="password-check">
    <br>
    <input type="submit" value="회원가입">
  </fieldset>
</form>
```

- Focus Event `focus`  `blur`

```jsx
username.addEventListener('focus', (e) => {
    console.log(e); // FocusEvent
    console.log(e.target, e.type); // #username focus
  });
  username.addEventListener('blur', (e) => {
    console.log(e); // FocusEvent 
    console.log(e.target, e.type); // #username blur

		// blur시에 유효성검사
    if(e.target.value.length == 0){
	    alert("username을 입력해주세요.");
    }
  });
```

<aside>
💡 비밀번호확인`#password-check`  input태그에 `blur`이벤트에 두 비밀번호 input의 일치여부를 검사할 수 있다.

</aside>

```jsx
document.querySelector("#password-check").onblur = (e) => {
	const passwordVal = password.value;
	const passwordCheckVal = e.target.value;
	if(passwordVal !== passwordCheckVal){
		alert("비밀번호가 일치하지 않습니다.");
	}
};
```

- Keyboard Event `keydown` `keypress` `keydown`

사용자 키보드 입력사 아래의 3가지 이벤트가 순서대로 작동한다. 세가지 모두 핸들링하기보다는 한가지를 선정해 구현하면 된다. `keyup`, `keydown` 추천

1. `keydown`
2. `keypress` 한글/기능키는 작동하지 않는다.
3. `keyup`  추천 

Key Event 주요속성 `a`를 눌렀을때 이벤트속성(대소문자 구분안함)

- `e.key` - `a`
- `e.code` - `KeyA`
- `e.keyCode` - `65`

```jsx
/**
 * Key관련 이벤트 
 */
username.addEventListener('keydown', (e) => {
  console.log(e.type);
});
username.addEventListener('keypress', (e) => {
  // 한글은 무시된다.
  console.log(e.type);
});
username.addEventListener('keyup', (e) => {
  console.log(e.type, e.keyCode, e.key, e.code);
  console.log(e);

  // 엔터입력 감지
  if(e.keyCode === 13){
    // 사용자입력값 처리
		console.log(e.target.value);
  }

});
```

- Form Event  `submit`

<aside>
💡 문서내 모든 form태그는 `document.forms` 에서 관리된다. name속성이 있는 form태그는`document.폼이름` 으로 직접 접근할 수 있다.

</aside>

<aside>
💡 Event가 가진 기본 작동방식을 중지할 수 있다.

1. `return false;` onevent속성으로 등록된 핸들러에서만 작동한다.
2. `event.prevetDefault()` onevent속성등록, addEventListener 방식 모두 작동한다. <u>단, 호출후에도 하위 코드는 모두 실행된다.</u>
</aside>

```jsx
 /**
   * Form submit 이벤트
   * - 실제 서버로 제출되기 전에 발생
   * - 사용자 입력값에 대한 유효성 검사
   */
  // document.querySelector("form[name=signupFrm]")
document.signupFrm.onsubmit = (e) => {
  alert("submit"); // signup 함수보다 먼저 호출된다.
	// 입력값 검사!
  if(username.value.length == 0){
    alert("username을 입력해주세요.");
    // return false; // 폼제출방지 (onevent에서만 사용)
    e.preventDefault(); // onevent, addEventListener 둘다 사용가능
  }

  // 비밀번호 유효성 검사
  if(password.value.trim().length < 4){
    alert("비밀번호는 4글자 이상이어야 합니다.");
    password.select();
    // e.preventDefault();
    return false;
  }

  if(password.value !== passwordCheck.value){
    alert("두 비밀번호가 일치하지 않습니다.");
    password.focus();
    e.preventDefault();
  }

};

const signup = () => {
  alert('회원가입 성공!');
};
```

- Event Propagation 이벤트 전파
    - `bubbling` 자식요소에서 발생한 이벤트가 부모로 전파된다.
        - `capture`옵션
            - 기본값 false
            - true : 이벤트가 부모로 전파될때 부모핸들러 → 자식핸들러 순으로 호출된다.
    
```jsx
<body>
	<div id="bubble1" class="bubble bubble1">
    <div id="bubble2" class="bubble bubble2">
      <div id="bubble3" class="bubble bubble3">bubbling</div>
    </div>  
  </div>
</body>

<style>
.bubble {border: 1px solid black; padding: 20px; margin: 5px 0; text-align: center;}
.bubble1 {background-color: lightblue;}
.bubble2 {background-color: lightcoral;}
.bubble3 {background-color: lightgreen;}
</style>
```

- bubbling 확인

    <aside>
    💡 <u>bubbling시에도 [event.target](http://event.target) 객체는 동일하게 실제 클릭한 자식태그객체이다.</u>

    </aside>

```jsx
bubble1.onclick = (e) => {
  console.log('#bubble1 클릭!', e.target);
};  
bubble2.onclick = (e) => {
  console.log('#bubble2 클릭!', e.target);
}; 
bubble3.onclick = (e) => {
  console.log('#bubble3 클릭!', e.target);
  // 전파방지
  e.stopPropagation();
};
document.querySelector("body").onclick = (e) => {
  console.log("body 클릭!", e.target);
};
```

![[02 - 학습/IT/개발 메모/JavaScript 정리/첨부/f11a0c27_Untitled.png]]

이를 응용하면 body태그에서 동일한 event핸들링이 가능하다.

```jsx
document.querySelector("body").onclick = (e) => {
  console.log("body 클릭!", e.target);

  if(e.target === bubble1){
    console.log('#bubble1 클릭!');
  }
  else if(e.target === bubble2){
    console.log('#bubble2 클릭!');
  }
  else if(e.target === bubble3){
    console.log('#bubble3 클릭!');
  }
}
```

- capture 옵션 확인

```html
<div id="capture1" class="capture capture1">
  <div id="capture2" class="capture capture2">
    <div id="capture3" class="capture capture3">capture</div>
  </div>  
</div>
<style>
.capture {border: 1px solid black; padding: 20px; margin: 5px 0; text-align: center;}
.capture1 {background-color: lightseagreen;}
.capture2 {background-color: lightyellow;}
.capture3 {background-color: lightpink;}
</style>
```

```jsx
/**
 * capturing
 * - bubbling의 역순으로 핸들러가 호출된다.
 * - 이벤트가 부모로 전파될때 부모핸들러 -> 자식핸들러 순으로 호출된다.
 * 
 * capture여부 등록을 위해 addEventListener함수 사용
 * - 세번째인자 option.capture : true 등록 (기본값 false)
 * - 세번째인자는 useCapture:boolean | options:object 이다.
 */
const divs = document.querySelectorAll(".capture");
divs.forEach(div => {
	div.addEventListener("click", (e) => {
    console.log(`#${div.id} 클릭 핸들러 호출!`);
    console.log(`이벤트발생객체 : #${e.target.id}`);
  }, {
    capture:true
  });
});

/*
	#capture3을 클릭한 경우, 출력결과 : 

#capture1 클릭 핸들러 호출!
이벤트발생객체 : #capture3
#capture2 클릭 핸들러 호출!
이벤트발생객체 : #capture3
#capture3 클릭 핸들러 호출!
이벤트발생객체 : #capture3

*/
```

- Trigger Event
    
    실제 event를 발생하지 않고, 프로그래밍적으로 발생시킬수 있다. 
    
    <u>해당 요소의 해당 이벤트 핸들러를 대신 호출하게 된다.</u>
    
```jsx
<h3 id="counter"></h3>
<button id="btn-trigger-coutner">클릭</button>
<script>
let num = 0;
counter.innerHTML = num;
counter.addEventListener('click', () => {
  num++;
  counter.innerHTML = num;
});

document.querySelector("#btn-trigger-coutner").addEventListener('click', () => {
  const event = new MouseEvent('click'{
    bubbles: true,  // event bubbling 여부
    cancelable: true, // e.preventDefault()에 의해서 취소가능여부.
    view: window  // The view event property returns a reference to the Window object where the event occured.
  });
  counter.dispatchEvent(event);
});
</script>
/**
 * mouserover 이벤트시에도 click이벤트 핸들러 호출
 * 
 * Event객체 options (생략가능)
 */
test1000.addEventListener('mouseover', () => {
  const event = new MouseEvent('click'{
    bubbles: true,  // event bubbling 여부
    cancelable: true, // e.preventDefault()에 의해서 취소가능여부.
    view: window  // The view event property returns a reference to the Window object where the event occured.
  });
  
  test1000.dispatchEvent(event);
});
</script>
```


---

### 합친 노트: Event (수업 필기)

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c8a1c682_Untitled.png]]

### Event

- 웹페이지에서 일어나는 사용자의 action, 네트워크상의 처리상태변화 등이 모두 하나의 이벤트로 관리된다.
- 이벤트가 발생하면 미리 등록된 이벤트핸들러(이벤트리스너)에 의해 다음 처리가 일어난다.
- A ======> B

#### 이벤트핸들러 다루는 방법 세가지

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

##### 1. inline이벤트 속성에 작성

```jsx
<button id="btn1" onclick="test1();">클릭미 #btn1</button>
const test1 = () => {
    console.log("test1"); // 핸들러의 몸통이 된다.
    console.log(btn1.onclick);
};
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f0561de1_Untitled.png]]

##### 2. 이벤트 속성에 함수 바인딩하기

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

##### 3. **addEventListner(event, listener)**

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

#### window.onload : html문서의 DOM등록 완료시 발생하는 이벤트

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

##### @실습문제 : 이미지 동적로딩

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

### 이벤트객체 | 이벤트발생객체

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

##### focus | blur 이벤트

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1a04b98d_Untitled.png]]

다른 곳을 누르면 focus가 사라지고 blur이벤트가 발생한다. ⇒ 사용자값이 유효한지 검사해주도록 설정을 많이 함

##### key관련 이벤트

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

### Form submit 이벤트(유효성검사)

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

### Event Propagation이벤트 전파

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

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
