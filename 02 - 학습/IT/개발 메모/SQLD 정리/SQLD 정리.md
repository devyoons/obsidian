---
별칭:
  - "학습 - SQLD 정리"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/2f3d96d10bfd4e6f89acb0bae8e65f3c
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
  - "[[00 - 대시보드/주제/자격증|자격증]]"
---

# 학습: SQLD 정리

## 세부 내용

[[02 - 학습/IT/개발 메모/SQLD 정리/SQLD 문제풀이|SQLD 문제풀이]]

NVL or ISNULL
표현식 두 개의 데이터 타입이 같아야 함.

---

---

## [SQL 1-1강]

#### SQL 문장 종류 익히기

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/d7790c63_Untitled.png]]

### 🌱 DCL : 데이터베이스 사용자에게 권한을 부여/회수하는 언어

*📌 문제가 많은 편은 아님 그러나 GRANT,REVOKE 단어가 주관식으로 나오는 경우 종종 있음*

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/c3014eb2_Untitled.png]]

<aside>
💡 **GRANT**는 USER에게 권한을 주기 때문에 **TO**가 붙고,

**REVOKE**는 USER로부터 권한을 회수하기 때문에 **FROM**이 붙는다.

</aside>

- DML 데이터를 편집하기 위한 권한이 될 수도 있음
- 구조 수정, index값 수정, 참조 값을 넣어줄 수 있다.
- 전부 사용할 수 있는 권한을 줄 수 있다.

#### 1 - 1. GRANT 옵션

---

```sql
TO 유저 WITH GRANT OPTION;
```

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/63e2163f_Untitled.png]]

- 특정 사용자에게 권한 부여 가능한 권한을 부여함
- 단, 엄마가 회수 될 때 자식도 회수

```sql
TO 유저 WITH ADMIN OPTION;
```

- 테이블에 대한 모든 권한 부여
- 엄마의 권한 회수는 나랑 상관없음

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/81f08479_Untitled.png]]

#### 문제[1~2]

---

- [문제1] 
유저 hoho가 아래의 코드와 같은 작업을 수행할 수 있도록 권한을 부여하는 DCL을 작성하시오.
    
```sql
UPDATE hoho_qualification.data 
SET col2 = ‘합격’
WHERE col1 = ‘SQLD’ ;
```

- 정답

```sql
GRANT SELECT, UPDATE ON hoho_qualification.data TO hoho;
```

- GRANT권한 ON 테이블명 TO 유저명;
- WHERE조건문을 사용가능하기 위한 SELECT권한도 수여
- 
- [문제2]
데이터베이스상에서 많은 사용자들에게 개별적으로 권한을 부여하고 관리하는 어려움을 해소하고자 다양한 권한을 하나의 그룹으로 묶어서 관리할 수 있도록 하는 논리적인 권한의 그롭(명령어)을 칭하는 말은?
    - 정답
        
        ROLE
        
        ex) GRANT <u>관리자권한 TO hoho;</u>
        
        - 다양한 권한을 다양한 유저를 대상으로 관리하기 위한 명령어다
        - 여러 사용자에게 동일한 ROLL 부여 가능하다
        - ROLE의 생성은 [CREATE ROLE] 권한을 가진 유저가 할 수 있다.

### 🌱 DDL: 데이터를 보관하고 관리하기 위한 객체의 구조를 정의하기 위한 언어

#### 1 - 1. CREATE : 데이터 베이스 상 테이블 구조 생성

---

```sql
CREATE TABLE C_INFO ( 
	이름 varchar2(10),
	생년 number(4),
	phone varchar2(15) ,
	첫방문일 date, 
	고객번호 varchar2(10)
);
```

- 컬럼명
    - 영문, 한글, 숫자 모두 가능 (시작만 문자로)
        - ex h10 (o) , 10h (x)
- 데이터 타입
    - number : 숫자형
    - date : 날짜형
    - varchar2 : 가변길이 문자열
        - ex ‘호호’ ≠ ‘호호    ‘
    - char : 고정된 크기 문자열 할당된 길이만큼 문자 채움
        - ex ‘호호’ = ‘호호    ‘
- **컬럼 뒤에 데이터 유형 지정 필수**

#### 1 - 2.  제약조건 CONSTRAINT

---

```sql
CREATE TABLE C_INFO ( 
	이름 varchar2(10) ,
	생년 number(4) default 9999,
	phone varchar2(15) not null,
	첫방문일 date, 
	고객번호 varchar2(10) primary key
);
```

