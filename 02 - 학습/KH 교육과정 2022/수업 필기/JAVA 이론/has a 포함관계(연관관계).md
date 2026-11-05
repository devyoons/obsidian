---
별칭:
  - "강의 - has a 포함관계(연관관계)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/b52706e23a744f0fa0a6e6f349f2de6e
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: has a 포함관계(연관관계)

## 강의 내용

## has a 포함관계

- StudentManager클래스가 필드로 다른 클래스 Student를 참조하는 경우
- StudentManager has a Student.
- UML상의 연관관계(Assciation) 
→ 클래스들이 개념상 서로 연결되었음을 나타냄
→ 한 클래스가 다른 클래스에서 제공하는 기능을 사용하는 상황일 때 표시
- 해당필드를 통해서 어떤 기능을 사용
Circle ——→ Point (연관관계)
- StudentManager -------(실선)--------> Student

```java
package kh.java.object.array.student;

/**
 * VO
 * 
 * - 학생번호
 * - 학생이름
 * - 자바점수
 *
 */
public class Student {
	private int no;
	private String name;
	private int javaScore;
	
	public Student() {}
	
	public Student(int no, String name, int javaScore) {
		this.no = no;
		this.name = name;
		this.javaScore = javaScore;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	public int getNo() {
		return no;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setJavaScore(int javaScore) {
		this.javaScore = javaScore;
	}
	public int getJavaScore() {
		return javaScore;
	}
	
	public String getStudentInfo() {
		return "Student{no = " + no + ", name = " + name + ", javaScore = " + javaScore + "}";
	}

}
```

```java
package kh.java.object.array.student;

public class StudentMain {

	public static void main(String[] args) {
		StudentManager sm = new StudentManager();
		sm.menu();
	}

}
```

```java
package kh.java.object.array.student;

import java.util.Scanner;

/**
 * Student[] 관리
 * 
 * has a 포함관계
 * - StudentManager클래스가 필드로 다른 클래스 Student를 참조하는 경우
 * - StudentManager has a Student.
 */
public class StudentManager {
	
	private Scanner sc = new Scanner(System.in);
	private static final int LENGTH = 3;
	private Student[] studentArr = new Student[LENGTH];
	private int index = 0; // studentArr의 인덱스관리
	
	public void menu() {
		String menu = "--- 학생정보관리 ---\n"
					+ "1. 학생정보 입력\n"
					+ "2. 학생정보 출력\n"
					+ "0. 종료\n"
					+ "---------------\n"
					+ "> ";
		
		while(true) {
			System.out.print(menu);
			String choice = sc.next();
			switch(choice) {
			case "1" : 
				if(index == LENGTH) {
					System.out.println("모든 학생 정보를 입력했습니다.");
					break;
				}
				insertData(); 
				break;
			case "2" : printData(); break;
			case "0" : System.out.println("프로그램 종료!"); return;
			default: System.out.println("잘못 입력하셨습니다.");
			}
		}
	}
	public void insertData() {
		System.out.println("> 학생정보 입력하세요...");
		while(true) {
			System.out.println("> 학생 " + (index + 1));
			System.out.print("번호 : ");
			int no = sc.nextInt();
			System.out.print("이름 : ");
			String name = sc.next();
			System.out.print("자바점수 : ");
			int javaScore = sc.nextInt();
			studentArr[index++] = new Student(no, name, javaScore);
			
			if(index < LENGTH) {
				System.out.print("더 입력하시겠습니까?(y/n) : ");
				char yn = sc.next().charAt(0);
				if(yn == 'n')
					break;
			}
			else 
				break;
		}
		System.out.println("> 입력완료!");
	}
	
	public void printData() {
		for(int i = 0; i < index; i++) {
			Student s = studentArr[i];
			System.out.println(s.getStudentInfo());
		}
	}
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/9ceb6248_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
