---
별칭:
  - "강의 - Bulider 패턴"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/11b2183b569b4c458c8a76971cafab22
---

# 강의: Bulider 패턴

## 강의 내용

---

---

### Bulider패턴

- GoF디자인 패턴중 생성패턴중 하나

#### 빌더 패던의 장점

1. 필요한 데이터만 설정할 수 있음
2. 유연성을 확보할 수 있음
3. 가독성을 높일 수 있음
4. 변경 가능성을 최소화할 수 있음

예를 들어 User 객체를 생성해야 하는데 birthday, address, married 라는 파라미터가 필요 없는 상황이라고 가정하자.

생성자나 정적 메소드를 이용하는 경우라면 우리는 birthday, address, married 에 더미 값을 넣어주거나 birthday, address, married 가 없는 생성자를 새로 만들어주어야 한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/95231724_Untitled.png]]

```java
/**
 * Bulider패턴
 * - GoF 디자인패턴중 생성패턴중 하나
 * - 객체의 필드를 단계적으로 설정하는 방식
 *
 */
public class User {
	
	/* 필드 */
	private String username;
	private String password;
	
	/* 선택 */
	private LocalDate birthday;
	private String address;
	private boolean married;
	
	// 기본 생성자
	public User() {
		super();
	}
	
	// 필수 파라미터 생성자
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	// 모든 파라미터 생성자
	public User(String username, String password, LocalDate birthday, String address, boolean married) {
		super();
		this.username = username;
		this.password = password;
		this.birthday = birthday;
		this.address = address;
		this.married = married;
	}
	
	
	public User(Builder builder) {
		this.username = builder.username;
		this.password = builder.password;
		this.birthday = builder.birthday;
		this.address = builder.address;
		this.married = builder.married;
	}

	// builder 내부클래스
	public static class Builder {
		/* 필드 */
		private String username;
		private String password;
		
		/* 선택 */
		private LocalDate birthday;
		private String address;
		private boolean married;
		
		// 필수만 빌더패스 만듬
		public Builder(String username, String password) {
			this.username = username;
			this.password = password;
		}
		
		// 나머지는 
		public Builder birthday(LocalDate birthday) {
			this.birthday = birthday;
			return this;
		}
		public Builder address(String address) {
			this.address = address;
			return this;
		}
		public Builder married(boolean married) {
			this.married = married;
			return this;
		}
		
		// user를 반환하는 빌드
		public User build() {
			return new User(this);
		}
	}

	public static Builder builder(String username, String password) {
		return new Builder(username, password);
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", birthday=" + birthday + ", address="
				+ address + ", married=" + married + "]";
	}
}
```

이러한 작업이 한 두번이면 번거로워도 작업을 해줄 수 있다. 

하지만 결국 요구사항은 계속 변하게 되어있고, 반복적인 변경을 필요로 하면서 시간 낭비로 이어지게 된다. 

하지만 빌더를 이용하면 동적으로 이를 처리할 수 있다.

```java
// UserMain
public class UserMain {

	public static void main(String[] args) {

		// 기존 방식 : 파라미터 생성자 순서를 맞춰야했음 타입때문에
		User user = new User("sejong", "1234", null, null, false);
		
		User user1 = User.builder("honggd", "1234").build();
		
		User user2 = User.builder("sinsa", "1234")
						 .birthday(LocalDate.of(1999, 9, 9))
						 .address("서울시 강서구")
						 .married(true)
						 .build();
		
		System.out.println(user1);
		System.out.println(user2);
	}
}
User [username=honggd, password=1234, birthday=null, address=null, married=false]
User [username=sinsa, password=1234, birthday=1999-09-09, address=서울시 강서구, married=true]
```

- 필수는 값을 넣고 선택은 선택적으로 넣을 수 있음!
- 맨 처음 static builder(){} 를 호출해서 Builder (a, b)를

[https://velog.io/@hero6027/Builder-Pattern빌더-패턴-by-Effective-Java](https://velog.io/@hero6027/Builder-Pattern%EB%B9%8C%EB%8D%94-%ED%8C%A8%ED%84%B4-by-Effective-Java)

### @Builder 어노테이션

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/29f9cc31_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/67fd4f5e_Untitled.png]]

```java
// Person
@Data
@Builder
public class Person {
	/* 필드 */
	@NonNull
	private String username;
	@NonNull
	private String password;
	
	/* 선택 */
	private LocalDate birthday;
	private String address;
	private boolean married;
}
```

```java
// PersonMain
public class PersonMain {

	public static void main(String[] args) {

		Person person = Person.builder()
							.username("honggd") // @NonNull
							.password("1234") // @NonNull
							.birthday(LocalDate.now())
							.build();
		System.out.println(person);
	}
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
