---
별칭:
  - "강의 - Spring Boot"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/b20d6e975fc74f6fb4c1db29320885fa
---

# 강의: Spring Boot

## 강의 내용

---

---

## Spring Boot

[[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/springboot.txt|springboot.txt]]

### 1. Spring Boot Project 생성하기

---

1. 웹에서 다운로드 하는 방법

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/첨부/6be729f2_Untitled.png]]

- spring boot dev tools 필수로 받아야함 ~ 리로드 같은 기능임
1. STS에서 프로젝트 생성

![[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/첨부/3d9cf88d_Untitled.png]]

![maven project
jar 
java version 11
package 명 설정](../../../attachments/133cb10d-3261-472d-9f02-7b291e92f963/Untitled.png)

maven project
jar 
java version 11
package 명 설정

![spring boot devtools
lombok
mybaties
orcle driver
spring web](../../../attachments/a357a562-4043-4c71-8e03-be1e101faed6/Untitled.png)

spring boot devtools
lombok
mybaties
orcle driver
spring web

```java
package com.kh.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 
 * @Configuration
 * @EnableAutoConfiguration - 자동으로 context 구성
 * @ComponentScan - 현재 패키지 하위의 @Component를 빈으로 등록
 *
 */
@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}
```

- HelloSpringbootApplication.java
    
    ```java
    package com.kh.spring;
    
    import org.springframework.boot.SpringApplication;
    import org.springframework.boot.autoconfigure.SpringBootApplication;
    
    /**
     * 
     * @Configuration
     * @EnableAutoConfiguration - 자동으로 context 구성
     * @ComponentScan - 현재 패키지 하위의 @Component를 빈으로 등록
     *
     */
    @SpringBootApplication
    public class HelloSpringbootApplication {
    
    	public static void main(String[] args) {
    		SpringApplication.run(HelloSpringbootApplication.class, args);
    	}
    
    }
    ```
    
- application.properties
    
    ```java
    server.servlet.context-path=/springboot
    server.port=10000
    ```
    
- indexController.jave
    
    ```java
    package com.kh.spring;
    
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.GetMapping;
    import org.springframework.web.bind.annotation.ResponseBody;
    
    import lombok.extern.slf4j.Slf4j;
    
    @Controller
    @Slf4j
    public class indexController {
    
    	@GetMapping("/")
    	@ResponseBody
    	public String index() {
    		return "<h1>hello, springbooooooot!</h1>";
    	}
    }
    ```
    

### 2. boot 의 view단 (thymeleaf, velocity, mustache)

---

- 부트에서는 jsp를 사용하지 않는다. 수업은 일단 jsp로 진행
- 
- jsp를 사용하기 위한 기초 설정
    1. src/main/webapp/WEB-INF/views/common
    2. common에 헤더 푸더 추가
    3. webapp 하위에 index.jsp 추가
    4. resources 추가
    5. pom.xml 에 dependency 추가
        
        ```xml
        <!-- #1. jsp를 view단으로 사용하기 위한 의존 -->
        	<dependency>
                <groupId>javax.servlet</groupId>
                <artifactId>jstl</artifactId>
            </dependency>
        
            <dependency>
                <groupId>org.apache.tomcat.embed</groupId>
                <artifactId>tomcat-embed-jasper</artifactId>
                <scope>provided</scope>
            </dependency>
        ```
        

## rest api 개요

---

[[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/REST API|REST API]]

- 철저하게 요청을 HTML이 포함되어있지 않고 **data로 응답**
- REST 는 @RestController : @Controller + 모든 핸들러에 @ResponseBody 추가

- **db연결시 mybatis 설정하기 —> application.properties**
    
    ```xml
    server.servlet.context-path=/springboot
    server.port=10000
    
    # datasource
    spring.datasource.url=jdbc:orcle:thin:@localhost:1521:xe
    spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
    spring.datasource.username=spring
    spring.datasource.password==spring
    
    # mybatis
    mybatis.configuration.jdbc-type-for-null=NULL
    mybatis.configuration.map-underscore-to-camel-case=true
    mybatis.type-aliases-package=com.kh.spring
    mybatis.mapper-locations=classpath*:mapper/**/*-mapper.xml
    
    # loggin - logback
    logging.level.com.kh.spring=DEBUG
    ```

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/REST API|REST API]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/Spring Boot/springboot.txt|springboot.txt]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
