---
별칭:
  - "학습 - API RestTemplate , WebClient"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/17324612498b8081b61de043095ae140
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 학습: API RestTemplate , WebClient

## 세부 내용

---

---

결론 : Spring 5 이후부터 WebClient를 사용하는 것으로 권장

### RestTemplate

---

```jsx
@RestController
public class TestController {
    @GetMapping("/test")
    public String getTest() {
        return "Hello TestRestTemplate!";
    }
}

@Test
public void testRestTemplateExample() {
    TestRestTemplate restTemplate = new TestRestTemplate();
    String response = restTemplate.getForObject("http://localhost:8080/test", String.class);
    System.out.println("Response: " + response); // 출력: Hello TestRestTemplate!
}

```

Spring Framework에서 제공하는 **TestRestTemplate**은 RESTful API를 테스트할 때 사용되는 도구입니다. 주로 **동기 방식**으로 동작하며, REST API에 요청을 보내고 응답을 받는 과정을 간단하게 처리할 수 있습니다.

- 동기 방식: 요청을 보내면 **응답이 올 때까지 기다림**. 다른 작업은 그동안 멈춘 상태.
- 주로 테스트 환경에서 사용되며, 간단한 테스트를 빠르게 작성할 때 유용.

#### 특징

- **동기적**으로 동작하여 사용이 간단.
- 주로 **단위 테스트**나 **통합 테스트**에서 REST API의 동작 확인에 적합.
- 기본적으로 HTTP 요청을 쉽게 작성할 수 있는 템플릿 메서드를 제공.

#### 장점

- 사용이 간단하고 직관적임.
- 동기 방식이므로 디버깅이나 테스트 결과 확인이 쉬움.

#### 단점

- 비동기 처리나 높은 트래픽 환경에는 적합하지 않음.
- 동기 방식이라 요청 대기 시간이 길어질 경우 성능에 영향이 있음.

### WebClient

---

```jsx
@RestController
public class WebClientController {
    private final WebClient webClient = WebClient.create();

    @GetMapping("/fetch")
    public Mono<String> fetchData() {
        return webClient.get()
                        .uri("https://jsonplaceholder.typicode.com/posts/1")
                        .retrieve()
                        .bodyToMono(String.class); // 비동기로 데이터 가져오기
    }
}

public void webClientExample() {
    WebClient webClient = WebClient.create();
    
    webClient.get()
             .uri("https://jsonplaceholder.typicode.com/posts/1")
             .retrieve()
             .bodyToMono(String.class)
             .subscribe(response -> System.out.println("Response: " + response)); // 응답 처리
}

```

Spring WebFlux에서 제공하는 **WebClient**는 RESTful API 호출에 사용하는 **비동기** 및 **비차단** 방식의 도구입니다.

- 비동기: 요청을 보내고 **응답을 기다리지 않고 다른 작업 수행 가능**.
- 비차단: 응답을 기다리는 동안에도 다른 요청을 동시에 처리할 수 있도록 시스템 리소스를 효율적으로 사용.

#### **특징**

1. **비동기/비차단** 방식으로 동작.
2. 대규모 트래픽을 처리하거나 느린 외부 API와 통신할 때 유리.
3. Flux, Mono와 같은 **Reactive Streams**를 지원하여 **반응형 프로그래밍**에 적합.

<aside>
💡

**비차단이란?**

- 요청을 보낸 후 응답이 올 때까지 작업을 멈추지 않고 다른 작업을 병렬로 처리함.
- CPU와 메모리 등 시스템 리소스를 효율적으로 활용 가능.
</aside>

#### **장점**

- 대규모 비동기 요청 처리에 강력.
- 리소스 사용이 효율적(특히 I/O 작업).
- 비차단 방식으로 높은 성능 제공.

#### **단점**

- 초기 학습 곡선이 존재(사용법이 TestRestTemplate보다 복잡).
- 디버깅이 동기 방식보다 어려울 수 있음.

#### **TestRestTemplate과 WebClient 비교**

| 특징 | TestRestTemplate | WebClient |
| --- | --- | --- |
| spring | 3.0 부터 | 5.0 부터  |
| **방식** | 동기 | 비동기/비차단 |
| **용도** | 단위 테스트, 간단한 작업 | 고성능 API 호출, 비동기 작업 |
| **복잡성** | 간단함 | 복잡함 |
| **성능** | 느린 응답 처리 시 비효율적 | 대규모 요청 처리에 적합 |

#### **현재 추천 사용법**

- **테스트 환경:** `TestRestTemplate` 사용.
    - 단순한 테스트를 작성할 때 적합.
- **프로덕션 환경:** `WebClient` 사용.
    - 대규모 API 호출이나 외부 서비스와 통신할 때 추천.

## 관련 노트

- 상위: [[02 - 학습/IT/공부기록/공부기록/SpringBoot/SpringBoot|SpringBoot]]
