---
별칭:
  - "학습 - Spring 설정 스니펫 모음"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/7e856eed30044fcaa144ef702b00b139
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 학습: Spring 설정 스니펫 모음

## 세부 내용

- 게시판작성 업로드 사진 바로 보이게
    
    썸머노트
    
- CSS 안먹힐 때 (경로 문제 없을 시)
    
    [[CSS] CSS 파일 적용이 안 될 때 해결 방법](https://ho-ding.tistory.com/19)
    
- 시큐리티 xml파일 네임스페이스 및 버전
    
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans:beans xmlns="http://www.springframework.org/schema/security"
	xmlns:beans="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xsi:schemaLocation="http://www.springframework.org/schema/security http://www.springframework.org/schema/security/spring-security-4.2.xsd
		http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd">
```

- csrf 토큰 넣는방법 2가지
    1. 동적 <form:form> 
    2. 명시 
    
```xml
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
```

- @Component어노테이션이 붙은 클래스를 빈으로 등록해주는 태그
    
```xml
<context:component-scan base-package="com.kh.security" />
```

- json 을 변환해서 view로 뿌려주는 dependency
    
```xml
pom.xml
<!-- #14. jsonView 의존 -->
<dependency>
	<groupId>net.sf.json-lib</groupId>
	<artifactId>json-lib-ext-spring</artifactId>
	<version>1.0.2</version>
</dependency>
```

```xml
servlet-context
<!-- #14.1 jsonView빈 등록 -->
<beans:bean id="jsonView" class="net.sf.json.spring.web.servlet.view.JsonView">
	<beans:property name="contentType" value="application/json; charset=utf-8"/>
</beans:bean>

<!-- #14.2 BeanNameViewResolver 등록 -->
<beans:bean id="beanNameViewResolver" class="org.springframework.web.servlet.view.BeanNameViewResolver">
	<beans:property name="order" value="1"/><!-- InternalResourceViewResolver보다 우선처리 -->
</beans:bean>
```

```xml
controller에서 return "jsonView" 하면 이걸가지고 뷰단처리해줄 빈있는지 확인함
그리고 servlet.context에 빈등록한게 뷰단처리를해줌
```

GetMapping String 일때 

1. beanNameViewResolver 없으면
2. internalResourceViewResolver 이걸로 앞에 WEB-INF/…/..jsp 붙여서 넘겨줌
- intellij 한글깨짐
    
    [[Intellij / 인텔리제이] 윈도우 실행시 한글 깨짐](https://milenote.tistory.com/37)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 공부|개발 공부]]
