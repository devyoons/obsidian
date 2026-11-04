---
별칭:
  - "강의 - jQuery"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f8bd04e8ace0463ab708f7cbca408ac0
---

# 강의: jQuery

## 강의 내용

---

---

### jQuery란

- 존레식에 의해 개발된 경량 javascript 라이브러리
- Write Less DO More(보다 간단히 많을 것을)을 모토로 복잡했던 코드를 손쉽게 구현.
    - DOM과 관련된 처리 쉽게 구현
    - 일관된 이벤트 연결 쉽게 구현
    - 시각적 효과 쉽게 구현
    - Ajax 애플리케이션 쉽게 개발
- 애니메이션 기능, Ajax통신, 이벤트 처리 등 폭넓게 지원
- jQuery플러그인을 통해 차트작성 , 슬라이드쇼, 엑셀같은 테이블도 간단한 코드로 구현가능

### jQuery연결

- CDN(Content Delivery Network)을 통한 연결
    - 온라인으로 js파일을 불러와서 실행
- 파일다운로드연결(오프라인에서사용하는경우)
    - jQuery홈페이지에서 최신버전 js파일을 다운로드
        
        [https://releases.jquery.com/](https://releases.jquery.com/)
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/899a3f16_Untitled.png]]
        
    
    ```jsx
    <script type=‘text/javascript’ 
    src=‘http://code.jquery.com/jquery-버전.js’>
    </script>
    
    //최신버전사용: jqeury-latest.min.js / jqeury-latest.js
    //이전과호환이안되는경우가있어버전에유의
    ```
    

### jQuery시작

- jQuery를 사용하는 웹 페이지 시작코드 $ 또는 jquery 사용
- window.load속성과 같은 개념의 메소드
- 페이지 내용을 로드한 후 ready메소드 실행
- $ ⇒ 함수 (dacument를 전달). ready()함수호출

```jsx
<script>
	$(document).ready(function(){
	});
	또는축약형으로
	$(function(){
	});
</script>
--------------------------
const $ = () => {}; 
$();
// undefined
-------------------------
const _ = () => {}; 
_();
// undefined
```

### 기본형식

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b4192ec3_Untitled.png]]

### 제이쿼리 선택자의 (기본형)

---

- 선택한 요소에 지정한 **스타일**을 적용 ⇒ **`$("CSS선택자").css("스타일 속성명", "값");`**
- 선택한 요소에 지정한 **속성**을 적용 ⇒ **`$("CSS선택자").attr("속성명", "값");`**
    - css선택자는 id, class를 가리킴

```jsx
<script> $(function(){ $("#title").css("color","red"); }); </script>
```

- id에는 ‘#’ , class에는 ‘.’ 접두어 사용
    - 아이디 선택자 : `$(”#아이디명”)`
    - 클래스 선택자 : `$(”.클래스명”)`
    

### 기본 선택자

- 각 요소에 대한 반복처리를 해줌. 메소드체이닝 가능

---

**<body> 영역에 있는 문서 객체를선택**할 수 있는 선택자입니다.

**직접선택자**와 인접**관계선택자**로 나뉩니다.

| 종류 | 사용법 | 설명 |
| --- | --- | --- |
| 전체 선택자 | $("*") | 모든 요소를 선택합니다 |
| 아이디 선택자 | $("#아이디명") | id 속성에 지정한 값을 가진 요소를 선택한다. |
| 클래스 선택자 | $(".클래스명") | class 속성에 지정한 값을 가진 요소를 선택한다. |
| 요소 선택자 | $("요소명") | 지정한 요소명과 일치하는 요소들만 선택한다. |
| 그룹 선택자 | $("선택1, 선택2,...") | 지정된 요소들을 한 번에 선택한다. |
| 종속 선택자 | $("요소.클래스명")
$("요소#아이디명") | 요소들중 클래스(아이디)인 요소를 선택한다. |

`$(선택자)` : jquery객체를 반환

### 이벤트 핸들링 메소드

---

- css에 없는 가상 선택자

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/911fd5eb_Untitled.png]]

#### 순서관련

---

**`:odd` :** 홀수

**`:even`** : 짝수

