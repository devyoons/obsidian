---
별칭:
  - "강의 - 다형성_다운캐스팅_instanceof"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/4e458cd6fc0d4f71bc2f44ab87728cb5
---

# 강의: 다형성_다운캐스팅_instanceof

## 강의 내용

---

---

### 🧐다형성

- 상속없이 다형성은 존재할 수 없다.
- **하나의 객체가 여러 가지 타입을 가질 수 있는 것을 의미**
- **자식객체(인스턴스)**를 **부모타입의 변수(참조 변수)에 담아 제어**할 수 있다.
- 부모타입의 변수에 담게되면 부모클래스에 선언된 필드/메소드만 사용가능하다.
- 자식클래스의 메소드를 사용하고 싶다면, 다시 자식 타입으로 형변환해야 한다. DownCasting
- 보모타입의 변수로 모든 자식타입객체를 일관되게 다룰 수 있다.
    
       →부모타입의 배열을 만들어서 여러 자식객체를 제어할 수 있다.
    
- 상위 클래스에서는 공통적인 부분을 제공하고 하위 클래스에서는 각 클래스에 맞는 기능 구현할 수 있다.

interface : 동물

method : 먹는다, 걷는다, 잔다

implements(구현체) : 고양이, 강아지, 호랑이

```java
Animal
- Cat implements Animal
- Monkey implements Animal
- Chicken impelemtns Animal

Animal cat = new Cat();
Animal monkey = new Monkey();
Animal chicken  = new Chicken();
```

**plus.**

**참조 변수의 타입 변환**

1. 서로 상속 관계에 있는 클래스 사이에만 타입 변환을 할 수 있다.
2. 자식 클래스 타입에서 부모 클래스 타입으로의 타입 변환은 생략할 수 있다.
3. 부모 클래스 타입에서 자식 클래스 타입으로의 타입 변환은 반드시 명시해야 한다.
(타입 캐스트 연산자를 활용한다.)

**동물**들은 모두 걷고, 먹고, 잠을 자지만 **동물들마다 그 방식은 다르다.**

구현체에서는 동물들이 각각 먹고, 걷고, 자는 방식을 구현하는데 

같은 "먹는다"라는 동사에서 동물마다 여러가지 형태로 구현할 수 있기 때문에 다형성이라 한다.

```java
// 동물들의 공통적 행위들을 추상적으로 선언
interface animal{
	public void eat(String bab);
	public void work(String move);
	public void sleep(String zzz);
}

// 고양이 구현체
class Cat implements animals{
	public void eat(String bab){
		Sysytem.out.println("고양이는 " + bab+ "을 먹어요.");
	}
	public void work(String move){
		Sysytem.out.println("고양이는 " + move+ "걸어요.");
	}
	public void sleep(String zzz){
		Sysytem.out.println("고양이는 " + zzz+ "자요.");
	}
}
// 원숭이 구현체
class Monkey implements animals{
	public void eat(String bab){
		Sysytem.out.println("원숭이는 " + bab+ "을 먹어요.");
	}
	public void work(String move){
		Sysytem.out.println("원숭이는 " + move+ "걸어요.");
	}
	public void sleep(String zzz){
		Sysytem.out.println("원숭이는 " + zzz+ "자요.");
	}
}
// 닭 구현체
class Chicken implements animals{
	public void eat(String bab){
		Sysytem.out.println("닭은 " + bab+ "을 먹어요.");
	}
	public void work(String move){
		Sysytem.out.println("닭은 " + move+ "걸어요.");
	}
	public void sleep(String zzz){
		Sysytem.out.println("닭은 " + zzz+ "자요.");
	}
}
```

```java
public class InterfaceTest{
	public static void main(String[] args){
		Cat cat = new Cat();
		Monkey monkey = new Monkey();
		Chicken chicken = new Chicken();

		cat.eat("생선");
		cat.work("네발로");
		cat.sleep("엎드려서");'

		monkey.eat("과일");
		monkey.work("두발 또는 네발로");
		monkey.sleep("누워서");

		chiken.eat("사료");
		chiken.work("두발로");
		chiken.sleep("서서");
	}
}
```

인터페이스에서는 각 동물이 무엇을 먹고, 어떻게 걷고, 자는지를 구현하도록 되어있다.

각 동물클래스 들이 animal이라는 인터페이스를 상속받을 시 eat, work, move 메서드를 오버라이딩 하여 구현해야 한다.

고양이의 자는 방법이 달라지더라도 원숭이와 닭에게는 영향이 없다!

**

**인터페이스는 다형성에 초점을 맞추어 사용하고,**

상속은 부모-자식 관계로서 부모가 갖고 있는 기능을 받을 수도 있고, 추가 혹은 수정할 수 있다.

구현하고자 하는 목적과 역할에 맞게 사용함으로써 보다 나은 가독성을 가진 코드와 구현이 가능할 것으로 예상된다!

- 수업시간 예제
    
    ```java
    <자식 객체를 부모타입의 변수에 담아 제어할 수 있다.>
    public void test1() {
    		Tiger tiger = new Tiger();
    		Animal animal1 = tiger; 
    		
    		Lion lion = new Lion();
    		Animal animal2 = lion;
    	}
    }
    ```
    
    ```java
    public void test1() {
    		Tiger tiger = new Tiger();
    		Animal animal1 = tiger; 
    		
    		Animal animal2 = new Lion();
    		
    		// 자식객체를 자식타입변수에 대입한 경우
    		tiger.say();
    		tiger.punch();
    		
    		// 자식객체를 부모타입변수에 대입한 경우
    		animal1.say();
    //	animal1.punch(); : 자식클래스에 선언한 필드/메소드에 접근할 수 없다.
    //자식클래스의 메소드를 사용하고 싶다면, 다시 자식 타입으로 형변환해야 한다. DownCasting
    		((Tiger) animal1).punch();
    //	(Tiger) animal1.punch(); //우선순위가 animal1. 이 먼저 실행되므로 괄호를 해줘야한다.
    ```
    

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/6aa5712e_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/af2eca94_Untitled.png]]

