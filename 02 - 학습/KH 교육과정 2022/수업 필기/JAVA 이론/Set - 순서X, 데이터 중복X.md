---
별칭:
  - "강의 - Set : 순서X, 데이터 중복X"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/70a0432d0cd840c0bdb6c6f16c170cb1
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Set : 순서X, 데이터 중복X

## 강의 내용

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/4b7095e6_Untitled.png]]

## Set 컬렉션 클래스

**Set 인터페이스를 구현한 모든 Set 컬렉션 클래스는 다음과 같은 특징을 가집니다.**

1. 요소의 저장 순서를 유지하지 않습니다.
2. 같은 요소의 중복 저장을 허용하지 않습니다.
3. List와 비교하면 **index가 없다는 차이**가 있다. 즉, **get(int index) 메서드를 사용할 수 없다.**
    - **toString()**으로 전체를 뽑던지, **iterator**를 사용해서 for문으로 쭉 뽑던지, 아니면 **toArray() 배열**로 따로 배열에 담아서 사용.
4. 컬렉션(Collection)의 추상 메서드만 사용함.
    - **Set은 따로 메서드를 갖고 있지 않고 Collection것만 사용**한다는 의미.
    

대표적인 **Set 컬렉션** **클래스에 속하는 클래스**는 다음과 같습니다.

1. **HashSet<E>** : 저장된 순서를 기억
2. **TreeSet<E>** : 기본정렬처리(요소로 사용된 클래스는 Comparable인터페이스를 구현)

---

#### Set인터페이스

1. **HashSet** : 가장 많이 사용, 동기화 지원 안함
2. **LinkedHashSet** : 앞 뒤 요소의 정보를 갖고 있고 index같은 순서 필요 없음
3. **TreeSet** : 이진 검색 트리 사용하여 자료 관리, 기본정렬처리

```java

HashSet<제네릭> set(변수명) = new HashSet<>();

<다형성 고려>
//Set 인터페이스
Set<제네릭> set2 = HashSet<>();

//Collection 인터페이스
Collection<제네릭> set3 = new HashSet<>();

--여기서 제네릭 장점--
1. 요소타입을 제한 -> add
2. 꺼낼 때 별도의 형변환이 필요없다. -> get
```

#### **HashSet<E> 클래스**

- 중복허용X
- 저장된 순서를 관리X
- 저장된 순서 무시 → 기본형 정렬처리되는 것은 무시할 것. 정렬된게 아님
- index가 없기 때문에 일반 for문으로 요소확인불가
    1. For each
    2. Iterator (객체생성→ hasNext → next)

### HashSet 코드예습

```java
<저장된 순서를 관리X>
private void test1() {
		HashSet<Integer> set1 = new HashSet<Integer>();
		Set<Double> set2 = new HashSet<Double>();
		Collection<String> set3 = new HashSet<String>();
		
		// 요소추가 : 저장된 순서 무시
		// 기본형 정렬처리되는 것은 무시할 것.
		set1.add(3);
		set1.add(2);
		set1.add(1);
		
		// toString
		System.out.println(set1);
		
	}
}
//결과
[1, 2, 3]
```

```java
<중복 허용X>
private void test1() {
		HashSet<Integer> set1 = new HashSet<Integer>();
		Set<Double> set2 = new HashSet<Double>();
		Collection<String> set3 = new HashSet<String>();
		
		// 요소추가 : 저장된 순서 무시
		// 기본형 정렬처리되는 것은 무시할 것.
		set1.add(3);
		set1.add(2);
		set1.add(2);// 중복을 허용하지 않는다.
		set1.add(2);
		set1.add(1);
		
		// toString
		System.out.println(set1);
		
	}
}
//결과
[1, 2, 3]
```

```java
private void test1() {
		HashSet<Integer> set1 = new HashSet<Integer>();
		Set<Double> set2 = new HashSet<Double>();
		Collection<String> set3 = new HashSet<String>();
		
		// 요소추가 : 저장된 순서 무시
		// 기본형 정렬처리되는 것은 무시할 것.
		System.out.println(set1.add(3));
		System.out.println(set1.add(2));
		System.out.println(set1.add(2));// 중복허용하지 않는다.
		System.out.println(set1.add(2));
		System.out.println(set1.add(1));
		
		// get(index)없음 - 요소하나를 가져올 수 없다.
		// 모든 요소를 순차열람가능
		// 일반 for문 X- index사용이 불가하니까 안됨
		//1. for each
		//2. iterator
		Iterator<Integer> iter = set1.iterator();
		while(iter.hasNext()) {
			Integer i = iter.next();
			System.out.println(i);
		}

//결과
1
2
3
```

- get(index)없음 - 요소하나를 가져올 수 없다.
- 모든 요소를 순차열람 가능
- 일반 for문 X - index사용이 불가하니까 안됨
    1. for each
    2. iterator

```java
private void test1() {
		HashSet<Integer> set1 = new HashSet<Integer>();
		Set<Double> set2 = new HashSet<Double>();
		Collection<String> set3 = new HashSet<String>();
		
		System.out.println(set1.add(3));
		System.out.println(set1.add(2));
		System.out.println(set1.add(2));// 중복허용하지 않는다.
		System.out.println(set1.add(2));
		System.out.println(set1.add(1));

for(Integer i : set1)
			System.out.println(i);
```

#### 요소제거

- 인덱스를 이용한 제거 없고, 요소와 일치하는 방식만 제공

```java
private void test1() {
		HashSet<Integer> set1 = new HashSet<Integer>();
		Set<Double> set2 = new HashSet<Double>();
		Collection<String> set3 = new HashSet<String>();
	
		System.out.println(set1.add(3));
		System.out.println(set1.add(2));
		System.out.println(set1.add(2));// 중복허용하지 않는다.
		System.out.println(set1.add(2));
		System.out.println(set1.add(1));

		//요소 제거
		set1.remove(2); //int ---> integer
										   auto-boxing
}

//결과
[1, 3]
```

