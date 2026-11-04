---
별칭:
  - "강의 - List : 순서 O , 데이터중복 O"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/0fe0e098568a4c14a25ddffe47aa9473
---

# 강의: List : 순서 O , 데이터중복 O

## 강의 내용

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/4b7095e6_Untitled.png]]

## ArrayList<E> 클래스

![**List<Integet> list = new ArrayList<>();
list.add(66);
list.add(33);
list.add(44);
...**](../../../../attachments/f75753cd-4d02-4a0e-9c05-bf0c0d066861/Untitled.png)

**List<Integet> list = new ArrayList<>();
list.add(66);
list.add(33);
list.add(44);
...**

```java
List<E> list = new ArrayList<E>();
```

- 생성할 때 크기가 고정되는 배열과 달리, ArrayList는 저장 용량을 초과한 객체들이 들어오면 자동적으로 저장용량 늘어남
- ArrayList에 객체를 추가하면 인덱스 0부터 차례대로 저장
- 특정 인덱스의 객체 제거하면 이후의 모든 인덱스가 1씩 당겨지고 특정 인덱스에 객체 삽입하면 이후의 모든 인덱스가 1씩 밀린다.
- List는 toString이 Override되어있다.
- 동기화 (Synchronization)를 제공하지 않는다.

#### generics 제네릭스

- 컬렉션의 요소를 타입을 제한하는 기능
- 지정한 타입만 추가가능
- getter사용시 리턴될 타입을 한정할 수 있다. 형변환 불필요(get)
- genetics에 기본형을 가질 수 없다.

#### ArrayList코드예습 (+제네릭스)

```java
private void test1() {
		**// list 다형성**
		ArrayList list1 = new ArrayList();
		List list2 = list1;
		Collection list3 = list1;
		
		**// 요소추가**
		list1.add("apple");
		list1.add(123); // 기본형이 아닌 Wrapper 객체 전달 Integer.valueOf(123) auto boxing
		list1.add(34.56);
		list1.add(true);
		list1.add(new Date());
		list1.add(true); // 중복된 요소 저장가능
		 
		**// 중간의 추가 : add(index, 요소)**
		list1.add(3, false); -> apple있을 때 추가된거라 결과에서는 2에 있다.
		
		**// 중간에 삭제** 
		list1.remove(0); // 뒤 요소는 자동으로 하나씩 앞당겨진다. -> apple삭제됨
		
		
		System.out.println(list1.size()); // 결과 6
		**//size : 저장된 요소의 개수**
		for(int i = 0; i < list1.size(); i++) {
			System.out.println(i + " " + list1.get(i));
		}
		
	}
//결과 
6
0 123
1 34.56
2 false
3 true
4 Thu Feb 24 21:57:03 KST 2022
//Type safety: The method add(Object) belongs to the raw type ArrayList. 
//References to generic type ArrayList<E> should be parameterized
-> 안전 유형: add(Object) 메서드가 원시 형식 ArrayList에 속합니다.
	 일반 형식 ArrayList<에 대한 참조E> 매개 변수화되어야 한다
-> ArrayList는 제네릭스를 사용해야한다.

```

```java
private void test2() {
		List<String> list = new ArrayList<앞에명시함,생략가능>(); // String만 요소로 하는 list
		list.add("홍길동");
		list.add("신사임당"); // 제네릭이 없다면 요소추가시 타입검사못함
****  //list.addd(Integer.valueOf(123));// 요소추가시 타입검사- String이외는 안됨
		String name0 = list.get(0); // generic을 사용하지 않으면 요소를 Object로 처리
		String name1 = list.get(1); // getter를 이용시 generic타입으로 바로 리턴
		System.out.println(name0);
		System.out.println(name1);
		
		//List<int> intList = new ArrayList<int>();  generics에 기본형을 가질 수 없다.
		List<Integer> intList = new ArrayList<Integer>();
		intList.add(3);
		intList.add(Integer.valueOf(3));// int -> Integer autoboxing처리후 추가
		Integer i0 = intList.get(0); //꺼냈을 때 Integer가 나옴
		int i1 = intList.get(1); //int변수에 담아도 문제는 없다.auto-unboxing처리
		System.out.println(i0); //auto boxing
		System.out.println(i1);
		
		**//객체생성부의 제네릭은 생략이 가능하다.(jdk1.7)**
		List<Double> dList = new ArrayList<>();
//결과
홍길동
신사임당
3
3
->ArrayList<E> extends AbstactList<E> -> <E>:변수명
->public boolean add(E e) -> AraayList했을 때 String이 E변수에 담기게된다.
->public E get(int index) -> E가 String이 된다.
늘 선언부는 매개변수(파라미터)<->매개인자(아규먼트)

```

