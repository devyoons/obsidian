---
별칭:
  - "강의 - 조건문 if,switch"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/b7086fa6bbf54492b57d1821ec27e22c
---

# 강의: 조건문 if,switch

## 강의 내용

- 수업내용 토대로 정리한 내용
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/if 문|if 문]]
    
    [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/switch|switch]]
    

---

## 📖목차

- if문과 if - else문
- if - else if - else문
- 조건문과 삼항연산자(조건 연산자)
- switch - case문
- break문의 역할

---

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/첨부/5c7aec68_Untitled.png]]

- 조건에 따라 다른 문장을 선택할 수 있도록 프로그래밍 하는 것
- 수행할 문장을 {블럭}으로 묶어서 나타낸다

## 🧐if 문과 if - else문

```java
if(조건식) {
	수행문; //조건식이 참일 경우에 이 문장을 수행
}
```

```java
if(조건식) {
	수행문1 //조건식이 참일 경우에 이 문장을 수행
}
else{
	수행문2 //조건식이 거짓일 경우에 이 문장을 수행
}
```

```java
int age = 10;

if(age >= 8){
	System.out.println("학교에 다닙니다.");
}
else{
	System.out.println("학교에 다니지 않습니다.");
}
//결과 age가 8이상이면 true로 수행문1이 수행되므로 , "학교에 다닙니다"가 출력된다
```

---

## 🧐if - else if - else문

```java
if(조건식1){
	수행문1 // 조건식1이 참일 경우에 수행함
}
else if(조건식2){
	수행문2 // 조건식2가 참일 경우에 수행함
}
else if(조건식3){
	수행문3 // 조건식3이 참일 경우에 수행함
}
else{
	수행문4 // 위의 조건이 모두 해당하지 않는 경우에 수행함
}
수행문5 // if - else if - else 문이 끝난 후 실행함
```

---

## 🧐조건문과 삼항연산자(조건연산자)

- 간단한 if - else조건문은 조건 연산자로 구현할 수 있음

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/첨부/11e8ccd2_Untitled.png]]

---

## 🧐switch - case문

- 조건식의 결과가 정수 또는 문자열의 값이고 그 값에 따라 수행문이 결정 될 때 
if - else if - else문을 대신하여 switch-case문을 사용할 수 있다.
- 괄호 안에는 값으로 처리 될 변수 또는 계산식이 들어와야한다.
- byte, short, int, char, string(jdk1.7부터), enum타입만 들어갈 수 있다.
- long(범위가 너무 큼), float, double(실수는 정확한 값 일치하는걸 찾기 어려움), boolean(if문사용) 은 들어올 수 없음
- 위에서 아래로 case문 검사. 해당하는 case구문 실행
- break를 만나면 실행중지, switsh문을 탈출
- 제시한 case문이 실행되지 않으면 default구문 실행

```java
switch(변수나 계산식){
	case 1 : 수행문; break;
	case 2 : 수행문; break;
	case 3 : 수행문; break;
	case 4 : 수행문; break;
	default : 수행문; //break; 생략가능
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/첨부/7c29fd8a_Untitled.png]]

#### case문 동시에 사용하기

```java
<각 달의 날짜를 출력하는 예시>
case 1 : case 3 : case 5 : case 7 : case 8 : case 10 : case 12 : day = 31;
				break;
case 4 : case 6 : case 11 : day = 30; 
				break;
case 2 : day = 28;
				break;
```

---

## 🧐break문의 역할

- switch - case 문의 수행을 멈추고 빠져나가도록 만든다.

```java
public static void main(String[] args){
	int ranking = 1;
	char medalcolor;
	
	switch(ranking){
		case 1 : medalcolor = 'G';
		case 2 : medalcolor = 'S';
		case 3 : medalcolor = 'B';
		default : medalcolor = 'A';
	}
	System.out.println( ranking + "등 메달의 색깔은" + medalcolor + "입니다.");
}
// 결과 'A' , 1등의 메달 색은 'G'인데 출력 결과는 A입니다.
// break문을 사용하지 않으면 첫 번째 case조건을 만족해도 switch-case문을 빠져나오지 않고 
// 잇따라 나오는 문장까지 모두 수행되어서 맨 마지막 default문에 있는 값이 대입된다.
```

#### case문에 문자열 사용하기

```java
if(medal.equals("Gold")){
	...
}
```

- 자바 7부터는 switch-case문의 case 값에 정수 값뿐 아니라 문자열도 사용할 수 있다.
이전에 문자열을 사용할 수 없었기 때문에 위 내용처럼 문자열을 비교하는 equals( )메서드를 이용했다.

```java
public class SwitchCase2{
	public static void main(String[] args){
		String medal = "Gold";
		
		switch(medal){
			case "Gold" : 
				System.out.println("금메달입니다.");
				break;
			case "Silver" : 
				System.out.println("은메달입니다.");
				break;
			case "Bronze" : 
				System.out.println("동메달입니다.");
				break;
			default : 
				System.out.println("메달이 없습니다.");
		}
	}
}
```

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/if 문|if 문]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/switch|switch]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
