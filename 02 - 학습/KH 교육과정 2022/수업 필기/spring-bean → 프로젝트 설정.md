---
별칭:
  - "강의 - spring-bean → 프로젝트 설정"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/ed8e1337eae24c59963102ef70b1c0df
---

# 강의: spring-bean → 프로젝트 설정

## 강의 내용

---

---

- 프로젝트 생성
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1189c627_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0772f069_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/973f3576_Untitled.png]]
    
    Artifact Id : 실제 프로젝트 이름
    
- 프로젝트 속성 설정
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fee15b96_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7a0c44c0_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/efcf28f6_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0ab7f0b5_Untitled.png]]
    
- pom.xml → core, beans 등 사용하기 위한 설정
    
    [https://mvnrepository.com/artifact/org.springframework/spring-context/5.2.9.RELEASE](https://mvnrepository.com/artifact/org.springframework/spring-context/5.2.9.RELEASE)
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6777cb0f_Untitled.png]]
    
    ![의존에 의존까지 pom maven은 해결해준다.
    스프링관련 클래스 core, context, beans 등등 사용가능](../../../attachments/27307484-e353-41b3-8d3b-6528275272aa/Untitled.png)
    
    의존에 의존까지 pom maven은 해결해준다.
    스프링관련 클래스 core, context, beans 등등 사용가능
    
- 클래스 생성시 인터페이스 추가하기
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/aebbf520_Untitled.png]]
    
- xml 통해서 bean 설정 : src/main/resources
    
    ![객체 생성없이 사용할 수 있도록 해주는게 context 
    context도 객체이며 spring container 에 있다.](../../../attachments/484b1c64-b710-47cf-9188-356ae731214b/Untitled.png)
    
    객체 생성없이 사용할 수 있도록 해주는게 context 
    context도 객체이며 spring container 에 있다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1057ac7e_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/37a02298_Untitled.png]]
    
    빌드패스로 소스들을 배포해주는 경로
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1cffa380_Untitled.png]]
    
    beans는 체크를 하지 않아도 자동으로 빈으로 생성해줌.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ea36b993_Untitled.png]]
    
    ```java
    <!-- 
    	scope 객체 관리 주기
    		- singletone (기본값)단 하나의 객체만 생성 관리
    		- prototype  getBean 요청시마다 생성
    		- request    request 마다 생성
    		- session    session 마다 생성
     -->
    <bean id="LgTv" class="com.kh.spring.tv.LgTv" scope="singletone"></bean>
    <bean id="SamsungTv" class="com.kh.spring.tv.SamsungTv"></bean>
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9068da40_Untitled.png]]
    
    getter를 만들때 자동으로 세터를 생성해서 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7b19838c_Untitled.png]]
    
    객체가 생성될 때 의존이 주입된다.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