- default : 기본값 지정
- not null : null 입력 불가
- primary key : 기본키 지정
    - PK는 not null
    - PK는 unique 한 값(테이블 내 중복 없음)
- foreign key : 외래키 지정
    - 테이블당 여러개 가능

#### 문제[3 ~ 4]

---

- [문제3]
김호호씨가 아래와 같이 테이블 menu를 생성한 후, 유효한 튜플 값 4개를 삽입했다.
이 경우, SQL-a와 SQL-b의 실행 결과를 각각 구하시오.
    
```sql
<테이블 생성>
	CREATE TABLE MENU (
	메뉴명 varchar2(10) PRIMARY KEY,
	가격 number(10) 
) ;

<SQL-a>
SELECT count(*) FROM MENU;

<SQL-b>
SELECT count(메뉴명) FROM MENU;
```

- 정답

    둘 다 숫자 4가 출력된다.

    - count(*) : 전체 행의 수 카운트, null 포함
    - count(컬럼명) : null 제외한 행 수 카운트
    - 메뉴명 컬럼은 PK이므로 null값을 가질 수 없다.
        - 따라서 *을 통해 전체 행을 추출한 sql-a와 메뉴명이랑 컬럼명을 명시한 sql-b 결과가 동일

- [문제4]
김호호씨가 아래와 같이 테이블 menu를 생성한 후, 유효한 튜플 값 4개를 삽입했다.
이 경우, SQL-a와 SQL-b의 실행할 경우엔 어떤 결과가 출력될까요?
    
```sql
<테이블 생성>
CREATE TABLE MENU (
	메뉴명 varchar2(10) PRIMARY KEY,
	가격 number(10) 
) ;

<SQL-a>
SELECT count(*) FROM MENU;

<SQL-b>
SELECT count(가격) FROM MENU;
```

- 정답

    [가격]컬럼에 포함된 null값의 개수에 따라 서로 실행 결과가 다를 수 있다.

    - [가격] 컬럼은 NOT NULL 제약조건이 붙지도 않았고, primary key 도 아니다.

<aside>
💡 Point. null 말문제 대비

1. NULL 은 모르는 값을 상징하고, 값이 없음(부재)을 의미함
2. NULL **IS** NULL = TRUE
3. NULL 과의 모든 비교 (ex. NULL = 0 ) 은 알 수 없음(NULL)을 반환함
4. NULL은 숫자 0이나 공백문자 (‘ ‘)와 동일하지 않음 (얘네는 값이 있음)
</aside>


#### 1 - 2. ALTER : 테이블과 컬럼에 대해 이름 및 속성 변경, 추가/삭제 등 구조 수정을 위해 사용

---

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/a06f21f4_Untitled.png]]

| 테이블명 변경 | **ALTER TABLE** MENU RENAME **TO** ho_MENU ; |
| --- | --- |
| 컬럼명 변경 | **ALTER TABLE** MENU RENAME **COLUMN** phone **TO** 전화번호 ; |
| 컬럼 속성 변경 | **ALTER TABLE** MENU **MODIFY** ( 이름 varchar(20) not null) ; |
| 컬럼 추가 | **ALTER TABLE** MENU **ADD** ( 거주지역 varchar(10) ) ; |
| 컬럼 삭제 | **ALTER TABLE** MENU **DROP** COLUMN 이름 ; |
| 제약조건
추가/삭제 | **ALTER TABLE** MENU ADD **CONSTRAINT** ;
                                 DROP **CONSTRAINT** ; |

#### 문제[5]

---

- [문제5]
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/8d938755_Untitled.png]]
    
    아래의 테이블 RIDING 에서 현재 null값이 존재하는 컬럼에 대하여 **null이 발생할 수 없도록**
    제약조건을추가하고자 한다. 올바른 SQL 문장을 기술하시오.
    
    - 정답
        
```sql
ALTER TABLE RIDING
MODIFY ( phone varchar(15) NOT NULL ) ;
```


#### 1 - 3. DROP : 테이블 및 컬럼 삭제

---

| 컬럼 삭제 | **ALTER TABLE** MENU **DROP** COLUMN 이름 ; |
| --- | --- |
| 테이블 삭제 | **DROP** TABLE MENU ; |
| 테이블 삭제
(유의) | **DROP TABLE** MENU **CASCADE CONSTRAINT** ;
>> 해당 테이블의 데이터를 외래키(FK)로 참조한 제약사항도 모두 삭제
>> [말] Oracle에만 있는 옵션. SQL Server에는 존재하지 않음
>> [말] FK 제약조건과 참조테이블 먼저 삭제하고, 해당 테이블을 삭제한다. |

