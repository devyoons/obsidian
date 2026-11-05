---
별칭:
  - "강의 - Command Line"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/acfe5896c2204410868484764c7bab35
주제:
  - "[[00 - 대시보드/주제/서버·인프라|서버·인프라]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: Command Line

## 강의 내용

#### 프로그램 실행시에 사용자 입력 값 받아서 처리하기

- 하나의 문자열 형태로 입력
- 공백을 기준으로 잘라서 String[배열]형태로 main메소드의 매개인자로 전달한다.

```java
String data = "안녕 잘가 123 abc";
// CSV Comma Separated Value : 구분자
String[] arr = data.split(" "); //쪼갠다, 구분자를 명시해주면된다./ String 배열에 반환

for(int i = 0; i < arr.length; i++)
	System.out.println(i + " : [" + arr[i] + "]");

//결과
0 : [안녕]
1 : [잘가]
2 : [123]
3 : [abc]
```

```java
<커맨드라인 수정 후>
	/**
	 * 사용자 정보 출력
	 * -이름 나이 성별 키
	 * 홍길동 33 남 177.5
	 */
	public void test1(String[] args) {
		String name = "";
		int age = 0;
		char gender = ' ';
		double height = 0.0;
		
		name = args[0];
		age = Integer.parseInt(args[1]); //String -> int
		gender = args[2].charAt(0); //String -> char
		height = Double.parseDouble(args[3]); //String -> double
		
		System.out.println("이름 : " + name);
		System.out.println("나이 : " + age + "세");
		System.out.println("성별 : " + gender + "자");
		System.out.println("키 : " + height + "cm");
	}
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/8fca01fb_Untitled.png]]

1. **실행설정**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/87a076a0_Untitled.png]]

2. **클래스확인**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7598a862_Untitled.png]]

3. **Arguments클릭**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/51e0ab2d_Untitled.png]]

4. **하나의 문자열 형태로 , 공백으로 구분해서 쓴다.**

### 팝업창으로 argument 설정

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/bdd3c14a_Untitled.png]]

1. **variables... 클릭**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/f900d215_Untitled.png]]

**2. string_prompt 검색**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/8cc4645f_Untitled.png]]

**3. apply→run**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/57a91209_Untitled.png]]

**4. 공백으로 구분하며 원하는 값 입력**

#### String → int 변환

```java
담을 변수 num = Integer.parseInt(args[0]);
```

#### String → double변환

```java
num = Integer.parseDouble(args[2]);
```

#### String → char변환

```java
num = args[1].charAt(0); 
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
