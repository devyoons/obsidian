---
별칭:
  - "강의 - 페이지 이동 forward, redirect"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/c8bb80ee5af441aebc4413ae32887dd6
주제:
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
---

# 강의: 페이지 이동 forward, redirect

## 강의 내용

---

---

### forward

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c6867191_Untitled.png]]

- URL주소는 처음 요청할 때의 값이 바뀌지 않으며, **서버 내부에서만 접근이 가능하다.**
    - web container 차원에서의 페이지 이동, 실제로 웹 브라우저는 다른 페이지로 이동했는지 알 수 없다.
    - 최초 호출한 URL만 표시되고, **이동한 페이지의 URL정보는 볼수가 없다.**
    - 동일한 web container에 있는 페이지로만 이동이 가능하다.
- 특정 서블릿에 대한 요청을 다른 서블릿이나 JSP로 넘겨준다. (파라미터도 같이 넘길 수 있다)
    - **현재 실행중인 페이지와 forward에 의해 호출될 페이지는 request, response 객체를 공유한다.**

**forward(전달하기)방식은 다음 이동한 URL로 요청정보를 그대로 전달한다. 그렇기 때문에 사용자가 최초로 요청한 요청정보는 가음 URL에서도 유효하다.**

`forward` 사용예시 (시스템 변화가 생기지 않는 단순조회 요청)

- 리스트 보기
- 검색

### redirect

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/33204b30_Untitled.png]]

- web container는 redirect명령이 들어오면 웹 브라우저에게 다른 페이지로 이동하라는 명령을 내린다.
- 웹 브라우저는 URL을 지시된 주소로 바꾸고 그 주소로 이동한다.
- 다른 web container에 있는 주소로 이동이 가능하다
- 새로운 페이지에서는 request, response객체가 새롭게 생성된다. 즉, 이전 페이지에서 요청한 내용을 다시 전달해야한다.

reditext의 경우 최초 요청을 받은 URL1에서 클라이언트에 redirect할 URL2를 리턴하고,

클라이언트에게 전혀 새로운 요청을 생성하여 URL2에 다시 요청을 보낸다. 

따라서 최초 요청정보는 더이상 유효하지 않다.

`redirect` 사용예시 (시스템 (session, DB)에 변화가 생기는 요청)

- 로그인
- 회원가입
- 글쓰기

#### forward와 redirect의 차이점 정리

1. URL의 변화여부 
    1. redirect 변화 O
    2. forward 변화 X
2. 객체의 재사용여부 
    1. redirect 재사용 X
    2. forward 재사용 O

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
