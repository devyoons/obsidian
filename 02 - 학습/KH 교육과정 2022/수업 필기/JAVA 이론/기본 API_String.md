---
별칭:
  - "강의 - 기본 API_String"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/d853f84718eb4cfe99f9ac114bd1fbe6
---

# 강의: 기본 API_String

## 강의 내용

### Application Programming Interface

- Java application
    - jdk ( System, Scanner, string, ...)
    

## String클래스

---

- 문자열 값을 수정 못하는 immutable(불변)dlek
- 수정시 수정된 문자열이 새로 할당되어 새 주소를 넘긴다.
- String 비교시 ( 이 안에 값이 같니?)
    - 동일성(주소값비교) ==
    - 동등성(객체정보비교) equals

#### 동일성 (주소값비교) ==

```java
public void test1() {
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java");
		String s4 = new String("java");
		
		//동일성(주소값비교) ==
	
		System.out.println(s1 == s2); //true
		System.out.println(s1 == s3); //false
		System.out.println(s3 == s4); //false
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/da98b3bd_Untitled.png]]

#### 동등성비교(객체정보비교) equals

- equals의 결과가 true라면 hashCode가 동일해야한다.

```java
public void test1() {
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java");
		String s4 = new String("java");
		
		//동등성(객체정보비교) equals
		
		System.out.println(s1.equals(s2)); //true
		System.out.println(s1.equals(s3)); //true
		System.out.println(s3.equals(s4)); //true
		
	}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/e8dbdd76_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7b30a19a_Untitled.png]]

```java
<hashCode 비교>

public void test1() {
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java");
		String s4 = new String("java");

// equals의 결과가 true라면 hashCode가 동일해야한다.
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(s3.hashCode());
		System.out.println(s4.hashCode());

//결과 
3254818
3254818
3254818
3254818 //동일하다
```

#### 문자열은 수정불가

```java
public void test1() {
		String s1 = "java";
		String s2 = "java";
		String s3 = new String("java");
		String s4 = new String("java");
		
		//문자열은 수정불가
		s1 +="oracle"; // "java"를 수정하는 것이 아니라, 
                   // "Javaoracle"을 추가로 생성하고 주소값을 새로 가지는 것
		s3 +="oracle";
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		System.out.println(s3.hashCode());
		System.out.println(s4.hashCode());

//결과
87819808
3254818
87819808
3254818
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/f42c3c36_Untitled.png]]

## 변경되는 String을 메모리 효율적으로 관리하기 위해 mutable한 String클래스

- **StringBuilder** : 싱글쓰레드용 → 데이터가 많아지면 체감할 수 있을정도로 이게 좀 더 빠름
- **StringBuffer** : 멀티쓰레드용 → 여러 쓰레드에서 공유시 안전한 사용을 보장함

#### StringBuilder : 싱글쓰레드용

- 변경 후에도 hashCode는 동일하다
- append 사용 → 덧붙이다

```java
public void test2() {
		StringBuilder sb = new StringBuilder("java");
		System.out.println(sb);
		System.out.println(sb.hashCode());

		sb.append("oracle");
		System.out.println(sb);
		System.out.println(sb.hashCode());
	}
//결과
java
665188480
javaoracle
665188480

```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/d7253844_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
