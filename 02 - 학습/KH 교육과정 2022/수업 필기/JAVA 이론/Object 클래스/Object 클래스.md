---
별칭:
  - "강의 - Object 클래스"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/6aac6ca69f7e4046ac34ee2e766285ab
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Object 클래스

## 강의 내용

### Object 클래스

#### java.lang 패키지

java.lang은 자바 프로그램에서 가장 많이 사용되는 패키지로서 자바 프로그램내에 'import'하지 않아도 자동으로 포함된다.

 그만큼 기본이 되는 클래스들과 인터페이스들이 포함되어 있다.

java.lang 패키지 클래스의 구조 

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/첨부/d208b00a_Untitled.png]]

#### Object 클래스

java.lang.Object 클래스는 자바 API의 모든 클래스와 사용자가 정의한 모든 클래스의 **최상위 클래스이다.**

즉, 모든 클래스들은 Object 클래스로부터 상속받는다.

사용자가 클래스를 정의할 때 선언부에 명시적으로 extends Object 하지 않아도 자동으로 상속받게 된다는 것이다. 

→ Object 클래스의 모든 메서드와 변수는 다른 클래스에서도 동일하게 사용할 수 있다는 것이다.

**Object 클래스 주요 메소드** 

[[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled Database|Untitled]]

**toString()**

**기본동작** : 객체의 해시코드를 출력한다. 

**Override 목적** : 객체의 정보를 문자열 형태로 표현하고자 할 때

**toString() 의 원형은 아래와 같다.**

```java
getClass().getName() + '@' + Integer.toHexString(hashCode())
```

**equals()**

**기본동작** : '==' 연산 결과 반환

**override 목적** : 물리적으로 다른 메모리에 위치하는 객체여도 논리적으로 동일함을 구현하기 위함.

equals()를 사용해 두 객체의 동일함을 논리적으로 override할 수 있다. 

**'물리적 동일함'** - 객체가 메모리에서 같은 주소값을 갖는 것을 의미

**'논리적 동일함'** - 물리적으로는 다른 위치에 있지만 같은 id의 회원객체, 같은 id의 주문객체와 같이 도메인을 구분할 수 있는 고유한 값 등에 의해 동일한 것을 의미

```java
public class User {

    int id;
    String name;

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public static void main(String[] args) {

        User user1 = new User(1001, "홍길동");
        User user2 = new User(1001, "홍길동");
        
        System.out.println(user1.equals(user2));
    }
}
```

**위 코드의 결과** 

- equals() 메소드의 기본 동작은 '==' 연산이기 때문에 서로 다른 인스턴스를 가리키는 참조변수 user1과 user2를 비교하면 자연스럽게 false가 반환된다.
- 이 경우 equals() 메소드를 override하여 논리적인 동일성을 갖도록 재정의 해야한다.

<aside>
💡 false

Process finished with exit code 0

</aside>

equals()메소드 재정의

```java
public class User {

    int id;
    String name;

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    @Override
    public boolean equals(Object obj) {

        if (obj instanceof User) {
            return this.getId() == ((User)obj).getId();
        } else {
            return false;
        }
    }

    public static void main(String[] args) {

        User user1 = new User(1001, "홍길동");
        User user2 = new User(1001, "홍길동");

        System.out.println(user1.equals(user2));
    }
}
```

**hashCode()**

**기본동작 :** JVM이 부여한 코드값. 인스턴스가 저장된 가상머신의 주소를 10진수로 반환한다.

**override 목적** : 두 개의 서로 다른 메모리에 위치한 객체가 동일성을 갖기 위함.

**해시코드란,** jvm이 인스턴스를 생성할 때 메모리 주소를 변환해서 부여하는 코드.

실제 메모리 주소값과는 별개의 값이며 실제 메모리 주소는 System 클래스의 identityHashCode()로 확인할 수 있다.

**자바에서의 동일성**

equals()의 반환값이 true, hashCode() 반환값이 동일함을 의미한다.

→ 보통 equals()와 hashCode()는 함께 override 한다.

```java
public class User{
	int id;
	String name;

	public User(int id, String name){
		this.id = id;
		this.name = name;
	}

	public int getId(){
		return id;
	}

	@Override
	public boolean equals(Object obj){
		if(obj instanceof User){
			return this.getId() == ((User)obj).getId();
		}else{
			return false;
	}

	public static void main(String[] args) {

      User user1 = new User(1001, "홍길동");
      User user2 = new User(1001, "홍길동");

      System.out.println("user1.equals(user2): " + user1.equals(user2));
      System.out.println("user1.hashCode(): " + user1.hashCode());
      System.out.println("user2.hashCode(): " + user2.hashCode());
  }
}
```

**위 main 메소드 실행 결과**

- equals 메소드를 overriding 하여 같음을 확인
- hashCode는 별도 재정의 하지 않았음으로 아래와 같이 다르게 출력

<aside>
💡 user1.equals(user2): true
user1.hashCode(): 901506536
user2.hashCode(): 747464370

Process finished with exit code 0

</aside>

