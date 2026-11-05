---
별칭:
  - "강의 - List ↔ Set"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/faee43e8df594f03a4098b4319ddc74e
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: List ↔ Set

## 강의 내용

## List → Set

- 중복을 제거하기 위해서

```java
private void test3() {
		List<Integer> list = Arrays.asList(2,3,4,5,2,3,4,1,3);
		System.out.println(list);
		
		//Set으로 변환
		//collection타입의 <integer> 호출함
		Set<Integer> set = new HashSet<>(list); //생성자호출
		System.out.println(set);
	}
//결과
[2, 3, 4, 5, 2, 3, 4, 1, 3]
[1, 2, 3, 4, 5]
-> 기본형이라서 가능 커스텀클래스에서는 불가
```

## Set → List

- 순서적용 (하나씩 접근, 정렬...)

```java
private void test3() {
		List<Integer> list = Arrays.asList(2,3,4,5,2,3,4,1,3);
		System.out.println(list);
		
		//Set으로 변환
		Set<Integer> set = new HashSet<>(list); //collection타입의 <integer>
		System.out.println(set);
		
		//List로 변환
		List<Integer> newList = new ArrayList<>(set);//인자로 컬렉션 받기
		System.out.println(newList);
	}
//결과
[2, 3, 4, 5, 2, 3, 4, 1, 3]
[1, 2, 3, 4, 5]
[1, 2, 3, 4, 5]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