```java
private void test3() {
		
		//학생 3명 관리
		List<Student> list = new ArrayList<>();
		list.add(new Student(1, "홍길동"));
		list.add(new Student(2, "신사임당"));
		list.add(new Student(3, "세종대왕"));
		
		//학생 2명 추가
		list.add(new Student(4, "이순신"));
		list.add(new Student(5, "장영실"));
		
		//2번지 학생 제거
		list.remove(2);
		
		//2번지에 학생 추가(삽입)
		list.add(2, new Student(6, "논개")); //삽입
		
		//2번지에 학생 대체
		list.set(2, new Student(200, "유비"));
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(i + " " + list.get(i));
		}
	}
```

- 아래 코드
- ArrayList는 toString을 Override하고 있다.
- remove 두가지 메소드 : 특정 요소를 찾아서 삭제할 수 있다.
    - index
    - object
- remove는 동일요소가 있을 때 삭제시 첫번째 요소가 삭제된다.
- contains 요소확인 → 리턴타입 boolean
- 개별요소확인
    1. 일반 for 문 index
    2. for each문
    3. Iterator객체(목록화) - 순차적으로 접근이 가능 : 제네릭클래스 - import해야함
        - set이랑 같이 사용하는데 제격이다
- isEmpty → boolean으로 리턴 : 요소가 0개라면 true 리턴
- clear : 모든 요소 제거

```java
/**
	 * list api
	 */
	private void test4() {
		List<Integer> list = new ArrayList<>();
		list.add(3);
		list.add(25);
		list.add(77);
		list.add(77);
		list.add(100);
		
		**// 삭제** -> 삭제된 요소가 반환된다 -> 삭제요소를 가지고 다른데 사용가능하다. 
		Integer removed = list.remove(0); // 인덱스로 지우는게 좋다.
		// 중복된 요소가 있을 경우, 첫번째 요소만 삭제
		System.out.println(removed);
		// 인덱스 77(int)인가? 아니면 요소 77(Integer)인가?
		// int는 저장할 수 없으니까 Integer로 auto-boxing되있음 그래서 Integer임
		// 요소삭제는 boolean을 리턴한다.
		boolean isRemoved = list.remove(Integer.valueOf(77)); 
		System.out.println(isRemoved);
		
		**//요소 포함여부 (contains)**
		boolean contained = list.contains(100);
		System.out.println("100이 포함되어 있는가?" + contained);
		
		**//몇번지에 있니?**
		int index = list.indexOf(77); // 존재하지 않으면 -1을 리턴
		System.out.println(index);

		**//뒤에서 부터 조회**
		index = list.lastIndexOf(77);
		System.out.println(index);
		
		**//다른 list 합치기 - 타입같아야함.**
		List<Integer> other = new ArrayList<>();
		other.add(9);
		other.add(99);
		//list.addAll(other); -> 맨 마지막에 요소를 추가해준다.
		list.addAll(2, other);
		
		System.out.println("------iterator------");
		**// 개별요소확인**
		// 1. 일반 for문 index
		// 2. for each문
		// 3. Iterator객체(목록화) - 순차적으로 접근이 가능 / iter.iterator.util 
		Iterator<Integer> iter = list.iterator();
		//요소 순차적으로 접근 -> 없을 때 까지
		while(iter.hasNext()) {
			Integer i = iter.next(); // 다음 요소 꺼내!
			System.out.println(i);
		}
		System.out.println("------iterator--끝----");
		
		// clear : 모든 요소제거
		list.clear();
		
		// isEmpty : 요소가 0개라면 true 리턴
		System.out.println(list.isEmpty());
		
		// toString Override 모든 요소 확인
		System.out.println(list);
		
	}
//결과
1
1
------iterator------
25
77
9
99
100
------iterator--끝----
true
[]
```

