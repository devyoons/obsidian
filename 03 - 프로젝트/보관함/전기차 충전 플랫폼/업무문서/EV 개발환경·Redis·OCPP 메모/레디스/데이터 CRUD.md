---
별칭:
  - "업무 - 데이터 CRUD"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/779967a0b06440adabafb8503758b6b7
주제:
  - "[[00 - 대시보드/주제/웹 기능 구현|웹 기능 구현]]"
  - "[[00 - 대시보드/주제/Redis|Redis]]"
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 업무: 데이터 CRUD

## 내용

---

최종 변경 : 2023.07.27

---

[Redis data types](https://redis.io/docs/data-types/)

---

#### String 데이터

- set : 데이터 쓰기
    
```bash
set KEY VALUE

//EX. set 1 kim
```


- set과 함께 expire 시간 설정
    
```bash
set KEY VALUE EX 초단위시간

set KEY VALUE PX 밀리초단위시간
```


- get : 데이터 읽기
    
```bash
get KEY

//EX. get 1
```


- scan : 단위 키 조회
    
```bash
scan 단위숫자

//EX. scan 0
```


- keys : 특정 키 조회
    
```bash
keys 패턴

//EX. keys *
```


- exists : 키 존재 여부 확인
    
```bash
exists KEY

//EX. exists 1
```


- del : 키 삭제
    
```bash
del KEY

//EX. del 1
```


- flushall : 모든 키 삭제
    
```bash
flushall
```


---

#### Lists 데이터

- lpush : 좌측에서 데이터 추가
    
```bash
lpush KEY VALUE

//EX. lpush testlist a
```


- rpush : 우측에서 데이터 추가
    
```bash
rpush KEY VALUE
```


- lpop : 좌측에서 데이터 제거
    
```bash
lpop KEY

//EX. lpop testlist
```


- rpop : 우측에서 데이터 제거
    
```bash
rpop KEY
```


- llen : 저장된 데이터 개수 출력
    
```bash
llen KEY
```


- lrange : 지정된 단위 VALUE 출력
    
```bash
lrange KEY 시작인덱스 종료인덱스
```


---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
