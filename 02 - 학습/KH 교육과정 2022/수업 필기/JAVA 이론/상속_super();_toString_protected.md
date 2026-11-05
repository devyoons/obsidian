---
별칭:
  - "강의 - 상속_super();_toString_protected"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/fb7eef55b7b04d7c9acc8870d5c0a396
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 상속_super();_toString_protected

## 강의 내용

### 상속이란?

---

- 다른 클래스(A : parent)가 가지고 있는 멤버(필드와 메소드)들을 새로 작성한 클래스(B : child)에서 직접 만들지 않고, 상속을 받음으로써 새 클래스가 자신의 멤버처럼 사용할 수 있는 기능

### 상속의 목적

- 클래스의 재사용, 연관된 일련의 클래스들에 대해 공통적인 규약을 정의

### 상속의 장점

1. 보다 적은 양의 코드로 새로운 클래스를 작성 가능
2. 코드를 공통적으로 관리하기 때문에 코드의 추가 및 변경이 용이함
3. 코드의 중복을 제거하여 프로그램의 생산성과 유지보수에 크게 기여함

### 방법

---

- 클래스간의 상속시에는 extends 키워드 사용함

```java
                   B              A
[접근제한자] class 클래스명 extends 클래스명{}
						상속받는 클래스        상속하는 클래스
						후손클래스             상위클래스
						자식클래스             부모클래스
						파생클래스             선조클래스
						서브(sub)클래스        슈퍼클래스
									<B가 A를 확장한다.>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/c3ecb384_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/944a16be_Untitled.png]]

### 특징

---

1. 부모클래스의 필드, 메소드를 선언없이 사용할 수 있다.
2. 하나의 부모클래스만 상속할 수 있다. 단일상속
3. 모든 클래스는 Object클래스의 후손클래스
    - 모든 클래스는 Object 의 메소드를 사용 또는 재작성할 수 있다.
    - equals, hashCode, toString...
4. 부모클래스 생성자, 초기화블럭은 상속되지 않는다.
    - 자식클래스 생성자를 별도로 작성해야 한다.
5. 부모클래스의 private필드는 상속받았다해도 직접 접근할 수 없다.
    - public메소드
    - super() 부모생성자호출

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/24e99f8f_Untitled.png]]

### code로 extends상속해보기

```java
package kh.java.inheritance.simple;

public class Child extends Parent{
	
	public void game() {
		System.out.println("자식이 게임을 한다....");
	}
	
	/**
	 * 부모메서드 재작성 Override
	 */
	public void say() {
		System.out.println("제가 자식입니다.");
	}

}
```

```java
package kh.java.inheritance.simple;

public class Parent extends Object{
	String name;
	int age;
	
	public void say() {
		System.out.println("내가 애비다");
	}
	
	public String info() {
		return "name = " + name + ", age = " + age;
	}
}
```

```java
package kh.java.inheritance.simple;

/**
 * 
 * Parent#name
 * Child#doGame
 *
 */
public class GrandChild extends Child {

	public void say() {
		System.out.println("제가 손자입니다.");
	}
}
```

```java
package kh.java.inheritance.simple;

public class Main {

	public static void main(String[] args) {
		
		Parent parent = new Parent();
		parent.name = "홍금보";
		parent.age = 50;
		parent.say();
		System.out.println(parent.info());
		
		System.out.println();
		
		Child child = new Child();
		child.name = "홍길동";
		child.age = 19;
		child.say();
		System.out.println(child.info());
		child.game();
		
		System.out.println();
		
		GrandChild grandChild = new GrandChild();
		grandChild.name = "홍진경";
		grandChild.age = 3;
		grandChild.say();
		System.out.println(grandChild.info());
		grandChild.game();
		
	}

}
//결과

내가 애비다
name = 홍금보, age = 50

제가 자식입니다.
name = 홍길동, age = 19
자식이 게임을 한다....