**DROP vs TRUNCATE**

| 테이블 삭제
DROP | **DROP TABLE** MENU ;
>> 테이블 관련해서 모두 삭제된다. 구조도, 데이터도! |
| --- | --- |
| 테이블 초기화
TRUNCATE | **TRUNCATE TABLE** MENU ;
>> 테이블 데이터만 삭제되고 구조는 살아있다 |

#### 문제[6]

---

- [문제 6]
    
    김호호씨는 F_INFO 테이블에 대해 DDL을 통해 삭제를 진행하고자한다.
    변경 후의 모습이 아래와 같도록 만들기 위해서, A와 B에 각각 알맞은 SQL을 작성하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/bfcafd48_Untitled.png]]
    
    - DROP
        - 테이블 정의를 완전 삭제함
        - 테이블이 사용했던 모든 저장공간을 Release됨
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/57af8c3a_Untitled.png]]
    
    - TRUNCATE
        - 테이블을 초기상태로 만듦
        - 테이블 최초 형성시 사용했던 저장공간만 남기고 Release
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/4fb8b1b5_Untitled.png]]
    

## [SQL 1-2강]

#### 문제[1]

---

- 문제[1]
    
    식당운영자인김호호씨는메뉴별 가격을 기록하기 위한 테이블을 추가로 제작하려고한다.
    물리적 테이블 명으로 가장 적절한 것은?
    
    1. 20_MENU
    2. !대박기원!_MENU
    3. MENU_20
    4. MENU-20
    - 정답
        
        3
        
    
    <aside>
    💡 Point 테이블 생성 주의사항
    
    1. 테이블명과 컬럼명은 반드시 문자로 시작해야함
    2. A-Z, a-z, 0-9, #, $, _ 만 사용가능함
    3. 다른 테이블명과 중복되지 않아야 함
    4. 칼럼 뒤 데이터유형은 꼭 지정되어야 함
    </aside>
    

### 🌱 DML : 정의된 데이터베이스에 레코드를 입력하거나, 수정, 삭제 및 조회하기 위한 명령어

| **INSERT** | **INSERT INTO** MENU (NAME) **VALUES** (‘연어스시’); |
| --- | --- |
| **UPDATE** | **UPDATE** MENU SET discount_rate = 10 (where name = ‘연어스시’) ; |
| **DELETE** | **DELETE FROM** MENU (WHERE name = ‘연어스시’) ; |

#### 문제[2 ~ 3]

---

- 문제[2]
    
    다음의 SQL을 통해 MENU 테이블을 생성했다. 보기의 SQL문장 중 오류가 발생하는 것을 모두 고르시오.
    
```sql
CREATE TABLE MENU (
	메뉴코드 varchar2(10) PRIMARY KEY,
	메뉴명 varchar2(10) NOT NULL,
	가격 number(10) NOT NULL,
	할인율 number(100) DEFAULT 0
) ;
```

1. UPDATE MENU SET 메뉴코드 = 100 WHERE 메뉴명 = ‘스키야키’ ;
2. DELETE MENU;
3. INSERT INTO MENU (메뉴코드, 가격) VALUES (‘101’, 50000 );
4. INSERT INTO MENU VALUES ( ‘102’, 와규, 30000 ) ;
- 정답

    3, 4

    - 숫자는 varchar2 와 char에 입력 가능
    - DELETE 에서 FROM 생략 가능
    - not null값인 메뉴명에 대한 insert가 이뤄지지 않을 경우 오류 발생
    - 컬럼명 지정이 이뤄지지 않은 상태에서는전체값이 들어가야함

- 문제[3]
    
    DELETE에 관한 설명 중 틀린 것은?
    
    1. 삭제된 데이터에 대해 로그를 남길 수 있는 방법이다.
    2. 특정 행은 지울 수 없다.
    3. 삭제된 데이터를 다시 되돌릴 수 있다.
    4. 데이터는 삭제되지만 용량이 줄어들지 않는다.
    - 정답
        
        2
        
        ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/efc32b97_Untitled.png]]
        
        1. TRUNCATE와 DROP은 로그를 남기지 않는다.
        2. 특정행 지울 수 있음. (where 문 사용)
        3. 되돌릴 수 있음. (DB에 반영되기 전까지는) DDL인 TRUNCATE와 DROP은 불가능하다.

### 🌱  TCL : 트랜잭션을 제어하기 위한 언어

[Transaction Control Language]

