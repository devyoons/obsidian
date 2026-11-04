---
별칭:
  - "강의 - hello-spring:3일차"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f27c2fa920e448f7bee736e1c3e5b00d
---

# 강의: hello-spring:3일차

## 강의 내용

---

---

### member 준비

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f66f1059_Untitled.png]]

- Controller
    
    ```java
    package com.kh.spring.member.controller;
    
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.RequestMapping;
    
    import com.kh.spring.member.model.service.MemberService;
    
    import lombok.extern.slf4j.Slf4j;
    
    @Controller
    @RequestMapping("/member")
    @Slf4j
    public class MemberController {
    
    	// private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    	
    	@Autowired
    	MemberService memberService;
    	
    	// @RequestMapping(path="/memberEnroll.do", method=RequestMethod.GET)
    	@GetMapping("/memberEnroll.do")
    	public String memberEnroll() {
    		
    		return "member/memberEnroll";
    	}
    }
    ```
    
- ServiceImpl
    
    ```java
    package com.kh.spring.member.model.service;
    
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;
    
    import com.kh.spring.member.model.dao.MemberDao;
    
    @Service
    public class MemberServiceImpl implements MemberService {
    
    	@Autowired
    	MemberDao memberDao;
    }
    ```
    
- DaoImpl
    
    ```java
    package com.kh.spring.member.model.dao;
    
    import org.mybatis.spring.SqlSessionTemplate;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Repository;
    
    @Repository
    public class MemberDaoImpl implements MemberDao {
    
    	@Autowired
    	SqlSessionTemplate sqlSession;
    }
    ```
    

### spring-security

---

```xml
<org.springframework.security-version>5.1.5.RELEASE</org.springframework.security-version>

<!-- 필수 core/web/config --> 
<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-core</artifactId>
    <version>${org.springframework.security-version}</version>        
</dependency>
<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-web</artifactId>
    <version>${org.springframework.security-version}</version>        
</dependency>
<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-config</artifactId>
    <version>${org.springframework.security-version}</version>        
</dependency>

<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-taglibs</artifactId>
    <version>${org.springframework.security-version}</version>        
</dependency>
<dependency>
    <groupId>org.springframework.security</groupId>
    <artifactId>spring-security-test</artifactId>
    <version>${org.springframework.security-version}</version>        
</dependency>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7bf7f734_Untitled.png]]

검색 : config

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b513db38_Untitled.png]]

- web.xml
    
    ```xml
    <!-- #2. 전역 context 설정 -->
    <!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
    <!-- #9.1. root-context에 security-context.xml 설정파일 추가 -->
    <context-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
    		/WEB-INF/spring/root-context.xml
    		/WEB-INF/spring/security-context.xml
    	</param-value>
    	<!-- <param-value>
    		/WEB-INF/spring/*-context.xml
    	</param-value> -->
    </context-param>
    ```
    

### ✔알아야할 내용

---

#### 1. 부트스트랩

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b963fa62_Untitled.png]]

### 2. wolcome파일 우선순위 삭제

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/83404012_Untitled.png]]

맨 밑으로 가면 있는 코드를 주석처리해준다.

```java
<welcome-file-list>
    <welcome-file>index.html</welcome-file>
    <welcome-file>index.htm</welcome-file>
    <welcome-file>index.jsp</welcome-file>
</welcome-file-list>
```

### 3. Dao 를 더 이상 스프링 context에서 사용X

---

- MemberDao.java <<interface>>
    
    ```java
    // Dao
    package com.kh.spring.member.model.dao;
    
    import org.apache.ibatis.annotations.Mapper;
    
    import com.kh.spring.member.model.dto.Member;
    
    @Mapper
    public interface MemberDao {
    
    	int insertMember(Member member);
    
    }
    ```
    
- member-mapper.xml
    
    ```java
    // member-mapper
    <mapper namespace="com.kh.spring.member.model.dao.MemberDao">
    ```
    

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a384bcb7_Untitled.png]]

- root-context.xml
    
    : mapper interface에 적힌 구현체를 만들어주는 역할
    
    - 구현체를 우리가 직접 관리하지 않지만 자동으로 만들어서 관리해준다는 말
    
    ```java
    <!-- @Mapper 인터페이스를 관리 -->
    <mybatis-spring:scan base-package="com.kh.spring.**.doo"/>
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fb3c7c25_Untitled.png]]
    
    : 이 이름으로 만들어서 관리하게 됨.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
