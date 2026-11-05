---
별칭:
  - "강의 - proxy server"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/ca418ea2c0b14b9eaa4a28c6908e8b4c
주제:
  - "[[00 - 대시보드/주제/서버·인프라|서버·인프라]]"
  - "[[00 - 대시보드/주제/Spring|Spring]]"
---

# 강의: proxy server

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b8712c42_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/2bd100e4_Untitled.png]]

#### 파싱없이 데이터 그대로 가져오기

---

> **DataController.java**
> 

```java
@Controller
@Slf4j
@RequestMapping("/data")
public class DataController {
	
	@Autowired
	DataService dataService;
	
	final String XML_URL = "https://shqkel.github.io/course.xml";
	
	@GetMapping("/xml/parseXml.do")
	public ResponseEntity<?> parseXml(){
		Resource resource = dataService.passXml(XML_URL);
		return ResponseEntity
				.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.TEXT_XML_VALUE)
				.body(resource); 
	}
}
```

- **Service.java**
    
```java
// 서비스 인터페이스
public interface DataService {
	Resource passXml(String xML_URL);
}

// 서비스 구현체
@Service
public class DataServiceImpl implements DataService {

	@Autowired
	ResourceLoader resourceLoader;
	
	@Override
	public Resource passXml(String url) {
		return resourceLoader.getResource(url);
	}

}
```


### JSON Data

> Document객체이용한 parsing
> 

1. DocumentBuilderFactory

2. DocumentBuilder

3. Document

Document#getElementsByTagName(tagName)

NodeList#item(index)

Node#textContent()

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4bffb645_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d76973ea_Untitled.png]]

#### #16. XmlMapper 의존추가

- jackson-dataformat-xml 의존 추가하고 사용
    
    [](https://mvnrepository.com/artifact/com.fasterxml.jackson.dataformat/jackson-dataformat-xml/2.13.3)
    
- jackson-datatype-jsr310 의존 추가 (jdk1.8 time패키지 이용하는 경우)
    
    [](https://mvnrepository.com/artifact/com.fasterxml.jackson.datatype/jackson-datatype-jsr310/2.13.3)
    

```xml
<!-- #16. XmlMapper 의존 -->
<dependency>
    <groupId>com.fasterxml.jackson.dataformat</groupId>
    <artifactId>jackson-dataformat-xml</artifactId>
    <version>2.13.3</version>
    <scope>compile</scope>
</dependency>
<dependency>
    <groupId>com.fasterxml.jackson.datatype</groupId>
    <artifactId>jackson-datatype-jsr310</artifactId>
    <version>2.13.3</version>
    <scope>compile</scope>
</dependency>
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
