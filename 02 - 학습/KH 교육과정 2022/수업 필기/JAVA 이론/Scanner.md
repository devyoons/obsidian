---
별칭:
  - "강의 - Scanner"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/05fa16b11dd342ca88cf1094b44a47ae
---

# 강의: Scanner

## 강의 내용

## 🧐Scanner클래스

<aside>
💡                                      intput                    output
keyboard (System.in)——-—> java app ——-—> console(표준출력)
                              java.util.Scanner

</aside>

1. **기본적인 데이터 타입들을 Scanner의 메소드를 사용하여 입력받을 수 있다.**
2. **Scanner를 사용할 시 util패키지를 경로의 Scanner 클래스를 호출해야 한다. (java.util패키지)**
3. **공백(띄어쓰기) 또는 개행(줄바꿈)을 기준으로 읽는다.
(’ ‘ , ‘\t’ , ‘\r’ ,\n’...  등)**

```java
<import문>
import java. util.* (util패키지 호출) 

클래스이름 객체이름 = new 클래스이름();
Scanner sc = new Scanner(System.in);
//System.in - 사용자로부터 입력을 받기 위한 입력 스트림이다.
```

#### Scanner 주요 메소드

- 사용자입력은 무조건 문자열이다.
- Scanner는 적절한 타입으로 변환해서 값을 리턴한다.

|  | 문자열로 리턴 |
| --- | --- |
| String nextLine(); | ‘\n’을 포함하는 한 라인을 읽고 ‘\n’을 버린 나머지만 리턴 |
| byte nextByte(); | byte 타입으로 변환해서 리턴 |
| short nextShort(); | short 타입으로 변환해서 리턴 |
| int nextInt(); | int 타입으로 변환해서 리턴 |
| long nextLong(); | long 타입으로 변환해서 리턴 |
| float nextFloat(); | float 타입으로 변환해서 리턴 |
| double nextDouble(); | double 타입으로 변환해서 리턴 |
|  | 입력버퍼에서 실제 문자열 이전에 만나는 공백/개행문자는 무시하고, 실제 문자열 이후 공백/개행문자전까지 읽어서 반환 |
- nextInt 에 마우스 커서를 놓고 ctrl+우클릭하면 메소드를 확인할 수 있는데
이때 void가 아니라 int이다 → 이 메소드를 호출하면 int값 하나를 반환한다

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/e6c09537_Untitled.png]]

```java
public void test1() {
	Scanner sc = new Scanner(System.in);
	System.out.print("이름을 입력하세요 : ");
	String name = sc.next(); //사용자입력값 문자열
	System.out.println("반갑습니다. " + name + "님!");
}

//결과
이름을 입력하세요 : (사용자입력값)홍길동
반갑습니다. 홍길동님!
```

#### nextLine 사용법 (ex. 띄어쓰기가 포함된 입력 값을 받을 때)

- 입력버퍼에서 개행문자까지 읽어온 후 , 개행문자를 제외하고 반환한다.

→ [주의] next 다음으로 nextLine 사용시 개행문자용 nextLine필요

```java
Scanner sc = new Scanner(System.in);
	Scanner sc = new Scanner(System.in);
	System.out.print("이름을 입력하세요 : ");
	String name = sc.next(); //사용자입력값 문자열

	sc.nextLine(); //개행문자 버리기용
	System.out.print("주소를 입력하세요 : ");
	1. String addr = sc.next();
	2. String addr = sc.nextLine();

System.out.println("반갑습니다. " + name + "님!");
System.out.printf("주소는 [%s]입니다.", addr);

//결과
주소를 입력하세요 : (사용자 입력 값) 서울시 강남구 역삼동
1.주소는 [서울시]입니다.
2.주소는 [서울시 강남구 역삼동]입니다.
```

#### char타입으로 리턴받는 방법, charAt(번지수)

- 임시적인 공간(문자열 변수)에 사용자로부터 받은 입력값을 받고,
그 공간에 첫번째 글자만 가져오는 방식

```java
System.out.print("성별 (남|여) : ")
String temp = sc.next(); //입력받을 공간 문자열 변수
char gender = temp.charAt(0); //0번지가 첫번째

System.out.printf("당신은 %c자 입니다" , gender);

//결과 
성별 (남|여) : (사용자입력값)여
당신은 여자 입니다.
```

#### 사용자입력시 오타로 인한 exception예외

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/5a35e3af_Untitled.png]]

- 내가 호출한 메소드를 찾으면 오류를 알 수 있다.
- 자바 예외가 발생했다 , 오류와 예외는 다르다

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