---

### Set API

#### 포함여부확인 
(List에서는 index가 있기 때문에 indexOf를 사용해서 확인했음)

```java
private void test2() {
		Set<String> set = new HashSet<>(); //타입추론에 의한 생략(jdk1.7)
		set.add("홍길동");
		set.add("고길동");
		set.add("마길동");
		
		//포함여부
		System.out.println(set.contains("홍길동"));
		System.out.println(set.contains("최길동"));
		
		System.out.println(set);
	}
```

#### 요소있는지 확인

```java
private void test2() {
		Set<String> set = new HashSet<>(); //타입추론에 의한 생략(jdk1.7)
		set.add("홍길동");
		set.add("고길동");
		set.add("마길동");

		//isEmpty()
		System.out.println(set.isEmpty());

//결과
false
```

#### 요소전체제거

```java
private void test2() {
		Set<String> set = new HashSet<>(); //타입추론에 의한 생략(jdk1.7)
		set.add("홍길동");
		set.add("고길동");
		set.add("마길동");
		
		//요소전체제거
		set.clear();
		System.out.println(set);

//결과
[]
```

#### 다른 set과 병합

```java
private void test2() {
		Set<String> set = new HashSet<>(); //타입추론에 의한 생략(jdk1.7)
		set.add("홍길동");
		set.add("고길동");
		set.add("마길동");
		
		//다른 set과 병합
		Set<String> other = new HashSet<>();
		other.add("조길동");
		other.add("하길동");

		set.addAll(other);

		System.out.println(set);
}
//결과
[홍길동, 마길동, 조길동, 고길동, 하길동]
```

### 커스텀객체 Set으로 관리하기

### 커스텀객체 Set으로 관리하기

- 동일한 데이터를 가진 객체를 중복처리하고 싶다면
    - `equals` & `hashCode` 오버라이드 필수 
    → vo클래스 관리할 때 둘은 같이 써야한다.

```java
<vo클래스 override 안했을 때>
private void test4() {
		Set<Student> set = new HashSet<>();
		set.add(new Student(1, "홍길동"));
		set.add(new Student(2, "신사임당"));
		set.add(new Student(3, "이순신"));
		set.add(new Student(1, "홍길동")); 
		//동일하지 않다고 생각하고 결과에 나옴
		
		for(Student s : set) {
			System.out.println(s);
		}
	}
//결과
Student [no=2, name=신사임당]
Student [no=3, name=이순신]
Student [no=1, name=홍길동]
Student [no=1, name=홍길동]
```

- `equals`의 결과가 true라면, 동일한 `hashCode`를 리턴해야 한다.
- 동일한 필드를 사용해서 두 메서드를 `@Override`해야한다.
- `equals`를 `@Override`하지 않으면 `Object의 equalse인 객체주소값 비교`를 한다. 그래서 꼭 Override해야함

```java
<vo clasee Override하기>

@Override
	public boolean equals(Object obj) {
		Student other = (Student) obj;
		if(this.no == other.no && this.name.equals(other.name))
			return true;
		else
			return false;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(this.no, this.name);
	}

----------실행클래스-----------------------

private void test4() {
		Set<Student> set = new HashSet<>();
		set.add(new Student(1, "홍길동"));
		set.add(new Student(2, "신사임당"));
		set.add(new Student(3, "이순신"));
		set.add(new Student(1, "홍길동"));
		
		for(Student s : set) {
			System.out.println(s);
		}
	}
//결과
Student [no=2, name=신사임당]
Student [no=3, name=이순신]
Student [no=1, name=홍길동]
```

---

### HashSet

- 저장된 순서를 기억하지 않음

```java
private void test5() {
		Set<Student> set = new HashSet<>();
		set.add(new Student(3, "이순신"));
		set.add(new Student(2, "신사임당"));
		set.add(new Student(1, "홍길동"));
		
		System.out.println(set);
		
	}
//결과
[Student [no=2, name=신사임당], Student [no=3, name=이순신], Student [no=1, name=홍길동]]
저장 순서를 기억하지 않음
```

### LinkedHashSet<>()

- 저장된 순서를 기억해준다.

```java
private void test5() {
//		Set<Student> set = new HashSet<>();
		Set<Student> set = new LinkedHashSet<>();
		set.add(new Student(3, "이순신"));
		set.add(new Student(2, "신사임당"));
		set.add(new Student(1, "홍길동"));
		
		System.out.println(set);
//결과
[Student [no=3, name=이순신], Student [no=2, name=신사임당], Student [no=1, name=홍길동]]

저장순서를 기억함
```

### TreeSet

- 기본정렬처리 ( 요소로 사용된 클래스는 Comparable인터페이스를 구현)

```java
------vo클래스--------
@Override
	public boolean equals(Object obj) {
		Student other = (Student) obj;
		if(this.no == other.no && this.name.equals(other.name))
			return true;
		else
			return false;
	}
@Override
	public int hashCode() {
		return Objects.hash(this.no, this.name);
	}

------실행클래스-------
private void test5() {
//		Set<Student> set = new HashSet<>();
//		Set<Student> set = new LinkedHashSet<>();
		Set<Student> set = new TreeSet<>();
		set.add(new Student(3, "이순신"));
		set.add(new Student(2, "신사임당"));
		set.add(new Student(1, "홍길동"));
		
		System.out.println(set);
		
	}
//결과
[Student [no=1, name=홍길동], Student [no=2, name=신사임당], Student [no=3, name=이순신]]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
