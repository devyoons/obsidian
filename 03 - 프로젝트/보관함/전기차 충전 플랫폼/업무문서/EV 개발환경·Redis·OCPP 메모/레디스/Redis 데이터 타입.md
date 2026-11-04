---
별칭:
  - "업무 - Redis 데이터 타입"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/55d8c107f27944ea93bdc262e29032b0
---

# 업무: Redis 데이터 타입

## 내용

---

최종 변경 : 2023.07.26

---

[Redis data types](https://redis.io/docs/data-types/)

---

#### Redis 데이터 타입

레디스의 모든 데이터는 “key” - “value” 형태로 저장된다. 문자열 key에 대응되는 여러 타입의 value가 존재하며 그 종류는 아래와 같다.

- String
    
    단순 문자열 데이터로 최대 길이 512MB
    

- Bitmaps
    
    비트 단위의 이진수 데이터
    

- Lists
    
    배열형태의 데이터로 key와 value의 관계는 1 대 N이다. value의 최대 개수는 2^32 - 1 개며 주로 큐와 스택으로 활용된다.
    

- Sets
    
    집합 (중복되는 데이터가 없는 Lists)
    

- Sorted Sets
    
    집합에서 각각의 원소에 스코어라는 고유 숫자가 부여된다.
    

- Hashes
    
    json과 같은 데이터 형태로 key : value 내부에 key : value 가 존재한다.
    

- HyperLogLogs
    
    긴 길이의 Bitmaps 데이터
    

- Streams
    
    로그와 같은 스트림 데이터
    

---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
