---
별칭:
  - "강의 - if 문"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/ab173f93e244477d83f850de19fde3d0
---

# 강의: if 문

## 강의 내용

#### if문 - 조건식이 true면 실행코드 실행

```java
<표현식>

	if(조건식){
		실행코드
	}
```

![**조건식이 true면 if{실행코드} 실행 
false면 실행하지 않음.**](../../../../../attachments/e3582b4d-c431-414f-b95f-657378cb3790/Untitled.png)

**조건식이 true면 if{실행코드} 실행 
false면 실행하지 않음.**

```java
<입력 받은 정수가 양수일 때 "참참참"이 출력되게 하시오>

public void test1(){
	Scanner sc = new Scanner(System.in);
	System.out.print("정수 입력 : ");
	int n = sc.nextInt();
	if(n > 0) {
		System.out.println("참참참!"); //if문이 true일 때 출력
	}
	System.out.println("test1 끝"); //if문이 false일 때 출력
}
```

#### if ~ else 문

```java
<표현식>

	if(조건식){
		실행코드1
	}else{
		실행코드2
	}
```

![**조건식이 true면 if의 {실행코드1}을  실행
false면 else의 {실행코드2}을 실행**](../../../../../attachments/a117e05b-a49f-4d4f-90b7-427511c07664/Untitled.png)

**조건식이 true면 if의 {실행코드1}을  실행
false면 else의 {실행코드2}을 실행**

```java
public void test2(){
	int a = 3;

	if (a == 3) {
		System.out.println("참참참");
	}
	else{
		System.out.println("거짓거짓");
	}
}
//참이면 "참참참" 출력, 거짓이면 "거짓거짓" 출력
```

#### else if 문

```java
<표현식>

	if(조건식1){
		실행코드1
	}else if(조건식2){
		실행코드2
	}else{
		실행코드3
	}

->else 블럭은 생략가능
```

![**조건식1이 true면 if{실행코드1}실행
조건식1 false 면 else if {실행코드2} 실행 
조건식2도 false면 else{실행코드3} 실행**](../../../../../attachments/e5630c1c-343e-496d-bd3f-dd122640758a/Untitled.png)

**조건식1이 true면 if{실행코드1}실행
조건식1 false 면 else if {실행코드2} 실행 
조건식2도 false면 else{실행코드3} 실행**

```java
A: 90 ~ 100
B: 80 ~ 89
C: 70 ~ 79
D: 60 ~ 69
F: ~ 59

public void test3(){
	int n = 30;
	char grade = ' ', //char의 기본값

	if(n > 90) {
		grade = 'A';
	}
	else if(n > 80){
		grade = 'B';
	}
	else if(n > 70){
		 grade = 'C';
	}
	else if(n > 60){
		grade = 'D';
	}
	else{
		grade = 'F';
	}

	System.out.printf("점수 :%d, 학점 : %c%n", n, grade);
}

//결과 점수 : 30 , 학점 : F
```

#### multiple if {블럭} - 여러개의 if

```java
A: 90 ~ 100
B: 80 ~ 89
C: 70 ~ 79
D: 60 ~ 69

public void test3(){
	int n = 100;
	char grade = 'F', //char의 기본값

	if(n > 90) {
		grade = 'A'; //true -> grade F -> A
	}
	if(n > 80){
		grade = 'B'; //true -> grade A -> B
	}
	if(n > 70){
		 grade = 'C'; //true -> grade B -> C
	}
	if(n > 60){
		grade = 'D'; //true -> grade C -> D
	}

	System.out.printf("점수 :%d, 학점 : %c%n", n, grade);
}

//결과 점수 : 100 , 학점 : D
```

→ 개선코드

```java
public void test3(){
	int n = 100;
	char grade = 'F', //char의 기본값

	if(n > 90) {
		grade = 'A'; 
	}
	if(n > 80 && n < 90){
		grade = 'B';
	}
	if(n > 70 && n < 80){
		 grade = 'C';
	}
	if(n > 60 && n < 70){
		grade = 'D'; 
	}

	System.out.printf("점수 :%d, 학점 : %c%n", n, grade);
}

//결과 점수 : 100 , 학점 : A
```

- if.. else if 가 multiple if 보다 비교횟수가 적기 때문에 성능으로 치면 if... else if가 좋다.

#### 중첩된 if문

```java
public void test3(){
	int n = 87;
	String grade = 'F+', // 두글자 이상은 char대신 String으로 

	if(n > 90) {
		grade = 'A'; 
		
		if(n >= 95){
			grade += "+"; //grade = grade +  "+"
		}
	}
	if(n > 80){
		grade = 'B'; 

		if(n >=85){
			grade += "+";
		}
	}
	if(n > 70){
		 grade = 'C'; 

		if(n >=75){
			grade +="+";
		}
	}
	if(n > 60){
		grade = 'D'; 

		if(n >=65) {
			grade += "+";
		}
	}

	System.out.printf("점수 :%d, 학점 : %s%n", n, grade);
}

//결과 점수 : 87 , 학점 : B+
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/조건문 if,switch|조건문 if,switch]]