*📌트랜잭션 : 데이터베이스의상태를 변화시키기 위해 수행하는 작업의 단위*

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/7dc5508e_Untitled.png]]

| COMMIT : 반영 | 데이터에 대한 변화를 DB에 반영하기 위한 명령어 |
| --- | --- |
| SAVEPOINT : 취소 | 코드를 분할하기 위한 저장 포인트 지정 |
| ROLLBACK : 위치지정 | 트랜잭션이 시작되기 이전의 상태로 되돌리기 위한 언어
최신 COMMIT이나 특수한 SAVEPOINT로 되돌릴 수 있는 명령어 |

#### 문제[4 ~ 7]

---

- 문제[4]
    
    다음의 SQL문을 수행했을때 결과를 구하시오. (주관식)
    
```sql
CREATE TABLE T1 (
	col1 varchar2(10)
	col2 number(10)
) ; 
INSERT INTO T1 VALUES( 10, 100) ; 
INSERT INTO T1 VALUES( 20, 200) ;
INSERT INTO T1 VALUES( 25, 250) ;
SAVEPOINT S1;
DELETE T1 WHERE col1 = 10 ;
UPDATE T1 SET col1 = 40 WHERE col2 = 200 ; 
SAVEPOINT S1;
INSERT INTO T1 VALUES(50, 500);
ROLLBACK TO SAVEPOINT S1;
SELECT MAX(col2) FROM T1;
```

- 정답

    300

    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/731ef79d_Untitled.png]]

- 문제[5]
    
    다음의 SQL문을 수행했을때 영구적으로 반영되는 col1의 값을 모두 쓰시오.
    
```sql
INSERT INTO T2 VALUES(10);
INSERT INTO T2 VALUES(20);
INSERT INTO T2 VALUES(30);
SAVEPOINT S1;
UPDATE T2 SET col1 = 50 WHERE col1 = 20;
SAVEPOINT S2;
DELETE T2 WHERE col1 = 30;
SAVEPOINT S3;
INSERT INTO T2 VALUES(70);
ROLLBACK S2;
COMMIT;
```

- 정답

    10, 50, 30

    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/de78eb16_Untitled.png]]

    - DML 은 자동 commit (반영) 되지 않음
    - ROLLBACK, DROP 은 되돌릴 수 없다던 말
    = [SQL server] 기준 DDL = auto-commit

    <aside>
    💡 **COMMIT과 ROLLBACK 효과**

    1. 데이터 무결성을 보장할 수 있다.
    2. 영구적인 변경 전 데이터에 대한 변동사항을 확인할 수
    있다.
    3. 논리적 연관성 있는 작업을 그룹화하여 처리할 수
    있다.
    </aside>

- 문제[6]
    
    다음의 SQL문을 수행했을때 영구적으로 반영되는 col1의 값을 모두 쓰시오.
    
```sql
INSERT INTO T2 VALUES(10);
INSERT INTO T2 VALUES(20);
INSERT INTO T2 VALUES(30);
COMMIT;
UPDATE T2 SET col1 =50 WHERE col1=20;
DELETE T2 WHERE col1= 30;
INSERT INTO T2 VALUES(70);
ROLLBACK;
COMMIT;
```

- 정답

    10, 20, 30

    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/3d640042_Untitled.png]]

    - SAVEPOINT 가 없을 경우 가장 최신의 COMMIT 상태로 복원된다.

- 문제[7]
    
    다음 중 데이터베이스 시스템 언어의 종류와 해당하는 명령어가 바르게 연결되지 않은 것을 모두 고르시오.
    
```sql
1. DDL - RENAME
2. TCL - REVOKE
3. DML - UPDATE
4. DCL - ROLLBACK
5. DDL - DELETE
6. TCL - COMMIT
7. DML - DROP
8. DCL - GRANT
```

- 정답

    2, 4, 5, 7


## [SQL 2-1강]

### 🌱  DML - SELECT문 기본 구조

```sql
SELECT 컬럼명 등
FROM 테이블명
WHERE 조건문
GROUP BY 집계기준컬럼명
HAVING grouping된 후 상태 기반의 조건문
ORDER BY 컬럼명
```

#### 문제[1 ~ 4]

---

