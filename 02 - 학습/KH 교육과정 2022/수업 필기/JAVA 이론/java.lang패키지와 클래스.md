---
별칭:
  - "강의 - java.lang패키지와 클래스"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/bf7c1bb333e4468593a5c32030f3ea88
---

# 강의: java.lang패키지와 클래스

## 강의 내용

---

---

### hashCode()

- 객체의 해시코드 (hash code)를 반환하는 메서드
- Object클래스의 hashCode()는 객체의 주소를 int로 변환해서 반환

```java
public class Object {
	...
	public native int hashCode();
}
네이티브 메서드 : OS의 메소드(주로 C언어로 작성된 경우가 많다.) , 
내용이 없다
```

- 이미 OS가 가지고 있는 C언어로 작성된 메소드가 마치 자바에서 작성된 메소드인 것 처럼 호출하여 사용이 가능하다 
→ **`JNI 라는 기술 : 자바와 자바가 아닌 언어가 서로 호출할 수 있는 기술`**

#### **`equals()`**를 오버라이딩하면, **`hashCode()`** 오버라이딩해야 한다.

- 공통점이 객체의 주소를 가지고 작업을한다.
- equals() 를 오버라이딩하는 이유는 객체주소대신 인스턴스변수로 작업할 수 있게 하는 것인데 , 이때 hashCode도 같이 오버라이딩을 해줘야한다.

#### 오버라이딩하기 이전의 기능이 필요할 때(중요하지않음)

- System.identityHashCode(Object obj)는 Object클래스의 hashCode()와 동일
- 객체마다 다른 해시코드 반환
- 코드보기
    
    ```java
    System.out.println(System.identityHashCode(str1)); //3526198
    System.out.println(System.identityHashCode(str1)); //7699183
    ```
    

<aside>
💡 **equals오버라이딩시 선언부가 동일해야한다.** 
public boolean equals(Object obj) { 
    ...
}

</aside>

---

### toString(),toString()의 오버라이딩

#### toString()

- 객체를 문자열(String)으로 변환하기 위한 메서드

**Object 에 있는 toString**

```java
public String toString(){
	return getClass().getName()+"@"+Integet.toHexString(hashCode());
}        설계도객체.설계도이름+@(at위치) +     16진   + 객체주소       
```

- hashCode가 오버라이딩 되어 있는 경우라면 객체마다 다른 값이 나와야하는데 같은 값이 나올 수 있다.

**기본 Object toString은 오버라이딩해서 사용하는게 유용하다**

- 오버라이딩을 해서 인스턴스변수를 출력하도록 한다.
- 객체가 인스턴스변수의 집합이므로 **객체를 문자열로 변환한다는 것**은 
**인스턴스변수의 값을 문자열로 변환한다는 것**

---

### Object클래스

- 모든 클래스의 최고 조상. 오직 11개의 메서드만을 가지고 있다.
- notify(), wait() 등은 쓰레드와 관련된 메서드이다.

| Object클래스의 메서드 | 설 명 |
| --- | --- |
| protected Object clone( ) | 객체 자신의 복사본을 반환한다. |
| public boolean equals(Object obj) | 객체 자신과 객체 obj가 같은 객체인지 알려준다.(같으면 true) |
| protected void finalize( ) | 거의 사용안함  |
| public class getClass( ) | 객체 자신의 클래스 정보를 담고 있는 Class인스턴스를 반환한다.(설계도 객체) |
| public int hashCode( ) | 객체 자신의 해시코드를 반환한다. |
| public String toString( ) | 객체 자신의 정보를 문자열로 반환한다. |
- clone ( )접근제한자를 오버라이딩하면서 public으로 변경해야한다. 그래야 사용가능

| public void notify ( ) | 객체 자신을 사용하려고 기다리는 쓰레드를 하나만 깨운다 |
| --- | --- |
| public void notifyAll ( ) | 객체 자신을 사용하려고 기다리는 모든 쓰레드를 깨운다. |
| public void wait ( )
public void wait (long timeout)
public void wait(long  timeout, int nanos) | 다른 쓰레드가 notify()나 notifyAll()을 호출할 때까지 현재 쓰레드를 무한히 또는 지정된 시간(timeout, nanos)동안 기다리게 한다.(timeout은 천분의 1초, nanos는 $10^9$ 분의 1초) |

#### equals(Objec obj)

- 객체 자신(this)과 주어진 객체(obj)를 비교한다. 같으면 true 다르면 false.
- Object클래스의 equals()는 객체의 주소를 비교(참조변수 값 비교)

