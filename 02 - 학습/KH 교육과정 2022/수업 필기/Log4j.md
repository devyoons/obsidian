---
별칭:
  - "강의 - Log4j"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/5265d9909196477c919e12a40b89a3e3
---

# 강의: Log4j

## 강의 내용

---

---

#### logging framwork

- 로그의 효율적 관리가 가능
- 출력형식 콘솔/파일 등으로 지정
- sysout 사용을 지양할 것
- **레벨값에 따라 로깅할지 말지 결정 가능**

```java
package com.kh.spring.logging;

import org.apache.log4j.Logger;

public class Log4jTest {

	private static final Logger log = Logger.getLogger(Log4jTest.class);
	
	public static void main(String[] args) {
		log.fatal("FATAL Message");
		log.error("ERROR Message");
		log.warn("WARN Message");
		log.info("INFO Message");
		log.debug("DEBUG Message");
		log.trace("TRACE Message");
	}

}
```

- trace 로 설정시
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/65165c9e_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/bd60ed6d_Untitled.png]]
    
- info 로 설정시
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/baf17659_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3948a363_Untitled.png]]
    

#### log4j 레벨

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/22a63ea3_Untitled.png]]

1. FATAL 아주 심각한 에러
2. ERROR 요청중 오류발생
3. WARN 프로그램 현재 실행에는 문제가 없지만, 향후 문제가 될 수 있는 코드
4. INFO 단순 정보성 메세제. 상태변경등.
5. DEBUG 개발용도의 로깅에만 사용
6. TRACE 디버그 하위에서 실행단위 추적시 사용

- import시 log4j가 없는 이유 : pom.xml runtime 설정
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9e7008ed_Untitled.png]]
    
    <exclusion> : 특정 패키지에서 사용하지 않겠다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6a99019a_Untitled.png]]
    
    : 컴파일때는 사용하지 않고 런타임할 때 사용하겠다는 뜻. 그래서 실행시에만 필요했던거였고 그래서 안나옴.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a1ab714b_Untitled.png]]
    

`additivity="true”`

- `<appender-ref ref="console" />` : console을 대상으로 출력
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e80446c5_Untitled.png]]
    
```java
<appender name="console" class="org.apache.log4j.ConsoleAppender">
		<param name="Target" value="System.out" />
		<layout class="org.apache.log4j.PatternLayout">
			<param name="ConversionPattern" value="%-5p: %c - %m%n" />
		</layout>
	</appender>
```

- 내부적으로 sysout을 사용하지만 얘가 쓰는지 내가 쓰는지에 대한 차이가 있다.

### PatternLayout

---

```java
* %c : 카테고리명(logger이름)을 표시
    * 카테고리명이 hello.world.logger일때, %c{2}는 world.logger를 출력
* %C : 클래스명을 표시함.    
    * 풀 클래스 명이 com.kh.logger일때, %C{2}는 kh.logger를 출력
* %d : 로그 시간을 출력한다. java.text.SimpleDateFormat에서 적절한 출력 포맷을 지정할 수 있다. 
    * %d{HH:mm:ss, SSS}
    * %d{yyyy MMM dd HH:mm:ss, SSS}
    * %d{ABSOLUTE} 
    * %d{DATE} 
    * %d{ISO8601}
* %F : 파일명을 출력. 로그시 수행한 메소드, 라인번호가 함께 출력된다.
* %l : 로깅이 발생한 caller의 위치정보.메소드명 (자바파일명:라인번호) - 링크제공
* %L : 라인 번호만 출력한다(링크없음)
* %m : 로그로 전달된 메시지를 출력한다.
* %M : 로그를 수행한 메소드명을 출력한다. 
* %n : 플랫폼 종속적인 개행문자가 출력. rn 또는 n
* %p : 로그 이벤트명등의 priority 가 출력(debug, info, warn, error, fatal )
* %r : 로그 처리시간 (milliseconds)
* %t : 로그이벤트가 발생된 쓰레드의 이름을 출력
* %% : % 표시를 출력. escaping
* %r : 어플리케이션 시작 이후 부터 로깅이 발생한 시점의 시간(milliseconds)
* %X : 로깅이 발생한 thread와 관련된 MDC(mapped diagnostic context)를 출력합니다. %X{key} 형태.
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b4145c30_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/349ce9b3_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9eddc540_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/043297cf_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7ed1e9bb_Untitled.png]]

ModelAndView : Model + View

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
