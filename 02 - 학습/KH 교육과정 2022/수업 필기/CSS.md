---
별칭:
  - "강의 - CSS"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f69b6da071ca456699ec27be88adf94f
---

# 강의: CSS

## 강의 내용

---

---

## 웹페이지_구성

| HTML | style | 웹페이지 |
| --- | --- | --- |
| 문서내용 | 디자인 |  |
- 문서내용작성과 꾸미는 부분을 분리하여 내용을 수정해도 디자인을 바꿀 필요가 없고 디자인을 수정해도 글내용을 바꿀 필요가 없음
- 다양한 기기에도 디자인만 따로 적용하여 구동 시킬 수 있다.

[csszengerden](http://www.csszengarden.com/)

## css_개요

### style과 stylesheet

- **`style`** : 정해진 속성을 입력하여 웹페이지를 꾸미는 것
- **`stylesheet`** : 웹페이지에서 반복적으로 쓰는 style을 모아 놓은 것

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b6e2fd10_Untitled.png]]

## css_적용

#### 1. 내부 스타일시트

- 수업때 사용할 방법이지만 실제로 외부 스타일시트방식으로 사용해야함.
- head태그 안에 작성하는게 좋은 위치

```html
<style></style>내부에 스타일 정보를 저장하는 방법

ex)
<head>
	<style>
		p {text-align : center;}
	</style>
</head>
```

#### 2. 외부 스타일시트

- 실제 프로젝트때는 이 방법으로 사용

```html
<link>태그를 이용하여 css파일을 읽어 와서 스타일을 적용

ex)
<link href = "css파일경로" rel="stylesheet" type="text/css">
```

#### 3. 인라인 스타일시트

- 태그 내부에 스타일 정보를 지정하는 방법
- 관리를 위해 사용을 자제해야함

```html
<html>
	<head>
	</head>
		<body>
			<p style="스타일정보;">
		</body>
<html>
```

## css_선택자

- 특정 html 태그를 선택해서 스타일을 적용하도록 하는 문법
    - 태그명
    - id
    - class
    - 속성명
    - 상태 ...
- 선택자의 종류

| 구분 | 내용 |
| --- | --- |
| 전체 선택자 | * |
| 태그 선택자 | 태그(h1, p, li등) |
| 아이디 선택자 | .클래스명 |
| 후손 선택자 | 선택자 선택자 |
| 자손 선택자 | 선택자 > 선택자 |
| 속성 선택자 | 선택자[속성=값] / 선택자[속성~=값]
선택자[속성|=값] / 선택자[속성^=값]
선택자[속성$=값] / 선택자[속성*=값] |
| 동위 선택자 | 선택자 + 선택자 / 선택자 ~ 선택자 |
| 구조선택자 | 선택자:first-child / 선택자:last-child
선택자:nth-child(수열) / 선택자:nth-last-child(수열)
선택자:first-of-type / 선택자:last-of-type
선택자:nth-of-type(수열) / 선택자:nth-last-of-type(수열) |
| 반응 선택자 | 선택자:active / 선택자: hover |
| 상태 선택자 | :checked / :focus |
| 속성 선택자 | :enabled / :disabled |
| 링크 선택자 | :link / visited |
| 문자 선택자 | ::first-letter / ::first-line
::after / ::before / ::selection |
| 부정 선택자 | 선택자:not(선택자) |

---

### 전체 선택자

- <html>에 있는 모든 태그에 적용되는 스타일
- 전체태그는 body태그에 있는 요소뿐만 아니라 html, head에도 적용된다.

```html
* { 설정내용; }
```

### 태그 선택자

- 특정 태그에 적용되는 스타일
- 여러개 태그 선택시에는 ‘,’ (쉼표)로 구별하여 작성

```html
기본형식 
	태그명 { 설정내용; }
```

### 아이디 / 클래스 선택자