```java
public boolean equals (Object obj) {
	return (this==obj); // 주소비교 주소가 같아야 true
}
```

- new 를 사용해서 객체를 생성하면 새로운 공간에 객체를 생성하기 때문에 같은 클래스의 객체, 같은 값을 가지고 있어도 equals로 비교하면 false로 나온다. 이유는 주소가 다르기 떄문
- 객체간 인스턴스 변수의 비교를 위해선 오버라이딩을 해야함
- equals 오버라이딩시 hashCode도 같이 오버라이딩하기

<aside>
💡 클래스변수는 객체마다 공통(공유값) 
인스턴스변수는 객체마다 다름(개별값)
그래서 클래스변수로는 객체가 같고 다른지 구분이 안된다 그래서 인스턴스변수로 객체가 동일한지 다른지 비교하는 것임

</aside>

- 모든 인스턴스변수가 동일하면 그 객체는 동일하다고 판단하는 것

```java
class Person {
	long id;

	public boolean equals(Object obj) {
		if(obj instanceof Person) //형변환이 가능한지 확인:instanceof
			return id == ((Person)obj).id; //obj가 Object타입이므로 
			//id값을 참조하기 위해서는 Person타입으로 형변환이 필요하다.
		else
			return false; //Person타입이 아니면 값을 비교할 필요가 없음
	}

	Persin(long id) {
		this.id = id;
	}
}
```

- 주소값이 아니라 id값을 비교하게 오버라이딩함

```java
Person p1 = new Person(9405262020202L);
Person p2 = new Person(9405262020202L);

서로 다른 두 객체 
p1 == p2 -> p1주소값 == p2주소값 -> false
p1.equals(p2) -> this.id == ((Person)obj).id 
->9405262020202L == 9405262020202L -> true
```

---

### String클래스

- 문자열을 다루기 위한 클래스
- String클래스 = 데이터(char[]) + 메서드(문자열 관련)
                         문자 배열            문자열을 다루는데 필요한 메서드

```java
public final class String implements java.io.Serializable, Comparable {
	private char[] value;
		...(문자열을 다루기위해 필요한 메서드들)
}
```

- 내용을 변경할 수 없는 불변(immutable)클래스(im : not/mut : change)

```java
String a = "a";
String b = "b";
a = a + b;

//결과 ab
```

위 코드를 보면 “a” + “b”가 문자열 결합으로 합쳐진 것으로 보여지지만 실제 데이터 상에서는 새로운 공간에 “ab”가 생긴 것이다.

새로운 공간에 만들어진 문자열 주소가 a에 대입되는 것이다.

- 덧셈 연산자(+)를 이용한 문자열 결합은 성능이 떨어짐

**`문자열의 결합이나 변경이 잦다면, 내용을 변경가능한 StringBuffer를 사용`**

#### 문자열의 비교

- String str = “abc”; 와 String str = new String(”abc”);의 비교
- 

```java
String str1 = "abc"; //문자열 리터럴 "abc"의 주소가 str1에 저장
String str2 = "abc"; //문자열 리터럴 "abc"의 주소가 str2에 저장
String str3 = new String("abc"); //새로운 String인스턴스 생성
String str4 = new String("abc"); //새로운 String인스턴스 생성
```

str1 == str2 → true // 같은 주소값을 가지고 있어서 true

str3 == str4 → false // 서로 다른 두 객체의 주소값을 비교하는거라 flase

<aside>
💡 내용비교를 하고 싶다면 equals를 사용해서 비교해야함

</aside>

#### 문자열 리터럴

- 문자열 리터럴은 프로그램 실행시 자동으로 생성된다(constant pool에 저장 : 상수 저장소)

```java
String s1 = "AAA";
String s2 = "AAA";
String s3 = "AAA";
```

- String 객체는 내용변경불가 (immutable)라서 여러 참조변수가 하나의 String 객체를 가르키고 있다, 같은 주소값을 가지고 있다.
- 하나의 String객체를 공유하고 있는 것

#### 빈 문자열 (””, empty string)

- 내용이 없는 문자열. 크기가 0인 char형 배열을 저장하는 문자열

```java
String str = ""; //str을 빈 문자열로 초기화
```

- 길이가 0인 배열을 생성하는 것은 어느 타입이나 가능
- 숫자를 문자로 바꿀 때  “빈문자열” + 5 = “5”
- 유용하게 사용할 일이 있으니 알고있기

