---
별칭:
  - "강의 - Window"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/79298acd2c35490ab82a57c2f486d0d4
---

# 강의: Window

## 강의 내용

---

---

## window

- 웹페이지의 모든 자원을 관리하는 최상위객체
    - window, this, globalThis 키워드를 통해 접근이 가능하다
    - BOM (Browser Object Model(navigator, location, history, screen, XMLHttpRequest, framse...))
    - DOM (Document Object Model(document))
    - javascript (Object, Array, String, ...)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b78c640d_Untitled.png]]

### open

- 새로운 탭 또는 팝업창을 여는 메소드
- open(주소, 윈도우명, 스펙) : **새윈도우객체**
    - 윈도우명 : 브라우져의 탭들을 관리하는 이름. 기존에 열린 탭중에 해당이름이 존재하면 `그 탭에 open`, 존재하지 않으면 새로 생성.
    - "`_self`" 현재탭에 해당 페이지를 `open`

```jsx
const test1 = () => {
  // window.open(); 최상위라 생략가능
  // 현재창이 부모가 되고 index페이지가 자식이 됨.
  const newWindow = open('index.html',"myWindow","");
	const newWindow = open('index.html',"_self","");
  console.log(newWindow);

  setTimeout(() => {
      newWindow.alert("안녕!!!");
  }, 3000);
};
```

- **`.open('팝업주소', '팝업창 이름', '팝업창 설정');`**

```jsx
const test1 = () => {
        
  // 새로열릴창의 너비 높이 
  const newWindow = open('index.html',"popup","width=500, height=300, top=300, left=200");
  console.log(newWindow);

  setTimeout(() => {
      newWindow.alert("안녕!!!");
  }, 3000);
};
```

### close

```jsx
let newWindow;
const test1 = () => {
  // 새로열릴창의 너비 높이 
  const newWindow = open('index.html',"popup","width=500, height=300, top=300, left=200");
  console.log(newWindow);

  setTimeout(() => {
      newWindow.alert("안녕!!!");
  }, 3000);
};
// 창 닫기
const test2 = () => {
    newWindow.close();
}
```

## Timer API

- setTimeout(callbackFunction, millis):timeoutId
- clearTimeout(timeoutId)

```jsx
let timerId = setTimeout(func|code, [delay], [arg1], [arg2], ...)
```

```jsx
let timeoutId;
const test3 = () => {
  timeoutId = setTimeout(() => {
      alert("Fooooooooooooooo!!!");
  }, 3000);
  console.log("timeoutId : ", timeoutId);
}
const test4 = () => {
   clearTimeout(timeoutId);
   console.log(`${timeoutId}번 타이머 취소`);
}
```

#### @실습문제 : 타이머 생성폼

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5ab0069a_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/47c44a20_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a66ac4e4_Untitled.png]]

```jsx
let userTimeoutId;
const test5 = () => {
    if(!message.value || !sec.value)
        return;

    const _message = message.value;
    userTimeoutId = setTimeout(() => {
        alert(_message);
    }, sec.value * 1000);

    alert(`${sec.value}초 후 타이머가 생성되었습니다.`);
    message.value = "";
    sec.value = "";
};
const test6 = () => {
    clearTimeout(userTimeoutId);
    console.log('타이머가 취소 되었습니다.');
}
```

### setInterval

- `setInterval`메서드는 `setTimeout`과 동일한 문법을 사용
- `setTimeout`이 함수를 단 한 번만 실행하는 것과 달리 `setInterval`은 함수를 주기적으로 실행하게 만듭니다.
- 함수 호출을 중단하려면 `clearInterval(timerId)`을 사용

```jsx
let timerId = setInterval(func|code, [delay], [arg1], [arg2], ...)
```

> 메세지가 2초 간격으로 보이다가 5초 이후에는 더 이상 메세지가 보이지 않게하기
> 

```jsx
// 2초 간격으로 메시지를 보여줌
let timerId = setInterval(() => alert('째깍'), 2000);

// 5초 후에 정지
setTimeout(() => { clearInterval(timerId); alert('정지'); }, 5000);
```

> 10부터 1씩 감소하는 h3텍스트 글을 화면에 출력하기
> 

