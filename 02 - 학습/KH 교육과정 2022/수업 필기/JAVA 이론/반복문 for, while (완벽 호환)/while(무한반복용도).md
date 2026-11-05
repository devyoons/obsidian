---
별칭:
  - "강의 - while(무한반복용도)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/7dd56e2eb92649e5b03ced2236d80026
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: while(무한반복용도)

## 강의 내용

## while문 : 조건식 → 실행코드

### while문을 무한반복해두고, 실행시 동적으로 종료/탈출하기

```java
<표현식>
초기식
while(조건식){ //조건식이 true일 경우 실행, false일 경우 종료(미실행)
	반복 실행할 문장;
	증감식
}
```

```java
public void test(){
	Scanner sc = new Scanner(System.in);
	while(true) {
		System.out.print("계속하시겠습니다?(y/n) : " );
		char yn = sc.next().charAt(0);
		if(yn == 'n')
			break;
	}
	System.out.println("이용해주셔서 감사합니다.");
}
```

## do ~ while 문 : 실행코드 → 조건식

#### 조건식 결과와 상관없이 무조건 한번은 실행시킨다.

```java
<표현식>

do{
	반복 실행할 문장;
}while(조건식) //조건식이 true일 경우 실행, false일 경우 종료
```

```java
	Scanner sc = new Scanner(System.in);
	char yn = 'y';
	do{
		System.out.print("계속하시겠습니다?(y/n) : " );
		char yn = sc.next().charAt(0);

	}while(yn == 'y'); //사용할 변수는 do블럭 앞에 선언되어야 한다.
	System.out.println("이용해주셔서 감사합니다.");
}
```

### break 실행시 반복문 블럭을 탈출

```java
int i = 1;
while(i <= 10) {
	System.out.println(i++);
	if(i > 5){
	break;
	}
}

// 1 2 3 4 5
```

### continue 반복문의 이하코드를 실행하지 않고, 
다시 반복문을 시작한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/첨부/e758c4da_Untitled.png]]

- for문 증감식으로 이동
- while문은 조건식으로 이동

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/반복문 for, while (완벽 호환)/반복문 for, while (완벽 호환)|반복문 for, while (완벽 호환)]]