```java
char[] chArr = new char[0];//길이가 0인 char배열 -> 빈문자열
int[] iArr = {};           //길이가 0인 int배열  -> 빈 문자열
```

- 문자(char)와 문자열(String)이 초기화

```java
String s = ""; // 빈 문자열로 초기화
char c = ' ';  // 공백으로 초기화
```

---

#### String클래스의 생성자와 메서드

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/5d4338af_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/b8c196bf_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/682d1804_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/9751a731_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/c618b888_Untitled.png]]

---

#### join()과 StringJoiner

- join()은 여러 문자열 사이에 구분자를 넣어서 결합

```java
String animals = "dog,cat,bear";
String[] arr = animals.split(",");// 문자열을 ','을구분자로 나눠서 배열에 저장
String str = String.join("-", arr);// 배열의 문자열을'-'로 구분해서 결합
System.out.println(str); //dog-cat-bear
```

---

#### 문자열과 기본형 간의 변환

- 숫자를 문자열로 바꾸는 방법

```java
int i = 100;
String str1 = i + ""; //100을 "100"으로 변환하는 방법1
String str2 = String.valueOf(i);//100을 "100"으로 변환하는 방법2
```

숫자 + 빈문자열  = 문자열 : 편리함

String.valueOf(숫자); = 문자열 : 속도가 빠름

- 문자열을 숫자로 바꾸는 방법

```java
int i = Integer.parseInt("100");//문자열을 숫자로 변환하는 방법1
int i2 = Integer.valueOf("100");//★문자열을 숫자로 변환하는 방법2
Integer i2 = Integer.valueOf("100");//원래는 반환 타입이Integer(참조형)
-> int(기본형)으로 사용해도 괜찮다
-> auto-boxing : 참조형을 기본형으로 자동으로 변환
```

| 기본형 → 문자열 | 문자열 → 기본형 |
| --- | --- |
| String String.valueOf(boolean b) | boolean Boolean.parsBoolean(String s) |
| String String.valueOf(char c) | byte       Byte.parsByte(String s) |
| String String.valueOf(int i) | short      Short.parsShort(String s) |
| String String.valueOf(boolean b) | int          Integer.parsInt(String s) |
| String String.valueOf(long l) | long       Long.parsLong(String s) |
| String String.valueOf(float f) | float       Float.parsFloat(String s) |
| String String.valueOf(double d) | double   Double.parsDouble(String s) |
- byte,short을 문자열로 변경할 때는 String valueOf(int i)를 사용하면 된다.

<aside>
💡 문자열 → 기본형도 valueOf
클래스마다 이름이 다 똑같이 사용가능한 valueOf를 사용하는게 좋음

</aside>

---

#### StringBuffer클래스

- 문자열 저장&다루기
- String처럼 문자형 배열(char[])을 내부적으로 가지고 있다.
- String과 달리 내용을 변경할 수 있다.(mutable)
- 반환타입이 StringBuffer의 참조를 반환(주소)
    - append() : 끝에 문자열 추가
    - delate() : 삭제
    - insert() : 삽입

```java
public final class StringBuffer implements java.io.serializable{
	private char[] value;
		...
}
```

 

```java
StringBuffer sb = new StringBuffer("abc");
sb.append("123"); //sb의 내용뒤에 "123"을 추가한다.
//결과
abc123
```

- 배열은 길이 변경이 불가. 공간이 부족하면 새로운 배열 생성해야함
- StringBuffer는 저장할 문자열의 길이를 고려해서 적절한 크기로 생성해야함

```java
StringBuffer sb = new StringBuffer("abc");
sb.append("123"); //sb의 내용뒤에 "123"을 추가한다.
sb.append("ZZ");

//위 두 코드를 합치면 sb.append("123").append("ZZ");
//반환타입이 StringBuffer의 참조를 반환하기 때문에 가능
abc123ZZ
```

- StringBuffer는 equals()가 오버라이딩되어 있지 않음(주소비교 →this==obj)
- StringBuffer을 String으로 변환 후에 equals()로 비교해야 한다.

```java
StringBuffer sb = new StringBuffer("abc");
StringBuffer sb2 = new StringBuffer("abc");

System.out.println(sb == sb2); //false
System.out.println(sb.equals(sb2)); //false

------------------StringBuffer --> String----------------
String s = sb.toString(); //sb를 String으로변환
String s2 = sb2.toString();

System.out.println(s.equals(s2)); //true
```

#### StringBuffer 생성자,메서드

---

### StringBuilder

