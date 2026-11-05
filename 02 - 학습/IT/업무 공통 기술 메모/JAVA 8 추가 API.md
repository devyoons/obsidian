---
별칭:
  - "학습 - JAVA 8 추가 API"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/백엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/9be500eac892409c99cb19c3fbdb2180
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 학습: JAVA 8 추가 API

## 세부 내용

---

---

#### Lambda : 익명함수지원, 코드간결, 컬렉션 처리 및 병렬프로그밍화

- 자바8 이전버전에서는 함수가 1급 객체가 아니므로, 메소드 자체를 전달하거나 리턴할 수 없다.
    - 1급 객체란?
        - 변수나 데이터에 할당할 수 있어야 한다.
        - 객체의 인자로 넘길 수 있어야 한다.
        - 객체의 리턴값으로 리턴할 수 있어야 한다.
- 자바에서는 메소드는 소속된 형태로만 사용가능하므로, 인터페이스등에 메소드 작성후 익명클래스객체를 통해서 처리할 수 있다.
- 즉, 기능(함수)를 객체에 담아두고 이를 변수에 담거나, 특정메소드에 전달, 또는 리턴받아 사용할 수 있다.

```java
//java 8 이전버전
public class AnonymousToLambda {
 
	public static void main(String[] args) {
    
    		// Java 8 이전의 방식 ( 익명 구현 객체[익명 클래스] ) 
		RunSomething rs = new RunSomething() {
        
			@Override
			public void doIt() {
				System.out.println("Anonymous Class!");
			}
		};
		rs.doIt();
	}
}
```

```java
//java 8 
public class AnonymousToLambda {
 
	public static void main(String[] args) {
    
		// 람다 표현식(Lambda Expression)
		RunSomething rs = () -> System.out.println("Anonymous Class!");
		
		rs.doIt();
	}
}
```

- 사용방법
    
```java
(인자 리스트) -> { body }
```

- 인자 리스트
    - 인자가 없을 때 : ( )
    - 인자가 1개일 때 : (one) 또는 one으로 괄호() 생략 가능
    - 인자가 여러 개일 때 : (one, two) 괄호 생략 X
    - 인자의 타입(Type)은 생략 가능 / 컴파일러가 추론(infer)하지만 명시할 수도 있다. (Integer one, Integer two)
- Body(바디)
    - 화살표(->) 오른쪽에 함수 본문을 정의
    - **여러 줄인 경우 { }를 사용해서 묶는다.**
    - **1 줄인 경우 { }를 생략 가능하며, return 또한 생략 가능**

```java
// 생략 전
Function<Integer, Integer> plus10 = (input) -> {
    return input + 10;
};
 
// 괄호{ } , return 생략
Function<Integer, Integer> plus20 = (input) -> input + 20; // 괄호, return 생략 가능
```


#### interface : default, static 메서드

- 자바7 이전에는 추상메서드 선언 및 상수 정의만 가능했는데 default method와 static method를 추가 정의할 수 있다.
- 인터페이스를 구현한 클래스에서 이러한 메서드를 오버라이드하지 않아도 되며, 이로써 기존 코드를 변경하지 않고도 새로운 기능을 추가할 수 있음
- **default 메소드**
    
    인터페이스가 변경이 되면, 인터페이스를 구현하는 모든 클래스들이 해당 메소드를 구현해야 하는 문제가 있다.
    
    이런 문제를 해결하기 위하여 인터페이스에 메소드를 구현해 놓을 수 있도록 하였다.
    
- **static 메소드**
    
    인터페이스에 static 메소드를 선언함으로써,
    
    인터페이스를 이용하여 간단한 기능을 가지는 유틸리티성 인터페이스를 만들 수 있게 되었다.
    

```java
// java 7 이하
// 인터페이스 정의
public interface MyInterface {
    void myMethod();
}

// 인터페이스 구현
public class MyClass implements MyInterface {
    @Override
    public void myMethod() {
        System.out.println("MyMethod 구현");
    }
}
```

