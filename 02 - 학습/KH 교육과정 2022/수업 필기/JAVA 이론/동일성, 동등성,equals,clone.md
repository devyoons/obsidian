---
별칭:
  - "강의 - 동일성, 동등성,equals,clone"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/9530308a2ed74cd5a555536c26e9d117
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 동일성, 동등성,equals,clone

## 강의 내용

---

---

#### 🔻동일성 : indentity 두 객체가 같은 주소값을 가지고 있는가

```java
<main>
package kh.java.inheritance.car;

public class CarMain {

	public static void main(String[] args) {
		Car car1 = new Car("현대","소나타",4);
		System.out.println(car1);
		
		Car car2 = new Car("현대","소나타",4);
		System.out.println(car2);

		// 동일성 indentity 두 객체가 같은 주소값을 가지고 있는가
		System.out.println(car1 == car2);

		// 동등성 equality 두 객체의 정보가 같은가
		System.out.println(car1.equals(car2));
	}

equals 따라가면
public boolean equals(Object obj) {
        return (this == obj); //동일성 비교와 똑같이 쓰여있다. 
    }
}
```

```java
<vo class>
package kh.java.inheritance.car;

public class Car {

	private String brand;
	private String name;
	private int doorNum;
	
	public Car() {
		super();
	}

	public Car(String brand, String name, int doorNum) {
		super();
		this.brand = brand;
		this.name = name;
		this.doorNum = doorNum;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDoorNum() {
		return doorNum;
	}

	public void setDoorNum(int doorNum) {
		this.doorNum = doorNum;
	}
	@Override
	public String toString() {
		return "Car[" + brand +", " + name + ", " + doorNum + "]";
	}
```

#### 🔻동등성 equality 두 객체의 정보가 같은가

- 지정한 필드값이 동일하면 동등하니 true 리턴
- 필드값이 하나라도 다르면 false 리턴

```java
package kh.java.inheritance.car;

public class CarMain {

	public static void main(String[] args) {
		Car car1 = new Car("현대","소나타",4);
		System.out.println(car1);
		
		Car car2 = new Car("현대","소나타",4);
		System.out.println(car2);

		// 동등성 equality 두 객체의 정보가 같은가
		System.out.println(car1.equals(car2));
	}

equals 따라가면
public boolean equals(Object obj) {
        return (this == obj); //동일성 비교와 똑같이 쓰여있다. 이걸 Override해준다.
    }
}
```

```java
<vo class>
package kh.java.inheritance.car;

public class Car {

	private String brand;
	private String name;
	private int doorNum;
	
	public Car() {
		super();
	}

	public Car(String brand, String name, int doorNum) {
		super();
		this.brand = brand;
		this.name = name;
		this.doorNum = doorNum;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getDoorNum() {
		return doorNum;
	}

	public void setDoorNum(int doorNum) {
		this.doorNum = doorNum;
	}
	@Override
	public String toString() {
		return "Car[" + brand +", " + name + ", " + doorNum + "]";
	}

/**
	 * 객체 동등성 비교 Override
	 * - 지정한 필드값이 동일하면 동등하니 true 리턴
	 * - 필드값이 하나라도 다르면 false 리턴
	 */
	@Override
public boolean equals(Object obj) {
		Car other = (Car) obj; //형변환
		
		if(this.brand.equals(other.brand) && this.name.equals(other.name) && this.doorNum == other.doorNum)
			return true;
		else
			return false;
		
    }
}
```

## 🧐`equals`와 `hashCode`는 동시에 `@Override`해야한다.

---

- 두 메서드에서 동일한 컬럼을 사용해야 한다.
- equals결과가 true이면 동일한 hashCode를 가져야한다.
- hashCode는 고유한 값

## 🧐clone : 원본 객체의 필드값과 동일한 값을 가지는 새로운 객체를 생성

- Object의 clone메서드는 protected단계로 접근을 제한하기 때문에 재정의하지 않은 클래스의 clone() 메서드를 외부에서 호출 할 수 없다. 
또한 내부적으로 모든 필드의 값을 복사해 새로 생성한 객체의 필드에 넣기 때문에 
clone()을 재정의하지 않고 사용한다면 얕은 복사만 가능하다.
따라서, 깊은 복사를 위해서 해당 클래스에 맞게 colne()을 재정의해줘야한다
- 복제이유 : 원복객체를 안전하게 보호하기 위해서
- 얕은복제 (this clone)와 깊은 복제(deep clone)이 있음
- Object#clone protected이고 다른패키지, 상속관계가 아니므로 접근할 수 없다.
- 공변반환타입 Covariant Return Type
    - 부모메소드의 반환타입의 자식클래스로 변환이 가능

```java
package kh.java.inheritance.car;

public class CarMain {

	public static void main(String[] args) {
		Car car1 = new Car("현대","소나타",4);
		System.out.println(car1);

		Car car2 = new Car("현대","소나타",2);
		System.out.println(car2);
		// 동일성 indentity 두 객체가 같은 주소값을 가지고 있는가
		System.out.println(car1 == car2);
		// 동등성 equality 두 객체의 정보가 같은가
		System.out.println(car1.equals(car2));
		
		// Object#clone protected이고 다른패키지, 상속관계가 아니므로 접근할 수 없다.
		Car car3 = car1.clone();
	}

}
```

```java
//protected에 있는 clone을 사용하기 위해서 오버라이드한것
	@Override //clone Override
	public Car clone() {
		return null;
	}
```

```java
/**
	 * 복사생성자
	 * 
	 */
	public Car(Car src) {
		this.brand = src.brand;
		this.name = src.name;
		this.doorNum = src.doorNum;
		
	}
	@Override //clone Override
	public Car clone() { //어디서든 접근가능하게 public으로 변경
	//복사 생성자
		return new Car(this);
	}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/fd871bb7_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