- 아이디 선택자 : 태그 속성 id를 설정하고 id값을 선택자로 하는 것 (#)
- 클래스 선택자 : 태그 속성 class를 설정하고 class값을 선택자로 하는 것( . )
- 클래스 선택자는 중복이 허용되고 id선택자는 중복이 허용안됨.
    - 코드상에서는 에러는 없지만 javascript의 DOM에서 id값으로 페이지 요소를 가져오기 때문에 중복을 허용하지 않는다.
- 클래스는 중복을 허용하기 때문에 영역을 명확하게 하기 위해 태그선택자와 같이 쓰는 경우도 있음.

```html
id : #아이디명 { 설정내용; } 
class : .클래스명 { 설정내용; }
```

### 기본 속성 선택자

- 지금 선택자와 함께 사용하는 선택자로 선택자 뒤에 [ ]를 사용하여 속성과 속성값을 사용

```html
기본형식
		 선택자[속성] { 설정내용; } 
		 선택자[속성=속성값] { 설정내용; }

예시
		 속성 선택자 
	   [title] {color: tomato;} 
	   [title=HelloWorld3] {text-decoration: underline;} 
	
	   혼용
	   li.group1 {color: red;} 
	   li[title] {background-color: thistle;} 
	
	   여러개 
	   #hw1, .group2 {color : violet;} 
```

- ㅁㄴㅇ

```html
<div>
    <!-- input:text[name]*5 -->
    <input type="text"><br>
    <input type="text" name="username"><br>
    <input type="email" name="useremail"><br>
    <input type="text" name="petname"><br>
    <input type="text" name="myusage">
  </div>
  <style>
  input[name] {width: 400px;}
  input[name=username] {width: 400px;}
  input[name^=user] {background-color: pink;} -> user로 시작하는 요소만 적용
  input[name$=name] {background-color: pink;} -> name으로 끝나는 요소만 적용
  input[name*=us] {background-color: pink;} -> us일부가 포함된 요소만 적용
  </style>
```

### 문자열 속성 선택자

- 특정문자열을 확인하여 스타일을 적용하는 방식으로 특별한 경우에만 사용

| 구분 | 내용 |
| --- | --- |
| 선택자[속성~=값] | 속성값이 특정 값을 단어로 포함하는 태그 선택
띄어쓰기로 구분 |
| 선택자[속성|=값] | 속성값이 특정 값을 단어로 포함하는 태그 선택 “-”으로 구분 – 앞의 내용이 값 동일해야함. |
| 선택자[속성^=값] | 속성값이 특정 값으로 시작하는 태그 선택 |
| 선택자[속성$=값] | 속성값이 특정 값으로 끝나는 태그 선택 |
| 선택자[속성*=값] | 속성값이 특정 값으로 포함하는 태그 선택 |

### 후손 / 자손 선택자

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1fcc3933_Untitled.png]]

#### 자손 선택자

- 여러개의 자손선택가능 (선택자>자손>자손>자손...)

```css
선택자 > 자손선택자 { 설정내용; }
```

#### 후손 선택자

- 부모로부터 자식을 찾는게 순서

```css
선택자 후손선택자 { 설정내용; }
```

#### 동위선택자

- 동위 관계에서 뒤에 위치한 태그를 선택할 때 사용

| 선택자a + 선택자b | 동위선택자a의 바로 뒤에 있는 한개의 선택자만 선택 |
| --- | --- |
| 선택자a~선택자b | 동위선택자a의 뒤에 있는 선택자b 모두 선택 |

```html
	<!-- div>p#p${Hi KH $}*5 -->
  <div>
    <p id="p1">Hi KH 1</p>
    <p id="p2">Hi KH 2</p>
    <p id="p3">Hi KH 3</p>
    <p id="p4">Hi KH 4</p>
    <p id="p5">Hi KH 5</p>
    <h4>Hi KH 6</h4>
  </div>
<style>
	/* 다음 형제 하나 선택자 */
  p#p2 + p {background-color : tomato;}
  p#p2 + * {background-color : tomato;}

  /* 다음 형제 모두 선택자 */
  p#p2 ~ p {background-color: tan;} 
  p#p2 ~ * {background-color: tan;}
</style>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1dc87e55_Untitled.png]]

### 가상(반응)선택자

- 사용자의 움직임에 따라 달라지는 선택자

| 선택자:active | 사용자 클릭한 태그 선택 |
| --- | --- |
| 선택자:hover | 사용자의 마우스가 올라가 있는 태그 선택 |

```css
선택자 :active { 설정내용; }
선택자 :hover { 설정내용; }
```

```html
<div>
  <a href="http://www.innerbody.com/htm/body.html">링크</a>
