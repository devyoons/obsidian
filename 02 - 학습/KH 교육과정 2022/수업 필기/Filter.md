---
별칭:
  - "강의 - Filter"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/1fe5d4e798d34e1fa690a7526fdd5c8e
주제:
  - "[[00 - 대시보드/주제/JSP·Servlet|JSP·Servlet]]"
---

# 강의: Filter

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5bb293e5_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c090b562_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fc36c7f0_Untitled.png]]

모든 요청에 대해서 이 필터를 거치고 가게 해달라는 것.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/759a1a74_Untitled.png]]

```xml
<filter>
	<filter-name>EncodingFilter</filter-name>
	<filter-class>common.filter.EncodingFilter</filter-class>
</filter>
	<filter-mapping>
	<filter-name>EncodingFilter</filter-name>
<url-pattern>/*</url-pattern>
```

### 필터의 구동 과정

① 서블릿 컨테이너는 웹 어플리케이션을 시작할 때 DD파일(web.xml)에 등록된 필터의 인스턴스를 생성하고 init()을 호출한다.

② 클라이언트 요청이 들어오면 해당하는 필터의 doFilter()를 호출한다.

③ doFilter()에서 작업을 실행하고 다음 필터의 doFilter()를 호출한다.

④ 마지막 필터까지 ③을 반복한다.

⑤ 마지막 필터는 서블릿의 service()를 호출한다.

⑥ 서블릿의 service()가 끝나면 service()를 호출했던 이전 필터로 돌아간다.

⑦ 반복해서 제일 처음 호출됐던 필터까지 돌아간다.

⑧ 마지막으로 클라이언트에게 응답 결과를 보낸다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5b868e70_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
