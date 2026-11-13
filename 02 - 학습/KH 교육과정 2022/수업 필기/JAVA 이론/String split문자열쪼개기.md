---
별칭:
  - "강의 - String split문자열쪼개기"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/90098d60c1d243daa5d3079b390cdcb4
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: String split문자열쪼개기

## 강의 내용

## 문자열 쪼개기 (CSV)

- "java,orcle,html,css,javascript”
- CSV comma Seperated Value
1. String#split (#인스턴스메서드)
2. StringTokenizer

#### String#split

```java
public void test3() {
		String data = "java,orcle,html,css,javascript";
		String[] result1 = data.split(",");
		System.out.println(result1.length);
		for(int i = 0; i < result1.length; i++) {
			System.out.println(result1[i]);
		}
	}
//결과
5
java
orcle
html
css
javascript
```

#### String#split 주의사항 - 공백도 포함하기 때문에 구분자에서 공백도 포함해준다.

```java
public void test3() {
		String data = "java / orcle / html / css / javascript";
		String[] result1 = data.split(" / ");
		System.out.println(result1.length);
		for(int i = 0; i < result1.length; i++) {
			System.out.println("[" + result1[i] + "]");
		}
	}
//결과
공백도 포함해서 처리해준다.
```

#### StringTokenizer

- tokenizer는 문자기준으로 사용된다. ' ' '/' →공백도 /도 쪼개준다
- 값이 없는 token은 버려진다.

```java
	StringTokenizer tokenizer = new StringTokenizer(data, " / ");
	System.out.println(tokenizer.countTokens());	
}
//결과
5
```

이때 import java.util.StringTokenizer; 를 import해야함

→ countTokens 몇개인지 알려준다.

```java
<Tokenizer에 들어있는 값 하나씩 접근하는 법>
// while문으로 반복을 하는데 tokenizer는 하나씩 읽으면서 제거한다.
// 즉 tokenizer가 있을 때 까지 반복을하고 없으면 실행종료
while(tokenizer.hasMoreTokens()) {
	String token = tokenizer.nextToken(); //해당토큰을 tokenizer로 객체로 부터 가져온다.(제거)
	System.out.println("[" + token + "] - " + tokenizer.countTokens());
}
//결과
[java] - 4
[orcle] - 3
[html] - 2
[css] - 1
[javascript] - 0
```

→ hasMoreTokens() 토근이 더 있는지 확인해서 

→ nextToken()  하나씩 객체로 부터 제거하면서 가져온다.

→ 더 쓰고 싶으면 새로 객체를 만들어야한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7b6fdead_Untitled.png]]

#### `split` 과 `Tokenizer`차이점

```java
public void test3() {
		String data = "java/orcle/html//css/javascript";
<split>
		String[] result1 = data.split("/");
		System.out.println(result1.length);
		for(int i = 0; i < result1.length; i++) {
			System.out.println("[" + result1[i] + "]");
		}
<Tokenizer>
		StringTokenizer tokenizer = new StringTokenizer(data, "/");
		System.out.println(tokenizer.countTokens());
		
		while(tokenizer.hasMoreTokens()) {
			String token = tokenizer.nextToken(); //해당토큰을 tokenizer로 객체로 부터 가져온다.(제거)
			System.out.println("[" + token + "] - " + tokenizer.countTokens());
		}
	}
//결과
6
[java]
[orcle]
[html]
[]
[css]
[javascript]
5
[java] - 4
[orcle] - 3
[html] - 2
[css] - 1
[javascript] - 0
```

#### 연습예제

```java
<a,b,c,b,e,... 전부 쪼개기>
public void test4() {
		String data = "a,b,c,\n"
								+ "b,e,나\n"
								+ "c,3,다";
		System.out.println("[" + data + "]");
```

```java
<split> 2차원배열처럼 풀이

for(int i = 0; i < result1.length; i++) {
	//System.out.println("[" + result1[i] + "]");

		String[] result2 = result1[i].split(",");
		for(int j = 0; j < result2.length; j++) {
			System.out.println("[" + result2[j] + "]");
		}
	}
```

```java
<tokenizer> 1차원배열처럼 풀이

StringTokenizer tokenizer = new StringTokenizer(data, ",\n");

while(tokenizer.hasMoreTokens()) {
			String token = tokenizer.nextToken(); //해당토큰을 tokenizer객체로 부터 가져옴
			System.out.println("[" + token + "]");
		}
	}
```

### `split` 여러문자를 동시처리하기

- regex :  split의 인자는 정규표현식(문자열검색표현식)
- 는 문자하나의 옵션 -(콤마) , 나 (역슬래시n)\n를 구분자로 사용하겠다.

```java
public void test5() {
		String data = "a,b,c,\n"
								+ "b,e,나\n"
								+ "c,3,다";
String[] result = data.split("[,\n]");
		for(String s : result)
		System.out.println(s);
	}
```

### [**`lastIndexOf`](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html#lastIndexOf-int-) 문자열 index 몇번째에 있는지**

```java
public void test6() {
		String str = "application";
		System.out.println(str.indexOf("ca")); //5
		System.out.println(str.indexOf("kkk")); //-1 존재하지 않는 경우
	}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
