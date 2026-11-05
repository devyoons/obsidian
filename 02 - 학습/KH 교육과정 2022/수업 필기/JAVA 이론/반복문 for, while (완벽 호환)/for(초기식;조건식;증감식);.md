---
별칭:
  - "강의 - for(초기식;조건식;증감식);"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/43efe3a5246d4b19a79fb28880807674
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: for(초기식;조건식;증감식);

## 강의 내용

```java
for(초기식;조건식;증감식){
		//실행코드
}
```

```java
1. 증감 변수는 어떻게 변해가는가?

2. n번 반복할건가?
```

- 초기식 : for문 실행시 처음에 한번만 실행. 증감변수를 초기화 / for(int i = 0; 조건식 ; 증감식)
- 조건식 : boolean으로 평가될 연산. true이면 블럭을 실행, false면 반복문 중지/탈출
- 증감식 : 블럭실행이후 증감변수에 대한 증감식. 매턴의 마지막에 실행

**순서 : 초기실 → 조건식 →실행코드 → 증감식 →조건식 → 실행코드 → 증감식**

```java
	public void test(){
		for(int i = 0; i < 3; i++){
			System.out.println("Hello World" + i);
		}
	}

//결과 -> i가 3이되면 false가 되면서 반복문 중지/탈출
Hello World 0
Hello World 1
Hello World 2
```

```java
<실습예제1>
//1,3,5,7,9,10,13,15,17,19
public void test1(){
	for(int i = 1; i < 20; i = i + 2){
		System.out.println(i);
	}
}
```

```java
<실습예제1 if문사용>
//1,3,5,7,9,10,13,15,17,19
public void test1(){
	for(int i = 1; i <= 20; i++){
		if( i % 2 != 0) {
			System.out.println(i);
		}
	}
}
```

```java
<실습예제2>
// 10 9 8 7 6 5 4 3 2 1
public void test2(){
	for(int i = 10; i > 0; i--){
		System.out.print(i + " ");
	}
}
```

```java
<실습예제3>
// 20 18 16 14 12 10 8 6 4 2
public void test3(){
	for(int i = 20; i > 0; i -= 2){
		System.out.print(i + " ");
	}
}
```

```java
<실습예제4>
// 5 6 7 8 9
public void test4(){
	for(int i = 5; i < 9; i++){
		System.out.print(i + " ");
	}
}
```

```java
<실습예제5>
// 구구단 8단
public void test5(){
	for(int i = 1; i < 9; i++){
		System.out.print("8 * %d = %d%n", i, 8 * i);
	}
}
```

## 반복횟수를 동적으로 결정하기

#### 1. limit 변수를 지정

```java
<1. limit 변수를 지정. 실습예제>

public void test1(){
	Scanner sc = new Scanner(System.in);
	System.out.print("이름 : ");
	String name = sc.next();
	System.out.print("횟수 : ");
	int cnt = sc.nextInt();

	for(int i = 0; i < cnt; i++) {
		System.out.println(name);
	}
}
```

#### 2. 무한반복해두고, 사용자가 반복중지를 결정

```java
<2. 무한반복 실습예제1>

public void test2(){
	for(;;) {//무한반복
		System.out.println(123);
	}
}

//결과 123 이 무한으로 계속 출력된다.
```

```java
<2. 무한반복해두고, 사용자가 반복중지를 결정. 실습예제2>

public void test3(){
	Scanner sc = new Scanner(System.in);

	for(;;) {//무한반복
		System.out.println(123);

		System.out.print("계속 하시겠습니까? (y/n) : "); 
		char yn = sc.next().charAt(0); //blocking
		if(yn == 'n')
			break; //for블럭을 중지/탈출
	}
	System.out.print("끝");
}

//결과 
123
계속 하시겠습니까? (y/n) : (사용자입력)n
끝
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/반복문 for, while (완벽 호환)|반복문 for, while (완벽 호환)]]