**`:first`** : css에서는 ⇒ **`:first-child`**, **`:first-of-type`**

**`:lsat`** : css에서는 ⇒ **`:last-child` , `last-of-type`**

#### 함수형태

---

**`:eq(n)`** : 선택한 요소 중에서 전달받은 인덱스에 해당하는 요소를 선택함.

**`:gt(n)`** : 보다 큰

**`:lt(n)`** : 보다 작은

### 내용

---

**`:contains(text)`** : 컨텐츠 텍스트 포함여부(하위의 자식, 후손까지 전부 확인함)

**`:has(selector)`** : 선택한 요소 중에서 전달받은 선택자에 해당하는 요소를 자손 요소로 가지고 있는 요소를 모두 선택함.

## attr | prop

---

#### attr 메소드

- 문서객체에 작성된 속성관리
- **해당속성을 가져오거나 (getter-attr(속성명)) 설정하는 (setter - attr(속성, 속성값))메소드**
- getter : 첫번째 요소의 값 반환. 해당속성이 작성되어 있지 않으면 undefined리턴
- setter : 모든 요소의 값 설정

#### prop

- **속성값 관리에 true / false 논리형이 필요한 경우에 사용**
- 자바스크립트를 이용한 동적제어 checked

#### each (인덱스, 요소)

## filter

---

- 선택한 요소 중에서 전달받은 선택자에 해당하거나, 함수 호출의 결과가 참(true)인 요소를 모두 선택함.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8b25282d_Untitled.png]]

#### filter(selector)

```jsx
<div>
    <p id="p1" class="group1">안녕1</p>
    <p id="p2" class="group1">안녕2</p>
    <p id="p3" class="group2">안녕3</p>
    <p id="p4" class="group2">안녕4</p>
    <p id="p5" class="group1 group2">안녕5</p>
</div>

$(btn1).click(() => {
    const $p = $("p");
    // 선택자
    $p
        .filter(".group1") // #p1, #p2, #p5
        .css("color","hotpink")
        .filter(":gt(0)") // #p2, #p2 보다 큰
        .css("background-color", "blue");
})
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d58012ed_Untitled.png]]

#### filter(callback)

```jsx
$(btn1).click(() => {
        const $p = $("p");
				$p.filter((index, p) => {
		        console.log(index, p);
		        return index % 2 == 0; // false를 반환하면 제거
	    })
		    .css("background-color", "cyan");
})
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b1a6934e_Untitled.png]]

#### first | last

---

```jsx
<div>
    <p id="p1" class="group1">안녕1</p>
    <p id="p2" class="group1">안녕2</p>
    <p id="p3" class="group2">안녕3</p>
    <p id="p4" class="group2">안녕4</p>
    <p id="p5" class="group1 group2">안녕5</p>
</div>

$(btn2).click(() => {
    const $p = $("p");

    $p.first().css("background-color","springgreen");
    $p.last().css("background-color","yellowgreen");
});
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/852fc492_Untitled.png]]

#### eq

---

- eq(index) : 선택한 요소 중에서 전달받은 인덱스에 해당하는 요소를 선택함.
- end : 이전 상태로 돌아감 (prevObject속성상태)

```jsx
<div>
    <p id="p1" class="group1">안녕1</p>
    <p id="p2" class="group1">안녕2</p>
    <p id="p3" class="group2">안녕3</p>
    <p id="p4" class="group2">안녕4</p>
    <p id="p5" class="group1 group2">안녕5</p>
</div>
$(btn3).click(() => {
        console.log(
            $("p")
            .eq(2) // #p3
            .css("background-color", "magenta")
            .end() // 이전 상태로 돌아감 (prevObject속성상태)
            .css("text-decoration", "underline")
        )
    })
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6775e2a3_Untitled.png]]

#### not(selector)

---

- 선택한 요소 중에서 전달받은 선택자에 해당하거나, 함수 호출의 결과가 참(true)인 요소를 제외한 나머지 요소를 모두 선택함.

```jsx
$(btn4).click(() => {
    $("p")
        .not(".group1.group2") // #p1, #p2, #p3, #p4
        .css("text-decoration", "underline");
})
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
