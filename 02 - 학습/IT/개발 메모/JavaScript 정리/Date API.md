---
별칭:
  - "학습 - Date API"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/d9170b8575a5411eae773ebf8f05e086
---

# 학습: Date API

## 세부 내용

```jsx
/**
 * Date
 * - 날짜, 시각정보를 관리하는 객체
 * - Date.prototype이 제공하는 메소드 사용
 */
function test4(){
  const now = new Date(); // new 생성자함수 호출!
  console.log(typeof now, now.toString());
  console.dir(now);
  
  console.log("getFullYear : ", now.getFullYear());
  console.log("getMonth + 1: ", now.getMonth() + 1); // 0 ~ 11 인덱스로 처리
  console.log("getDate : ", now.getDate());

  const days = ['일', '월', '화', '수', '목', '금', '토'];
  console.log("getDay : ", now.getDay()); // 일요일(0) ~ 토요일(6)
  console.log("요일 : ", days[now.getDay()]);

  console.log("getHours : ", now.getHours());
  console.log("getMinutes : ", now.getMinutes());
  console.log("getSeconds : ", now.getSeconds());

  console.log("unix time : ", now.getTime());
  console.log("unix time : ", Date.now());

  // 특정날짜시각 정보를 가진 Date객체 생성
  console.log(new Date('2022/01/01'));
  console.log(new Date('2022/01/01 15:00:20'));
  console.log(new Date(2022, 1 - 1, 1));
  console.log(new Date(2022, 1 - 1, 1, 15, 0, 20));

  const millis = new Date(2022, 1 - 1, 1).getTime();
  console.log(new Date(millis));

  // 두 날짜 차이 구하기
  const tomorrow = new Date(2022, 4 - 1, 15, 18, 0);
  const diff = (tomorrow - now) / 1000 / 60 / 60 / 24; // Date - Date = millis
  console.log(diff); // 일단위
}
```

- 초 시계 만들기
    
    ```jsx
    <h2 id='clock'></h2>
    <script>
    function displayClock(date){
      const f = function(n){
        return (n < 10) ? "0" + n : n;
      };
    
      const yyyy = date.getFullYear();
      const MM = f(date.getMonth() + 1);
      const dd = f(date.getDate());
      const hh = f(date.getHours());
      const mm = f(date.getMinutes());
      const ss = f(date.getSeconds());
    
      const str = `${yyyy}/${MM}/${dd} ${hh}:${mm}:${ss}`;
      clock.innerHTML = str;
    
      // 1초후에 다시 호출
      // 1 * 1000 ms
      setTimeout(function(){
        displayClock(new Date());
      }, 1000); 
      
    }
    
    displayClock(new Date());
    </script>
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/JavaScript 정리/JavaScript 정리|JavaScript 정리]]