- 문제[1]
    
    다음의 트랜잭션의 특징 중 원자성에 대한 설명으로 올바른 것은?
    
    1. 트랜잭션이 실행되는 동안 다른 트랜잭션에 영향을 받아 잘못된 결과를 만들어선 안된다.
    2. all or nothing. 트랜잭션에서 정의된 연산은 모두 성공적으로 실행되던지 아니면 전혀 실행되지 않은 상태로 있어야 한다.
    3. 트랜잭션이 성공적으로 완료되면 해당 트랜잭션이 갱신한 데이터베이스의 내용은 영구적으로 저장된다.
    4. 트랜잭션 발생 전 데이터베이스 내용에 잘못된 점이 없다면 트랜잭션 수행 후에도 데이터베이스의 내용에 잘못이 있으면 안된다.
    - 정답
        
        2
        
        ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/8917babc_Untitled.png]]
        
- 문제[2]
    
    다음과 같이 정의된 C_INFO 테이블에서 2000년도에 태어난 고객의 이름과 전화번호를 조회하려고 한다. 빈칸에 알맞은 명령어를 구하시오.
    
```sql
CREATE TABLE C_INFO ( 
	이름 varchar2(10) ,
	생년 number(4) default 9999,
	전화번호 varchar2(15) not null,
	첫방문일 date, 
	고객번호 varchar2(10) primary key
);

[ ㄱ ] 이름, 전화번호
[ ㄴ ] C_INFO
[ ㄷ ] 생년 = 2000 ;
```

- 정답

```sql
select, from, where
```

<aside>
💡 조회를 하기 위한 기본 문장 구조

**SELECT** 조회대상
**FROM** 테이블명
**WHERE** 조건문

</aside>

- 문제[3]
    
    테이블 C_INFO에 대하여 아래와 같은 SQL문을 실행한 결과 출력 되는 행의 수를 구하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/c4ea243c_Untitled.png]]
    
```sql
SELECT DISTINCT 성별, 연령대
FROM C_INFO ;
```

- 정답

    4

    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/064ec99a_Untitled.png]]

    - C_INFO라는 테이블의 (FROM C_INFO)
    - 성별 컬럼에서 중복을 제거하고 조회한다. (DISTINCT)
        - 단, DISTINCT는 NULL도 단일 행으로 본다.

    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/8c8c758a_Untitled.png]]

- 문제[4]
    
    테이블 C_INFO에 대하여 아래의 SQL문 3가지를 실행한 결과 출력 되는 행 수를 구하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/c095a963_Untitled.png]]
    
    - 정답
        
        5, 4, 3
        
        ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/a511d993_Untitled.png]]
        

### 🌱  SELECT문 기본 구조 - 문자형 함수

```sql
SELECT 컬럼명 등
FROM 테이블명
WHERE 조건문
ORDER BY 컬럼명
```

| LOWER(문자열) | 영어 문자열 소문자로 변환
LOWER(‘SQL’) >> ‘sql’ |
| --- | --- |
| UPPER(문자열) | 영어 문자열 대문자로 변환
LOWER(‘sql’) >> ‘SQL’ |
| CONCAT(문자열1, 문자열2) | 문자열 1과 문자열 2을 결합
CONCAT(‘가’,’나’) = ‘가’ || ‘나’ (oracle) 
                             = ‘가' + ‘나’ (sql server) |
| SUBSTR(문자열, m, n) | 문자열에서 m번째 자리값부터 n개를 자른다.
SUBSTR(‘KATE’ , 2, 2) >> ‘AT’ |
| LENGTH(문자열) = LEN(문자열) | 공백을 포함하여 문자열의 길이값
LEN(‘가 나다') >> 4 |

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/417620d9_Untitled.png]]

#### 문제[5 ~ 6]

---

- 문제[5]
    
    C_INFO를 우측의 테이블과 같이 조회하기 위한 SQL문은?
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/13c2af4d_Untitled.png]]
    
    - 정답
        
```sql
SELECT 회원코드, 연령대, UPPER(이름) 
FROM C_INFO ;
```

- 문제[6]
    
    C_INFO를 우측의 테이블과 같이 조회하기 위한 SQL문은?
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/a7d1041d_Untitled.png]]
    
    - 정답
        
```sql
SELECT 회원코드, RTRIM(연령대, ‘대’), UPPER(이름) 
FROM C_INFO ;
```

※ 참고

- WHERE 문에도 함수 들어갈 수 있음
- JOIN등과 결합한 문제 출제 가능
SELECT T1.*
FROM table_1 T1, table_2 T2
WHERE UPPER(T1.col1) LIKE T2.col1 ;


### 🌱  SELECT문 기본 구조 - 숫자형 함수

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/35b972a5_Untitled.png]]

### 🌱  SELECT문 기본 구조 - 날짜형 함수

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/d72ed827_Untitled.png]]

