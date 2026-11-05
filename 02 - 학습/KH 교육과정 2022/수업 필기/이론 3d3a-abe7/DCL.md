---
별칭:
  - "강의 - DCL"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/a02e23585e314a20841754d603fcc6e2
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: DCL

## 강의 내용

---

---

- Data Control Language 데이터 제어어
- 권한 할당, 권한 회수등에 사용하는 명령어
- TCL을 포함하는 상위개념

### GRANT : 권한을 사용자나 롤(권한 묶음)에 부여하는 명령어

- grant (특정권한 | 롤) to (사용자 | 롤) [with admin option]
- with admin option은 부여받은 권한을 다시 부여할 수 있는 옵션

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c700b79c_Untitled.png]]

#### 예제 코드

- (관리자계정) qwerty 생성 -> 접속(실패) create session권한 부재
- create session | connect 을 qwerty에게 부여 -> 접속 시도(성공)

```sql
-- c뭐시기 접두사 대신해서 이걸로 하고 밑에 코드 실행
alter session set "_oracle_script" = true; 
-- 우측상단 system계정으로 변환
create user qwerty identified by qwerty default tablespace users; 
--1.권한부여방법
grant create session to qwerty;
--2.권한부여방법
grant connect to qwerty;
-- 용량 무한으로 주는 것.
alter user qwerty quota unlimited on users;
-- 리소스도 같이 부여 -> 테이블 생성, 객체생성권한
grant resource to qwerty;

--롤이 가지고 있는 권한 조회

select *
from 
    dba_sys_privs
where
    grantee in ('CONNECT', 'RESOURCE');
    
/*
    RESOURCE	CREATE SEQUENCE
    RESOURCE	CREATE PROCEDURE
    CONNECT	SET CONTAINER
    RESOURCE	CREATE CLUSTER
    CONNECT	CREATE SESSION
    RESOURCE	CREATE INDEXTYPE
    RESOURCE	CREATE OPERATOR
    RESOURCE	CREATE TYPE
    RESOURCE	CREATE TRIGGER
    RESOURCE	CREATE TABLE

*/
```

### REVOKE : 권한 회수

- 위 코드에 부여한 권한을 회수함

```sql
-- 권한을 회수하는 명령어
-- revoke (권한 | 롤) from (사용자 | 롤)

revoke insert, update, delete on tb_coffee from qwerty;
```

## TCL

- Traction Control Language 트랜잭션 제어어
- commit / rollback / savepoint

#### Transaction

- 한번에 처리되어야할 최소의 작업단위
- 하위 작업들은 모두 성공, 모두 실패되어야 한다.

```sql
계좌이체 : a ------------> b 50000원 전송
1. a계좌에서 50000원 차감.
2. b계좌에서 50000원 증액.

1,2번 update실행후 모두 성공시 commit, 하나라도 실패하면 rollback!
```

#### TRANSACTION

- 트랙잭션이란 ‘거래’라는 뜻으로 데이터베이스 내에서 하나의 그룹으로 처리되어야 하는 명령문들을 모아 놓은 논리적인 작업 단위이다.
- 데이터베이스 응용 프로그램은 트랜잭션들의 집합으로 정의할 수 있다.
- 여러 단계의 처리를 하나의 처리처럼 다루는 기능이다.
- 여러 개의 명령어의 집합이 **정상적으로 처리되면 정상종료**된다.
- 하나의 명령어라도 **잘못되면 전체 취소**된다.
- 트랜잭션을 쓰는 이유는 **데이터의 일관성을 유지하면서 안정적으로 데이터를 복구**하기 위함.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/e972c807_Untitled.png]]

[1][2] 실행⇒ [3] 작업 시 소프트웨어가 중단되거나 하드웨어가 고장이 발생하여 작업에 오류가 생긴다면? ⇒ [2]번까지의 모든 작업을 취소하고 트랜잭션 작업전인 데이터베이스 초기 상태로 돌아간다.

1. A 은행에서 출금하여 B은행으로 송금한다고 가정
2. 송금하는 중에 알 수 없는 오류가 발생하여 A은행 계좌에서 돈이 빠져나갔는데 B은행 계좌에 입금되지 않았다.
3. 이때, 우리는 A은행 계좌의 출금을 취소하거나, 출금된 금액만큼 B은행 계좌로 다시 송금하면 된다.
4. 하지만 이 방법은 번거롭고 더 심한 오류를 발생시킬 수 있다.
5. 그래서 생각해낸 해결책이, 거래가 성공적으로 모두 끝난 후에야 이를 완전한 거래로 승인하고, 거래 도중 뭔가 오류가 발생했을 때는 이 거래를 아예 처음부터 없었던 거래로 되돌리는 것
6. 이렇게 거래의 **안정성을 확보하는 방법이 트랜잭션**이다.
7. 데이터베이스에선 테이블에서 데이터를 읽어 온 후 다른 테이블에 데이터를 입력하거나 갱신,삭제하는데 처리 도중 **오류가 발생하면 모든 작업을 원상태로 되돌린다.**

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c37bb946_Untitled.png]]

**COMMIT (커밋)** : 모든 부분 작업이 정상적으로 완료하면 이 변경사항을 한꺼번에 DB에 반영한다.

**ROLLBACK (롤백)** : 부분 작업이 실패하면 트랜잭션 실행 전으로 되돌린다.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