```java
//java 8 
// 인터페이스 정의
public interface MyInterface {
    void myMethod();

    // 디폴트 메서드
    default void myDefaultMethod() {
        System.out.println("MyDefaultMethod 구현");
    }

    // 정적 메서드
    static void myStaticMethod() {
        System.out.println("MyStaticMethod 구현");
    }
}

// 인터페이스 사용
public class Main {
    public static void main(String[] args) {
        MyInterface obj = new MyInterface() {
            @Override
            public void myMethod() {
                System.out.println("MyMethod 구현");
            }
        };

        obj.myMethod(); // MyMethod 구현
        obj.myDefaultMethod(); // MyDefaultMethod 구현
        MyInterface.myStaticMethod(); // MyStaticMethod 구현
    }
}
```

#### 함수형 인터페이스와 메서드 참조

- 자바8에 추가된 함수형 인터페이스는 함수형 프로그래밍을 지원하고, 람다표현식 및 스트림 API와 함께 사용됩니다.

Consumer<T>(T타입을 받고 리턴값 없음)

```java
Consumer<Integer> printT = (i) -> System.out.println(i);
printT.accept(10);
```

Supplier<T>(T타입의 값을 제공)

```java
Supplier<Integer> get10 = () -> 10;
System.out.println(get10); // 10
```

Function<T, R>(T타입을 받고 R타입을 리턴)

```java
Function<Integer, Integer> plus10 = (i) -> i + 10;
System.out.println(plus10.apply(1)); //11 -> 1 + 10
```

Predicate<T>(T타입을 받아 조건 검사후 boolean을 리턴)

```java
Predicate<Integer> isOdd = (i) -> i%2 == 0;
Predicate<Integer> isEven = (i) -> i%2 == 1;

System.out.println(isOdd.and(isEven).test(4));
System.out.println(isOdd.or(isEven).test(4));
System.out.println(isOdd.negate().test(3));
```

Operator(입력값을 받아 연산 수행 후 결과값 반환)

1. **Single Abstract Method (SAM)**: 

함수형 인터페이스는 오직 하나의 추상 메서드만을 가집니다. 이 특징으로 인해 람다 표현식을 사용하여 간결한 메서드를 정의할 수 있습니다.

1. **@FunctionalInterface 어노테이션**: 

이 어노테이션은 컴파일러에게 해당 인터페이스가 함수형 인터페이스임을 알려줍니다. 또한, 컴파일러가 오류를 감지할 수 있도록 합니다.

<aside>
💡 static 메서드와 default 메서드가 인터페이스 안에 존재하더라도 추상 메서드가 1개만 존재하면 함수형 인터페이스입니다.

</aside>

#### Stream : 컬렉션 데이터를 처리, 데이터 병렬 처리, 다양한 연산 수

컬렉션과 배열의 데이터는 일반적으로 for문, iterator등의 반복문을 이용해서 제어해왔다. 이 방식의 문제중 하나는 데이터소스마다 다른 방식으로 다뤄야한다는 것이다.
(Collection, Iterator등의 인터페이스를 통한 어느정도의 추상화는 가능하지만...)
예) List를 정렬하려면, Collection.sort()메소드를 이용하고, 배열을 정렬하려면, Arrays.sort()메소드를 이용해야한다.

JDK8 Stream API를 사용하면, 데이터소스를 추상화해서 리스트, 배열 모두 같은 방식을 통해 다룰 수 있다.

```java
List<String> names = Arrays.asList("jeong", "pro", "jdk", "java");
// 기존의 코딩 방식
long count = 0;
for (String name : names) {
    if (name.contains("o")) {
        count++;
    }
}
System.out.println("Count : " + count); // 2
 
// 스트림 이용한 방식
count = 0;
count = names.stream().filter(x -> x.contains("o")).count();
System.out.println("Count : " + count); // 2
```

실제 사용법으로 표기하면 "**Collections같은 객체 집합.스트림생성().중개연산().최종연산();**"

- 계속해서 . 으로 연계할 수 있게 하는 방법을 파이프라인이라고도 한다.

#### Optional : NPE방지, 안전한 null처리

- null이 될 수도 있는 객체를 감싸고 있는 일종의 래퍼 클래스이다.
- 명시적으로 해당 변수가 null일수도 있다는 가능성을 표현할 수 있음.
- NPE를 유발할 수 있는 null을 직접 다루지 않아도되서 코드가 깔끔해진다.
    
```java
// 적용 전
public void test(){
    String str = "ggomak";
    if(str!=null){
        System.out.println(str);
    }	
}
// 적용 후
public void test(){
    String str = "ggomak";
    Optional<String> opt = Optional.ofNullable(str);
    opt.ifPresent(name -> System.out.println(name));
}
```

