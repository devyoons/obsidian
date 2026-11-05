---
별칭:
  - "학습 - Thymeleaf"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/7b5cfe2e342e4dcebfb43cab3ad81cba
주제:
  - "[[00 - 대시보드/주제/Thymeleaf|Thymeleaf]]"
  - "[[00 - 대시보드/주제/MyBatis|MyBatis]]"
---

# 학습: Thymeleaf

## 세부 내용

---

---

- 검

[[Spring] 검증1 - Validation - 2](https://m.blog.naver.com/zbqmgldjfh/222565473580)

- 타임리프 사이트

[Thymeleaf](https://www.thymeleaf.org/)

- 스프링 공식 튜토리얼

[Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)

- 기본 표현식

[Tutorial: Using Thymeleaf](https://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf.html#standard-expression-syntax)

- 참고 블로그

[1. 타임리프 - 기본 기능](https://catsbi.oopy.io/32a9458e-f452-4733-b87c-caba75f98e2d)

[Thymeleaf 타임리프 기본 기능 정리 [텍스트/변수/반복/속성]](https://dahliachoi.tistory.com/48)

- html fragment 사용

[[Thymeleaf] 타임리프 fragment / insert / replace 사용법](https://seeminglyjs.tistory.com/455)

---

![[02 - 학습/IT/개발 메모/첨부/445e0f52_Untitled.png]]

- Controller에서 return 값으로 문자를 반환하면 뷰 리졸버가 화면을 찾아서 처리한다.
- 스프링 부트 템플릿 엔진 기본 viewName 매핑
- `resources:templates/` + {viewName} + `.html`

```jsx
변수 : ${}
객체 변수값 : *{}
메세지 : #{}
링크 : @{}
```

#### 변수

- ${key이름.변수이름}
- ${key이름['변수이름']}
- ${key이름.getter메서드 이름}

```java
@RequestMapping("/test")
public String getMessage(Model model){
	model.addAttribute("testSTR", "하하이");
	return "testView";
}
```

```html
<h2 th:text="${testSTR}><h2>
```

```html
<!-- 객체로 넘겼을 경우 -->
<span th:text="${user.name}"></span>
<span th:text="${user['name']}"></span>
<span th:text="${user.getName()}"></span>

<!--리스트로 넘겼을 경우 -->
<span th:text="${userList[0].name}"></span>
<span th:text="${userList[0]['name']}"></span>
<span th:text="${userList[0].getName()}"></span>

<!--맵으로 넘겼을 경우 -->
<span th:text="${userMap['user1'].name}"></span>
<span th:text="${userMap['user1']['name']}"></span>
<span th:text="${userMap['user1'].getName()}"></span>
```

---

#### **1. Thymeleaf 기본 표현식 - *{}, ${}, ...**

- 변수 : `${...}` - `${student.id}`
- 선택자 : `{...}` - `{id}`
- 메시지 : `#{...}` - `#{id}`
- 링크URL : `@{...}` - `@{https://www.naver.com}`
- 부분적 표현 : `~{...}` -
- 조건 연산자 : `and, or, not, !`
    - `${student.age} > 20 and ${student.age} < 10` 처럼 각각 분리하여서 사용하거나
    - `${student.age > 20 or student.age < 10}` 처럼 한 번에 묶어서 사용하는 것도 가능
- 텍스트 결합 : `${student.id}+${student.name}`
- 문장 결합 : `|학생 아이디 : ${student.id}, 학생 이름 : ${student.name} |` - `|` 로 전체 문장을 묶어줌
- if-then : `if ? then` - `${student.age < 20} ? '청소년'`
- if-then-else : `if ? then : else` - `${student.age < 20} ? '청소년' : '성인'`
- default : `value ?: defaultValue`

---

#### **2. Thymeleaf 기본 문법 - 데이터 바인딩, 조건문**

#### **1) 데이터 바인딩 - th:text, th:value, th:placeholder**

`p`, `span`, `div` 등의 태그에서 데이터를 텍스트로 바인딩할 때 사용한다.

`th:utext` 라는 속성도 있는데, utext의 경우 html 태그를 escape처리 하지 않기 때문에 보안에 취약해서 사용할 때 주의해야 한다.

```java
@RequestMapping("selectStudentInfo")
ModelAndView selectStudentInfo() {
    ModelAndView mav = new ModelAndView("/selectStudentInfo");
        
    Student student = new Student();
    student.setId("210000001");
    student.setName("Anne Marie");
    student.setAge(29);
        
    /** thymeleaf에서 사용할 object명, object를 ModelAndview에 넣어준다. */
    mav.addObject("student", student);
        
    return mav;
}
```

```html
<p th:text="${student.id}"></p>		<!-- 210000001 -->
<input type="text" th:placeholder="${student.name}" /> <!-- Anne Marie -->
<p><span th:utext="${student.age}"></span></p>  <!-- 29 -->
```

---

#### **2) 조건문 - th:if, th:unless**

조건문을 사용할 때 else 대신 unless를 사용한다. **주의할 점**은 **if문의 조건식과 unless의 조건식을 동일**하게 해주어야 한다.

```html
<p th:if="${student.grade > 80}">
  합격입니다!!!
</p>
<p th:unless="${student.grade > 80}">
  불합격.. 좀 더 노력하세요!
</p>
```

---

#### **3) form - th:object**

```java
@RequestMapping("selectStudentInfo")
ModelAndView selectStudentInfo() {
    ModelAndView mav = new ModelAndView("/selectStudentInfo");
        
    Student student = new Student("210000001", "Anne Marie", 29);
     
    List<Student> studentList = new ArrayList<>();
    studentList.add(student);
    studentList.add(new Student("210000002", "Lukas Graham", 33));
    studentList.add(new Student("210000003", "Christina Grimmie", 22));
  
    /** thymeleaf에서 사용할 object명, object를 ModelAndview에 넣어준다. */
    mav.addObject("studentList", studentList);
        
    return mav;
}
```

---

#### **3. 반복문 - th:each, 상태변수 사용(index, count 등)**

리스트 객체를 반복할 때 사용한다.

```java
@RequestMapping("selectStudentInfo")
ModelAndView selectStudentInfo() {
    ModelAndView mav = new ModelAndView("/selectStudentInfo");
        
    Student student = new Student("210000001", "Anne Marie", 29);
     
    List<Student> studentList = new ArrayList<>();
    studentList.add(student);
    studentList.add(new Student("210000002", "Lukas Graham", 33));
    studentList.add(new Student("210000003", "Christina Grimmie", 22));
  
    /** thymeleaf에서 사용할 object명, object를 ModelAndview에 넣어준다. */
    mav.addObject("studentList", studentList);
        
    return mav;
}
```

```html
<table>
  <tr th:each="student : ${studentList}">
    <td th:text="|${student.id} : ${student.name}|"></td>
    <td th:text="|나이: ${student.age}|"
  </tr>
</table>

<!-- /* 출력 결과 */ -->
210000001 : Anne Marie
나이: 29
210000002 : Lukas Graham
나이: 33
210000003 : Christina Grimmie
나이: 22
```

`th:each`를 사용할 때 기본적으로 status 변수를 제공해주고 이를 이용하여 index나 count 등의 값을 사용할 수 있다. 기본적으로 `변수명Stat` 로 사용할 수 있으며, 변수명을 다르게 사용하고 싶을 경우 직접 명시할 수 있다. index의 경우 0부터 시작한다.

<aside>
💡 index : 현재 인덱스(0부터 시작)
count : 현재 인덱스(1부터 시작)
size : 전체 개수
current : 현재 요소
even : 현재 반복이 짝수인지(boolean)
odd : 현재 반복이 홀수인지(boolean)
first : 현재 반복이 첫번째인지(boolean)
last : 현재 반복이 마지막인지(boolean)

</aside>

```html
<!-- /* 상태변수명을 바꾸고 싶을 경우 직접 명시할 수 있다.
			<tr th:each="student, stat : ${studentList}"> */ -->
<div th:each="student : ${studentList}">
  <p th:text="${'index: ' + studentStat.index}"></p>
  <p th:text="${'count: ' + studentStat.count}"></p>
  <p th:text="${'size: ' + studentStat.size}"></p>    
  <p th:text="${'current: ' + studentStat.current}"></p>
  <p th:text="${'even: ' + studentStat.even}"></p>
  <p th:text="${'odd: ' + studentStat.odd}"></p>
  <p th:text="${'first: ' + studentStat.first}"></p>
  <p th:text="${'last: ' + studentStat.last}"></p>
</div>
```

---

#### **4. 기타 문법, 타임리프 주석 사용법**

#### **1) th:block**

`th:if`문을 사용하고 싶은데, html 태그는 사용하고 싶지 않거나 사용할 수 없는 경우라면? `th:block`을 사용하여 타임리프 문법을 사용할 수 있습니다.

```html
<th:block th:if="${student.grade < 60}" th:text="|${student.name} 불합격!|"></th:block>
<th:block th:if="${student.grade >= 60 and student.grade < 90}" th:text="|${student.name} 통과! B등급!!|"></th:block>
<th:block th:if="${student.grade >= 90}" th:text="|${student.name} 통과! A등급!!|"></th:block>
```

---

#### **2) 타임리프 주석**

```html
<!-- /* 
이렇게 하면 타임리프 파싱될 때 일반 html 주석이 아니라 
타임리프 주석으로 처리되어 클라이언트에서 볼 수 없음. 
소스보기에서 숨겨야 하는 주석일 경우 타임리프 주석으로 처리 
*/ -->
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