- StringBuilder는 동기화가 안되어있다.
- StringBuffer는 동기화되어 있다. 멀티 쓰레드에 안전(thread-safe)
    - 일꾼1이 일하는걸 다른 일꾼2가와서 데이터를 꼬이게 하는걸 막는게 동기화:데이터 보호
- 멀티 쓰레드 프로그램이 아닌 경우, 동기화는 불필요한 성능저하
    - 이럴땐 StringBuffer 대신 StringBuilder를 사용하면 성능향상
    
    ```java
    StringBuffer sb;
    sb = new StringBuffer();
    sb.append("abc");
    
    -> StringBuffer부분만 StringBuilder 로 바꿔주면된다.
    ```
    
    - StringBuffer 멀티쓰레드일 때 사용하면 좋고
    - StringBuilder는 싱글쓰레드일 때 사용하면 좋다.

---

### Math클래스

- 수학관련 static메서드의 집합 (메서드밖에 없기 때문에 static메서드임)
    - 인스턴스변수가 없기 때문에 객체를 만들 필요가 없어서 메소드만있음
- round()로 원하는 소수점 아래 세 번째 자리에서 반올림하기
    - 원래 값에 100을 곱한다.
               90.7552 * 100 → 9075.52
    - 위의 결과에 Math.round()를 사용한다. : 소수점 아래 첫자리에서 반올림
              Math.round(9075.52) → 9076
    - 위의 결과를 다시 100.0으로 나눈다
              9076 / 100.0 → 90.76 : 실수로 나눠줘야함.
              9076 (int) / 100 (int)→ 90 : 원하는 결과 값이 아님
    

---

### 래퍼(wrapper)클래스

기본형 값을 감싸는 클래스

- 8개의 기본형(객체아님)을 객체로 다뤄야할 때 사용하는 클래스

```java
public final class Integer extends Number implements Comparable {
		...
	privat int value; (기본형 int를 감싸고 있음)
		...
}
```

---

### Number클래스

- 모든 숫자 래퍼 클레스의 조상

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/857df1ba_Untitled.png]]

- BigInteger, BigDecimal : 아주 큰 정수와 실수

---

### 문자열을 숫자로 변환하기(래퍼클래스)

- 문자열을 숫자로 변환하는 다양한 방법

```java
int i = new Integer("100").intValue(); //floatValue(),longValue()...
int i2 = Integer.parseInt("100"); //주로 이 방법을 많이 사용
Integer(int) i3 = Integer.ValueOf("100)");
```

- n진법의 문자열을 숫자로 변환하는 방법

```java
int i4 = Integer.parseInt("100",2); //100(2) -> 4
int i5 = Integer.parseInt("100",8); //100(8) -> 64
int i6 = Integer.parseInt("100",16);//100(16) -> 256
int i7 = Integer.parseInt("FF",16); //FF(16) -> 255
int i8 = Integer.parseInt("FF"); //NumberFormatException발생
```

- 진법을 안적어주면 10진수로 변환해주는데 FF는 16진수이기 때문에 이 숫자의 형식이 잘못됐다고 알려주는 에러가 발생

---

### 오토박싱 & 언박싱

**`기본형의 값을 객체로 자동변환하는 것을 오토박싱, 그 반대는 언박싱`**

기본형 int ——> Integer (래퍼클래스) : 오토박싱

기본형 int ←——Integer (래퍼클래스) : 언박싱

원래 기본형을 참조형으로 형변환연산자 사용불가(원칙)했는데 기능이 추가된것 ,원칙이 변한게 아니라 컴파일러가 자동변환해주는 기능이 추가된 것

- JDK1.5 이전에는 기본형과 참조형간의 연산이 불가능했다.

```java
int i = 5;
Integet iObj = new Integer(7);

int sum i + iObj; //에러 기본형과 참조형간의 덧셈 불가
```

- JDK 1.5이후 컴파일 시
    - java의 기본원칙이 변한것이 아니라 컴파일이 자동으로 해줌

```java
int i = 5;
Integet iObj = new Integer(7);

int sum i + iObj

-----컴파일 후-----

int i = 5;
Integet iObj = new Integer(7);

int sum i + iOj.intValue();
```

```java
ArrayList<Integer> list = new ArrayList<Integer>();
list.add(10); //오토박싱. 10->ew Integer(10)
//list.add(new Integer(10)); 컴파일 후 자동변환됨
int value = list.get(0);//언박싱. new Integer(10) -> 10
//intValue()로 변환해줘야하는데 컴파일러가 자동변환해줌
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