### 🌱  SELECT문 기본 구조 - 명시적 / 암시적 형변환

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/2a3b251b_Untitled.png]]

- 명시적 형변환은 위의 형변환 함수를 사용하여 강제로 data type을 변경하는 것
- 암시적 형변환은 데이터베이스가 알아서 바꿔주는 것
    - ex. 고객번호가 number형으로 되어있고, PK값인 테이블 C_INFO에 대해 아래와 같은 조회가 발생하면 암시적 형변환 발생한다.
    
```sql
SELECT *
FROM C_INFO
WHERE 고객번호 = ‘12345’
```

- [고객번호]는 숫자형 타입이고, PK이므로 인덱스가 됨
    - 인덱스 : 빠른 조회를 돕는 책의 목차와 같은 기능을 함, 데이터는 인덱스 기준 자동정렬됨
    - 인덱스에 대해 암시적 형변환이 발생한 경우, 인덱스를 사용할 수 없다.

#### 문제[7]

---

- 문제[7]
    
    어제 날짜(YYYYMMDD)를 조회하기 위한 다음 SQL문의 빈칸을 채우시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/70f86d14_Untitled.png]]
    
    - 정답
        
```sql
select to_char(sysdate-1,’YYYYMMDD’) from dual;
```

- DUAL
듀얼 테이블은 오라클에 존재하는 기본 테이블로, 하나의 열로만 이뤄져있음. 오늘 날짜를 구하거 간단한 계산을 하는 등에 사용하기 적합함.
- SYSDATE는 SQL을 작업하는 당일의 날짜와 시각을 알려주며, -1을 할 경우 전날의 날짜값이 출력된다.
- 날짜를 조회한다고 하였으니 TO_CHAR을 통해 형변환을 하여 날짜만 남긴다.


### 🌱  SELECT문 기본 구조 - DECODE , CASE WHEN

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/08e1ebc4_Untitled.png]]

#### 문제[8]

---

- [문제8]
    
    아래의 SQL문을 실행했을 때 출력될 표를 기입하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/a9b4b886_Untitled.png]]
    
```sql
SELECT 회원코드 AS C_ID , 연령 AS AGE, 이름 AS NAME
FROM C_INFO
ORDER BY ( CASE WHEN 회원코드 = 101 OR 회원코드 = 104 THEN 1 ELSE 2 END). 연령 DESC ;
```

- 정답


    | C_ID | AGE | NAME |
    | --- | --- | --- |
    | 104 | 24 | paul |
    | 101 | 20 | kate |
    | 103 | 59 | lily |
    | 102 | 40 | max |
    | 105 | 11 | james |
    - ALIAS의 줄임말로, 컬럼명을 변경하여 출력되도록 돕는다.
    - 조회된 테이블을 정렬하는 기능이다.
    - 조회된 테이블을 정렬하는 기능이다. 보통, 모든 테이블 제작 과정이 끝난 후 마지막으로 수행된다.
    (현 쿼리문에서는 FROM > SELECT까지 끝난 후 수행 됨)

```sql
SELECT 회원코드 AS C_ID, 연령 AS AGE, 이름 AS NAME 
FROM C_INFO
ORDER BY
1. (CASE WHEN 회원코드 = 101 OR 회원코드 = 104 THEN 1 ELSE 2 END
2. .연령 DESC
```

<aside>
💡 DESC : 내림차순 ( 큰수 → 작은수)

</aside>


## [SQL 2-2강]

### 🌱  SELECT문 기본 구조 - WHERE 조건문

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/9e9ebd89_Untitled.png]]

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/14113223_Untitled.png]]

#### 문제[1 ~ 3]

---

- 문제[1]
    
    아래와 같이 테이블을 조회하기 위한 SQL문의 빈칸에 알맞은 말은?
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/f0889323_Untitled.png]]
    
    - 정답
        
        like ‘ki%’
        
        ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/8c10613d_Untitled.png]]
        
- 문제[2]
    
    C_INFO 테이블에서 이름에 a가 들어가는 사람들을 대상으로 임시테이블을 만들고 전체를
    조회하는 쿼리를 작성하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/c2eb3353_Untitled.png]]
    
    - 정답
        
```sql
with tableName as (
	select *
	from c_info
	where name like '%a%'
);
```

<aside>
💡 WITH구문은

1. 서브쿼리를 사용해서 임시테이블이나 뷰(view)처럼 사용 가능함
2. 별칭 지정 가능함
3. 인라인뷰나 임시테이블로 판단한다.
</aside>