제가 손자입니다.
name = 홍진경, age = 3
자식이 게임을 한다....
```

### super 키워드

super 키워드는 부모 클래스로부터 상속받은 멤버변수나 메소드를 자식 클래스에서 참조하는데 사용하는 참조변수이다.

인스턴스 변수의 이름과 지역 변수의 이름이 같은 경우, 인스턴스 변수 앞에 this 키워드로 구분할 수 있었다.

이와 마찬가지로 부모 클래스의 멤버와 자식 클래스의 멤버 이름이 같은 경우 super 키워드를 사용하여 구분할 수 있다.

이렇게 자바에서는 super 참조 변수를 사용하여 부모 클래스의 멤버에 접근할 수 있다.

- 부모객체의 생성자를 호출하는 메소드이다.
- this와 같이 사용 불가 . 생략해도 자동으로 super() 호출됨

**사용방법**

1. 부모 클래스의 멤버 변수 접근 : **super**.멤버변수
2. 부모 클래스의 멤버 메소드 접근 : **super**.멤버메소드(매개변수);
3. 부모 클래스의 생성자 호출 : **super**(매개변수);

**주의점**

1. 반드시 자식 클래스의 생성자 첫 라인에서 부모 생성자를 호출해야 한다.
2. 자식 클래스의 생성자 내에서 반드시 부모 생성자를 호출해야 한다.
3. 명시적으로 자식 클래스에서 부모 생성자를 호출하지 않아도
super 키워드를 이용한 생성자 호출이 자동 삽입되어 부모 클래스의 생성자를 호출하게 된다. 
    
    → 만약 별도 매개변수를 가진 생성자를 자식 클래스에서 생성했다면? 부모 클래스의 생성자를 호출하는 super(); 를 직접 입력해야 한다.
    

#### super() 부모 클래스의 생성자

+생성자는 메소드가 아니다.

this() 가 같은 클래스의 다른 생서자를 호출할 때 사용된다면, 

super() 는 부모 클래스의 생성자를 호출할 때 사용된다.

자식 클래스의 인스턴스를 생성하면, 해당 인스턴스에는 자식 클래스의 고유 멤버뿐만 아니라 부모 클래스의 모든 멤버까지도 포함되어 있다.

따라서, 부모 클래스의 멤버를 초기화하기 위해서는 자식 클래스의 생성자에서 부모 클래스의 생성자까지 호출해야 한다.

**이러한, 부모 클래스의 생성자 호출은 모든 클래스의 부모 클래스인 Object 클래스의 생성자까지 계속 거슬러 올라가며 수행된다.**

```java
public class Desktop extends Product{

	private String os;
	
	private String monitor;
	private String keyboard;
	private String mouse;
	
	public Desktop(String brand, String code, String name, int price, 
			String os, String monitor, String keyboard, String mouse) {
		
			super(brand, code, name, price); //반드생성자에 딱 한번, 맨위줄에서만 사용
			
			this.os = os;
			this.monitor = monitor;
			this.keyboard = keyboard;
			this.mouse = mouse;

//getter setter 생략함
		}
}
```

## super.

---

- 부모객체의 주소가 있는 참조변수로 생각하면된다.
- 자식 클래스 내에서 부모클래스 객체에 접근하여 메소드를 호출할 때 사용

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/79019837_Untitled.png]]

## is a 상속관계,일반화관계

---

- Circle ———→ shape(일반화관계)
- 상속받은 기능을 내것인양 사용
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/f09c62e7_Untitled.png]]
    

## toString

---

- 객체가 문자열로 처리되어야 할 때 toString 자동호출

```java
package kh.java.inheritance.shape;

public class ShapeMain {

	public static void main(String[] args) {
		
		Circle c1 = new Circle(new Point(10, 10), 50);
		c1.calcArea();
		System.out.println(c1); // 객체가 문자열로 처리되어야 할때 toString 자동호출. 
		c1.draw();
	}
}
```

## 접근제한자 protected

---

- 부모 클래스에 작성한 변수나 메서드 중 외부 클래스에서 사용할 수 없지만 자식 클래스에서는 사용할 수 있도록 정하는 예약어
- 상속받은 자식 클래스에서는 public처럼 사용할 수 있다.
- protected는 상속된 자식 클래스를 제외한 나머지 외부 클래스에서는 private과 동일한 역할을 한다.
- protected예약어로 선언한 변수는 외부 클래스에는 privtate변수처럼 get(),set() 사용

```java
package kh.java.inheritance.product.after.parent;

/**
 * 
 *  Desktop, SmartPhone, Tv의 공통적인 속성/기능을 가지고 있는 부모클래스
 *
 */
public class Product {

	//protected 
	//- 같은 패키지에서 접근 가능. 다른 패키지에서 상속관계는 접근가능(자식클래스는 접근 가능)
	protected String brand;
	protected String code;
	protected String name;
	protected int price;
	
	public Product() {
		super();
	}

	public Product(String brand, String code, String name, int price) {
		super();
		this.brand = brand;
		this.code = code;
		this.name = name;
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProductInfo() {
		return brand + ", " + code + ", " + name + ", " + price;
	}
	
}
```

```java
package kh.java.inheritance.product.after;

import kh.java.inheritance.product.after.parent.Product;

public class Tv extends Product {

	private String resolution; 
	private int size;
	
	public Tv() {
		super();
	}

	public Tv(String brand, String code, String name, int price, String resolution, int size) {
		//1.Product필드가 private인 경우
		//super(brand, code, name, price);
		
		//Product 필드가 protected인 경우 패키지가 달라도 자식 클래스에서 직접 접근할 수 있다.
		
		this.brand = brand;
		this.code = code;
		this.name = name;
		this.price = price;
		this.resolution = resolution;
		this.size = size;
	}

	public String getResolution() {
		return resolution;
	}

	public void setResolution(String resolution) {
		this.resolution = resolution;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	
	public String getTvInfo() {
		return getProductInfo() + ", " + resolution + ", " + size;
	}

}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
