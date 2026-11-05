---
별칭:
  - "강의 - Optional"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/9e7373decc0e46b6b3c5eac319b71309
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Optional

## 강의 내용

- 목차

### null 창시자가 스스로 인정한 null 탄생의 실수

> 우선 null이라는 개념은 언제 누구에 의해 만들어졌을까요?
null 참조는 1965년에 Tony Hoare라는 영국의 컴퓨터 과학자에 의해서 처음으로 고안되었습니다.
당시 그는 “존재하지 않는 값”을 표현할 수 있는 가장 편리한 방법이 null 참조라고 생각했다고 합니다.
하지만 나중에 그는 그 당시 자신의 생각이 “10억불 짜리 큰 실수”였고, null 참조를 만든 것을 후회한다고 토로하였습니다.
> 

## Optional의 도입

> 스칼라나 히스켈과 같은 소위 함수형 언어들은 전혀 다른 방법으로 이 문제을 해결합니다.
자바가 “존재하지 않는 값”을 표현하기 위해서 null을 사용했다면, 이 함수형 언어들은 존재할지 안 할지 모르는 값을 표현할 수 있는 별개의 타입을 가지고 있습니다.
그리고 이 타입은 이 존재할지 안 할지도 모르는 값을 제어할 수 있는 여러가지 API를 제공하기 때문에 개발자들 해당 API를 통해서 간접적으로 그 값에 접근하게 됩니다.
Java8은 이러한 함수형 언어의 접근 방식에서 영감을 받아 `java.util.Optional<T>`라는 새로운 클래스를 도입하였습니다!
> 

## Basics

Optional는 "존재할 수도 있지만 안 할 수도 있는 객체", 즉, "null이 될 수도 있는 객체"을 감싸고 있는 일종의 래퍼 클래스

변수명은 그냥 클래스 이름을 사용하기도 하지만 `maybe`나 `opt`와 같은 접두어를 붙여서 Optional 타입의 변수라는 것을 명시

### Optional 객체 생성

1. `Optional.empty()` : 비어있는 Optional객체
    
```java
Optional<Member> maybeMember = Optional.empty();
```

2. `Optional.of(value)` : null이 아닌 객체를 담은 Optional객체 (null이면 NPE를 던짐)
    
```java
Optional<Member> maybeMember = Optional.of(aMember);
```

3. `Optional.ofNullable(value)` : null일수도 있는 Optional객체
    - not null : `Optional.of(value)`
    - null : `Optional.empty()`
    
```java
Optional<Member> maybeMember = Optional.ofNullable(aMember);
Optional<Member> maybeNotMember = Optional.ofNullable(null);
```


### Optional 객체가 감싼 객체 제어

1. `get()` : null이면, NoSuchElementException을 던짐.
2. `orElse(T other)` : null이면, 전달받은 인자 other를 다시 리턴
3. *`orElseGet(Supplier<? extends T> other)` : null이면 전달받은 함수형 인자를 통해 생성된 객체를 반환. `orElse(T other)`의 게으른 버전이라고 보시면 됩니다. null인 경우에만 함수가 호출되기 때문에 **orElse(T other) 대비 성능상 이점을 기대할 수 있음.**
4. *`orElseThrow(Supplier<? extends X> exceptionSupplier)`: null인 경우 넘어온 함수형 인자를 통해 생성된 예외를 던짐.
5. `isPresent()` : null여부를 boolean으로 리턴.
6. `ifPresent(Consumer<? super T> consumer)`: 이 메소드는 특정 결과를 반환하는 대신에 Optional 객체가 감싸고 있는 값이 존재할 경우에만 실행될 로직을 함수형 인자로 넘김.

```java
public void test1() {
		int len = getStringLength("홍길동");
		System.out.println(len);
		len = getStringLength("");
		System.out.println(len);
		len = getStringLength(null);
		System.out.println(len);
	}
	
	/**
	 * Optional객체
	 * - Optional.empty() : 비어있는 객체
	 * - Optional.of(객체) : null일수 없는 객체
	 * - Optional.ofNullable(null가능성 있는 객체)
	 * 
	 * 결과
	 * - get():T 객체가 null인 경우 NoSuchElemnetException을 던짐.
	 * - orElse(기본값): 객체가 null인경우 기본값으로 처리
	 * - orElseGet(Supplier): 객체가 null인 경우 supplier가 리턴한 값을 리턴
	 * - orElseThrow(exceptionSupplier): 객체가 null인 경우, exceptionSupplier가 제공한 예외를 던짐.
	 * 
	 * @param str
	 * @return
	 */
	public int getStringLength(String str) {
		Optional<String> maybeStr = Optional.ofNullable(str);
		return maybeStr.map(s -> s.length()).orElse(0); 
	}
```

## 중첩객체에서 Optional 사용

has a 포함관계의 있는 vo에서 내부필드의 값에 접근하려면, 해당 field의 null여부 검사를 필수적으로 수행해야 한다.

```java
/* 주문 */
@Data
class Order {
	private Long id;
	private Date date;
	private Member member;
}
/* 회원 */
@Data
class Member {
	private Long id;
	private String name;
	private Address address;
}
/* 주소 */
@Data
class Address {
	private String street;
	private String city;
	private String zipcode;
}

public class BeforeOptional {

	public static void main(String[] args) {
		
		//임의의 Order객체생성
		Order order = new Order();
		
		//이 주문을 한 회원이 살고 있는 도시를 반환
		String city = new BeforeOptional().getCityOfMemberFromOrder(order);
		System.out.println("city = " + city);
		
		

	}

	/* 주문을 한 회원이 살고 있는 도시를 반환한다 */
	/*public String getCityOfMemberFromOrder(Order order) {
		return order.getMember().getAddress().getCity();
	}*/
	
	public String getCityOfMemberFromOrder(Order order) {
		if (order != null) {
			Member member = order.getMember();
			if (member != null) {
				Address address = member.getAddress();
				if (address != null) {
					String city = address.getCity();
					if (city != null) {
						return city;
					}
				}
			}
		}
		return "Seoul"; // default
	}
	
	
}
```

