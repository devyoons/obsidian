---
별칭:
  - "업무 - Replication"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/d1d51b8d81354418a11874614d726a3a
---

# 업무: Replication

## 내용

---

최종 변경 : 2023.07.28

---

[Redis replication](https://redis.io/docs/management/replication/)

---

#### Replication : 복제

Replication은 Redis에서 지원하는 복제 로직으로 동일한 데이터에 대해서 마스터 - 슬레이브 구성을 갖추어 마스터 서버에 장애가 발생하는 경우 슬레이브 서버를 통해 마스터를 대체할 수 있도록 구성할 수 있다.

---

#### 모식도

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/첨부/7aa46d60_1.png]]

---

#### Replication 설정

복제의 경우 슬레이브 노드의 conf 파일에서 설정을 진행한다.

- redis.conf 파일
    
    ```bash
    sudo vi /etc/redis/redis.conf
    ```
    

- 복제 설정
    
    ```scheme
    replicaof 마스터IP 마스터포트
    
    //EX. replicaof 127.0.0.1 6379
    ```
    

- 설정 후 재시작
    
    ```bash
    sudo systemctl restart redis-server
    ```
    

---

#### 마스터 서버 장애 대비

마스터 서버에 장애가 발생하였을 경우 슬레이브 서버를 마스터 서버로 승격시켜야 한다.

이때 수동으로 설정을 진행하는 것이 거의 불가능하기 때문에 Redis는 Sentinel이라는 도구를 지원한다.

[High availability with Redis Sentinel](https://redis.io/docs/management/sentinel/)

---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
