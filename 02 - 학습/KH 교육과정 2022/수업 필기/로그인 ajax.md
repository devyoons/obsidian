---
별칭:
  - "강의 - 로그인 ajax"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/1dd302360f1449ddb4a675641f6bc955
주제:
  - "[[00 - 대시보드/주제/jQuery·Ajax|jQuery·Ajax]]"
  - "[[00 - 대시보드/주제/웹 기능 구현|웹 기능 구현]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 로그인 ajax

## 강의 내용

---

---

### json 보내는 방법 2가지

---

#### 1. ajax1 :BeanNameViewResolver + jsonView(#14)

- #14 (pom.xml)
    
```xml
<!-- #14. jsonView 의존 -->
<dependency>
    <groupId>net.sf.json-lib</groupId>
    <artifactId>json-lib-ext-spring</artifactId>
    <version>1.0.2</version>
</dependency>
```

- #14.1 - 2 jsonView 빈 등록(servlet-context)
    
```xml
<!-- #14.1 jsonView빈 등록 -->
<beans:bean id="jsonView" class="net.sf.json.spring.web.servlet.view.JsonView">
	<beans:property name="contentType" value="application/json; charset=utf-8"/>
</beans:bean>

<!-- #14.2 BeanNameViewResolver 등록 -->
<beans:bean id="beanNameViewResolver" class="org.springframework.web.servlet.view.BeanNameViewResolver">
	<beans:property name="order" value="1"/><!-- InternalResourceViewResolver보다 우선처리 -->
</beans:bean>
```


**jsonView** 

- model에 저장된 속성을 json으로 변환, 응답메세지에 작성
- json으로 처리해주세요하는 코드고 거기로 보내는 요청임.

```java
@GetMapping("/checkIdDuplicate.do")
	public String checkIdDuplicate(@RequestParam String memberId, Model model) {
		try {
			Member member = memberService.selectOneMember(memberId);
			boolean available = member == null;
			
			model.addAttribute("memberId", memberId);
			model.addAttribute("available", available);
			
		}catch (Exception e) {
			log.error("중복 아이디 체크 오류", e);
			throw e;
		}
		
		return "jsonView";
	}
```

- servlet-context 이걸 사용해서 view로 보냈었음.
    
```java
<beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
```


<aside>
📌 1. beanNameViewResolver 먼저 찾음
2. internalResourceViewResolver

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5d91d88b_Untitled.png]]

#### 2. ajax2 :@ResponseBody + MessageConverter (#15.1-2)多

- 리턴객체를 특정타입(json)으로 변환해주는 빈 - jackson

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f7e50eb4_Untitled.png]]

- #15. MessageConvert의 json처리용 빈
    
```xml
<!-- #15. MessageConvert의 json처리용 빈 -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.9.5</version>
</dependency>
```

- #15.1 jacksonMessageConverter
    
```xml
<beans:bean id="jacksonMessageConverter" class="org.springframework.http.converter.json.MappingJackson2HttpMessageConverter"/>
```

- #15.2 @ResponseBody 처리를 위한 MessageConverter 등록 [생략가능]
    - interface를 보고 알아서 찾아감.
    - spring 5.x에 버전에 와서 생략가능.
        - annotation-driven에 의해서 자동처리
    
```xml
<!-- #15.2. @ResponseBody 처리를 위한 MessageConverter 등록 -->

<beans:bean class="org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter">
	<beans:property name="messageConverters">
		<beans:list>
			<beans:ref bean="jacksonMessageConverter"/>
		</beans:list>
	</beans:property>
</beans:bean>
```


`@ResponseBody` 

- 핸들러의 리턴객체를 직접 응답메세지에 출력

```java
@GetMapping("/checkIdDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkIdDuplicate2(@RequestParam String memberId, Model model) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(memberId);
			boolean available = member == null;
			
			map.put("memberId", memberId);
			map.put("available", available);
			
		}catch (Exception e) {
			log.error("중복 아이디 체크 오류", e);
			throw e;
		}
		
		return map;
	}
```

#### 3. ajax3 : ResponseEntity<?>多

**: api 서버만들 때 많이 사용함!**

- 응답메세지 작성을 도와주는 객체
- status, header, body 자유롭게 작성가능
    - `ResponseEntity<?>` : 응답메세지 body 에 작성해줌!
- @ResponseBody 포함
- 기본적으로 json에 반환

```java
@GetMapping("/checkIdDuplicate.do")
	public ResponseEntity<?> checkIdDuplicate3(@RequestParam String memberId) {
		Map<String, Object> map = new HashMap<>();
		try {
			Member member = memberService.selectOneMember(memberId);
			boolean available = member == null;
			
			map.put("memberId", memberId);
			map.put("available", available);
			
		}catch (Exception e) {
			log.error("중복 아이디 체크 오류", e);
			throw e;
		}
		
//		return ResponseEntity.ok(map); // 200 + body에 작성할 맵
// 상태코드, 응답값
		return ResponseEntity
					.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
	}
```

```java
public ResponseEntity<?> checkIdDuplicate3(@RequestParam String memberId) {
		Map<String, Object> map = new HashMap<>();
		try {
			
			if(true)
				throw new RuntimeException("중복아이디 체크 오류!");
			
			Member member = memberService.selectOneMember(memberId);
			boolean available = member == null;
			
			map.put("memberId", memberId);
			map.put("available", available);
			
		}catch (Exception e) {
			log.error("중복 아이디 체크 오류", e);
//			throw e;
			
			map.put("error", e.getMessage());
			map.put("msg", "이용에 불편을 드려 죄송합니다.");
			
			return ResponseEntity
					.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
		}
		
//		return ResponseEntity.ok(map); // 200 + body에 작성할 맵
		return ResponseEntity
					.status(HttpStatus.OK)
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_UTF8_VALUE)
					.body(map);
	}
```

- ResponseEntity가 없을 때 @ResponseBody 로 작성하면 거의 흡사! 대신 아래 코드가 header에 작성하기 번거로울 뿐
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f77b714f_Untitled.png]]
    

### 4. ajax3 방식이 api에서 자주 사용 → 서버내에 api생성해보기

- ajax3 api구조
    - url이 다른….
    - movie api 단순조회 용도 기능제공
        - 우리것도 얼마든지 가능하다는 것
    - data만 돌려주면 됀다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a3e96b72_Untitled.png]]
    

#### RestAPI : Representational State Transfer

- 요청 성격별로 전송방식을 결정해서 사용하는 서비스
    - c : POST
    - r : GET
    - u : PUT/PATCH
    - d : DELETE
- url 작성시에 몃아형으로 계층구조를 갖도록 작성

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b3ac2bc4_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/bbd9dadd_Untitled.png]]

- 좌측보다 더 세분화한것.
- url은 동일한데 요청성격은 다름!
- url을 save하는 효과가 있음

`ResponseEntity<T>` : body에 작성할 자바타입

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