```jsx
<button onclick="test7();">setInterval</button>
<button onclick="test8();">clearInterval</button>
<h3 id="counter"></h3>

let intervalId;
const test7 = () => {
  let initNum = 10;

  intervalId = setInterval(() => {
      counter.innerHTML = --initNum;
  }, 1000);

  if(initNum === 0){
      clearInterval(intervalId);
  }
  console.log('intervalId : ', intervalId);
};

// clearInterval을 사용해서 정지하기
const test8 = () => {
   clearInterval(intervalId);
   console.log(`${intervalId} 인터벌 중지`);
}
```

> 페이지 로딩이 끝나면 시계를 작동
> 

```jsx
<body onload="clockInterval();">
...
<h3 id="clock"></h3>
function displayClock(date){
    const f = function(n){
        return n < 10 ? "0" + n : n;
    }
    const yyyy = date.getFullYear();
    const MM = f(date.getMonth() + 1);
    const dd = f(date.getDate());
    const hh = f(date.getHours());
    const mm = f(date.getMinutes());
    const ss = f(date.getSeconds());
    
    const str = `${yyyy}/${MM}/${dd} ${hh}:${mm}:${ss}`;
    clock.innerHTML = str;
}

const clockInterval = () => {
    setInterval(() => {
        displayClock(new Date());
    }, 1000);
};
```

- 조심해야할 부분 ! 스크립트는 위에서 아래로 읽기 때문에 clock 을 못찾는다고 오류가 남.
- #clock이 DOM 등록전이라 찾을 수 없어 오류

```jsx
**displayClock(new Date())**
const clockInterval = () => {
    // setInterval(() => {
    //     displayClock(new Date());
    // }, 1000);
};
 </script>
 <h3 id="clock"></h3>
```

- #clock이 DOM등록 완료후이므로 정상작동!

```jsx
const clockInterval = () => {
    **displayClock(new Date())**
    // setInterval(() => {
    //     displayClock(new Date());
    // }, 1000);
};
 </script>
 <h3 id="clock"></h3>
```

## BOM

- Browser Object Model(navigator, location, history, screen, XMLHttpRequest, framse...)
- **`Navigator`** 인터페이스는 사용자 에이전트의 상태와 신원 정보를 나타내며, 스크립트로 해당 정보를 질의할 때와 애플리케이션을 특정 활동에 등록할 때 사용합니다.

### navigator

- OS 정보 / 브라우저에 대한 정보
- `Navigator` 객체는 `window.navigator` 읽기 전용 속성으로 접근할 수 있습니다.
- 아무 속성도 상속하지 않습니다.

```jsx
익스플로러 11 : Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; .NET4.0C; .NET4.0E; .NET CLR 2.0.50727; .NET CLR 3.0.30729; .NET CLR 3.5.30729; InfoPath.3; rv:11.0) like Gecko 
익스플로러 edge : Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2486.0 Safari/537.36 Edge/13.10586 
크롬 : Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36
파이어폭스	: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0 
네이버 웨일 : Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.49 Whale/0.5.12.4 Safari/537.36
```

### location

- 현재 접속한 페이지(url)의 주소관련 정보
- 파싱해서 관리함

