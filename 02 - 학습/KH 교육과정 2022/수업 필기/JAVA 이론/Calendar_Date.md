---
별칭:
  - "강의 - Calendar_Date"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/6c42658f48494039af75449df04fc0f9
---

# 강의: Calendar_Date

## 강의 내용

- Calendar 객체를 얻어내는거 혹은 자식객체를 구현하는 것

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/6967a89d_Untitled.png]]

- Date - 기본생성자, Long타입생성자를 제외하고는 거의 Deprecated
- Calendar
- java.time패키지에서 LocalDate, LocalDateTime... 을 제공
- Calendar 객체를 만들 수 있는 방법 2가지
    - Calendar call = Calendar.getInstance();
    - 자식 클래스인 GregorianCalendar 생성 : 이때 import문 추가해줘야함

```java
public void test1() {
		//Calendar객체 생성하기
		//원래 생성하던 new Calendar 방식은 막혀있다.
		Calendar call = Calendar.getInstance();
		System.out.println(call);
	}
}
//결과
java.util.GregorianCalendar[time=1645066162137,
areFieldsSet=true,areAllFieldsSet=true,lenient=true,
zone=sun.util.calendar.ZoneInfo[id="Asia/Seoul",offset=32400000,
dstSavings=0,useDaylight=false,transitions=30,lastRule=null],
firstDayOfWeek=1,minimalDaysInFirstWeek=1,ERA=1,YEAR=2022,MONTH=1,
WEEK_OF_YEAR=8,WEEK_OF_MONTH=3,DAY_OF_MONTH=17,DAY_OF_YEAR=48,
DAY_OF_WEEK=5,DAY_OF_WEEK_IN_MONTH=3,AM_PM=0,HOUR=11,HOUR_OF_DAY=11,
MINUTE=49,SECOND=22,MILLISECOND=137,ZONE_OFFSET=32400000,DST_OFFSET=0]

-> 월은 0부터 시작 0 ~ 11
-> 현재 2월인데 1로 표기되어있음
-> 실제 생성된건 자식객체인 GregorianCalendar이 생성된 것
```

#### calendar는 추상클래스라 객체생성 안된다.

→ 자식클래스만 객체화 할 수 있다.

- import java.util.GregorianCalendar;

```java
Calendar cal1 = new Calendar(); //에러
```

```java
Calendar cal2 = new GregorianCalendar();
System.out.println(cal2); //가능 자식클래스 GregorianCalendar
```

#### 년 월 일 시 분 초

- get메소드 사용
- field는 상수처리 되어 있어서 Calendar.원하는상수접근

```java
Calendar cal1 = Calendar.getInstance();
		System.out.println(cal1);
		
		//년 월 일 시 분 초
		System.out.println(cal1.get(Calendar.YEAR)); //년
		System.out.println(cal1.get(Calendar.MONTH) + 1); //월 0-based value
		System.out.println(cal1.get(Calendar.DATE)); //일
		System.out.println(cal1.get(Calendar.DAY_OF_MONTH));일
		System.out.println(cal1.get(Calendar.DAY_OF_WEEK));//일(1),월(2),화(3),수(4),목(5),금(6),토(7)
		String[] weeks = {"일","월","화","수","목","금","토"};
		System.out.println(weeks[cal1.get(Calendar.DAY_OF_WEEK)-1]);
//요일은 1부터 시작하기 때문에 -1 해서 index처리를 해준다. 
		
		System.out.println(cal1.get(Calendar.HOUR)); //12시간제
		System.out.println(cal1.get(Calendar.HOUR_OF_DAY)); //24시간제
		System.out.println(cal1.get(Calendar.MINUTE));//분
		System.out.println(cal1.get(Calendar.SECOND));//초
		System.out.println(cal1.get(Calendar.MILLISECOND));// 1/1000초
		
		System.out.println(cal1.getActualMaximum(Calendar.MONTH));// 월 말 구하기
		System.out.println(cal1.getActualMaximum(Calendar.DATE)); // 말 일 구하기
```

#### 특정일자를 가리키는 Calendar 객체 만들기

- Calendar로 날짜지정하기

```java
public void test1() {
		//설정
		Calendar dday1 = Calendar.getInstance();
		dday1.set(2022, 8 - 1, 29); //시분초 정보유지
		printCalendar(dday1);
	}
	public void printCalendar(Calendar cal) {
		System.out.printf("%d년 %d월 %d일 %d시 %d초",
						cal.get(Calendar.YEAR),
						cal.get(Calendar.MONTH) + 1,
						cal.get(Calendar.DATE),
						cal.get(Calendar.HOUR_OF_DAY),
						cal.get(Calendar.MINUTE),
						cal.get(Calendar.SECOND));
	}
//2022년 8월 29일 19시 38초
```

- Gregorian 으로 날짜 지정하기

```java
public void test1() {
		Calendar dday2 = new GregorianCalendar(2020, 8 - 1, 29);
		printCalendar(dday2);
	}
	public void printCalendar(Calendar cal) {
		System.out.printf("%d년 %d월 %d일 %d시 %d초%n",
						cal.get(Calendar.YEAR),
						cal.get(Calendar.MONTH) + 1,
						cal.get(Calendar.DATE),
						cal.get(Calendar.HOUR_OF_DAY),
						cal.get(Calendar.MINUTE),
						cal.get(Calendar.SECOND));
	}

}
//2020년 8월 29일 0시 0초
시분초 생성할 수 있는 생성자있음. 안하면 0으로 세팅
```

### 날짜 차이 계산하기

- Epoch Time
- 1970년 1월 1일 자정 기준으로 누적된 밀리초를 반환

```java
public void test2() {
		// 오늘
		Calendar today = Calendar.getInstance();
		// D-day 2/21 자정기준
		Calendar dday = new GregorianCalendar(2022, 2 - 1, 21);
		//날짜 차이 -> millis초 단위 변환 후 계산
		long future = dday.getTimeInMillis();//미래
		long past = today.getTimeInMillis(); //현재
		double diff = ((double)future - past) /1000 /60 /60 /24;
		// 초 -> 분 -> 시 -> 일
		System.out.println(diff);
		
		//올림처리
		System.out.println("오늘은 D" + (diff > 0 ? "-" : "+") +(int)(Math.ceil(diff)) + "일 입니다.");
		
	}
```

## Calendar → Date

```java
Calendar cal = Calendar.getInstance();
		long epochTime = cal.getTimeInMillis();
		Date date = new Date(epochTime);
		
		System.out.println(cal);
		System.out.println(date);
	}
```

## Date → Calendar

```java
public void test4() {

		// 2.Date -> Calendar
		Date now = new Date();
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(now);
		printCalendar(calendar);
		
	}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
