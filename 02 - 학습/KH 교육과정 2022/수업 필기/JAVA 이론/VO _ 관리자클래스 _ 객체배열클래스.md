---
별칭:
  - "강의 - VO _ 관리자클래스 _ 객체배열클래스"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/92b25006488f49cd92e02104d35eb8f6
---

# 강의: VO _ 관리자클래스 _ 객체배열클래스

## 강의 내용

## VO

---

- Value Object
- DO Domain Object
- DTO Data Tranfer Object
- Entity DB Table과 상용하는 의미
- bean jsp/EJB

---

- private 필드
- 기본생성자
- 모든 필드생성자
- getter
- setter

```java
public class Person {
	
	private String name;
	private int age;

	//기본생성자
	public Person() {
		
	}
	// 모든 필드 생성자
	public Person(String name, int age) {
		this.name = name;
		this.age = age;
	}
	//getter , setter
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getAge() {
		return age;
	}
	//Person정보확인
	public String getPersonInfo() {
		return "Person[name = " + name + ", age = " + age + "]";
	}
	
}
```

## 객체배열

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/f22a9a45_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7d635ced_Untitled.png]]

```java
		// 객체배열 : 객체 여러개를 묶어서 인덱스를 통해 관리
		Person[] persons; // 선언
		persons = new Person[5]; // 할당

		// 인덱스별 Person객체 할당
		Person p1 = new Person(); //기본생성자 + setter
		p1.setName("홍길동");
		p1.setAge(33);

		Person p2 = new Person("신사임당", 48); //필드생성자

		persons[0] = new Person("세종대왕", 65); //인덱스별 Person객체 할당
		persons[1] = new Person("유관순", 16);
		persons[2] = new Person("윤봉길", 31);
		persons[3] = p1;
		persons[4] = p2;
```

### for each 문 사용해서 객체배열출력하기

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/dc5dc457_Untitled.png]]

```java
public class PersonMain {

	public static void main(String[] args) {
		PersonMain main = new PersonMain();
		public void test2() {
				int[] arr = {1, 2, 3}; // 참조변수 선언, 배열 할당, 인덱스별 값대입
				Person[] personArr = {
					new Person("홍길동", 33),	
					new Person("신사임당", 48),
					new Person("주몽", 48)
				};
				
				// foreach문 출력
				for(Person p : personArr) {
					System.out.println(p.getPersonInfo());
				}
				
			}
		
		for(int i = 0; i < persons.length; i++) {
					Person p = persons[i];
					System.out.println(i + " : " + p.getPersonInfo());
				}
		}
}
//결과
Person[name = 홍길동, age = 33]
Person[name = 신사임당, age = 48]
Person[name = 주몽, age = 48]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