#### 정렬하기

1. Collections 클래스안에  `sort(List<T> list)` : 기본정렬
2. `sort(List<T> list, Comparator<? super T> c)`
    - reverseOrder() : 기본정렬에 반대를 의미

```java
1. Collection 클래안에 sort()사용하기
private void test5() {
		List<Integer> list = new ArrayList();
		list.add(3);
		list.add(2);
		list.add(5);
		list.add(4);
		list.add(1);
		
		// 정렬
		// 기본정렬(오름차순)
		Collections.sort(list); 
		System.out.println(list);
//결과 
[1, 2, 3, 4, 5]

```

```java

private void test5() {
		List<Integer> list = new ArrayList();
		list.add(3);
		list.add(2);
		list.add(5);
		list.add(4);
		list.add(1);
											                  //reverseOrder 기본정렬 역순
		Comparator<Integer> comparator = Collections.reverseOrder(); 
		Collections.sort(list, comparator); //Comparatorr 비교기준객체
		System.out.println(list);           //null로 주게 되면 기본정렬과 동일

//결과
[5, 4, 3, 2, 1]
```

#### 이름정렬

- Arrays클래스에 asList(T...a) 가변인자를 받음 →개수제한없이 넣을 수 있다.

```java
		private void test5() {
  	List<Integer> list = new ArrayList();
		list.add(3);
		list.add(2);
		list.add(5);
		list.add(4);
		list.add(1);
	
		//이름정렬
		List<String> names = Arrays.asList("홍길동", "신사임당", "고주몽", "장영실", "논개");
		Collections.sort(names); //기본정렬
		System.out.println(names);

//결과
[고주몽, 논개, 신사임당, 장영실, 홍길동]
```

---

### ArrayList
커스텀 객체 정렬하기 (코드예습 기준으로 설명)

#### Comparable인터페이스 : 기본정렬기준

- 기본정렬기준 (딱 하나 정하기)
    - 해당클래스(Student class)가 `Comparable` 인터페이스 구현
    - 구현하지 않고 `Collections.sort(List<T>);` 사용불가
    - Comparable에서 `compareTo`를 @Override해야함 (음수냐,0이냐,양수냐)
        - 결국 위 내용은 Collections.sort 내부에서 하나씩 비교하는 복잡한 작업을 해주고 있는 것
        - 우선순위가 높은 필드가 뭔지 구분하지 못하기 때문에 구체화 해줘야함
        - `Integer` / `String` 은 구현되어있음
        - `String`에는 `compareTo`가 기본정렬로 구현되어있음 (문자열간의 비교)
        

#### Comparator인터페이스 : 기본정렬기준 외

- 그외 정렬기준(n개 몇개이든지 상관없음)
→ 별도의 `Comparator`구현클래스 생성 (정렬기준당 1개)
    - 학생번호 오름차순 (기본정렬)
    - 학생번호 내림차순
    - 학생이름 오름차순
    - 학생이름 내림차순

#### 커스텀 객체 코드예습

#### 커스텀 객체 정렬하기