</div>
<style>
a:link{color: aqua;} /* 방문전 */
a:visited{color: violet;} /* 방문후 */
a:hover{color: yellow;}
a:active{color: blue;}
</style>
```

#### 상태선택자

- 입력양식의 상태에 따라 선택되는 선택자

| input태그:checked | 체크 상태의 input태그 선택 |
| --- | --- |
| input태그:focus | 초점이 맞추어 진 input태그 선택 |
| input태그:enabled | 사용가능한 input태그 선택 |
| input태그:disabled | 사용 불가능한 input태그 선택 |

```html
<div>
    <input type="text" name="string" id="string">
    <br>
    <input type="checkbox" name="fruit" id="apple">
    <label for="apple">사과</label>
    <input type="checkbox" name="fruit" id="banana">
    <label for="banana">바나나</label>
    <input type="checkbox" name="fruit" id="peach">
    <label for="peach">복숭아</label>
  </div>
  <style>
    /* :focus 입력가능한 상태 */
    input[name=string]:focus {background-color: black; color: gray;}

    /* :checked */
    input[type=checkbox]:checked {width: 100px; height: 100px;}
    /* 체크된 체크박스의 라벨태그도 글자크기 확대 */
    input[type=checkbox]:checked + label {font-size: 100px}
  </style>
```

#### 위치(일반구조)선택자

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c36e1150_Untitled.png]]

- 특정한 위치에 있는 태그 선택(위치로만 구분)
- 자식 순서는 1부터 시작

| :first-child | 형제 관계 태그 중 첫 번째 태그 선택 |
| --- | --- |
| :last-child | 형제 관계 태그 중 마지막 태그 선택 |
| :nth-child(수열)
:nth-child(2n) | 형제 관계 태그 중 앞에서 수열 번째 태그 선택
짝수번째 형제 관계 태그 선택 |
| :nth-last-child(수열) | 형제 관계 태그 중 뒤에서 수열 번째 태그 선택 |

#### 타입위치(형태구조) 선택자

- 특정한 위치에 있는 태그 선택(태그 별로 구분)

| :first-of-type | 형제 관계 태그 중 첫 번째 태그 선택 |
| --- | --- |
| :last-of-type | 형제 관계 태그 중 마지막 태그 선택 |
| :nth-of-type(수열) | 형제 관계 태그 중 앞에서 수열 번째 태그 선택| |
| :nth-last-of-type(수열) | 형제 관계 태그 중 뒤에서 수열 번째 태그 선택 |

#### 문자 선택자

- 태그 내부에서 특정 조건의 문자를 선택자

| 선택자::first-letter | 첫 번째 글자를 선택 |
| --- | --- |
| 선택자::first-line | 첫 번째 줄을 선택 |
| 선택자::after | 태그 뒤에 위치하는 공간을 선택 |
| 선택자::before | 태그 앞에 위치하는 공간을 선택 |
| 선택자::selection | 사용자가 드래그한 글자 선택 |

#### 부정 선택자

- 지금까지의 선택자에 대해 반대로 적용하는 선택자
- 선택자에는 다른 부정선택자나 가상요소를 넣을 수 없음

| 요소:not(선택자) | 선택자를 반대로 적용하여 선택 |
| --- | --- |

#### 최상위 선택자

- 웹 문서 구조에서 특정 위치에 있는 요소를 선택하는 가상 클래스이다.
    - :root 선택자는 웹 문서 구조에서 가장 상위 요소를 선택할 때 사용한다.
- :root을 이용해 최상위 요소에 변수를 선언하면 모든 요소에서 이 변수를 사용할수있음

| :root { 설정 내용; } | 웹 문서 구조에서 가장 상위 요소를 선택할 때 사용 |
| --- | --- |

## css_우선순위

- 적용 방법에 따른 순위

**`태그스타일 ⇒ class 스타일 ⇒ id 스타일 ⇒ 인라인 스타일 ⇒ !important`**

[참고 사이트1](https://www.w3.org/TR/selectors-3/#specificity)

[참고 사이트2](http://www.devdic.com/css/refer/documents/document:1806/%EC%84%A0%ED%83%9D%EC%9E%90(Selector)%EC%9D%98-%EC%9A%B0%EC%84%A0-%EC%88%9C%EC%9C%84)

#### 선택자 우선순위

```css
!importatnt 최우선
인라인

a #id
b .class 속성
c tag 상태

* 우선순위 없음
```

## background속성

| background | 모든 background  속성을 이용한 스타일을 한 줄에 설정할 수 있음 |
| --- | --- |
| background-color | HTML요소의 배경색을 설정함 |
| background-image | HTML 요소의 배경 이미지를 설정함 |
| background-repeat | 설정된 배경 이미지의 반복 유무를 설정함 |
| background-position | 반복되지 않는 배경 이미지의 상대 위치를 설정함 |
| background-attachment | 배경 이미지를 스크롤과는 무관하게 해당 위치에 고정시킴 |

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
