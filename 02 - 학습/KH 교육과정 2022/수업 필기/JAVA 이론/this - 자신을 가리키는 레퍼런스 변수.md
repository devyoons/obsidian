---
별칭:
  - "강의 - this : 자신을 가리키는 레퍼런스 변수"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/158da7749c5b4bfd914ee1ff1780b999
---

# 강의: this : 자신을 가리키는 레퍼런스 변수

## 강의 내용

- 다른 생성자를 호출해서 반복된 코드를 제거 가능
- 생성자 코드 몸통 첫 줄에 딱 한번만 사용가능
- 레퍼런스 변수 : 다른 객체를 가리키는 변수
- this 모든 non-static 메소드에 존재하는 현재객체를 가르키는 숨은 참조변수

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/87d0bd29_Untitled.png]]

```java
package kh.java.oop.student;
/**
 * n명의 학생객체를 위한 클래스 설계
 * - 상태 : 속성 -> 필드
 * - 행동 : 기능 -> 메소드
 */
public class Student {

	//속성
	private String name;
	private char gender;
	private int age;
	//setter
	/**
	 * this
	 * - this 모든 non-static 메소드에 존재하는 현재객체를 가르키는 숨은 참조변수
	 * 
	 */
	public void setName(String _name) {
		this.name = _name;
	}
	public void setGender(char _gender) {
		this.gender = _gender;
	}
	public void setAge(int _age) {
		this.age = _age;
	}
public String getName() {
		return this.name; //this 생략가능
	}
	public char getGender() {
		return gender;
	}
	public int getAge() {
		return age;
	}
```

```java
public void Main {
	public static void main(String[] args){
		Account a = new Account(10000);
		Account b = new Account(3000);
		a.send(4000,b); // a계좌가 4천원을 b계좌에게 송금
	}
}

class Account{
	//필드 -> 클래스 내부 전역
	private int balance;
	//생성자
	//스코프(scope):변수의 활동 영역 (필드 -> 클래스 내부/ 지역변수&파라미터 -> 메소드내부)
	//변수 탐색 원리 : 가장 가까운 곳부터 찾음 그래서 this를 사용해야함
	public Account(int balance){ //파라미터 -> 해당 메소드 내부
		/* 1. 생성자를 완성하시오. */
		this.balance = balance;
		System.out.println("계좌생성 : \n\t" + this.toString());
	}
	//send
	public void send (int amount, Account target){
		System.out.println("송금시작 : \n\t" + this.toString());
	//해당 메소드를 완성하시오
		this.balance -= amount;
		target.balance +=amount;
		System.out.println("송금완료 : \n\t" + this.toString());
}
	
	//toString : 현재 객체의 정보를 문자열로 출력
	public String toString(){
		return String.format("Account [balance=%d]", this.balance);
	}
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