- 메서드가 반환할 결과값이 ‘없음’을 명백하게 표현할 필요가 있고, null을 반환하면 에러를 유발할 가능성이 높은 상황에서 메서드의 반환 타입으로 Optional을 사용하자는 것이 만들어진 주목적이다.

#### StringJoiner : 문자열을 구분자로 합칠 수 있는 기능

- 기존 방식은 루프를 돌면서 조건식을 통해 문자열에 추가했었음

```java
// java 8 이전버전
final List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
final StringBuilder stb = new StringBuilder();
int size = numbers.size();
for (int i = 0; i < size; i++) {
    stb.append(numbers.get(i));
    if (i != size - 1) {
        stb.append(" : ");
    }
}
System.out.println(stb.toString());
```

- 체이닝을 통해 간단하게 구분자를 넣어줄 수 있다.

```java
// java 8 
final List<Integer> numbers = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
final String result = numbers.stream()
														 .map(String::valueOf)
														 .collect(joining(" : "));
```

#### Date API : joda-time을 참고하여 새짐

---

- JDK 1.0 : java.util.Date (java의 유일한 시간/날짜 API)
- JDK 1.1 : java.util.Calendar (java.util.Date의 날짜간의 연산, 국제화 지원 등의 기능을 java.util.Calendar가 맡게 됨)
- JDK 1.8 (JSR-310) : java.time (오픈소스 Joda-Time에서 많은 영향을 받아 만들어진 새로운 시간/날짜 관련 패키지)

---

- JSR310 (joda-time을 참고)하여 새로 만들어 졌고, java.time 패키지에 담겨 있다.
- 기존 Date와 Calendar 클래스
    - **1900년 1월  0일부터 시작**
        - 일광성이 없고 날짜를 조작하는 메서드가 적다
    - **API가 현실의 사회 제도, 과학, 역사적 문제와 복잡하게 얽혀 있다**
        - Calendar 클래스는 그레고리력, 율리우스력 등 다양한 역법을 지원한다 즉, 제대로 사용하기 위해서는 천문학적 지식을 알아야했음
    - **Calendar와 Date는 불변 객체가 아님**
        - 여러 객체가 공유되더라도 값이 변하지 않게 한번 생성된 이후 내부 속성을 바꿀 수 없게 설계해야 하는데 java의 Calendar와 Date는 불변 객체가 아니라서 여러 객체에 의해 공유되는 상황이라면 그 객체의 정보를 믿을 수 없음
    - **오류에 둔감함**
        - 서울 시간은 'Asia/Seoul'인데 프로그래머가 실수로 'Seoul/Asia’적어도 오류는 발생하지 않는다
    - **java.util.Date 하위 클래스의 문제**
        - java.util.Date와 java.sql.Date의 이름이 같은 부분 때문에 'java 플랫폼 설계자는 클래스 이름을 지으면서 깜빡 졸았나보다'라는 조롱도 있을 정도로 헷갈리게 지어놓음
    
    <aside>
    💡 편하게 사용하는게 API인데 불필요하게 헷갈리고 생성 비용이 적지도 않았음
    그래서 Joda-Time이라는 라이브러리를 추가로 사용했었
    
    </aside>
    

**java8  java.time 도입**

- LocalDate : 년, 월, 일
- LocalTime : 시, 분, 초, 나노초
- LocalDateTime : 년, 월, 일, 시, 분, 초, 나노초
- java.time내의 클래스들은 불변객체
- 메소드 체이닝을 지원

---

`Instant` : 타임스탬프 ( 기계용 시간, EPOCH )

`LocalDate` : 시간이 없는 날짜 ( 타임존에 대한 참조가 없음 )

`LocalTime` : 날짜가 없는 시간 ( 타임존에 대한 참조가 없음 )

`LocalDateTime` : 날짜와 시간을 결합한 클래스

`ZonedDateTime` : UTC 에서 시간대 및 타임존에 대한 참조를 가진 시간과 날짜를 다루는 클래스

---

- 현재 시간 객체 생성
    
```java
// 현재 시간 객체 생성
LocalTime localTime = LocalTime.now(); // 11:37:23.431062500
LocalTime localTIme = LocalTime.of(12, 30, 0);//12:30
```


- 객체의 형변환
    
