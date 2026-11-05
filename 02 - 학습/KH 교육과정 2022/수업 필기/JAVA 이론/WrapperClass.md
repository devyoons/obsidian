---
별칭:
  - "강의 - WrapperClass"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/a8347224aee44c19aa5ee17f13b6e445
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: WrapperClass

## 강의 내용

- wrap : **싼다**
- java.lang 패키지에 존재하는 기본형 8가지에 1:1대응되는 클래스
- 기본형값을 감싼 클래스
    - Byte(byte)
    - Short(short)
    - Integer(int)
    - Long(long)
    - Charactor(char)
    - Boolean(boolean)
    - Double(double)
- 참조형을 반드시 써야하는 경우
- 부가기능 (형변환)
- auto-boxing 자동으로 기본값을 Wrapper객체에 담아 생성
- auto-unboxing 자동으로 Wrapper객체에서 값을 꺼내어 처리

```java
<참조형에 int 값 넣기>
private void test1() {
		
		int n = 100;
//  Integer m = new Integer(100); //deprecated
//  사용법
1.	Integer m = Integer.valueOf(100);
2.	Integer l = (Integer)100;
		
★3.Integer k = 100;//auto-boxing 자동으로 기본값을 Integer 객체에 담아 생성
		System.out.println(k);
		k = null; //null도 들어갈 수 있다.
		System.out.println(k);
	}

//결과
100
null
```

→ Integer 는 기본형이 아니지만 기본형 값을 전달해도 잘 처리가 된다.

```java
<기본형하고 참조형 더하기>

private void test1() {
		
		int n = 100;
		Integer m = Integer.valueOf(100);
		
		Integer i = 50;
		System.out.println(n + i);
		//auto-unboxing 자동으로 Integer객체에서 값을 꺼내어 처리
	}
}
//결과 150
```

```java
<int == Integer.intValue()--> int == int>
private void test1() {
		
		int n = 100;
		Integer m = Integer.valueOf(100);
		
		Integer i = 50;
		System.out.println(n + i);//auto-unboxing 자동으로 Integer객체에서 값을 꺼내어 처리

		System.out.println(n == i); //int == Integer.intValue() -> int == int
	}
}
```

### 기본형이 아닌 참조형을 반드시 써야하는 경우

#### Generics 문법 - 기본형을 허용하지 않는다.

```java
List<Integer> list = new ArrayList<Integer>();

// Integer 자리에 int가 오면 안된다.
```

### 문자열값을 해당 Wrapper타입으로 변환

#### Integer.parseInt(”123”) + 123;

→ 문자열 + 숫자 = 문자열인데 결과가 숫자로 받고 싶을 때

- Character 는 없다.

```java
<int>
private void test2() {
		System.out.println(Integer.parseInt("123") + 123);
	}
//결과 -> int + int
246
```

```java
<double>
private void test2() {
		System.out.println(Double.parseDouble("12.34") + 4.6);
	}
//결과 -> double +double
16.939999999999998
```

```java
<Boolean>
private void test2() {
		System.out.println(Boolean.parseBoolean("true") ? 1 : 2);
	}
//결과
1
```

## 각 타입을 String으로 변환

#### `String.valueOf()`

```java
private void test3() {
		print(String.valueOf(1));
		print(String.valueOf(12.34));
		print(String.valueOf(true));
	}
	public void print(String s) {
		System.out.println(s);
	}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
