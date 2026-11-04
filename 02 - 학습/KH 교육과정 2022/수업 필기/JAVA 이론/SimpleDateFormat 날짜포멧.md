---
별칭:
  - "강의 - SimpleDateFormat 날짜포멧"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/c98f862a8ba04916b12a9076addfd5c7
---

# 강의: SimpleDateFormat 날짜포멧

## 강의 내용

- SimpleDateFormat 포맷형식지정
- SimpleDateFormat#format에 Date객체 전달

```java
private void test1() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yy-M-dd E요일 hh시 mm분 ss초");
		String formattedDate = sdf.format(new Date());
		System.out.println(formattedDate);
		
		Date date = sdf.parse(formattedDate);
		System.out.println(date);
	}
//1.객체생성
//2.형식문자전달
//3.Date객체를 전달 -> 리턴타입은 String
//4.출력
```

- util타입 import
- M대문자 : 월 , m소문자: 분
- API 활용해서 형식문자 확인하기
    
    [Java Platform SE 8](https://docs.oracle.com/javase/8/docs/api/)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
