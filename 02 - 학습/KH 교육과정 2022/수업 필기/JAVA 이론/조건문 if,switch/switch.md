---
별칭:
  - "강의 - switch"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/3d4dc90eb45c40a6ba4c325a8c7b1efd
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: switch

## 강의 내용

#### 값에 따라 분기처리하는 제어문 (ex. 메뉴판)

- 괄호 안에는 값으로 처리 될 변수 또는 계산식이 들어와야한다.
- byte, short, int, char, string(jdk1.7부터), enum타입만 들어갈 수 있다.
- long(범위가 너무 큼), float, double(실수는 정확한 값 일치하는걸 찾기 어려움), boolean(if문사용) 은 들어올 수 없음
- 위에서 아래로 case문 검사. 해당하는 case구문 실행
- break를 만나면 실행중지, switsh문을 탈출
- 제시한 case문이 실행되지 않으면 default구문 실행

```java
<표현식>
int n = 1;
switch(2){ //switch문 괄호안에 올 수 있는건 오직 값 뿐
case 1: System.out.println(100); break;
case 2: System.out.println(200); break;
case 3: System.out.println(300); break;
default: System.out.println("기본구문실행"); //return 생략가능
}

//결과 200
```

```java
<실습1>

public void test(){
	Scanner sc = new Scanner(System.in);
	System.out.print("과일을 선택하세요 (1.사과 2.바나나. 3.키위 4.아보카도)\n > ");
	int num = sc.nextInt();
	
	switch(num){ 
	case 1: System.out.println("사과를 선택하셨네요"); break;
	case 2: System.out.println("바나나를 선택하셨네요"); break;
	case 3: System.out.println("키위를 선택하셨네요"); break;
	case 4: System.out.println("아보카도를 선택하셨네요"); break;
	default:System.out.println("잘못된 번호입니다.");
	}
}
```

```java
public void test2(){
	String menu = "=====================\n"
							+	"a.된장찌게 -------5000원"
							+	"b.김치찌게 -------6000원"
							+	"c.순대국   -------7000원"
							+	"---------------------\n"
							+	"선택 : ";
	System.out.print(menu);
	Scanner sc = new Scanner(System.in);
	char choice = next().charAt(0);

	String name = " ";
	int price = 0;

	switch(choice){
	case 'a' : name = "된장찌게"; price = 5000; break;
	case 'b' : name = "김치찌게"; price = 6000; break;
	case 'c' : name = "순대국"; price = 7000; break;
	default: "잘못선택하셨습니다." return; //return 호출부로 돌아간다.
	}
	System.out.printf("%s는 %d입니다. 감사합니다", name, price);
}
```

```java
public void test3(){
	String menu = "회원등급을 입력하세요\n"
							+ "1.Gold 2.Silver 3.bronze \n"
							+ "입력 : "

	System.out.print(menu);

	Scanner sc = new Scanner(System.in);
	int num = sc.nextInt();

	String present = " ";
	switch(num) {
	case 1: present += "스마트TV, ";
	case 2: present += "전자렌지, ";
	case 3: present += "전기다리미"; break;
	default: System.out.printf("잘못 입력하셨습니다."); return;
	}
	System.out.printf("축하합니다. [%s]를 드립니다.");
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/조건문 if,switch/조건문 if,switch|조건문 if,switch]]
