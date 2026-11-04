---
별칭:
  - "학습 - JDBC 연동 확인"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/a91370b0627c4c77bdc031818ff925bd
---

# 학습: JDBC 연동 확인

## 세부 내용

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/1.png]]

<u>src/test/java</u> 하위 폴더 

<u>com.tmi.sprig.JDBCTest.java</u> 접속

## pom.xml JUnit 의존 필요

- 현재 우리 코드에 포함되어 있음 (262 ~ 268 Line)

```xml
<!-- Test -->
<dependency>
	<groupId>junit</groupId>
	<artifactId>junit</artifactId>
	<version>4.7</version>
	<scope>test</scope>
</dependency>
```

## JDBCTest.java

- @Test 어노테이션 JUnit4 라이브러리 추가 등록 필요
    
    ![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/6.png]]
    

```java
package com.tmi.spring;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try(Connection con = 
				DriverManager.getConnection(
                // Oracle19 버전인 경우 => "jdbc:oracle:thin:@localhost:1521:orcl"
                // Oracle11 버전인 경우 => "jdbc:oracle:thin:@localhost:1521:XE"
						"jdbc:oracle:thin:@tmi_medium?TNS_ADMIN=C:/Wallet/Wallet_TMI",
						"admin",
						"TMItmi12345678")){
			System.out.println(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
		
	}
}
```

## JUnit

Window → Show View → Other → JUnit 검색후 Open

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/2.png]]

### JUnit 실행

우클릭 → Run As → JUnit Test

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/3.png]]

## 실행 성공시 실행되는 창

#### JUnit

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/4.png]]

#### Console

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/5.png]]

## 오류

- 콘솔창에 에러 또는 아무런 내역 출력 되지 않음 → 오류
- JUnit 빨간불 → 오류
- 실행이 안됨 또는 너무 오래걸림 → 오류

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/TMI (Travel Making Imagine)|TMI (Travel Making Imagine)]]