```java
public class User{
	int id;
	String name;

	public User(int id, String name){
		this.id = id;
		this.name = name;
	}

	public int getId(){
		return id;
	}

	@Override
	public boolean equals(Object obj){
		if(obj instanceof User){
			return this.getId() == ((User)obj).getId();
		}else{
			return false;
	}

	@Override
	public int hashCode(){
		return getId();
	}

	public static void main(String[] args) {

      User user1 = new User(1001, "홍길동");
      User user2 = new User(1001, "홍길동");

      System.out.println("user1.equals(user2): " + user1.equals(user2));
      System.out.println("user1.hashCode(): " + user1.hashCode());
      System.out.println("user2.hashCode(): " + user2.hashCode());
			System.out.println("System.identityHashCode(user1): " + System.identityHashCode(user1));
      System.out.println("System.identityHashCode(user2): " + System.identityHashCode(user2));
  }
}
```

**위 main 메소드 실행 결과**

- hashCode() 재정의하여 반환 값을 getId()로 하였다.
- 구현하고자 한 객체의 같음(동시성)을 표현하기 위해서는 id를 통해 구분하기 위함이였으며, equals()와 hashCode()를 함께 재정의 하였다.

<aside>
💡 user1.equals(user2): true
user1.hashCode(): 1001
user2.hashCode(): 1001
System.identityHashCode(user1): 901506536
System.identityHashCode(user2): 747464370

Process finished with exit code 0

</aside>

**clone()**

해당 인스턴스를 복제하여 새로운 인스턴스를 반환한다.

**but.** 단지 필드의 값만 복사함으로, 필드의 값이 배열이나 인스턴스면 제대로 복제할 수 없다.

→ clone() 메소드를 오버라이딩하여 복제가 제대로 이루어지도록 재정의 해야 한다.

이러한 clone() 메소드는 데이터의 보호를 이유로 **Cloneable 인터페이스를 구현한 클래스의 인스턴스만**이 사용할 수 있다.

- 객체지향의 정보은닉에 위배 될 수 있음 🤢

```java
public class Book {

    private String title;
    private String author;

    public Book(String title, String author) {
        this.title = title;
        this.author = author;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", author='" + author + '\'' +
                '}';
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }

    public static void main(String[] args) throws CloneNotSupportedException {

        Book book1 = new Book("깊은 밤 부엌에서", "모리스 샌닥");
        System.out.println(book1);
        
        Book book2 = (Book) book1.clone();
        System.out.println(book2);
    }
}
```

<aside>
💡 Book{title='깊은 밤 부엌에서', author='모리스 샌닥'}
Exception in thread "main" java.lang.CloneNotSupportedException: com.yoon._object.Book
	at java.base/java.lang.Object.clone(Native Method)
	at com.yoon._object.Book.clone(Book.java:23)
	at com.yoon._object.Book.main(Book.java:31)

Process finished with exit code 1

</aside>

**Book 클래스를 Clone이 가능하게 하려면?** - implements Cloneable

```java
class Book implements Cloneable
```

Cloneable 인터페이스는 빈 인터페이스이다.

- 즉, Cloneable 인터페이스를 implements 해도 구현해야 할 메소드는 없다.
- 이러한 인터페이스를 **"Mark Interface"** 라고도 한다.

```java
public interface Cloneable{
}
```

**clone() 메소드의 고찰**

Clone 메소드는 신중하게 오버라이드하자. (feat. effective Java)

Cloneable 인터페이스는 복제를 허용하는 객체라는 것을 알리는 목적으로 사용하는 믹스인 인터페이스이다. (Mixin Interface)

- 믹스인 인터페이스이기 때문에 자신이 clone method를 가지고 있는 것도 아니다.
- Object의 clone은 Cloneable을 implements 하지 않으면 사용할 수 없다.

 Cloneable 을 impelemtns한 class에서 clone을 호출하면, 해당 객체의 복제본을 만들어 반환한다.

→ 복제 객체는 원본 객체와 같은 필드를 가지며 각 필드의 값도 복사된다.

**but**.

**reference를 가진 녀석들은 Deep Copy 가 아닌 Soft Copy를 수행한다는 점에 주목해야한다.**

clone 메소드는 또 다른 생성자와 같다.

clone 메소드가 원본 객체에 손상을 주지 않으면서 원본과 복제 객체 간의 상호 영향도 없도록 해야 한다.

→ 즉, reference의 경우 deep copy를 해주어야 한다는 것이다.

여기서 deep copy는 해당 객체의 clone을 호출해주는 것만으로 끝나는 것이 아니다. 

- Collection일 경우에는 Collection 안의 내용물들도 clone 을 해주는 진정한 Deep Copy가 되어야 한다.

**finalize()**

finalize() 메소드는 직접 호출하는 메소드가 아니라

객체가 HEAP 메모리에서 해제될 때 가비지 콜렉터가 호출하는 메소드이다.

이 메소드가 Override되어 있으면 가바지 콜렉터가 이 메소드를 호출하여 실행한다.

즉, finalize()는 객체가 해제될 때 리소스 해제, 소켓 close 등의 필요한 것들을 구현해주면 된다.

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/Class getClass()|Class getClass()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/String toString()|String toString()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/boolean equals(Object obj)|boolean equals(Object obj)]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/int hashCode()|int hashCode()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/protected Object clone()|protected Object clone()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/protected void finalize()|protected void finalize()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/void notify()|void notify()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/void notifyAll()|void notifyAll()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/void wait()|void wait()]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/void wait(long timeout)|void wait(long timeout)]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled/void wait(long timeout, int nanos)|void wait(long timeout, int nanos)]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/Object 클래스/Untitled Database|Untitled Database]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