<aside>
💡 서브쿼리와 인라인뷰
- 서브쿼리 : SELECT 문 내에 SELECT문이 또 쓰여있는 쿼리
- 인라인뷰 : 서브쿼리가 FROM 절 내에 쓰여진 것

SELECT *
FROM ( SELECT * FROM C_INFO WHERE name LIKE ‘%a%’ )

</aside>

- 문제[3]
    
    다음에 기술된 목적으로 사용되는 테이블의 명칭을 적으시오.
    
    1. 사용상의 편의를 위해 사용한다.
    2. 수행속도의 향상을 위해 사용한다.
    3. SQL의 성능을 향상시키기 위해 사용한다.
    4. 임시적인 작업을 위해 사용한다.
    5. 보안관리를 위해 사용한다.
    - 정답
        
        VIEW 테이블
        
        <aside>
        💡 일종의 가상테이블로서 실제 데이터가 하드웨어에 저장되는 것은 아니다.
        실제 데이터를 가지고 있지 않다.
        테이블 구조가 변경되더라도 독립적으로 존재한다.
        
        </aside>
        

### 🌱  SELECT문 기본 구조 - NULL 관련 함수

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/a91d55ae_Untitled.png]]

#### 문제[4 ~ 6]

---

- 문제[4]
    
    C_INFO 테이블에서 생년이 NULL이면 9999를 표시하고자 한다. SQL 문장의 빈칸을 채우시오.
    
```sql
SELECT 고객명, 고객번호, [ ](생년, 9999) AS 정답컬럼
FROM C_INFO ;
```

- 정답

    NVL or ISNULL

    - 표현식 두 개의 데이터 타입이 같아야 함.

- 문제[5]
    
    다음 SQL의 결과값을 기술하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/8ac614cc_Untitled.png]]
    
    - 정답
        
        
        | 성별 | count |
        | --- | --- |
        | F | 2 |
        | M | 2 |
        |  | 1 |
        
        📌 ***NULL을 제외하고 group by 하는 SQL서버일 때, 동일한 결과를 얻기 위해서는?***
        
```sql
SELECT NVL(성별, ‘N’) AS gender, COUNT( 회원코드 ) cnt
FROM C_INFO
GROUP BY
```

```sql
SELECT NVL(성별, ‘N’) AS gender, COUNT( 회원코드 ) cnt
FROM C_INFO
GROUP BY NVL(성별, ‘N’)                     [GROUP BY 내 Alias 불가]
```

- 문제[6]
    
    다음 SQL의 결과값을 기술하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/37ac2e3c_Untitled.png]]
    
    - 정답
        
        
        | 성별 | 연령대 | count(회원코드) |
        | --- | --- | --- |
        | F | 20대 | 2 |
        | M | 30대 | 1 |
        | M | 40대 | 1 |
        | F | 10대 | 1 |
        

### 🌱  SELECT문 기본 구조 - 집계함수

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/b3777ebc_Untitled.png]]

*📌 참고*

- NULL값에 대한 연산의 결과는 모두 NULL이며 통계적 집계함수를 연산할때 NULL은 제외하고 계산한다.
(ex. NULL / 10 = NULL )

#### 문제[7 ~ 8]

---

- 문제[7]
    
    C_INFO에서 평균 연령이 30대인 성별과 해당 성별의 평균 연령을 출력하는 SQL을 작성하시오.
    
    ![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/6b7315c2_Untitled.png]]
    
    - 정답
        
        
        | 성별 | AVG(연령) |
        | --- | --- |
        | M | 32 |
        
        ***point. 문제를 쪼개어 생각해야 함***
        
        1.성별 별로 평균 연령을 구해야함.
        
        2. 조건에 맞는 평균연령( AVG(연령) ) 레코드만 출력해야함
        
```sql
SELECT 성별, AVG(연령)
FROM C_INFO 
GROUP BY 성별
```

```sql
SELECT 성별, AVG(연령)
FROM C_INFO 
GROUP BY 성별
HAVING AVG(연령) >= 30 AND AVG(연령) < 40
```

- 문제[8]
    
    아래의 SQL 문장에 대해서 실행 순서를 나열하시오.
    
```sql
SELECT 지역명 as area, count(c_id) 
FROM C_INFO
WHERE age BETWEEN 20 and 39
GROUP BY 지역명
HAVING count(c_id) <= 10
ORDER BY 1 ;
```

- 정답

    SELECT ALIAS > FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY

