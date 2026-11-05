---
별칭:
  - "강의 - String클래스"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/71b9825acdf04cd79f95d37c72999f83
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: String클래스

## 강의 내용

### String은 참조형이지만, 기본형처럼 사용가능한 유일한 타입

1. String클래스는 char[]와 메서드(기능)를 결합한 것

```java
string클래스 = char[] + 메서드(기능)
```

1. String클래스는 내용을 변경할 수 없다. (read only)
- 값 (literal) 을 직접 대입하는 형태로 사용가능

```java
public void stringTest() {
	String s1 = "기차"; //문자열 리터럴 - 싸따옴표로 감싸서 표현
	String s2 = new String ("기차"); //객체 레시피 사용 안해도 가능

//결과
System.out.println(s1); // 기차
System.out.println(s2); // 기차

<문자열 더하기 연산을 지원>
	s1 = s1 + "칙칙폭폭";
	s2 = s2 + "칙칙푹푹";
//결과
System.out.println(s1); // 기차칙칙폭폭
System.out.println(s2); // 기차칙칙푹푹

String s3 = s1 + " " + s2;
System.out.println(s3); // 기차칙칙폭폭 기차칙칙푹푹

<연산 순서에 따른 결과>
String s4 = 1 + 2 + 3 + s1;
String s5 = s1 + 1 + 2 + 3;

System.out.println(s4); // 6기차칙칙폭폭 , 6 + s1 
System.out.println(s5); // 기차칙칙폭폭123 , s1 + 1,2,3 (문자열)
}
```

| 메서드 | 설명 |
| --- | --- |
| char charAt(int index) | 문자열에서 해당 위치(index)에 있는 문자를 반환한다. |
| int length() | 문자열의 길이를 반환한다. |
| String substring(int form, int to) | 문자열에서 해당 범위 (from ~ to)의 문자열을 반환한다. (to는 포함안 됨) |
| boolean equals(Object obj) | 문자열의 내용이 같은지 확인한다. 같으면 결과는 true, 다르면 false |
| char[] toCharArray() | 문자열을 문자배열(char[])로 변환해서 반환한다. |

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/fb39255b_Untitled.png]]

**charAt(index)**

```java
<charAt()>
String str = "ABCDE";
char ch = str.charAt(3);
System.out.println(ch); //D

<length>
str.length = 5

<substring>
String str = "012345";
String tmp = str.substring(1,4); // str 에서 index범위 1 ~ 4의 문자들을 반환(to제외)
System.out.println(tmp); //123
String tmp2 = str.substring(1); //to생략하면 배열끝까지 나옴 
String tmp3 = str.substring(1, str.length()); //to생략하는것과 의미가 같다.
System.out.println(tmp2); //1234
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