```java
1. 일반 for문
private void test6() {
		
		List<Student> list = new ArrayList<>();
		list.add(new Student(3, "세종대왕"));
		list.add(new Student(2, "신사임당"));
		list.add(new Student(5, "장영실"));
		list.add(new Student(1, "홍길동"));
		list.add(new Student(4, "이순신"));

		for(int i  =0; i < list.size(); i++)
				System.out.println(i + " " + list.get(i));
}

0 Student [no=3, name=세종대왕]
1 Student [no=2, name=신사임당]
2 Student [no=5, name=장영실]
3 Student [no=1, name=홍길동]
4 Student [no=4, name=이순신]
```

---

#### 1. 실행클래스 - 기준정렬

- Collections.sort(list); 에러 이유 → Student가 Comparable 인터페이스를 구현하지 않았기 때문에 오류
- 인터페이스 구현 후 돌아오면 에러는 사라진다.
- class에 implements Comparable<Student> 후에 메소드override해줘야함

```java
private void test6() {
		
		List<Student> list = new ArrayList<>();
		list.add(new Student(3, "세종대왕"));
		list.add(new Student(2, "신사임당"));
		list.add(new Student(5, "장영실"));
		list.add(new Student(1, "홍길동"));
		list.add(new Student(4, "이순신"));
		
		Collections.sort(list);

		for(int i = 0; i < list.size(); i++) {
					System.out.println(i + " " + list.get(i));
		}
	}
//결과
0 Student [no=**1**, name=홍길동]
1 Student [no=**2**, name=신사임당]
2 Student [no=**3**, name=세종대왕]
3 Student [no=**4**, name=이순신]
4 Student [no=**5**, name=장영실]
```

#### 2. Student 클래스 Comparable 구현

- **학생번호**를 기준으로 정렬할 것을 여기에 적어줘야함
    - 음수 : 자리교환
    - 0 : 나머지는 무시하는
    - 양수
- 특정 필드값을 비교할 수 있도록 해야한다.

```java
package kh.java.collections.list;

import java.util.Objects;

public class Student implements Comparable<Student>{
										//인터페이스를 구현,<제네릭스:현재클래스전달>
	private int no;
	private String name;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Student(int no, String name) {
		super();
		this.no = no;
		this.name = name;
	}
	public Student() {
		super();
	}
	@Override
	public String toString() {
		return "Student [no=" + no + ", name=" + name + "]";
	}

	@Override
	public int compareTo(Student other) {
		// 현재객체의no - 넘어온no 빼기
		return this.no - other.no;
	}
```

#### 3. 학생번호 오름차순(기본정렬) 설정 후 내림차순하는 법

- 기본 정렬이 아닌것은 list 뒤에 comparator 넣어줘야한다.
    - `Collection.sort(list, comparator)`
- `Collections.reverseOrder() 로 뒤집어준다.`

```java
	private void test6() {
		
		List<Student> list = new ArrayList<>();
		list.add(new Student(3, "세종대왕"));
		list.add(new Student(2, "신사임당"));
		list.add(new Student(5, "장영실"));
		list.add(new Student(1, "홍길동"));
		list.add(new Student(4, "이순신"));

		Comparator<Student> comp = Collections.reverseOrder();
		Collections.sort(list, comp);

		for(int i = 0; i < list.size(); i++) {
					System.out.println(i + " " + list.get(i));
		}
	}

```

### ArrayList 커스텀 객체 다른 정렬 하는법

#### 커스텀 객체 기본정렬외 코드예습

```java
package kh.java.collections.list;

import java.util.Comparator;

public class StudentNameCompartor implements Comparator<Student>{

	/**
	 * 음수 : 자리교환
	 * 0 
	 * 양수
	 */
	@Override
	//매개인자 2개 받음 (문자열에 더하기 연산은 있어도 빼기연산은 없다.)
	public int compare(Student s1, Student s2) { 
		return s1.getName().compareTo(s2.getName());//문자열간의 비교
	}
}
---------------실행 클래스 -----------------
		
		Comparator<Student> comp = new StudentNameCompartor();
		//결과 
		//0 Student [no=3, name=세종대왕]
		//1 Student [no=2, name=신사임당]
		//2 Student [no=4, name=이순신]
		//3 Student [no=5, name=장영실]
		//4 Student [no=1, name=홍길동]

		//역순 -> StudentNameCompartor 이걸 뒤집은걸 제공
		Comparator<Student> comp = 
								Collections.reverseOrder(new StudentNameCompartor());
		
		//list만 적으면 기본정렬이 되어버림 별도의comparator를 제공 
		Collections.sort(list, comp); 

```

