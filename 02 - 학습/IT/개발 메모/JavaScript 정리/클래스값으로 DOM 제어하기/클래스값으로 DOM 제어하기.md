---
별칭:
  - "학습 - 클래스값으로 DOM 제어하기"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/6d212fa0eea142139c1e1373669f3506
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: 클래스값으로 DOM 제어하기

## 세부 내용

<aside>
💡 체크박스를 통해 부모 td태그의 클래스값을 변환하는 예제이다.

</aside>

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>클래스값으로 DOM 제어</title>
  <style>
  table {
    border: 1px solid #000;
    border-collapse: collapse;
  }
  th, td {
    border: 1px solid #000;
    text-align: center;
    padding: 5px;
  }
  .on {
    background-color: hotpink;
    color: #fff;
  }
  .gungseo {
    font-family : 궁서, 'serif';
  }
  </style>
</head>
<body>
  <h1>클래스값으로 DOM 제어</h1>
  <!-- table>thead>tr>th -->
  <table>
    <thead>
      <tr>
        <th colspan="5">수강신청</th>
      </tr>
    </thead>
    <!-- tbody>tr>td -->
    <tbody>
      <tr>
        <td colspan="5">
          <input type="checkbox" id="checkAll" onchange="checkAllChanged()">
          <label for="checkAll">전체선택/해제</label>
        </td>
      </tr>
      <!-- tr>(td.gungseo>input:checkbox[name=subject]#subject$+label[for=subject$])*5 -->
      <tr>
        <td class="gungseo"><input type="checkbox" name="subject" id="subject1" onchange="subjectChanged('subject1');"><label for="subject1">국어</label></td>
        <td class="gungseo"><input type="checkbox" name="subject" id="subject2" onchange="subjectChanged('subject2');"><label for="subject2">영어</label></td>
        <td class="gungseo"><input type="checkbox" name="subject" id="subject3" onchange="subjectChanged('subject3');"><label for="subject3">수학</label></td>
        <td class="gungseo"><input type="checkbox" name="subject" id="subject4" onchange="subjectChanged('subject4');"><label for="subject4">사회</label></td>
        <td class="gungseo"><input type="checkbox" name="subject" id="subject5" onchange="subjectChanged('subject5');"><label for="subject5">과학</label></td>
      </tr>
    </tbody>
  </table>
</body>
</html>
```

- `[name=subject]` 체크/체크해제시 change 이벤트 처리하기 - id값을 전달
    
    <aside>
    🙂 부모 td 태그객체에 접근하기 위한 속성 `parentElement` 를 사용한다.
    부모 td의 다른 클래스값을 온전히 보전하기 위해 `className` 속성 제어시 다른 클래스 값을 함께 작성해야 하므로 불편하고, 위험하다.
    
    </aside>
    
```jsx
/**
 * [name=subject]가 체크/체크해제되었을때 change이벤트핸들러
 * - 어느 체크박스로부터 호출된 것인지 확인하기 위해 id 매개인자 필수
 */
function subjectChanged(id){
  // console.log("subjectChanged : ", id);
  const subject = document.querySelector("#" + id); 
  // console.log(subject);
  const parentTd = subject.parentElement;
  // console.log(parentTd);
  if(subject.checked){
    parentTd.className = "on gungseo";
  }
  else{
    parentTd.className = "gungseo";
  }

}
```

- className 대신 classList 객체 사용하기
    
    <aside>
    💡 클래스명을 하나의 문자열로 제어하는 className과 달리 classList객체 속성을 사용하면 개별 클래스값을 하나씩 제어할 수 있다.
    
    </aside>
    
    - W3School - **HTML DOM Element classList**
        
        [HTML DOM Element classList](https://www.w3schools.com/jsref/prop_element_classlist.asp)
        
        [[02 - 학습/IT/개발 메모/JavaScript 정리/클래스값으로 DOM 제어하기/classList속성/classList속성|classList속성]]
        
    
```jsx
function subjectChanged(id){
  const subject = document.querySelector("#" + id); 
  const parentTd = subject.parentElement;
  if(subject.checked)
    parentTd.classList.add("on");
  else
    parentTd.classList.remove("on");
}
```

- this용법1 - <u>inline 이벤트 속성에 기술된 this는 태그 객체 자신이다.</u>
    
    <aside>
    💡 `input[name=subject]` 태그의 onchange속성에서 id가 아닌 `this`키워드를 전달한다.
    
    </aside>
    
```jsx
<tr>
  <td class="gungseo"><input type="checkbox" name="subject" id="subject1" onchange="subjectChanged(this);"><label for="subject1">국어</label></td>
  <td class="gungseo"><input type="checkbox" name="subject" id="subject2" onchange="subjectChanged(this);"><label for="subject2">영어</label></td>
  <td class="gungseo"><input type="checkbox" name="subject" id="subject3" onchange="subjectChanged(this);"><label for="subject3">수학</label></td>
  <td class="gungseo"><input type="checkbox" name="subject" id="subject4" onchange="subjectChanged(this);"><label for="subject4">사회</label></td>
  <td class="gungseo"><input type="checkbox" name="subject" id="subject5" onchange="subjectChanged(this);"><label for="subject5">과학</label></td>
</tr>
```

```jsx
/**
 * this용법1. inline 이벤트속성에 기술된 this는 태그객체 자신이다.
 */
function subjectChanged(subject){
  const parentTd = subject.parentElement;
  if(subject.checked)
    parentTd.classList.add("on");
  else
    parentTd.classList.remove("on");

}
```

- 전체선택제어1 `input#checkAll` → `input[name=subject]`
    
    <aside>
    💡 전체선택 체크박스 `#checkAll`의 체크상태와 `[name=subject]` 모든 체크박스를 동일하게 관리한다.
    
    개별 체크박스의 부모 td에 대한 클래스값처리는 이와 별개로 이루어진다.
    
    </aside>
    
```jsx
/**
 * #checkAll 체크/체크해제했을때 change이벤트핸들러
 */
function checkAllChanged(){
  // console.log("checkAllChanged");
  // const subjects = document.getElementsByName('subject');
  const subjects = document.querySelectorAll('[name=subject]');
  // console.log(subjects);
  const checkAll = document.querySelector("#checkAll");

  for(let i = 0; i < subjects.length; i++){
    const subject = subjects[i];
    // 1. 체크/체크해제 처리
    subject.checked = checkAll.checked;
  }

}
```

- 전체선택제어2 `input[name=subject]` → `input#checkAll`   완성
    
    <aside>
    💡 개별체크박스를 모두 체크하면, `#checkAll` 이 체크되어야 한다.
    개별체크박스를 하나라도 체크해제하면, `#checkAll`도 체크해제되어야 한다.
    
    </aside>
    
    <aside>
    💡 공통부분은 `toggleClassOn`함수에 별도 작성하였다.
    
    </aside>
    
```jsx
function subjectChanged(subject){
  toggleClassOn(subject);

  // 전체선택 체크박스 처리
  // - 모두 체크된 경우 #checkAll.checked = true
  // - 하나라도 체크해제된 경우 #checkAll.checked = false
  const subjects = document.querySelectorAll('[name=subject]');
  const checkedSubjects = document.querySelectorAll('[name=subject]:checked');
  const checkAll = document.querySelector("#checkAll");
  console.log(subjects, checkedSubjects);
  checkAll.checked = (subjects.length == checkedSubjects.length);
}

/**
 * #checkAll 체크/체크해제했을때 change이벤트핸들러
 */
function checkAllChanged(){
  // console.log("checkAllChanged");
  // const subjects = document.getElementsByName('subject');
  const subjects = document.querySelectorAll('[name=subject]');
  // console.log(subjects);
  const checkAll = document.querySelector("#checkAll");

  for(let i = 0; i < subjects.length; i++){
    const subject = subjects[i];
    // 1. 체크/체크해제 처리
    subject.checked = checkAll.checked;
    // 2. 부모td.on 처리
    toggleClassOn(subject);
  }

}

function toggleClassOn(subject){
  const parentTd = subject.parentElement;
  if(subject.checked)
    parentTd.classList.add("on");
  else
    parentTd.classList.remove("on");
}
```

## 하위 노트

- [[02 - 학습/IT/개발 메모/JavaScript 정리/클래스값으로 DOM 제어하기/classList속성/classList속성|classList속성]]

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
