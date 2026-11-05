---
별칭:
  - "강의 - 이클립스, Java프로그래밍,명명규칙"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/f22d2e24b7324298a2c0f02542459205
주제:
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 이클립스, Java프로그래밍,명명규칙

## 강의 내용

---

- 목차

---

## 🧐이클립스 이용한 코드작성 순서

1. project 만들기
2. package  만들기
3. class 만들기
4. 소스코드 작성
5. 컴파일 (ctrl + F11)
- [링크참조](https://hoonvalue.com/23)해서 순서 확인하기

---

## 🧐JAVA 프로그래밍 순서

#### java 프로그래밍 소스코드 작성 순서

1. 패키지 선언
2. 임포트 선언
3. 클래스 작성부
1) 멤버변수
2) 생성자 메소드
3) 멤버 메소드

```java
<소스코드 구조>

		//package명 작성
예) package com.kh.sample;
		//import선언
예) import java.util.Scanner;
		import java.util.*;
//class작성
		public class Sample
		{
			//블록범위
		}
```

- 자바 프로그램은 클래스에 선언된 메소드를 연달아 호출하며 실행된다.
- main메소드가 그 시작과 끝.  jvm이 main메소드를 호출
- main메소드의 모든 코드를 실행하면 프로그램은 종료된다.

```java
class내부에 main method 작성
public static void main(String[] args)
{
//블록범위
}
사용자 정의 method 작성
public void 메소드명 (매개변수)
{
//블록범위
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/b349a31a_Untitled.png]]

**class안에 여러개의 method가 실행되면서 프로그램이 돌아가는 것.**

#### 파일명에 따라 package,class,method 구분

```java
a.b.c.ABC.hello
	a.b.c -> package
	ABC -> class
	hello -> method
```

## 🧐import

#### 같은 package , 다른 package 호출

```java
<같은 package인 경우>

package com.kh.java._import;

public class ImportMain {
	public void static main(String[] args) {

	ImportMain main = new ImportMain(); //1. 객체생성
	main.test1(); //2. 메소드 호출

	Foo foo = new Foo(); //1. 객체생성
	foo.test2(); //2. 메소드 호출
	}

	public void test1() {
		system.out.println("안녕");
	}
}
// 같은 package안에 class파일명 : Foo가 존재한다는 가정하
```

```java
<다른 package인 경우, import문이 필요하다.>

package com.kh.java._import;

import com.kh.java._import.other.Bar;

public class ImportMain {
	public void static main(String[] args) {

	ImportMain main = new ImportMain(); //1. 객체생성
	main.test1(); //2. 메소드 호출

	Bar bar = new bar(); //1. 객체생성
	bar.test3(); //2. 메소드 호출
	}

	public void test1() {
		system.out.println("안녕");
	}
}
//다른 package안에 class파일명 : Bar 가 존재한다는 가정하
```

#### java api의 다른 클래스도 import문 작성 후 사용 가능

```java
package com.kh.java._import;

import java.util.Date;

public class ImportMain {
	public void static main(String[] args) {

	ImportMain main = new ImportMain(); //1. 객체생성
	main.test1(); //2. 메소드 호출

	Date date = new Date();
	System.out.println(date);
	
	}

	public void test1() {
		system.out.println("안녕");
	}
}

//결과 
안녕
현재 날짜 시간을 알려준다.
```

#### import예외 - import.java.lang.*

- 자주 사용하는 class들이 여기 있기 때문에 java에서 import없이 사용가능

```java
String str = new String("자바개발자")
System.out.println(str);

//결과 
자바개발자
```

---

## 🧐프로그램 권장규칙

#### 명명 권장 규칙

- 클래스 이름의 첫 글자는 항상 대문자로 한다 - 
변수와 메소드의 이름의 첫 글자는 항상 소문자로 한다
- 여러 단어인 이름은 단어의 첫 글자를 대문자로 한다
예) ageOfVampire,userName등 (Camel Case : 낙타표기법)
- 3.상수의 이름은 모두 대문자로 한다 . 여러 단어 이루어진 경우로 구분한다
예) PI, MAX_NUMBER, MIN_NUMBER 등

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