```jsx
웹 주소 : http://192.168.10.6:5500/03_javascript/17_BOM.html?q=hello&type=sss#abcde

<button onclick="test2();">location</button>
<button onclick="test2();">location</button>
<script>
const test2 = () => {
    console.log(location);
}
</script>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/72af9d01_Untitled.png]]

```jsx
const test2 = () => {
    console.log(location);
    const {protocol, hostname, port, pathname, search, hash} = location;
    console.log(protocol, hostname, port, pathname, search, hash);
    // http: 
    // 192.168.45.208
    // 5500 
    // /03_javascript/17_BOM.html 
    // ?q=hello&type=sss 
    // #abcde
}
```

#### 페이지 이동

```jsx
<button onclick="test3();">location.href</button>
<button onclick="test4();">location.reload()</button>
```

- location.href = 페이지 이동

```jsx
const test3 = () => location.href = "https://www.naver.com";
```

#### F5 새로고침과 같은 기능

```jsx
const test4 = () => location.reload();
```

### history

- 브라우저 방문기록 정보

```jsx
<button onclick="test5();">history</button>
```

```jsx
const test5 = () => {
    console.log(history);
}
```

#### history.forward()

- 다음 페이지 이동

#### history.back()

- 이전 페이지 이동

#### history.go()

- reload까지 같이 처리할 수 있음
- go(0) 새로고침
- go(1) 앞으로가기 1 (2 로하면 2개 앞으로 가기됨)
- go(-1) 뒤로가기 -1

```jsx
<button onclick="test6();">history.go()</button>
const test6 = () => {
    history.go(1);
};
```

### screen

- 모니터 (hw)에 대한 정보를 가진 객체
- screen 객체는 사용자의 화면과 관련된 정보를 제공하는 객체입니다.
- 팝업창을 띄울 때 속성값을 확인해서 가운데에 띄울 수 있음
    - (전체너비 - 팝업창 너비) / 2 = x좌표
    - (전체높이 - 팝업창 높이) /  2 = y좌표

```jsx
screen.속성
```

#### screen 객체 속성

| screen.availHeight() | 작업표시줄을 제외한 화면의 사용 가능한 높이 값을 반환합니다. |
| --- | --- |
| screen.availWidth() | 작업표시줄을 제외한 화면의 사용 가능한 너비 값을 반환합니다. |
| screen.colorDepth() | 화면의 표현 가능한 컬러 색상 수를 반환합니다. |
| screen.pixelDepth() | 화면의 픽셀당 비트 수를 반환합니다. |
| screen.height() | 화면의 높이 값을 반환합니다. |
| screen.width() | 화면의 너비 값을 반환합니다. |

## DOM

- Document Object Model
    - 브라우저가 문서를 해석해서 document객체 하위에 계층구조로 태그객체를 관리
    - document.getElementsByXX, document.querySelector 메소드는 document하위에서 태그객체 찾는 메소드
- DOM에 등록된 태그객체
    - Node객체로 관리가 된다.
    - 모든 document하위의 객체는 Node객체를 상속한다.
    - textNode, commentNode, span, div, p, ...
    
    ```jsx
    <div id="sample">
       안녕
       <!-- 안녕은 한국어로 hello입니다. -->
       <span>잘가</span>
    </div>
    
    <button onclick="test1()">#sample</button>
    
    <script>
    
    const test1 = () => {
       console.log(sample);
       console.dir(sample);
    };
    </script>
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a796a313_Untitled.png]]
    
- textNode가 있는 태그객체(Element)
- <h2>여보세요~ 봄이 왔어요!</h2>
    
    

```jsx

<button onclick="test2()">태그객체 - textNode</button>

<div 
id="target" 
style="background-color: lightgray; margin: 10px 0; padding: 5px; min-height: 50px;">
</div>

const test2 = () => {
  const h2 = document.createElement('h2');
  const text = document.createTextNode('여보세요~ 봄이 왔어요!');
  h2.appendChild(text); // 자식 Node추가시
  target.append(h2); // 자식 Element추가

// target.innerHTML = '<h2>여보세요~ 봄이 왔어요!</h2>';
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ee62eedf_Untitled.png]]

#### img 태그객체 추가

```jsx
const test3 = () => {
  //  const img = document.createElement('img');
  //  img.src = '../sample/image/flower1.PNG';
  //  img.style = 'width: 200px';
  //  target.append(img);

   target.innerHTML = '<img src="../sample/image/flower1.PNG" style="width:200px"/>'
}
```

## 자식요소제거, 요소제거

```jsx
<button onclick="test4();">자식요소제거</button>
<button onclick="test5();">요소제거</button>
<div id="foo">
   <p>안녕1</p>
   <p>안녕2</p>
   <p id="foo3">안녕3</p>
   <p>안녕4</p>
   <p>안녕5</p>
</div>
<script>

//자식요소 제거

const test4 = () => {
  foo.removeChild(foo.firstElementChild);
};