- Student의 기본정렬(no)외에 정렬기준을 만들려면 별도의 Comparator구현클래스를 작성해야 한다.
- **학생이름을 기준**으로 정렬할 것을 여기에 적어줘야함
    - 음수 : 자리교환
    - 0
    - 양수
- Student#name이 String타입이므로, String타입간 정렬기준메소드(String#compareTo)를 이용
    - compareTo가 String의 기본정렬

---

## LinkedList<E> 클래스

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/3dfbb47d_Untitled.png]]

```java
List<E> list = new LinkedList<E>();
```

- List의 후손으로, 인접 참조를 링크해서 체인처럼 관리
- 양방향 포인터 구조로 데이터의 삽입, 삭제가 빈번할 경우 데이터의 위치정보만 수정하면 되기에 유용
- 객체 삭제와 삽입이 빈번하게 일어나는 곳
- ArrayList보다 성능이 좋다.
- 중간에 요소추가, 삭제가 빈번히 일어나는 데이터를 관리할 때 유용

#### LinkedList 코드예습

```java
private void test7() {
		List<Integer> list = new LinkedList<>();
		list.add(3);
		list.add(2);
		list.add(4);
		list.add(5);
		list.add(1);
		System.out.println(list);
	}
```

## ArrayList 와 LinkedList 차이점

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/392878d7_Untitled.png]]

ArrayList 삽입과정

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/6f601f09_Untitled.png]]

ArrayList 삭제과정

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/f3816329_Untitled.png]]

LinkedList 삽입과정

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/00f63a51_Untitled.png]]

LinkedList 삭제과정

---

## Queue 와 Stack

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7b9bd460_Untitled.png]]

#### Queue

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/089dab80_Untitled.png]]

```java
Queue<String> queue = new LinkedList<>();
```

- **선입선출** FIFO first In First Out
- **offer** : 맨마지막에 추가
- **poll** : 맨 앞에서 제거

#### Queue 코드예습

```java
private void test1() {
		Queue<Integer> queue = new LinkedList<>();
	
		queue.offer(3);
		queue.offer(5);
		queue.offer(7); //offer:제공하다
		
		int n = queue.poll(); //queue에서 제거 선입되었던 3이 제거
		System.out.println(n);
		queue.offer(9);
		
		System.out.println(queue);
		
		// 모든 요소를 순서대로 꺼내기
		while(!queue.isEmpty()) {//queue가 비어있지 않다면 
			System.out.println(queue.poll());
		}
		
	}

}
//결과
3
[5, 7, 9]
5
7
9
```

### Stack

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/6ea69c11_Untitled.png]]

- **선입후출** FILO First In Last Out
- **push** : 맨 마지막에 추가
- **pop** : 맨 마지막에서 제거

#### Stack 코드예습

```java
private void test2() {
		Stack<Integer> stack = new Stack<>();
		stack.push(1);
		stack.push(2);
		stack.push(3);
		stack.push(4);
		stack.push(5);
		
		int n = stack.pop(); //마지막에 입력된 5가 삭제
		System.out.println(n);
		
		System.out.println(stack);	
	}

//결과
5
[1, 2, 3, 4]
```

```java
private void test2() {
		Stack<Integer> stack = new Stack<>();
		stack.push(1);
		stack.push(2);
		stack.push(3);
		stack.push(4);
		stack.push(5);
		
		int n = stack.pop();
		n = stack.pop();
		System.out.println(n);
		
		System.out.println(stack);
		
	}
//결과
4
[1, 2, 3]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
