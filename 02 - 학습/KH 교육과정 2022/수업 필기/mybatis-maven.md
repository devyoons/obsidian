---
별칭:
  - "강의 - mybatis|maven"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/784194acdc0245d4a8ed18b97be00805
---

# 강의: mybatis|maven

## 강의 내용

---

---

### maven

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f60a3b23_Untitled.png]]

: 의존성 프로그램을 관리해주는게 maven  

: ex> gson.jar : 인터넷에서 직접 다운로드해서 WEB-INF/lib(web app librariey) 에 넣어줬었는데 
POM.XML문서에 <dependency> 코드를 작성해주면 해당 jar파일을 다운로드해서 자동연결해줌.

: 인터넷 연결이 필수

1. maven 프로젝트 생성
2. next

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1b0a0b18_Untitled.png]]

1. maven-archetype-webapp

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9e10167a_Untitled.png]]

1. 그룹id 패키지명 설정

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ffeeadf4_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/38925a17_Untitled.png]]

- 보통 패키지 이름으로 관리

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/75afa6c0_Untitled.png]]

- packaging → war : 톰캣에 뭐하겠다는 약속
    - jar : 직접 실행

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/60b213cc_Untitled.png]]

- 의존하고 있는 라이브러리를 설정할 수 있음

플러그인 : 부가적인 기능을 위해 설정하는 것들 부가프로그램이라고 생각하면됨.

네비게이션

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4b22ea34_Untitled.png]]

- 빌트 패스

### ✔버전 설정 새로 하기

- pom.xml : 자바버전 설정

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4f8c4dfe_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/88d1d5df_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5dcd2194_Untitled.png]]

- web-xml 버전 변경 : 파일내용직접변경

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9b3fcc4e_Untitled.png]]

## mybatis

- 프로젝트 설정
    1. maven 프로젝트 생성 → next → maven-archetype-webapp
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/53fea4f3_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