//태그객체 자신을 제거
const test5 = () => {
  foo3.remove();
};
</script>
```

```jsx
const test4 = () => {
  console.log(foo.childNodes); // 텍스트노드 포함 자식요소 반환
  console.log(foo.children); // 텍스트노드 없이 자식태그요소만 반환

  console.log(foo.firstChild);// 텍스트노드 포함 첫번째 자식요소 반환
  console.log(foo.firstElementChild); // 첫번째 자식태그요소 제거

  // foo.removeChild(foo.firstElementChild); // p태그 제거!
  // foo.removeChild(foo.firstChild); // 더블클릭해야 삭제됐었음-> 개행삭제된 후 태그삭제

  // 자식요소가 존재한다면 삭제 (존재하지않을때까지 삭제)
  while(foo.firstElementChild)
      foo.removeChild(foo.firstElementChild);
};
```

### Traversing

- 하나의 DOM객체로부터 다른 DOM객체를 조회하는 방법
- 조회방법은 세가지
    - 부모
    - 형제
    - 자식
- Node(텍스트노드포함: #text) | Element(태그객체만 대상)
    - Node로 검색하면 텍스트노드가 포함되어있기 때문에 주의해야한다. (잘 사용하지 않음)

|  | Node | ★Element★ |
| --- | --- | --- |
| child | firstChild
lastChild | firstElementChild
lastElementChild |
| children(자식들) | childNodes(읽기속성) | children |
| sibling | previousSibling
nextSibling | previousElementSibling
nextElementSibling |
| parent | parentNode | parentElement |
| 추가 | appendChild | append |
- `Node추가시 appendChild`
- `Element추가시 append`

### Node(텍스트노드포함)

- textNode
- comentNode
- E

```jsx
<button onclick="test6();">Traversing</button>
<div class="wrapper">
  <p id="p1">Hello world1</p>
  <p id="p2">Hello world2</p>
  <p id="p3">Hello world3</p>
  <p id="p4">Hello world4</p>
  <p id="p5">Hello world5</p>
</div>

<script>
const test6 = () => {
   const src = document.querySelector("div.wrapper");
   let d est;
   dest = src.firstChild; // #text

	 // p#p1 - #text(개행) - p#p2
   **dest = dest.nextSibling.nextSibling.nextSibling;** 
   dest.style.color = 'deeppink';
}
</script>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0b102266_Untitled.png]]

> 부모로부터 자식을 찾고 자식의 형제요소를 찾음
> 

```jsx
const test6 = () => {
	 const src = document.querySelector("div.wrapper");
	 let dest;
	 dest = src.lastChild; // #text
	 dest = dest.previousSibling; // p#p5
	 dest.style.color = 'deeppink';
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3b3d0e4f_Untitled.png]]

> 자식노드에서 부모노드를 찾을 때
> 

```jsx
const test6 = () => {
   const src = document.querySelector("div.wrapper");
   let dest;
   dest = dest.parentNode; // 부모Node(태그객체) div.wrapper
   dest.style.color = 'deeppink';
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/31c45f97_Untitled.png]]

### Element(태그객체만 대상)

```jsx
<button onclick="test7();">Element</button>
<div class="wrapper">
	  <p id="p1">Hello world1</p>
	  <p id="p2">Hello world2</p>
	  <p id="p3">Hello world3</p>
	  <p id="p4">Hello world4</p>
	  <p id="p5">Hello world5</p>
</div>
```

> 첫번째 Element p#p1
> 

```jsx
const test7 = () => {
   const src = document.querySelector("div.wrapper");
   **let dest = src.firstElementChild;**
   dest.style.color = 'springgreen'
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fb968e75_Untitled.png]]

> dest 그 다음 요소  p#p2
> 

```jsx
const test7 = () => {
   const src = document.querySelector("div.wrapper");
   let dest = src.firstElementChild; // p#p1
   **dest = dest.nextElementSibling; // p#p2**
   dest.style.color = 'springgreen'
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7ff898de_Untitled.png]]

> 마지막 자식요소 p#p5
> 

```jsx
const test7 = () => {
   const src = document.querySelector("div.wrapper");
   **let dest = src.lastElementChild; //p#p5**
   dest.style.color = 'springgreen'
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7eeddb39_Untitled.png]]

> p#p5 이전 요소인 p#p4 요소
> 

```jsx
const test7 = () => {
   const src = document.querySelector("div.wrapper");
   let dest = src.lastElementChild; // p#p5
   **dest = dest.previousElementSibling; // p#p4**
   dest.style.color = 'springgreen'
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5601e9ad_Untitled.png]]

> 자식요소에서 부모요소 찾을 때
> 

```jsx
const test7 = () => {
   const src = document.querySelector("div.wrapper");
   let dest = src.lastElementChild; // p#p5
   dest = dest.previousElementSibling; // p#p4
   **dest = dest.parentElement 
	 //부모 Element div.wrapper(parentNode와 늘 동일하다.)**
   dest.style.color = 'springgreen'
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/eddfe092_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
