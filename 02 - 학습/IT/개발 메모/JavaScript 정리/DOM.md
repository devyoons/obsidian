---
별칭:
  - "학습 - DOM"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/ae0f6670d6a5422b9fd40c54dca04fc1
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: DOM

## 세부 내용

<aside>
💡 DOM은 Document Object Model이면 window하위에서 관리된다

- 브라우져가 html문서를 해석해서 document객체 하위에 계층구조로써 html태그객체를 관리
- document.getElementByXXX, document.querySelectorXXX 메소드는 모두 DOM에서 검색하게 된다.
- Node.prototype, Element.prototype 등을 상속하고 있다.
</aside>

## Node | Element

- `Node` 모든 document객체가 상속하는 객체.
    
    [Node - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/Node)
    
    - Text Node
    - Comment Node
    - Element  Node
    
    <aside>
    💡 `Node.prototype`
    
    모든 DOM객체가 Node를 상속받으므로 Node의 다음 속성/함수를 사용할 수 있다.
    
    - `firstChild`, `lastChild`, `childNodes`, `nextSibling`, `previousSibling`, `parentNode`...
    - `contains()`, `hasChildNodes()`, `appendChild()`, `removeChild()`, `replaceChild()`...
    </aside>
    
- `Element` 모든 tag객체가 상속하는 객체.
    
    [Element - Web APIs | MDN](https://developer.mozilla.org/en-US/docs/Web/API/Element)
    
    <aside>
    💡 `Element.prototype`
    
    Element Node는 Element의 다음 속성, 메소드를 상속받아 사용가능하다.
    
    - `firstElementChild`, `lastElementChild`, `children`, `nextElementSibling`, `previousElementSibling`, `parentElement`...
    - `append()`, `prepend()`, `before()`, `after()`, `insertBefore()`, `insertAdjacentElement()`, `insertAdjacentHTML()`, `replaceChildren()`...
    </aside>
    
- `div#sample`
    
```html
<div id="sample">
    <span>Hello</span><!-- Hello은 한국어로 안녕입니다. -->
  </div>
<script>
/**
 * #sample 노드 확인 
 * HTMLDivElement > HTMLElement > Element > Node > EventTarget > Object
 * - Node.nodeType // 1
 * - Node.nodeName // "DIV"
 * - Node.nodeValue // null
 * - Node.parentNode // body
 * - Node.textContent // ""
 */
const test1 = () =>{
  console.dir(sample);
  console.dir(sample.childNodes); // [text, span, comment, text]
};
</script>
```


### 동적으로 Tag 생성하기

- h2
    
    자식 textNode를 가지는 h2태그를 생성한다.
    
```jsx
<button onclick="test2();">Element - textNode</button>
<script>
/**
 * textNode를 가진 Element 생성하기
 * <h2>안녕하세요</h2>
 * 
 */
const test2 = () => {
  const h2 = document.createElement("h2"); // <h2></h2>
  const content = document.createTextNode("안녕하세요"); // 안녕하세요
  h2.appendChild(content); // <h2>안녕하세요</h2>
  document.body.appendChild(h2); // body의 자식요소로 맨 마지막에 추가. DOM에 추가
  // 이벤트핸들러를 바로 등록하기 좋다.
  h2.onclick = () => alert("ㅋㅋㅋㅋ");

  // document.body.innerHTML += "<h2>안녕하세요</h2>";
};
</script>
```

- img
    
    자식 textNod가 없는 img태그를 생성한다.
    
```jsx
<button onclick="test3();">Element - img</button>
<script>
/**
 * img element 생성
 * - textNode 없음
 */
const test3 = () => {
  const img = document.createElement("img"); // <img />
  img.src = "../sample/image/hyunta.jpg";
  img.style = 'width: 200px; margin: 10px; border-radius: 50%;';
  document.body.append(img);
};
</script>
```


## DOM Tree Traversing

```jsx
<!-- div#foo>p{안녕$}*5 -->
<div id="foo">
  <p id="p1">안녕1</p>
  <p id="p2">안녕2</p>
  <p id="p3">안녕3</p>
  <p id="p4">안녕4</p>
  <p id="p5">안녕5</p>
</div>
```

- 자식요소 찾기
    - 자식요소제거
        
```jsx
<button onclick="test4();">자식요소제거</button>
<script>
/**
 * 자식
 * - Node속성 : firstChild | lastChild | childNodes
 * - Element속성 : firstElementChild | lastElementChild | children
 */
const test4 = () => {
  console.dir(foo);
  console.log(foo.firstChild);
  console.log(foo.firstElementChild);
  console.log(foo.lastChild);
  console.log(foo.lastElementChild);
  console.log(foo.childNodes); // [text, p, text, p, text, p, text, p, text, p, text]
  console.log(foo.children); // [p, p, p, p, p]

  // console.log(foo.removeChild(foo.firstChild)); // textNode제거후 반환
  // console.log(foo.removeChild(foo.firstElementChild)); // p 제거후 반환

  // 모든 자식노드 제거
  while(foo.firstChild)
    foo.removeChild(foo.firstChild);

	// 한번에 모든 자식요소제거 - 매개인자 없이 호출
	foo.replaceChildren();
};
</script>
```

- 요소제거

```jsx
<button onclick="test5();">요소제거</button> 
<script>
/**
 * 태그 자신을 직접 제거
 */
const test5 = () => foo.remove();
</script>
```

- 형제요소 찾기
    
```jsx
<button onclick="test6()">형제요소</button>
<script>
/**
 * 형제
 * - Node속성 nextSibling | previousSibling
 * - Element속성 nextElementSibling | previousElementSibling
 */
const test6 = () => {
  console.log(foo.childNodes);
  // const node = p3.nextSibling.nextSibling; // textNode - p#p4
  // const node = p3.previousSibling.previousSibling; // textNode - p#p2
  // const node = p3.nextElementSibling; // p#p4
  const node = p3.previousElementSibling; // p#p2
  console.log(node);
  node.style.color = 'red'; // textNode에는 style속성이 없다.
};
</script>
```

- 부모요소 찾기
    
```jsx
<button onclick="test7()">부모요소</button>
<script>
/**
 * 부모요소
 * - Node속성 parentNode
 * - Element속성 parentElement
 */
const test7 = () => {
  const node = p3.parentNode;
  // const node = p3.parentElement;
  node.style.color = "blue";
  console.log(node);
};
</script>
```

- @실습문제
    
```jsx
<button onclick="test8()">@실습문제 - textNode변경하기</button>
<script>
/**
 * @실습문제 - #p3에서 출발
 * - #p2 컬러 pink
 * - #p5 컬러 tomato
 * - 부모요소를 찾아 background-color를 지정
 * - 부모의 모든 자식요소를 찾아 textNode를 Hello1, Hello2, ... 로 변경하기
 */
const test8 = () => {
  p3.previousElementSibling.style.color = "hotpink";
  p3.nextElementSibling.nextElementSibling.style.color = "tomato";
  p3.parentElement.style.backgroundColor = "lightgray";

  console.log(p3.parentElement.children); // 유사배열
  console.log([...p3.parentElement.children]); // 진짜배열
  [...p3.parentElement.children].forEach((p, index) => {
    const content = document.createTextNode('Hello' + (index + 1));
    // p.removeChild(p.firstChild); // 기존 textNode제거
    // p.appendChild(content); // 새로 추가
    p.replaceChild(content, p.firstChild); // newNode, oldNode 순으로 전달
  })
};
</script>
```

- 특정위치에 요소추가
    - insertBefore
        
        <aside>
        💡 부모요소로부터 기준요소 앞에 새 요소를 추가한다.
        
        </aside>
        
```jsx
/**
 * parent.insertBefore(newNode, referenceNode)
 * - newNode를 referenceNode 앞에 추가
 */
const test9 = () => {
  const mark = document.createElement("mark");
  mark.append(document.createTextNode("월화수목금금금~")); // mark.innerText = "월화수목금금금~";

  foo.insertBefore(mark, p3);
};

/*
<div id="foo">
  <p id="p1">안녕1</p>
  <p id="p2">안녕2</p>
	<mark>월화수목금금금~</mark>
  <p id="p3">안녕3</p>
  <p id="p4">안녕4</p>
  <p id="p5">안녕5</p>
</div>

*/
```

- insertAdjacentElement

```jsx
/**
 * target.insertAdjacentElement(position, html);
 * - beforebegin 시작태그전(형제요소)
 * - afterbegin 시작태그직후(자식요소)
 * - beforeend 종료태그직전(자식요소) append와 동일
 * - afterend 종료태그후(형제요소)
 */
const test10 = () => {
	const mark = document.createElement("mark");
	mark.append(document.createTextNode("I'm new!"))

  // p3.insertAdjacentElement('beforebegin', mark);
  // p3.insertAdjacentElement('afterbegin', mark);
  // p3.insertAdjacentElement('beforeend', mark);
  p3.insertAdjacentElement('afterend', mark);
};

/*
<div id="foo">
  <p id="p1">안녕1</p>
  <p id="p2">안녕2</p>
	<mark>I'm new!</mark> <!-- beforebegin -->
  <p id="p3">
		<mark>I'm new!</mark> <!-- afterbegin -->
		안녕3
		<mark>I'm new!</mark> <!-- beforeend -->
	</p>
	<mark>I'm new!</mark> <!-- afterend -->
  <p id="p4">안녕4</p>
  <p id="p5">안녕5</p>
</div>

*/
```

- insertAdjacentHTML

<aside>
💡 `insertAdjacentElement` 와 달리 문자열 html을 처리할 수 있다.

</aside>

```jsx
/**
 * target.insertAdjacentHTML(position, html);
 * - beforebegin 시작태그전(형제요소)
 * - afterbegin 시작태그직후(자식요소)
 * - beforeend 종료태그직전(자식요소) append와 동일
 * - afterend 종료태그후(형제요소)
 */
const test10 = () => {
  const html = "<mark>I'm new!</mark>";

  // p3.insertAdjacentHTML('beforebegin', html);
  // p3.insertAdjacentHTML('afterbegin', html);
  // p3.insertAdjacentHTML('beforeend', html);
  p3.insertAdjacentHTML('afterend', html);
};

/*
<div id="foo">
  <p id="p1">안녕1</p>
  <p id="p2">안녕2</p>
	<mark>I'm new!</mark> <!-- beforebegin -->
  <p id="p3">
		<mark>I'm new!</mark> <!-- afterbegin -->
		안녕3
		<mark>I'm new!</mark> <!-- beforeend -->
	</p>
	<mark>I'm new!</mark> <!-- afterend -->
  <p id="p4">안녕4</p>
  <p id="p5">안녕5</p>
</div>

*/
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