Optional을 사용해 다음과 같이 작성할 수 있다.

```java
private String getCityFromOrder(Order order) {
		return Optional
						.ofNullable(order)
						.map(Order::getMember)
						.map(Member::getAddress)
						.map(Address::getCity)
						.orElse("Seoul");
		
//		Optional<Order> maybeOrder = Optional.ofNullable(order);
//		return maybeOrder
//				.map(o -> o.getMember()) // Optional<Member>
//				.map(m -> m.getAddress())// Optional<Address>
//				.map(a -> a.getCity()) // Optional<String>
//				.orElse("Seoul");
		
	}
```

## filter

Optional의 filter는 Stream의 filter와 달리 단일 Optional객체에 대해서 실행한다.

조건에 만족하지 않으면, Optional.empty()를 리턴. 이를 `isPresent():boolean`, `isEmpty():boolean`로 다시 확인할 수 있다. (isEmpty는 jdk11에 추가)

```java
/**
 * filter
 * 조건에 만족하지 않으면, Optional.empty()를 리턴
 * 이를 isPresent(), isEmpty()로 다시 확인할 수 있다. (isEmpty는 jdk11에 추가)
 */
private void test3() {
	Stream
			.of(30, 50, 60, -35, 130, null, new Integer(88))
			.peek(n -> System.out.println(isValid(n))) // true true true false false false true
			.filter(this::isValid)
			.forEach(n -> System.out.println(n)); // 30 50 60 88
		/*
		 출력결과:
		 	true
			30
			true
			50
			true
			60
			false
			false
			false
			true
			88
		 */
}

public boolean isValid(Integer num) {
	return Optional.ofNullable(num).filter(n -> n >= 0 && n <= 100).isPresent();
}
```

### @ 실습문제

(난이도: 중상) persons목록에서 R로 시작하는 사람 가져오기. 

1. stream의 filter, Objects.nonNull 사용
2. Optional : 요소를 Optional객체로 변경해 null-safe하게 filtering

```java
/**
 * persons목록에서 R로 시작하는 사람 가져오기
 */
private void test4() {
	List<Person> persons = new ArrayList<>();
	persons.add(new Person("David"));
	persons.add(new Person("Adele"));
	persons.add(new Person("Britney"));
	persons.add(new Person("Robert"));
	persons.add(new Person("Rabbit"));
	persons.add(null);
	persons.add(new Person());
	
//		List<Person> result = 
//			persons
//				.stream()
//				.filter(p -> p.getName().startsWith("R")) // NPE
//				.collect(Collectors.toList());
	
	//1.filter : Objects.nonNull(nullableValue)로 처리
	List<Person> result1 = 
			persons
				.stream()
				.filter(Objects::nonNull)
				.filter(p -> Objects.nonNull(p.getName()))
				.filter(p -> p.getName().startsWith("R")) // NPE
				.collect(Collectors.toList());
	System.out.println(result1);
	
	//2. Optional : 요소를 Optional객체로 변경해 null-safe하게 filtering
	List<Person> result2 = 
			persons
				.stream()
				.map(Optional::ofNullable) // Person -> Optional<Person>
//					.filter(p -> p.isPresent())	// Person객체가 null인지 체크(생략)
				.filter(p -> p.map(Person::getName).isPresent())
				.map(p -> p.get()) // Optional<Person> -> Person (null-safe) 
				.filter(p -> p.getName().startsWith("R"))
				.collect(Collectors.toList());
	System.out.println(result2);
}

@Data
@NoArgsConstructor
@AllArgsConstructor
class Person {
	private String name;
}
```

## Optional 최적화

[](http://homoefficio.github.io/2019/10/03/Java-Optional-%EB%B0%94%EB%A5%B4%EA%B2%8C-%EC%93%B0%EA%B8%B0/)

Java Optional 바르게 쓰기

1. `isPresent()-get()` 대신 `orElse()/orElseGet()/orElseThrow()`
2. `orElse(new ...)` 대신 `orElseGet(() -> new ...)`
3. 단지 값을 얻을 목적이라면 `Optional` 대신 `null` 비교
4. `Optional` 대신 비어있는 컬렉션 반환
5. `Optional`을 필드로 사용 금지
6. `Optional`을 생성자나 메서드 인자로 사용 금지
7. `Optional`을 컬렉션의 원소로 사용 금지
8. `of()`, `ofNullable()` 혼동 주의
9. `Optional<T>` 대신 `OptionalInt`, `OptionalLong`, `OptionalDouble`

## See Also

[자바8 Optional 1부: 빠져나올 수 없는 null 처리의 늪](http://www.daleseo.com/java8-optional-before/)

[자바8 Optional 2부: null을 대하는 새로운 방법](http://www.daleseo.com/java8-optional-after/)

[자바8 Optional 3부: Optional을 Optional답게](http://www.daleseo.com/java8-optional-effective/)

[[Java] Optional을 이용한 새로운 null 처리](https://mylupin.tistory.com/74)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
