---
별칭:
  - "강의 - Lambda API"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/803659dbd74640d18ce8c2369c8486db
---

# 강의: Lambda API

## 강의 내용

## 함수형 프로그래밍이란

[(번역) 함수형 프로그래밍이란 무엇인가?](https://medium.com/@jooyunghan/%ED%95%A8%EC%88%98%ED%98%95-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%EC%9D%B4%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80-fab4e960d263)

@krisjenkins  “What is Functional Programming? 한주영님 번역글

모든 함수는 두종류의 입력과 두종류의 출력을 가진다.

- 명시적인 입력(인수)와 출력(리턴값)
- 암시적인 입력(side-cause)와 출력(side-effect)

[(번역) 어떤 프로그래밍 언어들이 함수형인가?](https://medium.com/@jooyunghan/%EC%96%B4%EB%96%A4-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%EC%96%B8%EC%96%B4%EB%93%A4%EC%9D%B4-%ED%95%A8%EC%88%98%ED%98%95%EC%9D%B8%EA%B0%80-fec1e941c47f)

@krisjenkins Which Programming Languages Are Functional? 한주영님 번역글

부원인과 부작용을 제어할 수 있다면 FP로 간주할 수 있다.

- scala
- clojure
- haskell
- perl
- python
- mocking framework

[함수형 프로그래밍이란?](https://medium.com/@lazysoul/%ED%95%A8%EC%88%98%ED%98%95-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D%EC%9D%B4%EB%9E%80-d881230f2a5e)

1. 변경 가능한 상태를 불변상태(Immutable)로 만들어 SideEffect를 없애자.
2. 모든 것은 객체이다 → [함수는 1급객체여야 한다.](https://medium.com/@lazysoul/functional-programming-%EC%97%90%EC%84%9C-1%EA%B8%89-%EA%B0%9D%EC%B2%B4%EB%9E%80-ba1aeb048059) 
3. 코드를 간결하게 하고 가독성을 높여 구현할 로직에 집중 시키자.
4. 동시성 작업을 보다 쉽게 안전하게 구현 하자.

## Before Lambda

자바에서는 함수(메소드)가 일급값이 아니므로, 메소드 자체를 전달하거나 리턴할 수 없다. 

자바에서는  메소드는 클래스에 소속된 형태로만 사용가능하므로, 인터페이스등에 메소드 작성후 익명클래스객체를 통해서 처리할수 있다.

<u>즉, 기능(함수)를 객체에 담아두고 이를 변수에 담거나, 특정메소드에 전달, 또는 리턴받아 사용할 수 있다.</u>

### 1. 일반메소드 처리

람다 없이도 잘 살았다...

피타고라스의 정리 $c^{2} = a^{2} + b^{2}$

```java
public class BeforeLambda {

	public static void main(String[] args) {
		BeforeLambda beforeLambda = new BeforeLambda();
		//직각삼각형의 빗변구하기
		double result = beforeLambda.hypotenuse(100,30);
		System.out.println("result = " + result);
	}

	/**
	* 피타고라스의 정리
	* c^{2} = a^{2} + b^{2}
	*/
	private double hypotenuse(int a, int b) {
		return Math.sqrt(square(a) + square(b));
	}

	private int square(int a) {
		return a * a;
	}

}
```

### 2. 익명클래스

동일한 기능을 하는 인터페이스를 선언해서, hypotenuse와 square의 기능을 묶어둔다.

```java
public class BeforeLambda {

	public static void main(String[] args) {
		BeforeLambda beforeLambda = new BeforeLambda();
		
		//익명클래스로 처리
		beforeLambda.anonymousClassTest();
	}

private void anonymousClassTest() {
		//익명클래스로 작성
		Pita pita = new Pita(){

			@Override
			public double hypotenuse(int a, int b) {
				return Math.sqrt(square(a)+square(b));
			}
			
		};
		double result = pita.hypotenuse(100, 30);
		System.out.println("result = " + result);
	}

}

interface Pita{
	
	double hypotenuse(int a, int b);
	
	//java8부터 인터페이스에서 추상메소드외에도, default, static메소드를 가질 수 있음.
	default int square(int x){
		return x * x;
	}
	
}
```

### 3. Lambda식

동일한 Pita 인터페이스를 람다식으로 구현한 익명클래스객체 생성. 

<aside>
💡 lambda식 안에서는 scope가 달라서 default메소드에 접근 불가하다. lambda식 안의 this는 외부클래스객체(encolosing instance)를 가리킨다.

</aside>

[Why can we not use default methods in lambda expressions?](https://stackoverflow.com/questions/33108540/why-can-we-not-use-default-methods-in-lambda-expressions)

```java
public class BeforeLambda {

	public static void main(String[] args) {
		BeforeLambda beforeLambda = new BeforeLambda();
		
		//lambda식 적용하기
		beforeLambda.helloLambda();
	}

private void helloLambda() {
		//람다식으로 작성
		Pita pita1 = (int a, int b) -> { 
			return Math.sqrt(a * a + b * b); 
		};
		
		//람다식 축약형(타입추론이 가능한 경우에 한해 생략)
		Pita pita2 = (a, b) -> Math.sqrt(a * a  + b * b);
		
		double result = pita1.hypotenuse(100, 30);
		System.out.println("result1 = " + result);
		result = pita2.hypotenuse(100, 30);
		System.out.println("result2 = " + result);
}

interface Pita{
	
	double hypotenuse(int a, int b);

}
```

## @FunctionalInterface

람다식은 메소드를 하나의 식(expression)으로 표현함 것임. 

메소드선언시 메소드이름, 리턴타입등이 없어지므로, 람다식을 익명함수(anonymous function)이라고도 함.

람다식으로 작성하기 위해서는 인터페이스가 필요한데, 이를 함수형인터페이스라고 하고, 어노테이션 `@FunctionalInterface`으로 문법검사를 지원한다. (<u>함수형인터페이스는 단 하나의 추상메소드만 가질수 있음) compile-time에서 오류를 체크할 수 있으므로, 반드시 사용할 것.</u>

```java
package com.kh.java.lambda;

public class Lambda01FunctionalInterface {

	public static void main(String[] args) {
		Lambda01FunctionalInterface functionalInterface = new Lambda01FunctionalInterface();
		functionalInterface.test1();
		functionalInterface.test2();
		functionalInterface.test3();
	}

	private void test1() {
		//리턴타입, 메소명 생략후, 파라미터부분과 메소드바디를 작성함.
		Func max = (int a, int b) -> {
			return a > b ? a : b;
		};
		
		//메소드바디가 없는 경우, 리턴타입은 하나의 식으로 표현가능함. 
		max = (int a, int b) -> a > b ? a : b;
		
		//파라미터의 자료형도 생략가능(유추할 수 있으므로)
		max = (a, b) -> a > b ? a : b;
		
		int result = max.calc(4, 7);
		System.out.println("result = " + result); // 7

    Func min = (a, b) -> a < b ? a : b;
		result = min.calc(4, 7);
		System.out.println("result = " + result); // 4
	}

	private void test2() {
		//제곱 구하기
		Func2 square = (int a) -> a * a;
		
		//파라미터가 하나이고, 자료형을 생략했다면, 괄호도 생략가능
		square = (a) -> a * a;
		square = a -> a * a;
		
		int result = square.calc(3);
		System.out.println("result = " + result); // 9
	}
	
	private void test3() {
		//메소드바디 작성내용이 한줄인 경우, {}는 생략가능.
		Func3 f3 = (name, age) -> System.out.println("저는 " + age + "살 " + name + "입니다.");
		f3.print("홍깅동", 30); // 저는 30살 홍길동 입니다.
	}

}	
	
@FunctionalInterface
interface Func1{
	int calc(int a, int b);
}

@FunctionalInterface
interface Func2{
	int calc(int a);
}

@FunctionalInterface
interface Func3{
	void print(String name, int age);
}
```

## JDK8 제공하는 함수형인터페이스

대부분의 메소드시그니쳐는 비슷하다.
매개변수가 없거나, 한개, 두개, 반환값은 없거나, 있음.
매개변수의 타입, 리턴타입은 제네릭메소드로 정의해두면 일일히 함수형 인터페이스를 작성할 필요가 없다.

java8 api는 이를 위한 함수형 인터페이스를 제공함.
java.lang.Runnable을 제외하고, 모두 java.util.function패키지에 있음.

[[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Lambda API/Functional Interface from JDK8/Functional Interface from JDK8|Functional Interface from JDK8]]

```java
자<Integer> seq = () -> ++Lambda02Basic.num;
		
		System.out.println(seq.get());
		System.out.println(seq.get());
		System.out.println(seq.get());
	}
	
	/**
	 * @실습문제2
	 * 로또를 생성하는 람다식을 작성하세요. 리턴타입 Set<Integer>
	 */
	private void test3() {
	// 방법1
		Supplier<Set<Integer>> lotto = ()->{
			Set<Integer> set = new TreeSet<>();
			while(set.size() < 6){
				set.add((int)(Math.random() * 45 + 1));
			}
			return set;
		};
		System.out.println("lotto="+lotto.get());
	}

	// 방법2
	Supplier<Set<Integer>> lotto2 = () -> {
      return new TreeSet<Integer>() {
          {
              while(size() < 6)
                  add((int)(Math.random() * 45 + 1));
          }
      };
  };
  System.out.println("lotto2 : " + lotto2.get());
	
	/**
	 * @실습문제
	 * 원화 입력시 환율 계산을 통해 얻어진 달러를 출력하는 람다식을 작성
	 * 현재 1달러는 1100원이다.
	 */
	private void test4() {
		Consumer<Integer> calc = won -> {
			double rate = 1100;
			double dollar = won / rate;
			System.out.println("￦ " + won + " =>  ＄ " + dollar);
		};
		calc.accept(3000); // ￦3000 => $2.7272
	}
	
	/**
	 * @실습문제 
	 * 위 문제를 jdk가 제공하는 Function 함수형인터페이스 형식에 맞게 변형하세요.
	 * 
	 */
	private void test5() {
		Function<Integer, Double> calc = won -> {
			double rate = 1100;
			return won / rate;
		};
		double dollar = calc.apply(3000);
		System.out.println(dollar);
	}
	
	private void test6() {
		//@실습문제1
		//공백을 제외한 문자열의 길이가 0인지를 체크하는 람다식을 만들고,
		//문자열리스트 {"abc","","대한민국","   "}를 체크하세요.
		List<String> strList = Arrays.asList("abc", "", "대한민국", "   ");
		Predicate<String> isLen0 = str -> str.trim().length() == 0;
		for(String str:strList){
			System.out.println("["+str+"]의 길이는 0입니까? " + isLen0.test(str));
		}	
	}

}
```

### 심화

매개변수가 2개인 함수형 인터페이스
매개변수가 3개이상은 직접 만들어 써야함.

```java
package com.kh.java.lambda;

public class Lambda03Advance {

	public static void main(String[] args) {
		Lambda03Advance lambdaAdvance = new Lambda03Advance();
		lambdaAdvance.test1();
		lambdaAdvance.test2();
	}

	/**
	 * 매개변수가 2개인 함수형 인터페이스
	 * 매개변수가 3개이상은 직접 만들어 써야함.
	 */
	private void test1() {
		//매개변수가 2개이고, 리턴타입 없음
		BiConsumer<String, Integer> biC = (name, age) -> System.out.println("이름 : "+name+", 나이 : "+age);
		biC.accept("Kim", 30000);
		
		//매개변수가 2개이고, 리턴타입 있음.
		BiFunction<String, String, List<String>> biF = (s1,s2)-> Arrays.asList(s1,s2);
		System.out.println(biF.apply("하나", "둘"));
		
		//매개변수가 2개이고, 리턴타입이 boolean
		//BiPredicate<String, String> biP = (s1,s2)->s1.contains(s2);
		BiPredicate<String, String> biP = String::contains;
		System.out.println(biP.test("돌아이", "아이"));
		System.out.println(biP.test("돌아이", "아이유"));
		
		//@실습문제(고급)
		//국어, 영어, 수학점수를 입력받아 int 배열[총점,평균]을 리턴하는 람다식을 작성하세요
		PointFunc<Integer, Integer, Integer, int[]> pf = (kor,eng,math)->{
			int[] arr = new int[2];
			arr[0] = kor+eng+math;
			arr[1] = Math.round(arr[0]/3*10)/10;
			return arr;
		};
		
	}
	
	/**
	 * Function의 또 다른 변형으로 파라미터와 리턴타입이 같은 경우,
	 * UnaryOperator, BinaryOperator를 사용할 수  있다.
	 */
	private void test2() {
		//파라미터와 리턴타입이 같은 경우
		UnaryOperator<String> f1 = s -> s.toUpperCase();
		System.out.println(f1.apply("jordan"));
		
		//파라미터1, 파라미터2와 리턴타입이 같은 경우
		BinaryOperator<String> f2 = (s1,s2) -> s1.concat(s2);
		System.out.println(f2.apply("lo", "ve"));
	}

}

@FunctionalInterface
interface PointFunc<T, U, V, W>{
	W calc(T a, U b, V c);
}
```

## 메소드 참조

메소드참조를 사용하면 람다식을 더욱 간결히 할 수 있다. 기존 메소드를 람다식으로 사용가능하도록 한것.

배열 정렬시 정렬기준을 제시하는 Comparator객체 전달시 이용하면 아주 유용하다.

```java
//람다식만 사용
Arrays.sort(rosterAsArray,
    (a, b) -> Person.compareByAge(a, b)
);

//람다식, 메소드참조 사용
Arrays.sort(rosterAsArray, Person::compareByAge);
```

[Method References](https://docs.oracle.com/javase/tutorial/java/javaOO/methodreferences.html)

- static method - `Integer::parseInt`
- non-static method - `String::equals` 두개의 인자를 받아 `s1.equals(s2)`로 처리
- 특정객체의 메소드 - `str::foo`
- 생성자 참조 - `Product::new`  전달된 인자의 타입/개수에 따라 적절한 생성자를 호출해 객체를 리턴

```java
public class Lambda04MethodReference {

	public static void main(String[] args) {
		Lambda04MethodReference methodReference = new Lambda04MethodReference();
		methodReference.test1();
		methodReference.test2();
		methodReference.test3();
		
	}

	private void test1() {
		//1. 단순 출력 
		//매개인자 변형없이 그대로 출력만 가능
		Consumer<String> out = s -> System.out.println(s);
		out.accept("홍길동");
		
		//메소드참조
		out = System.out::println;
		out.accept("홍길동");
		
		
		//2. 문자열을 정수로 형변환 리턴하는 람다식
		Function<String, Integer> f = s -> Integer.parseInt(s);
		System.out.println(f.apply("123") + 456);//579
		
		//메소드참조
		//int java.lang.Integer.parseInt(String s) throws NumberFormatException
		f = Integer::parseInt;
		System.out.println(f.apply("123") + 456);//579

    //3. 문자열의 길이를 리턴
		String name = "James";
		int len = name.length();
		Function<String, Integer> leng = String::length;
		System.out.println(leng.apply("안녕하세요")); // 5
		
		
		//4. 문자열 동등비교하는 람다식
		BiFunction<String,String,Boolean> biF = (s1,s2) -> s1.equals(s2);
		System.out.println(biF.apply("안녕", "안녕")); // true
		
		//String클래스의 오버라이딩된 equals메소드를 사용. 
		//Object::equals로 작성해도, biF의 매개변수타입이 String 이므로, String.equals가 적용됨. 
		biF = String::equals;
		System.out.println(biF.apply("안녕", "안녕"));//true
		
		//Object::equals는 주소값 비교(==)로 처리
		BiFunction<Object,Object,Boolean> biF2 = Object::equals;
		System.out.println(biF2.apply(new Object(), new Object()));//false
		
	}
	
	/**
	 * 클래스가 아닌 객체참조변수의 메소드참조
	 */
	private void test2() {
		//특정객체 기준으로 equals
		String foo = "foo";
		//Predicate<String> equalsToFoo = s -> foo.equals(s);
		Predicate<String> equalsToFoo = foo::equals;
		System.out.println(equalsToFoo.test("foo")); // true
		System.out.println(equalsToFoo.test("hoo")); // false

		//커스텀 함수형 인터페이스 작성없이 기존객체에 대해서 작동하는 람다식
		MyClass my1 = new MyClass("홍길동", 30);
		//Function<MyClass, Boolean> func = x -> my1.equals(x);
		//이미 생성된 객체의 메서드를 사용할때는 클래스이름이 아닌 객체참조변수를 지정
		Function<MyClass, Boolean> func = my1::equals;
		
		System.out.println(func.apply(my1));//true
		System.out.println(func.apply(new MyClass("홍길동", 30)));//true
		System.out.println(func.apply(new MyClass()));//false
	}
	
	/**
	 * 생성자 메소드 참조
	 */
	private void test3() {
		//생성된 객체를 리턴해야 하므로, Supplier<T>를 사용함.
		//Supplier<MyClass> m1 = () -> new MyClass();
		Supplier<MyClass> m1 = MyClass::new;
		System.out.println(m1.get());
		
		//MyClass생성자 추가: 매개변수1
		Function<String,MyClass> m2 = MyClass::new;
		System.out.println(m2.apply("James"));
		
		//MyClass 생성자 추가 : 매개변수2
		BiFunction<String,Integer,MyClass> m3 = MyClass::new;
		System.out.println(m3.apply("Bill", 30));
		
		//지정 길이의 배열 생성
		//배열생성시 배열의 길이를 생성자의 파라미터로 전달
		Function<Integer, int[]> m4 = x -> new int[x];//람다식
		m4 = int[]::new;//메소드 참조
		
		int arr[] = m4.apply(10);
		System.out.println("arr.length = " + arr.length);
		
	}
	
}

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
class MyClass{
	
	@NonNull
	private String name;
	private int age;
	
}
```

[[Java8] Method Reference (메서드 참조) - 생성 방법](https://countryxide.tistory.com/127)

## Collection 람다식과 함께 사용하기

### List

인터페이스에 다음 default메소드들이 JDK8에 추가되었다.

- JDK8에 추가된 default메소드 `Iterable::forEach`
    
    ```java
    public interface Iterable<T> {
    
    	default void forEach(Consumer<? super T> action) {
            Objects.requireNonNull(action);
            for (T t : this) {
                action.accept(t);
            }
        }
    }
    ```
    
- JDK8에 추가된 default메소드 `Collection::removeIf`
    
    ```java
    public interface Collection<E> extends Iterable<E> {
    	default boolean removeIf(Predicate<? super E> filter) {
            Objects.requireNonNull(filter);
            boolean removed = false;
            final Iterator<E> each = iterator();
            while (each.hasNext()) {
                if (filter.test(each.next())) {
                    each.remove();
                    removed = true;
                }
            }
            return removed;
        }
    }
    ```
    
- JDK8에 추가된 default메소드 `List::replaceAll`
    
    ```java
    public interface List<E> extends Collection<E> {
    	default void replaceAll(UnaryOperator<E> operator) {
            Objects.requireNonNull(operator);
            final ListIterator<E> li = this.listIterator();
            while (li.hasNext()) {
                li.set(operator.apply(li.next()));
            }
        }
    }
    ```
    

<aside>
💡 `Arrays$ArrayList`인경우, 불변리스트로 `UnsupportedOperationException` 유발한다. 상속하고 있는 `AbstractList`의 remove, add등을 override하지 않았음. 
set, replaceAll은 사용가능하다.

</aside>

```java
package com.kh.java.lambda;

public class Lambda05WithCollection {
	
	public static void main(String[] args){
		Lambda05WithCollection lambda = new Lambda05WithCollection();
		//List
		lambda.test1();
	}

	private void test1() {
		
		List<Integer> list = new ArrayList<>();
		for(int i = 0; i < 10; i++)
			list.add(i + 1);
		
		//Consumer 매개변수1, 리턴타입 없음
		//전달된 인자는 요소
		//void java.lang.Iterable.forEach(Consumer<? super Integer> action)
		list.forEach(i -> System.out.print(i + " "));
		System.out.println();
		
		//2의 배수제거
		//boolean java.util.Collection.removeIf(Predicate<? super Integer> filter)
		list.removeIf(i -> i % 2 == 0);//Arrays$ArrayList인경우, UnsupportedOperationException 유발한다. AbstractList의 remove, add등을 override하지 않았음. set, replaceAll은 사용가능하다.
		System.out.println(list);
		
		//모든 요소에 10곱하기
		//void java.util.List.replaceAll(UnaryOperator<Integer> operator)
		list.replaceAll(i -> i * 10);
		System.out.println(list);
		
	}

}
```

### Map

- JDK8에 추가된 default메소드 `Map::forEach`
    
    ```java
    public interface Map<K, V> {
    	
    	default void forEach(BiConsumer<? super K, ? super V> action) {
            Objects.requireNonNull(action);
            for (Map.Entry<K, V> entry : entrySet()) {
                K k;
                V v;
                try {
                    k = entry.getKey();
                    v = entry.getValue();
                } catch (IllegalStateException ise) {
                    // this usually means the entry is no longer in the map.
                    throw new ConcurrentModificationException(ise);
                }
                action.accept(k, v);
            }
        }
    }
    ```
    

```java
package com.kh.java.lambda;

public class Lambda05WithCollection {
	
	public static void main(String[] args){
		Lambda05WithCollection lambda = new Lambda05WithCollection();
		//Map
		lambda.test2();
	}

	private void test2() {
		Map<Integer, String> map  = new HashMap<>();
		map.put(1,"Davic");
		map.put(2,"Sam");
		map.put(3,"Curry");
		map.put(4,"Brown");
		map.put(5,"Carl");
		
		//get 기본값 있음.
		System.out.println(map.getOrDefault(1, "홍길동"));
		System.out.println(map.getOrDefault(10, "신사임당"));

		//해당 key가 존재하지 않을 경우, 해당 key - value생성
		//10=James가 추가된다.
		map.computeIfAbsent(10, (k)-> {
			return "James";
		});
		//해당 key가 존재한다면, 수정할 수 있다.
		//5=Karl로 수정된다.
		map.computeIfPresent(5, (k, v)-> "Karl");
		
		//해당 key에 대한 value를 수정(존재하거나 존재하지 않거나, 존재하는데 null이거나 모두 적용
		map.compute(3, (k, v) -> (v == null ? "Ted" : v + "!!!")); // 3=Curry!!! 수정
		map.compute(33, (k, v) -> (v == null ? "Ted" : v + "!!!")); // 33=Ted 추가
		
		//기존key의 value를 모두 변경
		map.replaceAll((k, v) -> v.toUpperCase());
		
		//기존값과 병합하기
		map.merge(4, "Choco", (prev, newVal) ->  newVal + prev); // prev=Brown, newVal=Choco이 전달됨.
		map.merge(44, "Sky", (prev, newVal) ->  newVal + prev); // prev="", newVal=Sky이 전달됨.
		//void java.util.Map.forEach(BiConsumer<? super String, ? super String> action)
		map.forEach((k,v) -> System.out.println(k + "=" + v));
	}

}
```

### @실습문제

1. MyClass객체 리스트를 순회하면서 40세 이상만 출력하세요. (list의 forEach메소드 사용할 것.)
    
    ```java
    /**
    	 * @실습문제 : MyClass객체 리스트를 순회하면서 40세 이상만 출력하세요.
    	 * (list의 forEach메소드 사용할 것.)
    	 * 
    	 * 
    	 */
    	private void test3() {
    		List<MyClass> list = new ArrayList<>() {
    			{
    				add(new MyClass("홍길동", 30));
    				add(new MyClass("신사임당", 48));
    				add(new MyClass("전봉준", 55));
    				add(new MyClass("세종대왕", 54));
    				add(new MyClass("간달프", 105));
    			}			
    		};
    		
    		list.forEach(myClass -> {
    			if(myClass.getAge() >= 40)
    				System.out.println(myClass.getName());
    		});
    		
    	}
    ```
    
2. 다음 map에서 key값이 홀수인 value만 출력하세요. (map의 forEach메소드 사용할 것.)
    
    ```java
    /**
    	 * @실습문제 :
    	 * 다음 map에서 key값이 홀수인 value만 출력하세요.
    	 * (map의 forEach메소드 사용할 것.)
    	 */
    	private void test5() {
    		Map<Integer, MyClass> map = new HashMap<>() {
    			{
    				put(1, new MyClass("홍길동", 30));
    				put(2, new MyClass("신사임당", 48));
    				put(3, new MyClass("전봉준", 55));
    				put(4, new MyClass("세종대왕", 54));
    				put(5, new MyClass("간달프", 105));
    			}
    		};
    		
    		//{} 생략 불가
    		map.forEach((k, v) -> {
    			if(k % 2 == 1) 
    				System.out.println(v);
    		});
    	}
    ```
    

## See Also

[Java - Lambda, 익명 클래스에서 final 변수를 참조해야하는 이유](https://codechacha.com/ko/java-why-we-should-use-final-in-lambda/)

[https://www.slideshare.net/madvirus/8-35205661](https://www.slideshare.net/madvirus/8-35205661)

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/Lambda API/Functional Interface from JDK8/Functional Interface from JDK8|Functional Interface from JDK8]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JDK8 API/JDK8 API|JDK8 API]]
