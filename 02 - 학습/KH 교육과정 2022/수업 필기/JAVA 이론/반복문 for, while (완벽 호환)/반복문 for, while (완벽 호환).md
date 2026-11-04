---
별칭:
  - "강의 - 반복문 for, while (완벽 호환)"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/4805d482d7d54ef6af950835e696f0a6
---

# 강의: 반복문 for, while (완벽 호환)

## 강의 내용

- 수업내용 토대로 정리한 내용
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/for(초기식;조건식;증감식);|for(초기식;조건식;증감식);]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/while(무한반복용도)|while(무한반복용도)]]
    

---

## 📖목차

- while문
- do - while문
- for문
- foreach 반복문
- 중첩된 반복문
- continue문
- break문

---

#### 각 반복문의 쓰임

**`while 문`**

- 하나의 조건에 대해 반복수행이 이루어질때 사용
- 조건이 맞지 않으면 수행문이 수행되지 않음
- 주로 조건식이 true, false로 나타남

**`do - while문`**

- 하나의 조건에 대해 반복수행이 이루어질 때 사용
- 단, 수행문이 반드시 한번 이상 수행됨

**`for문`**

- 수의 특정 범위, 횟수와 관련한 반복수행에서 주로 사용
- 주어진 조건이 만족 할 때까지 수행문을 반복적으로 수행함
- while, do - while, for 문이 있음
- 조건의 만족과 반복 가능 여부에 대해 정확한 코딩을 해야함

## 🧐while문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/9e5a1387_Untitled.png]]

```java
int num = 0;
while (num < 4) {
    num++;
    System.out.println(num);
}
//결과
1
2
3
4
```

- 조건식이 참인 동안 수행문을 반복해서 수행

---

## 🧐do-while문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/25370cdf_Untitled.png]]

```java
int num = 0;
do {
    num++;
    System.out.println(num);
} while (num < 4);
//결과
1
2
3
4
```

- 먼저 수행문을 한 번 수행하고 조건식 체크
- 수행문이 반드시 한 번 이상 수행 되어야 하는 경우 사용

---

## 🧐for문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/a939e410_Untitled.png]]

```java
for (int num = 0; num < 4; num++) {
    System.out.println(num);
}

//결과
0
1
2
3
```

- 반복문 중 가장 많이 사용하는 반복문
- 주로 조건이 횟수인 경우에 사용
- 초기화식, 조건식, 증감식을 한꺼번에 작성
- 1. 증감 변수는 어떻게 변해가는가?
2. n번 반복할건가?

#### 무한반복

```java
for( ; ; ){
	 무한루프
}
```

#### 반복횟수를 동적으로 결정하기

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

---

## 🧐foreach 반복문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/a1fc0394_Untitled.png]]

```java
for (변수 : 배열 or 이터레이터) {
    // 반복 시킬 내용
}
```

- 배열의 경우 인덱스 0부터 배열의 끝까지 순차적으로 접근하여 배열의 값을 변수에 저장
- 이터레이터의 경우 자료구조의 끝까지 순차적으로 접근하여 자료구조의 원소를 변수에 저장

```java
int[] numArray = {10, 20, 30, 40};

for (int num : numArray) {
    System.out.println(num);
}
//결과
10
20
30
40
```

---

## 🧐중첩된 반복문

- 반복문 안에 또 다른 반복문을 중첩해서 사용하는 경우

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/3106570e_Untitled.png]]

**구구단의 예시**

- 내부 for문을 통해 내부 for문 조건식이 false가 될 때까지 실행 후 바깥 반복문을 실행한다.

---

## 🧐continue문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/d4762add_Untitled.png]]

- 반복문과 함께 쓰이며, 반복문 내부 continue문을 만나면 이후 반복되는 부분을 수행하지 않고 조건식이나 증감식을 수행함

---

## 🧐break문

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/45b2884e_Untitled.png]]

- 반복문에서 break 문을 만나면 더 이상 반복을 수행하지 않고 반복문을 빠져 나옴
- 중첩된 반복문 내부에 있는 경우 가장 가까운 반복문 하나만 빠져 나옴 아래의 경우 내부 반복문만 빠져 나옴

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/for(초기식;조건식;증감식);|for(초기식;조건식;증감식);]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/while(무한반복용도)|while(무한반복용도)]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
