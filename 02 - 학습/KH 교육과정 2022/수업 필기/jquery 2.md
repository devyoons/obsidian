---
별칭:
  - "강의 - jquery 2"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/d5d4475edf9b48159c2d801af2079cfa
---

# 강의: jquery 2

## 강의 내용

---

---

## 이벤트

#### mouseover | mouseout

---

- 자식요소 접근시에도 이벤트 핸들링된다.
- 지정된 태그 요소(혹은 자신)는 물론이며, 자식 요소가 있다면 해당 자식요소의 영역까지 포함됨

#### mouseenter | mouseleave

---

- 자식요소 접근시에도 이벤드핸들링하지 않는다.
- 지정된 태그 요소(혹은 자신)의 영역에만 해당되며, 만약 자식요소가 있다면 해당 자식요소의 영역은 제외됨

**`hover` = mouseenter + mouseleave**

#### on/off 이벤트핸들러

---

- on 핸들러바인딩 => addEventListener
- off 핸들러바인딩(제거) => removeEventListener
    - 이벤트핸들러 반드시 지정해야했는데 jq에 **off는 핸들러지정을 하지 않아도 된다.**

```jsx
<button id="btn1">클릭미!</button>
<button id="btn2">한번만 클릭미!</button>
```

```jsx
$(btn1).on('click', (e) => {
    console.log('#btn1 클릭!');
    // 한번 클릭후 이벤트핸들러 제거
    $(e.target).off('click');
})
// 클릭 후 콘솔에 출력되고 삭제된다.
```

- one 한번만 사용

```jsx
$(btn2).one('click', () => {
    console.log("#btn 클릭! 처음이자 마지막!");
})
// 한번 사용 후 끝
```

> on , html동적 생성, append(자식요소추가)
> 
- **새로 만들어진 태그들은 이벤트를 핸들러를 바인딩한 적이 없어서 작동하지 않음**

```jsx
<!-- div#heading-wrapper>h2{안녕} -->
<div id="heading-wrapper">
    <h2>안녕</h2>
</div>
<script>
let num = 0;
$("#heading-wrapper > h2").on('click', () => {
    // 새 h2 태그를 추가
    const $h2 = $(`<h2>안녕${++num}</h2>`); // html을 동적으로 생성
    $("#heading-wrapper").append($h2); // 자식요소로 마지막에 추가
})
</script>
```

![‘안녕’을 클릭하면 계속 추가가되고, 
새로 만든 h2태그들은 핸들러를 바인딩한 적이 없기 때문에 작동하지 않는다.](../../../attachments/040edcde-64e9-4b1a-a07b-2dfcc37f5607/Untitled.png)

‘안녕’을 클릭하면 계속 추가가되고, 
새로 만든 h2태그들은 핸들러를 바인딩한 적이 없기 때문에 작동하지 않는다.

- 새로만들어진 요소도 이벤트 핸들러 바인딩해주기

```jsx
<div id="heading-wrapper">
    <h2>안녕</h2>
</div>
<script>
let num = 0;
const generateH2 = () => {
        // 새 h2 태그를 추가
        const $h2 = $(`<h2>안녕${++num}</h2>`); // html을 동적으로 생성
        $("#heading-wrapper").append($h2); // 자식요소로 마지막에 추가

        $h2.on('click', generateH2); // 새요소도 핸들러바인딩
};
$("#heading-wrapper > h2").on('click', generateH2);
</script>
```

### traversing

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/cf379910_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b67326d0_Untitled.png]]

#### 부모

- parent([selector]) 직계 부모요소
- parents([selector]) 모든 조상요소
- parentUntil(selector) 특정부모요소 전까지 모든 조상요소

#### 자식

- children([selector]) 모든 직계자식요소
- find(selector) 매칭되는 모든 후속요소

#### 형제

- siblings([selector]) 모든 형제요소
- next([selector]) 다음형제요소 하나.
- nextAll([selector]) 다음형제요소 모두
- nextUntil(selector) 특정형제요소 전까지의 모든 형제요소
- prev([selector]) 이전 형제요소 하나
- prevAll([selector]) 이전 형제요소 모두
- prevUntil(selector) 특정 형제요소 전까지의 모든 형제요소

- add (jq 요소추가)

## css

---

- show(speed, easing,callback)
- hide(speed, easing,callback)
- toggle(speed, easing,callback)
    - speed 밀리초
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9ceb9c95_Untitled.png]]
        

```jsx
<button id="btn1">show</button>
    <button id="btn2">hide</button>
    <button id="btn3">toggle</button>
    <br><br>
    <img src="../sample/image/river1.PNG" alt="" id="river">
</div>
<script>
$(btn1).click(() => {
    $(river).show(500);
})
$(btn2).click(() => {
    $(river).hide(500);
})
$(btn3).click(() => {
    $(river).toggle(1000);
})
</script>
```

- toggle 세부설정

```jsx
$(btn3).click(() => {
    $(river).toggle(1000, 'swing', () => {
        alert('토글완료');
    });
})
```

### slideDown | slideUp | slideToggle

---

- slideDown(speed, easing, callback)
- slideUp(speed, easing, callback)
- slideToggle(speed, easing, callback)
    - speed 기본값 400millis

```jsx
// 아코디언
$(".menu").click((e) => {
    // $(e.target)
    //     .next()
    //     .slideToggle()
    //     .end()
    //     .siblings(".menu")
    //     .next()
    //     .slideUp();

    $(e.target)
    .next().slideToggle()
    .siblings('.content').slideUp()
});
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/357673d3_Untitled.png]]

### fadeIn | fadeOut | fadeToggle

---

`opacity ⇒ display : none`

- fadeIn(speed, sasing, callback)
- fadeOut(speed, sasing, callback)
- fadeToggle(speed, sasing, callback)
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c094150b_Untitled.png]]
    

```jsx
<div style="border:1px solid gray;">
    <button id="btn4">fadeIn</button>
    <button id="btn5">fadeOut</button>
    <button id="btn6">fadeToggle</button>
    <br><br>
    <img src="../sample/image/river2.PNG" alt="" id="river2">
</div>

$(btn4).click(() => {
    $(river2).fadeIn();
});
$(btn5).click(() => {
    $(river2).fadeOut();
});
$(btn6).click(() => {
    $(river2).fadeToggle();
});
```

### animate

---

- animate(styleProps, duration, easing, callback)
- [컬러 API](https://releases.jquery.com/color/)
- [UI API](https://releases.jquery.com/ui/)
    - js 소스 아래에 작성해야함.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/70ee7042_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
