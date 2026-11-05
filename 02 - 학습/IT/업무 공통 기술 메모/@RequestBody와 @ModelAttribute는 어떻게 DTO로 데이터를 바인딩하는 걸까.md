---
별칭:
  - "학습 - @RequestBody와 @ModelAttribute는 어떻게 DTO로 데이터를 바인딩하는 걸까?"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/12eeaf6a3a1c469ba144ad1b7247df54
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 학습: @RequestBody와 @ModelAttribute는 어떻게 DTO로 데이터를 바인딩하는 걸까?

## 세부 내용

---

### Http request 데이터를 보내는 방식 이해하기

![[02 - 학습/IT/업무 공통 기술 메모/첨부/8b6a8580_Untitled.png]]

1. JSON
    - JSON 타입의 데이터를 받아오고, JSON 타입으로 응갑하는 방식은 Restful API에서 많이 사용하는 방식이다.
    - JSON 데이터는 보통 다음과 같이 요청이 들어온다.
    
```jsx
POST /login HTTP/1.1

Content-Type: application/json
{
	"id" : "dallae",
  "pwd" : "dallae1234!@#$"
}
```

클라이언트는 위처럼**Http Body**에 **application/json 타입**으로 서버에 데이터를 전달한다.

이때, 서버는 요청된 **Http Body**를 읽어서 데이터를 가져와야 하므로 `@RequestBody`를 통해 읽어올 수 있다. 

2. Http Parameter
    - Parameter 방식은 **URL에 그대로 노출하여 데이터를 전송**한다.
    - 즉, URL 주소에 필요한 데이터를 포함하고 있기 때문에 Http Body를 조회할 필요가 없다.
    1. QueryString 
        - 쿼리 스트링은 주소 뒤에 **`?`** 를 시작으로 **`&`** 로 구분하여 데이터를 전송하는 방식이다.
    
```jsx
POST /login?id=aaa&pw=123!
```

1. Path
    - Path는 주소 뒤 `/` 이후 데이터를 전송한다

```jsx
GET /post/1
```

1. form
    - form은 get과 post방식이 각각 데이터를 다른 방식으로 보내게 된다.

    1. GET 
        - get방식으로 form데이터를 전송하면 form의 내용을 쿼리스트링으로 바꾸어 URL에 데이터를 담아 서버로 전송한다.

```jsx
GET /login?id=aaa&pw=123!
```


1. POST
- post방식으로 form데이터를 전송하면 Http body에 application/x-www-urlencoded타입으로 전송하게 된다.
- URL이 아닌 Http Body에 x-www-urlencoded형태로 데이터를 전송한다는 점은 다르지만 보내는 데이터의 모양은 쿼리스트링 형태이다.

```jsx
POST /login HTTP/1.1

Content-Type : application/x-www-urlencoded
id=aaa&pwd=123!
```


---

### 그렇다면, 서버는 전송된 데이터를 어떻게 받아올까?

#### 역직렬화

서버는 클라이언트가 보낸 데이터를 받아와서 처리할 수 있도록 객체로 변환하는 과정이 필요하다

ex) JSON 데이터 → Java DTO클래스

이처럼 데이터를 객체로 매핑하는 과정을 역직렬화라고한다. (반대는 직렬화)

이러한 과정도 그 데이터가 json 타입인지, 쿼리스트링인지, form 데이터인지에 따라 달라진다.

#### 1. Json : `@RequestBody`

Json 데이터는 Http body를 통해 전송되기 때문에 `@RequestBody`를 사용한다.

`@ReqeustBody` 는 Http body를 읽어와서 jackson라이브러리를 통해 Json 객체를 DTO와 매핑시킨다.

```java
@PostMapping("/")
public ResponseEntity Login(@RequestBody RequestDto request){...}
```

1. DTO 매핑

```java
@NoArgsConstructor
@Getter
public class RequestDto {
	private String id;
    private String pwd;
}
```

Spring은 Json데이터를 역직렬화/직렬화 할 때 `Jackson라이브러리` 의 `ObjectMapper`를 사용한다.

`Jackson 라이브러리` 가 역직렬화 할때,

DTO클래는 생성자가 필요하고,  getter또는 setter로 데이터를 바인딩한다.

기본적으로 setter보다 getter를 통해 접근/수정하기 때문에 getter사용을 권장한다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
