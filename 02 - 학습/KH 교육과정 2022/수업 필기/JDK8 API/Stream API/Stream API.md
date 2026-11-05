---
별칭:
  - "강의 - Stream API"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/ee3a2f50e9b54b37b59cd650ac9197fd
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Stream API

## 강의 내용

- 목차

컬렉션과 배열의 데이터는 일반적으로 for문, iterator등의 반복문을 이용해서 제어해왔다. 이 방식의 문제중 하나는 데이터소스마다 다른 방식으로 다뤄야한다는 것이다.
(Collection, Iterator등의 인터페이스를 통한 어느정도의 추상화는 가능하지만...)
예) List를 정렬하려면, Collection.sort()메소드를 이용하고, 배열을 정렬하려면, Arrays.sort()메소드를 이용해야한다.

JDK8 Stream API를 사용하면, 데이터소스를 추상화해서 리스트, 배열 모두 같은 방식을 통해 다룰 수 있다.

[자바 스트림(Stream) API 정리, 스트림을 이용한 가독성 좋은 코드 만들기(feat. 자바 람다, 함수형 프로그래밍, 자바8)](https://jeong-pro.tistory.com/165)

## Before Stream

배열과 리스트에 대해 직접 정렬처리하는 경우와 스트림을 통해서 처리하는 경우를 간단 비교한다.

```java
package com.kh.java.stream;

public class BeforeStream {
	private String[] strArr = {"b", "a", "c", "e", "d"};
	private List<String> strList  = Arrays.asList("b", "a", "c", "e", "d");
	
	public static void main(String[] args) {
		BeforeStream beforeStream = new BeforeStream();
//		beforeStream.test1();
//		beforeStream.test2();
		
		//toArray학습테스트
		beforeStream.toArrayTest();
	}

	
	
	/**
	 * 정렬하고자 할때, 
	 * 배열은 Arrays.sort, 콜렉션은 Collections.sort로 처리
	 */
	private void test1() {
		
		Arrays.sort(strArr);
		Collections.sort(strList);
		
		System.out.println(Arrays.toString(strArr));
		System.out.println(strList);
	}
	
	private void test2() {
		Stream<String> strStream1 = Arrays.stream(strArr);
		Stream<String> strStream2 = strList.stream();
		
		//스트림 변환후 동일하게 처리하기
		//Stream<String> java.util.stream.Stream.sorted()
		//void java.util.stream.Stream.forEach(Consumer<? super String> action)
		strStream1.sorted().forEach(System.out::print);
		System.out.println();
		strStream2.sorted().forEach(System.out::print);
		System.out.println();
		
		//스트림은 소스를 변경하지 않는 읽기전용임.
		System.out.println(Arrays.toString(strArr));
		System.out.println(strList);
		
		//(생략)결과를 리턴 또는 반영하려면 collect terminal operation을 이용해야한다.
		//strArr = Arrays.stream(strArr).sorted().collect(Collectors.toList()).toArray(strArr);
		Arrays.stream(strArr).sorted().collect(Collectors.toList()).toArray(strArr);
		strList = strList.stream().sorted().collect(Collectors.toList());
        
		System.out.println(Arrays.toString(strArr));
    System.out.println(strList);
	}
}
```

<aside>
💡 `toArray()`가 리턴한 `Object[]`을 `String[]`을 강제형변환 시도시, ClassCastException유발. 반드시 타입을 매개인자로 전달할 것.
`String[] sortedArr  = (String[])Arrays.stream(strArr).sorted().collect(Collectors.toList()).toArray();`

</aside>

## Stream Basic

### Stream 생성하기

1. 배열
    - `Stream.of`  static메소드 `가변인자` 에 대한 처리를 지원하므로, 개수 상관없이 전달할 수 있다.
    - `Arrays.stream` static메소드 사용 : 특정범위의 요소만 추리는 것도 가능
2. 컬렉션
    - `Collection`의 `default` 메소드 `Stream<E> stream()`

```java
/**
 * 1.배열을 stream객체로 변환하기 
 */
private void test1() {
	String[] s = {"a", "b", "c", "d", "e"};
	
	Stream<String> stream1 = Stream.of("a", "b", "c", "d", "e");//가변인자
	Stream<String> stream2 = Stream.of(s);
	Stream<String> stream3 = Arrays.stream(s);
	Stream<String> stream4 = Arrays.stream(s,0,3);//특정요소만 지정해서 스트림생성(startInclusive, endExclusive)
	
	stream1.forEach(System.out::print); System.out.println();
	stream2.forEach(System.out::print); System.out.println();
	stream3.forEach(System.out::print); System.out.println();
	stream4.forEach(System.out::print); System.out.println();
	
}

/**
 * List를 Stream객체 변환하기
 */
private void test2() {
	List<String> list = new ArrayList<>();
	list.add("가");
	list.add("나");
	list.add("다");
	
	Stream<String> stream5 = list.stream();
	Stream<String> stream6 = list.parallelStream(); //병렬스트림생성. 내부적으로 각 쓰레드별로 처리하도록 chunk로 분할 처리함.

	stream5.forEach(System.out::print); System.out.println();
	stream6.forEach(System.out::print); System.out.println();
	
	Set<Integer> set = new HashSet<>() {
		{
			add(1);
			add(3);
			add(2);
		}
	};
	set.stream().forEach(System.out::print);
	System.out.println();
}
```

### distinct | filter

```java
/**
 * 요소 filtering
 */
private void test4() {
	List<Integer> list = Arrays.asList(1,2,3,4,3,2,1,2);
	//1. distinct() : 중복된 요소를 제거함.
	list.stream()
	  	.distinct() 
	  	.forEach(i -> System.out.print(i + " "));
	
	System.out.println();
	
	//2. filter(Predicate<T> p)
	//각 요소에 대해서 true가 리턴된 경우만 다음 스트림에 포함됨
	list.stream()
		.filter(i -> i % 2 == 0)
		.forEach(i -> System.out.print(i + " "));
	
	System.out.println();
	
	//@실습문제
	//스트림을 이용하여 다음 배열요소중 ["김동현","김진호","유병승","유정훈"]에서 
	//김씨로 시작하는 인원만 화면에 출력하세요.
	List<String> nameList = Arrays.asList("김동현","김진호","유병승","유정훈");
	nameList.stream()	
		   	.filter(s -> s.startsWith("김"))
		   	.forEach(System.out::println);
	//filter()메소드는 여러번 사용가능함.
	//김씨중에 현으로 이름이 끝나는 사람만 출력하려면??
	nameList.stream()	
		   	.filter(s -> s.startsWith("김"))
		   	.filter(s -> s.endsWith("현"))
		   	.forEach(System.out::println);
	
	//만약, 김씨인 마씨로 변경하려면??
}
```

### map

<aside>
💡 형변환이 가능하다. 
map에 전달한 Function lambda식의 리턴타입에 따라 Stream<R>이 결정된다.

</aside>

```java
/**
 * 변환하기 - map()
 */
private void test5() {
	//1.변환하기
	//Stream<R> java.util.stream.Stream.map(Function<? super T, ? extends R> mapper)
	Arrays.asList(1,2,3,4,5)
		  .stream()		
		  .map(n -> n * 10)
		  .forEach(System.out::print);
	
	System.out.println();
	//Stream
  String[] names = {"홍길동", "신사임당", "이조", "강감찬", "홍난파", "이적"};
		Arrays
			.stream(names) //  Stream<String>
//			.map(name -> name.substring(0, 1)) // Stream<String>
//			.map(name -> name.charAt(0)) // Stream<Character>
			.map(name -> name.length()) // Stream<Integer>
			.forEach(System.out::println);

	//@실습문제 : 다음 요소의 공백을 모두 제거하고 출력하세요.
	String[] wordArr = {"a b c d", "홍 길동", "제 이름은 신사임당입니다.", "hello world"};
	Arrays.stream(wordArr)
		  .map(s -> s.replace(" ", ""))
		  .forEach(System.out::println);
	
	//@실습문제 : 다음 요소의 숫자가 아닌 값을 모두 제거하고 출력하세요.
	String[] numArr = {"1,000,000원", "$ 50", "500원만 주세요"};
	Stream.of(numArr)
		  .map(s -> s.replaceAll("\\D", "")) // [^0-9]
//			  .mapToInt(Integer::parseInt)
		  .forEach(System.out::println);
		  
		
}
```

### peek

요소의 변환 없이 단순 조회가 가능하다. 

이를 통해 stream의 내부적 처리를 확인한다.

스트림은 크게 3가지 단계로 작동한다.

1. 컬렉션이나 배열 등으로부터 스트림을 생성하는 작업(Stream Source)
2. <u>스트림을 필터링하거나 요소를 알맞게 변환하는 중간 연산(Intermediate Operations)</u>
3. <u>최종적인 결과를 도출하는 단말 연산(Terminal Operations)</u>

<aside>
💡 스트림은 최종 단말 연산전에는 중간연산을 완료하지 않는다는 특징이 있다.

</aside>

```java
/**
 * 조회하기 - peek()
 * 지연된 처리 확인하기
 */
private void test6() {
	//조회하기
	//stream 요소 전체를 대상으로  peek - filter - forEach 순차 처리되지 않는다.
	//다음 filter의 기준으로 Predicate메소드에 부합하는 요소들단위로 처리된다. 
	//이는 스트림 처리방식(최종연산 전에 중간연산 하지 않음.)
	
	//Stream<T> java.util.stream.Stream.peek(Consumer<? super T> action)
	List<Integer> intList = Arrays.asList(1,2,3,4,5,6,7,8,9,10,11,12);
	intList.stream()
		   .peek(n -> System.out.println("요소:" + n))
		   .filter(n -> n % 2 == 0 || n % 3 == 0)
		   .forEach(System.out::println);
	/*
	 	요소:1
		요소:2
		2
		요소:3
		3
		요소:4
		4
		요소:5
		요소:6
		6
		요소:7
		요소:8
		8
		요소:9
		9
		요소:10
		10
		요소:11
		요소:12
		12
	 */
	
	//peek - filter - peek - sorted - forEach
	intList.stream()
		   .peek(n -> System.out.println("요소:" + n))
		   .filter(n -> n % 2 == 0 || n % 3 == 0)
		   .peek(n->System.out.println("2,3배수:" + n))
		   .sorted(Collections.reverseOrder())
		   .forEach(System.out::println);
	/*
	  결과는?
	 */
}

/**
 * @실습문제 : 
 * 출력결과를 예상해보자
 * 
 */
private void test7() {
	final List<String> list = Stream
								.of("one", "two", "three", "four")
								.peek(e-> System.out.println("1 " + e))  
								.filter(e -> e.length() > 3)  
				        .peek(e -> System.out.println("2 " + e))  
				        .map(String::toUpperCase)  
				        .peek(e -> System.out.println("3 " + e))  
				        .collect(Collectors.toList());
	System.out.println("최종 : " + list);
	
	/*
	 1 one
	 1 two
	 1 three
	 2 three
	 3 THREE
	 1 four
	 2 four
	 3 FOUR
	 */
}
```

### @실습문제

`"d2", "a2", "b1", "b3", "c"` 

이 문자열을 Stream객체화하고, 숫자가 포함된 요소만 출력하세요.

(Pattern클래스의 정규표현식 사용할것.)

```java
/**
 * @실습문제 : 
 * "d2", "a2", "b1", "b3", "c" 
 * 이 문자열을 Stream객체화하고, 숫자가 포함된 요소만 출력하세요.
 * (Pattern클래스의 정규표현식 사용할것.)
 */
private void test8() {
	
	Stream
		.of("d2", "a2", "b1", "b3", "c")
		.filter(s -> {
			Pattern pattern = Pattern.compile("\\d");
			Matcher matcher = pattern.matcher(s);
	        return matcher.find();
	    })
		.forEach(System.out::println);

	Stream
	.of("d2", "a2", "b1", "b3", "c")
	.filter(s -> s -> Pattern.matches(".*\\d.*", s))
	.forEach(System.out::println);
		
}
```

### collect

 stream의 최종 단말연산에서 collect를 사용, collection으로 변환하는 예제. 

```json
/**
	 * 스트림의 결과를 다시 collection객체로 변환
	 * collect
	 * - list: collect(Collectors.toList())
	 * - set : collect(Collectors.toSet())
	 * - map : collect(Collectors.toMap(keyMapper:Function<T,K>, valueMapper:Function<T,U>))
	 *         collect(Collectors.toMap(keyMapper:Function<T,K>, valueMapper:Function<T,U>, mergeFunction:BinaryOperator<U>))
	 */
	private void test() {
		List<Integer> list = Arrays.asList(1,2,3,4,5,4,3,2,1,1);
		
		List<Integer> otherList =
			list.stream()
				.map(n -> n * 100)
				.collect(Collectors.toList());
		System.out.println(otherList);
		
		Set<Integer> otherSet =
			list.stream()
				.map(n -> n * 10)
				.collect(Collectors.toSet());
		System.out.println(otherSet);
		
		Map<Integer, String> otherMap =
			list.stream()
				.distinct()
				.collect(Collectors.toMap(n -> n, n -> String.valueOf(n * 100)));
		System.out.println(otherMap);

		Map<Integer, String> anotherMap =
			list.stream()
				.collect(Collectors.toMap(
							n -> n, 
							n -> String.valueOf(n * 100),
							(v1, v2) -> v1 + " " + v2
						));
		System.out.println(anotherMap);

		Map<String, Integer> map = 
			Stream.of("홍길동", "신사임당", "김말복", "홍길동", "세종대왕")
				.collect(Collectors.toMap(
							name -> name, 
							name -> 1,
							(v1, v2) -> v1 + v2)); // mergeFunction:BinaryOperator<U>
		System.out.println(map);
	}
```

<aside>
💡 `int[]`과 같이 기본형 배열은 IntStream 기본형 스트림으로 변환되고, collect메소드전 `boxed()`를 호출해 boxing작업을 먼저한다.

</aside>

```sql
/**
 * collect
 */
public void test() {
	Integer[] arr = {1,2,3,4,5};
	
	//Stream<Integer>
	List<Integer> list = 
		Arrays
			.stream(arr)
			.map(n -> n * 2)
			.peek(n -> {})
			.collect(Collectors.toList());
	System.out.println(list);

	//IntStream -> Stream<Integer>
	int[] intArr = {1,2,3,4,5};
	
	list = 
		Arrays
			.stream(intArr)
			.map(n -> n * 3)
			.peek(n -> {})
			.boxed()	//Stream<Integer>
			.collect(Collectors.toList());
	System.out.println(list);
	
	//다시 배열로 변환
	Arrays
		.stream(intArr)
		.map(n -> n * 4)
		.peek(n -> {})
		.boxed()	//Stream<Integer>
		.collect(Collectors.toList())
		.toArray(arr);//List<Integer> -> Integer[]
	System.out.println(Arrays.toString(arr));
}
```

[[JAVA] Stream 필터링한 요소 수집(collect())](https://cornswrold.tistory.com/384)

[[Java 8] Java 8, Stream의 Collectors](https://sabarada.tistory.com/41)

### stream객체의 재사용

`Supplier`람다식을 작성하고, get()메소드로 동일 stream을 다시 생성 리턴함.

```java
private void test4() {
		
	//stream공급자객체 사용
	Supplier<Stream<String>> streamSupplier =
			    () -> Stream
			    		.of("a", "b", "c");
	
	streamSupplier
					.get()
					.forEach(System.out::println);
	
	boolean bool = streamSupplier
												.get()
												.anyMatch(s -> {
													return Pattern
															.compile("\\d")
															.matcher(s)
															.find();	
												});
	
}
```

### anyMatch | noneMatch

`boolean java.util.stream.Stream.anyMatch(Predicate<String> predicate)`

이 스트림의 요소중 Predicate람다식 true를 리턴한 요소가 하나라도 존재하는지 여부를 리턴함.

```java
private void test1() {

		//anyMatch
		//이 스트림에서 Predicate람다식 true를 리턴한 요소가 하나라도 존재하는지 여부를 리턴함.
		//boolean java.util.stream.Stream.anyMatch(Predicate<String> predicate)
		System.out.println(
			Stream.of("d2", "a2", "b1", "b3", "c")
				  .map(s -> {
					  System.out.println("map: " + s);
					  return s.toUpperCase();
				  })
				  .anyMatch(s -> {
					  System.out.println("anyMatch: " + s);
					  return s.startsWith("A");
				  })
		);

		System.out.println(
			Stream
			    .of("a", "b", "c");
				  .noneMatch(s -> {
					return Pattern
							.compile("[0-9]")
							.matcher(s)
							.find();
				})
		);
	}
```

```java
System.out.println(Pattern.matches(".*\\d.*", "abc1")); // true 숫자포함
System.out.println(Pattern.matches("[0-9]", "123")); // false 전체일치여부. ^[0-9]$와 동일하다.
System.out.println(Pattern.matches("[0-9]", "1")); // true
```

### AtomicInteger

stream에서 index 또는 count 처리

```java
/**
 * stream에서 numbering
 * 
 * AtomicInteger
 * - getAndIncrement()
 * - incrementAndGet()
 * 
 */
private void test2() {
	//1.map - filter
	//카운팅을 위한 변수 count(지역익명클라스객체에서 참조하는 부모메소드변수)는 반드시 final이어야함. 고로 객체필드로 선언해서 사용.
//		int count = 0;//final이 아니므로 사용불가
	
	//지역익명클래스에서의 카운트를 위한 AtomicInteger객체사용
	AtomicInteger count = new AtomicInteger();
	Stream
		.of("a", "b", "c", "d", "e")
	    .forEach(s -> {
	    	System.out.println(s + count.incrementAndGet());
	    });
	
    System.out.println("count = " + count.get());	
	System.out.println("-----------------------------------------");
	
	
	count.set(0);//0으로 reset후 재상용
	
	Stream
		.of(1,1,1,1,1)
		.forEach(s -> {
	    	System.out.println(s * count.getAndIncrement());
	    });
	
	System.out.println("count = " + count.get());	
	
	//기본스트림 사용하기
	String[] arr = {"a", "b", "c", "d", "e"};
	IntStream
			.range(0, 4)
			.mapToObj(i -> arr[i] + i)
			.forEach(System.out::println);
}
```

이 외에서 Guava에서 제공하는 `mapWithIndex` 도 존재한다.

```java
String[] arr = {"A", "B", "C", "D"};
Streams.mapWithIndex(
							Arrays.stream(array),
              (str,index)->"["+index+"] "+str
				)
        .forEach(System.out::println);
```

[Iterate over a Stream with Indices in Java 8 and above - Techie Delight](http://www.techiedelight.com/iterate-over-stream-indices-java8/)

## @실습문제

[[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Stream API/@실습문제 Product|@실습문제 Product]]

## Stream Advance

### 기본형 stream 생성하기

IntStream, LongStream, DoubleStream이 제공됨.

```arduino
private void test1() {
		//기본형 스트림(wrapper클래스를 이용하는 것보다 성능향상)
		//IntStream, LongStream, DoubleStream이 제공됨.
		int[] intArr = new int[]{1,2,3,4,5};
		IntStream intStream1 = IntStream.of(1,2,3,4,5);
		IntStream intStream2 = IntStream.of(intArr);
		IntStream intStream3 = Arrays.stream(intArr);
		IntStream intStream4 = Arrays.stream(intArr,2,5);
		
		intStream1.forEach(System.out::print);System.out.println();
		intStream2.forEach(System.out::print);System.out.println();
		intStream3.forEach(System.out::print);System.out.println();
		intStream4.forEach(System.out::print);System.out.println();
		
		DoubleStream doubleStream1 = DoubleStream.of(1.234, 3.14, 5.55);
		doubleStream1.forEach(d -> System.out.print(d + " "));System.out.println();
}

private void test2() {
		//1. range(startInclusive, endExclusive)
		IntStream
			.range(1, 4)
			.forEach(System.out::print);
		System.out.println();//123
		
		//2. rangeClosed(startInclusive, endInclusive)
		IntStream
			.rangeClosed(1, 4)
			.forEach(System.out::print);
		System.out.println();//1234
		
		//3. 기본형 스트림만의 메소드 : average(OptionalDouble을 리턴), sum(int를 리턴)
		//Stream<Integer> s = Stream.of(1,2,3); //wrapper
		//Stream<Integer> s = Arrays.stream(new Integer[]{1, 2, 3}); //wrapper
		IntStream s = Arrays.stream(new int[] {1, 2, 3});
	    s.map(n -> 2 * n + 1)
	     .peek(System.out::println)
	     .average() //OptionalDouble을 리턴함.
	     .ifPresent(System.out::println);  // 5.0
	    
	    int sum = Arrays
	    			.stream(new int[] {1, 2, 3})
	    		   	.sum();
	    System.out.println("sum = " + sum);

			IntSummaryStatistics stat = 
				IntStream
					.rangeClosed(1, 10)
					.summaryStatistics();
			System.out.println("stat = " + stat);
			System.out.println("max = " + stat.getMax());
	    
}
```

### 스트림 요소 형변환하기

```arduino
private void test3() {
		//1. Stream<String> => IntStream
		Stream
			.of("a1", "a2", "a3")
			.map(s -> s.substring(1))
			.mapToInt(Integer::parseInt)
		    .max() //OptionalInt를 리턴함.
		    .ifPresent(System.out::println);  // 3
		
		//2. IntStream => Stream<String>
		IntStream
			.range(1, 4)
			.mapToObj(i -> "a" + i)
			.forEach(System.out::print);
		System.out.println();
}
```

```arduino
/**
 * @실습문제
 * double형배열 doubleArr {1.2, 4.1, 6.8, 8.9, 2.7}을 스트림으로 만들어서 다음처럼 출력되도록 하세요.
 * a1 a2 a4 a6 a8
 */
private void test4() {
	
	System.out.println();
	double doubleArr[] = {1.2, 4.1, 6.8, 8.9, 2.7};
	Arrays
		.stream(doubleArr)//DoubleStream
	    .mapToInt(d -> (int)d)
	    .mapToObj(i -> "a" + i)
	    .sorted()
	    .forEach(e -> System.out.print(e + " "));

	//일반스트림으로 처리한다면...
	//Stream.of(doubleArr)//사용불가 : 배열이지만 기본형인자라 가변인자취급당함.
	Stream.of(1.2, 4.1, 3.8, 5.9, 2.7)//Stream<Double>
	.mapToInt(Double::intValue)//d->d.intValue() Double wrapper클래스이므로 가능함.
	.mapToObj(i -> "a" + i)
	.sorted()
	.forEach(e -> System.out.print(e+" "));
}

```

### collect

collect메소드를 사용하면, 스트림의 연산 결과를 list, set, map객체로 반환할수 있다.

```java
public class Stream05Collect {
	List<Person> persons = Arrays.asList(
		        new Person("Max", 18),
		        new Person("Peter", 23),
		        new Person("Pamela", 23),
		        new Person("David", 12)
		    );
	
	public static void main(String[] args) {
		
		Stream05Collect s = new Stream05Collect();
		//1.collect
		s.test1();
		
		//2.collect(심화) : groupBy, aggregation
//		s.test2();
	}

	private void test1() {
		//1.toList
		List<Person> filtered = persons
									.stream()
									.filter(p -> p.name.startsWith("P"))
									.collect(Collectors.toList());

		System.out.println(filtered);    // [Peter, Pamela]
		
		//2.toSet
		Set<String> set = Arrays
							.asList("a","b","c","a","c")
							.stream()
							.collect(Collectors.toSet());

		System.out.println(set);    // [a, b, c]
		
		Set<Integer> filteredByAge = persons
										.stream()
										.map(p -> p.age)
										.collect(Collectors.toSet());
		System.out.println(filteredByAge);	// [18, 23, 12]
		

		//3.toMap
		//toMap(Function<T,R> keyMapper, Function<T,R> valueMapper)
		//기본적으로 Map<Object,Object>이고, 리턴타입을 참조해 auto-casting됨.
		Map<String,Person> map = persons
									.stream()
									.collect(Collectors.toMap(p -> p.name, p -> p));
		System.out.println(map);
		
		//key는 unique해야하며, 그렇지 않은 경우, IllegalStateException을 던짐.
		//그럴경우, mergeFunction을 추가할 수 있음. 동일한 key값을 가진 value에 대한 처리를 작성
		//toMap(Function<T,R> keyMapper, Function<T,K> valueMapper, BinaryOperator<K> mergeFunction)
		Map<Integer, String> mergedMap = persons
											.stream()
										    .collect(Collectors.toMap(
										        p -> p.age,
										        p -> p.name,
										        (name1, name2) -> name1 + "&" + name2
										        )
										    );

		System.out.println(mergedMap);
		// {18=Max, 23=Peter&Pamela, 12=David}
	}
	

	private void test2() {
		//1. groupBy
		/*
			public static <T, K> Collector<T, ?, Map<K, List<T>>>
		      groupingBy(Function<? super T, ? extends K> classifier) {
		        return groupingBy(classifier, toList());
		    }
	    */
		Map<Integer, List<Person>> personsByAge = persons.stream()
			    									 	 .collect(Collectors.groupingBy(p -> p.age));
		
		//key:Integer, value:List<Person>
		personsByAge.forEach((age, personGroup) -> System.out.format("age %s: %s\n", age, personGroup));
		
		/*persons.stream()
		 	  .collect(Collectors.groupingBy(p -> p.age))
		 	  .forEach((age, p) -> System.out.format("age %s: %s\n", age, p));*/
		
		//2. aggregation : average
		Double averageAge = persons.stream()
			    				 .collect(Collectors.averagingInt(p -> p.age));

		System.out.println(averageAge);     // 19.0
		
		//3. aggregation : summary statistics
		IntSummaryStatistics ageSummary = persons.stream()
			        						 .collect(Collectors.summarizingInt(p -> p.age));

		System.out.println(ageSummary);
		// IntSummaryStatistics{count=4, sum=76, min=12, average=19.000000, max=23}
		
		//4. 하나의 문자열로 리턴하기
		//joining(CharSequence delimiter, CharSequence prefix, CharSequence suffix)
		String phrase = persons.stream()
						    .filter(p -> p.age >= 18)
						    .map(p -> p.name)
						    .collect(Collectors.joining(" and ", "In Germany ", " are of legal age."));

		System.out.println(phrase);
		// In Germany Max and Peter and Pamela are of legal age.
	}
	
}

@Data
@AllArgsConstructor
class Person {
    String name;
    int age;

    @Override
    public String toString() {
        return name+"("+age+")";
    }
}
```

### flatMap

2차원배열의 요소를 단일 스트림으로 반환해서 순차접근이 가능하게 한다.

```java
/**
	 * 스트림으로 구구단 출력하기
	 */
	private void test1() {
		IntStream.range(2, 10)
				 .forEach(dan -> IntStream.range(1, 10)
									 	  .forEach(num -> System.out.println(dan  + " * " + num + " = " + (dan * num) + (num == 9 ? "\n" : ""))));
		
		//for문의 break 유사처리
		//takeWhile()가 false를 리턴하면, 즉시 중지된다.
		//takeWhile은 jdk9부터 사용가능
		IntStream.range(1, 11)
				 .takeWhile(n -> n < 5)
				 .forEach(System.out::print);
		//1234
		
		System.out.println();
	}
	
	private void test2() {
		String[][] names = {
				{"홍길동", "히야시"},
				{"권율", "고길동"},
				{"세종대왕", "스끼다시"},				
				{"이황", "장영실"},				
		};
		
		//세글자인 이름만 필터링후 출력하기 
		Arrays
			.stream(names)
			.forEach(arr -> {
				for(String name : arr)
					if(name.length() == 3)
						System.out.println(name);
			});
		
		//flatMap을 이용하면, 배열 요소를 단일원소 스트림으로 전환할 수 있다.
		Arrays
			.stream(names)
			.flatMap(arr -> Arrays.stream(arr))
			.filter(name -> name.length() == 3)
			.forEach(System.out::println);
				
	}

	@Data
	class Foo {
	    String name;
	    List<Bar> bars = new ArrayList<>();

	    Foo(String name) {
	        this.name = name;
	    }
	}
	
	@Data
	class Bar {
	    String name;

	    Bar(String name) {
	        this.name = name;
	    }
	}
	
	private void test3() {
		List<Foo> foos = new ArrayList<>();

		// create foos
		IntStream
			.range(1, 4)
			.forEach(i -> foos.add(new Foo("Foo" + i)));

		// create bars
		foos.forEach(f -> IntStream
								.range(1, 4)
								.forEach(i -> f.bars.add(new Bar(f.name+"의 Bar" + i))));
		
		//foo(bar,bar,bar) * 3
		System.out.println(foos);
		for(Foo f : foos) {
			System.out.println(f);
		}
		
		
		//flatMap의 사용
		foos.stream()
		    .flatMap(f -> f.bars.stream()) // foo객체를 필드bars의 stream객체로 매핑함.
		    .forEach(b -> System.out.println(b.name));

	}
	
	/**
	 * @실습문제 : test3코드를 모두 stream의 메소드체인(한번에 처리)으로 변경해서 동일한 결과를 출력하세요.
	 * (mapToObj, peek등 활용)
	 */
	private void test4() {
		System.out.println("---------------------------------");
		IntStream.range(1, 4)
				.mapToObj(i-> new Foo("Foo"+i))
				.peek(foo-> IntStream.range(1, 4)
//								  .mapToObj(i -> new Bar(foo.name+"으 Bar" + i))
//						          .forEach(foo.bars::add))
								  .forEach(i->foo.bars.add(new Bar(foo.name+"의 Bar" + i))))
				.flatMap(foo->foo.bars.stream())
				.forEach(bar->System.out.println(bar.name));
	}

```

### reduce

```java
private void test5() {
	//reduce를 통한 aggregation 누적처리
	// T reduce(T identity, BinaryOperator<T> accumulator)
	int result = 
			Stream
				.of(1,2,3,4,5,6,7,8,9,10)
				.reduce(0, (sum, n) -> sum += n);//Stream<Integer>, IntStream 모두 사용가능 
		System.out.println(result);
		
		result = 
				IntStream
					.rangeClosed(1, 10)
					.sum();	//IntStream만 사용가능
		System.out.println(result);
	
}	

/**
 * Optional<T>을 리턴하는 reduce
 */
private void test5() {
	List<Person> persons = Arrays.asList(
						        new Person("Max", 18),
						        new Person("Peter", 23),
						        new Person("Pamela", 24),
						        new Person("David", 12)
						   );
	
	//reduce : 두개의 인자(T)를 받아 조건에 따라 특정 T를 리턴함.
	//Optional<T> reduce(BinaryOperator<T> accumulator)
	persons
		.stream()
		.reduce((p1, p2) -> p1.age > p2.age ? p1 : p2)
		.ifPresent(System.out::println);    // Pamela(24)
	
	
	
	//reduce를 통한 aggregation 누적처리
	// T reduce(T identity, BinaryOperator<T> accumulator)
	Person result = persons
						.stream()
				        .reduce(new Person("", 0), (p1, p2) -> {
				        	System.out.println(p1);//p1 = identity, p2 = 요소
				            p1.age += p2.age;
				            p1.name += p2.name;
				            return p1;
				        });

		System.out.format("name=%s; age=%s", result.name, result.age);
		// name=MaxPeterPamelaDavid; age=77
}
```

### Stream.concat(Stream, Stream) | IntStream.concat(IntStream, IntStream)

<aside>
💡 concat에 사용된 stream객체는 더이상 사용할 수 없다.

</aside>

```jsx
/**
	 * 철봉세트 10 9 8 7 6 5 4 3 2 1 2 3 4 5 6 7 8 9 10 을 진행할때 총 쉬는시간은 몇 초인가?
	 * @param args
	 */
	public static void main(String[] args) {
		IntStream stream1 = IntStream.rangeClosed(1, 10);
		IntStream stream2 = IntStream.of(9, 8, 7, 6, 5, 4, 3, 2, 1);
		IntStream stream = IntStream.concat(stream1, stream2); // stream1, stream2는 이제 사용할 수 없다(operated)
//		stream.forEach(System.out::print);
		
		stream
			.reduce((n1, n2) -> {
				System.out.println(n1 + ", " + n2);
				return n1 + n2;
			})
			.ifPresent(n -> {
				System.out.println("총쉬는 시간 : " + n * 10 + "sec");
			});
			
		
		
	}
```

## See Also

### charStream은 존재하지 않는다.

- `String.chars()` 는 내부적으로 Integer로 처리된다.

[Why is String.chars() a stream of ints in Java 8?](https://stackoverflow.com/questions/22435833/why-is-string-chars-a-stream-of-ints-in-java-8)

[https://www.slideshare.net/madvirus/8-api](https://www.slideshare.net/madvirus/8-api)

---

Find Last Element Of Stream

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Stream API/@실습문제 Product|@실습문제 Product]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