```java
// localTime -> String 
localTime.format( DateTimeFormatter.ISO_LOCAL_TIME ); // 11:07:27.0000000000
localTime.format( DateTimeFormatter.ofPattern( "HH:mm:ss" ); // 11:07:27

// String -> localTime 
LocalTime.parse( "22:00:00", DateTimeFormatter.ofPattern( "HH:mm:ss" ) ); // @param String, DateTimeFormatter
```


- 유용한 메서드
    
```java
// 시간, 분, 초 나노초 얻기 
loalTime.getHour(); // 11
localTime.getMinute(); // 25
localTime.getSecond(); // 38
localTime.getNano(); // 879975840

// 시간 비교 
LocalTime time1 = LocalTime.of( 12, 30, 0 );
LocalTime time2 = LocalTime.of( 13, 40, 0 );

time1.isAfter( time2 ); // false ( @param LocalTime )
time1.isBefore( time2 ); // true

// 특정 시간에서 특정 부분 ( 시간, 분, 초 ) 변경한 객체 얻기
LocalTime localTime3 = LocalTime.of(12, 30, 0);

localTime3.with(ChronoField.MINUTE_OF_HOUR, 40); // 12:40 ( @param TemporalField field, long newValue )
localTime3.withHour(13); // 13:30
localTime3.withMinute(40); // 12:40
localTime3.withSecond(40); // 12:30:40
localTime3.withNano(40); // 12:30:00.000000040

// 시간 더하기
localTime3.plus(2, ChronoUnit.HOURS); // 14:30 ( @param long amountToAdd, TeporalUnit unit )
localTime3.plusHours(2); // 14:30
localTime3.plusMinutes(30); // 13:00
localTime3.plusSeconds(30); // 12:30:30
localTime3.plusNanos(30); // 12:30:00.000000030

// 시간 빼기
localTime3.minus(2, ChronoUnit.HOURS); // 10:30 ( @param long amountToSubtract, TeporalUnit unit )
localTime3.minusHours(2); // 10:30
localTime3.minusMinutes(30); // 12:00
localTime3.minusSeconds(30); // 12:29:30
localTime3.minusNanos(30); // 12:29:59.999999970

// 두 시간 차이
Duration duration = Duration.between(time1, time2);
duration.getNano(); // 0
duration.getSeconds(); // 4200

long diffHours = ChronoUnit.HOURS.between(time1, time2); // 1
long diffMinutes = ChronoUnit.MINUTES.between(time1, time2); // 70
long diffSeconds = ChronoUnit.SECONDS.between(time1, time2); // 4200
```

- 참조
    
    [Java의 날짜/시간 API. Date와 Calendar는 왜 사용하면 안될까?](https://gaebalsogi.tistory.com/66)
    

| ERA | 시대 |
| --- | --- |
| YEAR | 연도 |
| MONTH_OF_YEAR | 월 |
| DAY_OF_MONTH | 일 |
| DAY_OF_WEEK | 요일 (월요일:1, 화요일:2, ..., 일요일:7) |
| AMPM_OF_DAY | 오전/오후 |
| HOUR_OF_DAY | 시(0~23) |
| CLOCK_HOUR_OF_DAY | 시(1~24) |
| HOUR_OF_AMPM | 시(0~11) |
| CLOCK_HOUR_OF_AMPM | 시(1~12) |
| MINUTE_OF_HOUR | 분 |
| SECOND_OF_MINUTE | 초 |
| DAY_OF_YEAR | 해당 연도의 몇 번째 날 (1~365, 윤년이면 366) |
| EPOCH_DAY | EPOCH(1970년 1월 1일)을 기준으로 몇 번째 날 |

#### 자바 병렬 정렬(**Parallel array Sorting)**

- Java 8에서는 `parallelSort()`라는 정렬 메소드가 제공되며, Java 7에서 소개된 Fork-Join 프레임웍이 내부적으로 사용된다.
- sort()의 경우 단일 쓰레드로 수행되며, parallelSort()는 필요에 따라 여러 개의 쓰레드로 나뉘어 작업이 수행된다. 따라서 **parallelSort()가 CPU를 더 많이 사용하게 되겠지만, 처리 속도는 더 빠르다.**
- 개수가 많지 않은 배열에서는 `sort()` / 개수가 많은 배열에서 `parallelSort()`

‣

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