**업캐스팅 : 자동**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/e8ca2ca3_Untitled.png]]

**다운캐스팅 : 명시적으로 형변환**

- 부모타입의 배열을 만들어서 여러 자식객체를 제어할 수 있다.

```java
public void test3() {
		//변수 a에는 Animal 또는 Animal의 자식클래스는 다 대입가능하다.
		Animal a = null;
		a = new Tiger();
		a = new Lion();

		Animal[] arr = new Animal[3];
		arr[0] = new Tiger();
		arr[1] = new Lion();
		arr[2] = new Tiger();
		
		for(Animal animal : arr)
			System.out.println(animal);
	}
//결과
kh.java.polymorphism.animal.Tiger@167fdd33
kh.java.polymorphism.animal.Lion@1e965684
kh.java.polymorphism.animal.Tiger@4d95d2a2
```

### 🧐객체 instanceof 클래스

- 객체가 해당 클래스 타입이면 true반환

```java
for(Animal animal : arr) {
			System.out.println(animal + " " + (animal instanceof Tiger));
			//객체 instanceof 클래스 : 객체가 해당 클래스타입이면 true반환
			if(animal instanceof Tiger) {
				((Tiger)animal).punch();
			}
			else {
				((Lion) animal).kick();
			}
		}
		//instanceof 해당 타입으로 형변환 가능한가?
		Tiger tiger = new Tiger();
		System.out.println(tiger instanceof Tiger);
		System.out.println(tiger instanceof Animal);
		System.out.println(tiger instanceof Object);
	}
```

### 🧐동적바인딩 vs 정적바인딩

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/abfdb117_Untitled.png]]

#### 🔻**정적바인딩(Static binding)이란?**

**실행 이전에 값이 확정되면 정적 바인딩이라고 한다.**

**컴파일 타임에 호출될 함수가 결정**되는 것으로, 함수는 기본적으로 정적 바인딩된다.

컴파일러는 선언되어있는 자료형을 보고 바인딩을 하기 때문에 실제로 가리키는 객체가 무엇이든 **포인터의 자료형을 기반으로 호출의대상을 결정**한다.

- 빌드 중에 이루어진다.

#### 🔻**동적 바인딩(Dynamic binding)이란?**

**실행 이후에 값이 확정되면 동적 바인딩이라고 한다.**

**런타임에 호출될 함수가 결정되는 것**으로, virtual 키워드를 통해 동적 바인딩하는 함수를 가상 함수라고 한다.

함수가 **가상 함수로 선언**이 되면, 포인터 변수가 실제로 가리키는 객체에 따라 호출의 대상이 결정된다.

- 실행 파일을 만들 때 바인딩 되지 않고 보류 상태 둔다.실행 시간에 실제로 사용된 객체의 클래스형에 의해 호출될 함수가 결정됩니다. 점프할 메모리 번지를 저장하기 위한 메모리 공간(4 byte)을 가지고 있다가 런타임에 결정.

#### 🔻**예시!**

**int a=1;** 를 예로 생각해보자.

Data Type으로 **int**가 바인딩 되는 것은 프로그램을 컴파일 할 때 메모리에 할당되므로 **정적 바인딩**이다.

**a**라는 변수명 또한 컴파일 할 때 메모리에 할당되므로 **정적 바인딩**이다.

하지만 **1**은 실행 시에 값으로 할당되므로 **동적 바인딩**이다.

#### 🔻**장단점은?**

**[정적바인딩]**

- 장점 **: 정적 바인딩은** 컴파일 시 이미 값이 확정되어있기 때문에 **실행시 효율이 높아진다. 값이 변하지 않아서 안정적**이다.

**[동적바인딩]**

- 장점 : **유연**하고 **값이 변할 수 있다.**
- 단점 **:** 어떤 값이 들어올지 몰라서 들어올 값보다 많은 메모리 공간을 차지하고 있기 때문에 **메모리 공간이 낭비**될 수 있다.

들어오는 값이 메모리 타입에 맞는지 확인하기 때문에 **속도가 늦어진다.**

#### 🔻**java에서는?**

자바에서는 **메소드**를 기본적으로 **동적 바인딩** 하기 때문에 메소드 오버라이딩이 가능하다!

또한 **static**으로 선언하는 것은 메모리를 한 번밖에 할당하지 않기 때문에 컴파일 시에 메모리에 할당된다.

따라서 **static으로 선언된 것은 모두 정적 바인딩**이다.

- 바인딩 : 객체와 특정메소드를 연결시켜주는 걸 생각하면 된다.
- 정적바인딩 - CompileTime에 결정. 호출한 메소드의 실행타입별로 실행할 메소드가 결정되는 것
- 동적바인딩( 상속, 오버라이드, 다형성) - RunTime에 결정 
→ 다형성을 적용해 부모타입으로 메소드를 실행하면 자식 클래스의 오버라이드된 메소드가 호출

```java
정적바인딩
Animal animal = new Animal();
Tiger tiger = new Tiger();

animal.say();
tiger.say();

동적바인딩
Animal animal2 = new Tiger();
animal2.say();
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