```sql
[6] SELECT [4] 지역명 [1] as area, count(c_id) 
[2] FROM C_INFO
[3] WHERE age BETWEEN 20 and 39
[4] GROUP BY 지역명
[5] HAVING count(c_id) <= 10
[7] ORDER BY 1 ;
```


### 🌱  SELECT문 기본 구조 - 조회되는 행 수를 제한할 때

📌 **테이블의 한 행만 조회하고 싶다!**

```sql
SELECT 컬럼명 등
FROM 테이블명
WHERE 조건문
ORDER BY 컬럼명
```

```sql
ORACLE 기준 >
SELECT *
FROM C_INFO
WHERE ROWNUM = 1 ;
```

ROWNUM : 오라클에서 조회 된 행이 몇 번째 행인지 부여해주는 것

- SQL Server or MySQL

```sql
SQL Server에서는
SELECT TOP(1) FROM C_INFO ;
MySQL에서는
SELECT * FROM C_INFO LIMIT 1 ;
```

#### 문제[9]

---

- 정답
    
    다음 중 ROWID에 대한 설명으로 틀린 것을 고르시오.
    
    1. 해당 데이터가 어떤 데이터 파일 상에서 어느 블록에 저장되었는지 알려준다.
    2. 데이터베이스에 저장되어 있는 데이터를 구분할 수 있는 값 중 하나이다.
    3. ROWID의 번호는 데이터 블록에 데이터가 저장된 순서이다.
    4. 테이블에 데이터를 입력하면 자동으로 생성된다.
    - 정답
        
        2
        
        - 데이터베이스에 저장되어 있는 데이터를 구분할 수 있는 유일한 값이다.
        

## [SQL 3 - 1강]

### 🌱  DML - ELECT문 기본 구조

***📌GROUP BY 영역에 추가로 들어갈 수 있는 부분***

#### 문제 출제  100% : GROUP 함수들

```sql
SELECT 성별, 연령대, count(회원코드)
FROM C_INFO
GROUP BY 성별 , 연령대 ;
```

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/f85ad851_Untitled.png]]

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/e4ca79dd_Untitled.png]]

- ROLLUP
    - 부분합계와 전체합계값을 보여준다.
    - 인수의 순서에 영향을 받는다.

```sql
SELECT 성별, 연령, SUM(결제금액)
FROM 결제
GROUP BY ROLLUP( 성별, 연령대 )
ORDER BY 성별, 연령 ;
```

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/029bd97d_Untitled.png]]

```sql
select 성별, 연령, SUM(결제금액)
from 결제
group by rollup(성별, 연령대)
order by 성별, 연령;
```

- CUBE

```sql
SELECT 성별, 연령, SUM(결제금액)
FROM 결제
GROUP BY CUBE ( 성별, 연령대 ) ;
```

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/3b18da45_Untitled.png]]

| GROUP BY 성별, 연령 | 1. 성별X연령 별 합계 |
| --- | --- |
| GROUP BY ROLLUP(성별, 연령) | 1. 성별X연령 별 합계
2. 성별 별 합계
3. 전체합계 |
| GROUP BY CUBE(성별, 연령) | 1. 성별X연령 별 합계
2. 성별 별 합계
3. 연령 별 합계
4. 전체합계
* 그룹화될 수 있는 모든 경우에 대해 생성 |

- GROUPING SETS

| GROUP BY 성별, 연령 | 1. 성별X연령 별 합계 |
| --- | --- |
| GROUP BY ROLLUP(성별, 연령) | 1. 성별X연령 별 합계
2. 성별 별 합계
3. 전체합계 |
| GROUP BY CUBE(성별, 연령) | 1. 성별X연령 별 합계
2. 성별 별 합계
3. 연령 별 합계
4. 전체합계
* 그룹화될 수 있는 모든 경우에 대해 생성 |
| GROUP BY
GROUPING SETS(성별, 연령) | 1. 성별 별 합계
2. 연령 별 합계
* 괄호 묶은 집합별 집계 가능 |

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/524a0f75_Untitled.png]]

```sql
SELECT 성별, 연령, SUM(결제금액)
FROM 결제
GROUP BY GROUPING SETS ( 성별, 연령대 ) ;
```

![[02 - 학습/IT/개발 메모/SQLD 정리/첨부/451000c4_Untitled.png]]

```sql
SELECT 성별, 연령, SUM(결제금액)
FROM 결제
GROUP BY GROUPING SETS ( ( 성별, 연령대 ), 거주지) ;
```

## 하위 노트

- [[02 - 학습/IT/개발 메모/SQLD 정리/SQLD 문제풀이|SQLD 문제풀이]]

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
