---
별칭:
  - "강의 - Random"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/db973833f91f4fa585ee1b29ce1d83c9
---

# 강의: Random

## 강의 내용

### 1. java. util.Random 클래스 사용

- import java.util.Random; 임포트문 작성

```java
Random rnd = new Random();
System.out.println(rnd.nextInt()); //int 범위내에 난수를 반환

<1 ~ 10까지의 난수를 얻고 싶을 때>
//nextInt(경우의 수) + 시작 값
System.out.println(rnd.nexInt(10) + 1); // (0 ~ 9) + 1(1부터시작)
// 5 ~ 10 
System.out.println(rnd.nextInt(6) + 5); // (0 ~ 5) + 5 -> 5 ~ 10
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/5eaf17c6_Untitled.png]]

```java
<0.0 이상 1.0 미만의 실수를 반환>
System.out.println(rnd.nextDouble());

<true , false 임의로 반환>
System.out.println(rnd.boolean() ? "안녕" : "잘가");

<임의의 알파벳 대문자 출력하기>
System.out.println((char)(rnd.nextInt(26) + 65));
System.out.printf("%c".rnd.nextInt(26) + 65);
```

### 2. Math.random() 메소드 사용 → double반환

- 0.0 이상 1.0 미만의 실수를 반환
- import문 없이 사용가능

```java
System.out.println((int)(Math.random() * 경우의 수) + 최소값);

double n = Math.Random();

<1 ~ 10 사이의 난수 생성>
System.out.println((int)(n * 10) + 1);

<임의의 알파벳 대문자 출력하기>
System.out.printf("%c%n",(int)(n * 26) + 'A');
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
