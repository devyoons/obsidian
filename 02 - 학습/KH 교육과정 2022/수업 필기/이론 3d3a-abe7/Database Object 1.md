---
별칭:
  - "강의 - Database Object 1"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/fb47189b957749ab8e76c884b049b995
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: Database Object 1

## 강의 내용

---

---

- **database object2** : pl/sql
- alt + ‘ : 드래그 하고 사용하면 대문자 , 소문자로 변경해줌

## 데이터 사전 (data dictionary)

- db를 효율적으로 관리하기 위해 다양한 객체의 정보를 가지고 있는 시스템 테이블
- 모두 read- only이므로, 직접 추가/수정/삭제 작업은 일절 할 수 없다.
- 객체정보가 변경되면, 자동으로 DD에 반영된다.

## 데이터 사전(dictionary view)

- 오라클은 데이터 딕셔너리의 내용을 사용자가 이해할 수 있는 내용으로 변환하여 제공
- 데이터 딕셔너리 뷰는 접두어 따라 다음의 세종류가 있음
- XXX에는 자기 소유의 객체가 복수 형태로 들어감 (ex.user_tables)

### DD의 종류

| 일반사용자용 | USER_XXXS | 사용자 소유의 객체 등에 관한 정보 조회 |
| --- | --- | --- |
| 일반사용자용
(부여받은객체포함) | ALL_XXXS | 사용자 소유의 객체포함, 사용권한 부여받은 객체 정보 조회 |
| 관리자용 | DBA_XXXS | 관리자만 접근가능하며 모든 Database Object를 조회 |

#### DD조회

```sql
select * from dictionary;
select * from dict;
```

### USER_XXX : 내가 소유한  ~

```sql
select * from user_tables; -- 내가 소유한 table조회
select * from user_sys_privs; -- 내가 가진 권한 조회
select * from user_role_privs; -- 내가 가진 롤(권한묶음) 조회
select * from user_role_sys_privs; -- 내가 가진 롤(권한묶음)에 포함된 권한 조회

select * from user_constraints; -- 제약조건
select * from user_sequences; -- 시퀀스
select * from user_indexes; -- 인덱스
select * from user_views; -- 뷰
```

### ALL_XXX : 소유하거나 사용권한을 부여받은 모든 객체 조회

```sql
select * from all_tables; -- user가 접근 가능한 모든 테이블
select * from all_tab_comments; -- 테이블 코멘트 (테이블이름, 타입, 코멘트)
select * from all_col_comments; -- 테이블 코멘트 (테이블이름, 컬럼명, 코멘트)
select * from all_user; -- 모든 유저 정보
select * from constraint -- 모든 테이블 제약조건
select * from all_views -- 모든 뷰 조회
select * from sequences -- 모든 시퀀스 조회
```

### DBA_XXX : 관리자만 접근이 가능한 객체 정보 조회

- 관리자는 모든 테이블, 모든 사용자에 대한 조회가 가능하다.
- 관리자계정으로 접속

```sql
select * from dba_tables where owner = 'KH';

select * from kh.employee;

select * from dba_sys_privs where grantee = 'KH';
select * from dba_role_privs where grantee = 'KH';
select * from dba_tab_privs where owner = 'KH'; -- 테이블에 대한 권한 관리
-- grant select on kh.tb_coffee to qwerty;
```

## STORED VIEW

<aside>
❓ **inline view와 다른 점을 알고 있어야함.**

</aside>

- view는 저장된 select문 → 데이터 논리적 부분집합 (물리적으로 존재하지 않는 테이블)
    - ex) 창문을 통해서 데이터를 바라보는 것. 가공된 데이터를 사용자에게 보여주지 않아도 될 정보는 빼고 필요한 정보만 제공→  보안적인 측면 강화, 쿼리단순화로 가독성을 높여준다.
- 하나이상의 테이블로부터 원하는 데이터를 선별적으로 제공하는 가상테이블
- 실제데이터를 소유하지 않고, 실제테이블에 대한 통로역할
- 이 객체에는 inline view 쿼리를 가지고 있다. 쿼리 실행시 해당 inline view를 처리함

### view 생성

```sql
create [or replace][force|noforce] view 뷰명 as (select문)
[with check option[constraint 제약조건명]]
[with read only[constraint 제약조건명]]

or replace : 뷰가 존재하면 다시 생성, 뷰의 권한은 유지됨

froce | no froce(default) : 
force 뷰생성할때 쿼리 컴파일하지 않고 만듬 
no force 뷰 생성할 때 컴파일진행(기본값)

with check option : DML작업이 뷰 영역에만 적용되도록 할 수 있음 
                    즉, 한번 생성된 뷰에서 데이터의 변경이 없도록 뷰단에서 crud가 불가함

with read only : DML작업을 못하게 하는 옵션
```

> **수업예제코드**
> 

```sql
-- 1. 관리자계정으로 접속해서 권한부여를 해준 뒤
select * from user_views;
-- (관리자계정) create view권한을 kh에 부여
grant create view to kh;

-- 2. 생성하기 
-- create view 권한은 resoure롤에 포함되지 않으므로 새로 부여해야 함.
create view view_emp
as
select * from employee;
```

> **view 권한부여**
> 

```sql
select * from user_views;
-- (관리자계정) create view권한을 kh에 부여
grant create view to kh;

-- create view 권한은 resoure롤에 포함되지 않으므로 새로 부여해야 함.
-- or replace 없으면 생성, 있으면 갱신 (덮어쓴다는 말)
create or replace view view_emp
as
select emp_id, emp_name, email, phone from employee;

select * from view_emp;
-- > select * from (select emp_id, emp_name, email, phone from employee); 

-- qwerty에게 view_emp조회권한 부여
grant select on view_emp to qwerty;

--> sqlplus 에서 조회하는 방법
qwerty 로 접속
select * from kh.view_emp;
-------------------------------------------------
-- 1. 타사용자에게 선별적으로 데이터 제공
-- qwerty에게 view_emp 조회권한 부여
grant select on view_emp to qwerty;
```

### view 삭제

- drop 명령어를 통해 삭제

```sql
drop view view_emp;
```

### view 수정

- view 객체는 alter명령이 없다.
- drop이후 다시 생성해서 다시 만들 수 있지만 view는 생성시 **or replace옵션을 추가하여 새로 변경하여 생성하는 것을 권장함**
    - 이유 : drop을 하게 되면 oracle객체가 사라지니 권한까지 삭제됨 **or replace로 새로 생성하면 권한 그대로 남아 있고 해당 select문만 변경됨.**

#### 코드예제 employee 테이블 자주쓰는 view테이블 만들기

```sql
-- 2. 가상컬럼, relation에 대한 조회를 손쉽게 할 수 있다.
-- 사번, 사원명, 성별, 나이, 직급명, 부서명 조회
create or replace view view_emp_read
as
select 
    emp_id,
    emp_name,
    decode(substr(emp_no, 8, 1), '1', '남', '3', '남', '여') gender,
    extract(year from sysdate) - (decode(substr(emp_no, 8, 1), '1', 1900, '2', 1900, 2000) + substr(emp_no, 1, 2)) + 1 age,
    (select job_name from job where job_code = e.job_code) job_name,
    (select dept_title from department where dept_id = e.dept_code) dept_title
from
    employee e;

select * from view_emp_read where gender = '여';
```

## SEQUENCE : 정수값을 순차적으로 발행하는 객체(채번기)

- 시퀀스란 자동으로 순차적으로 증가하는 순번을 반환하는 데이터베이스 객체
- PK값을 정수로 관리하는 경우 sequence발급한 번호를 사용한다.

```sql
		create sequence 시퀀스명        
    [start with 시작값]             -- 기본값1
    [increment by 증감값]           -- 기본값1
    [maxvalue 최대값 | nomaxvalue]  -- nomaxvalue
    [minvalue 최소값 | nominvalue]  -- nominvalue
    [cycle | nocycle]               -- nocycle (최대/최소값 도달시 순환여부) 
    [cache 수량 | nocache]          -- 20 
																		--CACHE 설정시 메모리에 시퀀스 값을 미리 할당하고 
																		--NOCACHE 설정시 시퀀스값을 메로리에 할당하지 않음
--currval
--nextval
```

```sql
<시퀀스 객체 생성하기>
create sequence seq_tb_advice_no; -- 시퀀스객체생성
								시퀀스_어디에 사용될
```

### ▼ **sequence 생성**

```sql
--문법
CREATE SEQUENCE [시퀀스명]
INCREMENT BY [증감숫자] --증감숫자가 양수면 증가 음수면 감소 디폴트는 1
START WITH [시작숫자] -- 시작숫자의 디폴트값은 증가일때 MINVALUE 감소일때 MAXVALUE
NOMINVALUE OR MINVALUE [최솟값] -- NOMINVALUE : 디폴트값 설정, 증가일때 1, 감소일때 -1028 
                               -- MINVALUE : 최소값 설정, 시작숫자와 작거나 같아야하고 MAXVALUE보다 작아야함
NOMAXVALUE OR MAXVALUE [최대값] -- NOMAXVALUE : 디폴트값 설정, 증가일때 1027, 감소일때 -1
                               -- MAXVALUE : 최대값 설정, 시작숫자와 같거나 커야하고 MINVALUE보다 커야함
CYCLE OR NOCYCLE --CYCLE 설정시 최대값에 도달하면 최소값부터 다시 시작 NOCYCLE 설정시 최대값 생성 시 시퀀스 생성중지
CACHE OR NOCACHE --CACHE 설정시 메모리에 시퀀스 값을 미리 할당하고 NOCACHE 설정시 시퀀스값을 메로리에 할당하지 않음
-----------------------------------------------
create table tb_advice --시퀀스이름 tb_advice
increment by 1 --증감숫자 1
start with 1 --시작숫자 1
minvalue 1 --최소값 1
maxvalue 1000 --최대값 1000
nocycle --순한하지않음
cache;
```

```sql
<테이블 생성>
create table tb_advice (
    no number primary key,
    user_id varchar2(20) not null,
    reg_date date default sysdate
); 

<시퀀스 객체 생성>
create sequence seq_tb_advice_no;

<값 넣기>
insert into tb_advice(no, user_id) values (seq_tb_advice_no.nextval, 'honggd');
insert into tb_advice(no, user_id) values (seq_tb_advice_no.nextval, 'sinsa');
insert into tb_advice(no, user_id) values (seq_tb_advice_no.nextval, 'sejong');

select * from tb_advice;

```

### ▼ **sequence 조회**

```sql
<현재 시퀀스 상태조회 (마지막 발급번호)>
select seq_tb_advice_no.currval from dual;

<시퀀스 정보 조회>
select * from user_sequences;
```

### ▼ **sequence 수정**

- 시퀀스는 DDL문이므로 ALTER문으로 수정가능
- 다만, 시작값은 수정이 불가능함
- 현재 들어있는 값보다 높은 최소값

```sql
<increment by 옵션 수정해보기 -> 다음 시작번호 10단위로 부여>
-- 메모리상 20을 이미 사용했기 때문에 30,40 순으로 발급될 예정
-- 시퀀스 객체의 start with값은 수정이 불가함. 삭제후 다시 생성해야함.
alter sequence seq_tb_advice_no increment by 10;
```

### ▼ **sequence 삭제**

```sql
drop sequence [시퀀스명]
drop sequence seq_tb_advice_no
```

## INDEX

- 색인.SQL명령의 처리속도를 향상을 위해 TABLE의 컬럼에 대해 생성하는 색인 객체.
- key-value형태로 저장. key(컬럼값), value(행이 저장된 주소값)을 보관.

**장점**

1. 검색속도가 빨라지고, 시스템부하가 줄어든다.
2. 전체적인 성능향상

**단점**

1. 인덱스를 위한 추가 저장공간이 필요
2. 인덱스 생성/수정/삭제시 별도의 작업시간이 소요.
3. 데이터 생성/수정/삭제가 빈번하다면 인덱스로 인해 성능저하도 야기됨.

**어떤 컬럼에 대해 인덱스를 만들어야 하는가?**

1. 선택도(selectivity)가 좋은 컬럼을 인덱스로 만든다.
2. 선택도란? 고유한 값을 많이 가지는 것.
    
```sql
employee.emp_id 중복X      -> 선택도가 아주 좋다.
employee.emp_no 중복X      -> 선택도가 아주 좋다.
employee.emp_name 중복O    -> 선택도가 좋다.
employee.dept_code 중복O   -> 선택도 보통.
employee.gender            -> 선택도 나쁨
```

3. where절에서 자주 조회되는 컬럼
4. join조건 컬럼을 선택
5. 한번 입력된 데이터가 변경이 자주 없는 컬럼
6. 큰 테이블에서 적은 데이터가 필요할 때

**`중복값 많은 컬럼, null값이 많은 컬럼은 되도록 사용하지말 것.(비교가 안되기 때문)`**

#### index 조회

- pk, uq제약조건이 걸린 컬럼은 자동으로 인덱스를 생성한다.
    - pk, uq제약조건의 선택도는 아주 좋다. → pk, uq는 중복값을 허용하지 않음
- 제약조건명을 잘 지으면(테이블명, 컬럼명 포함)인덱스정보 확인시 유용하다.

```sql
select * from user_indexes;
select * from user_ind_columns; 
-- 컬럼명이 없어서 조인하는건데 제약조건이름을 잘지어놓고 하나로 조회하는걸 추천

-- 인덱스 조회
-- pk,uq로 생성된 인덱스는 제약조건명과 인덱스명이 같다. 
-- 제약조건명을 잘 지으면(테이블명, 컬럼명 포함)인덱스정보 확인시 유용하다.
select * from user_constraints where constraint_type in('P','U');
-- P랑 U가 pk,uq -> 자동으로 인덱스 만들어놓은 제약조건
select
    *
from 
    user_indexes ui join user_ind_columns uic
        using(index_name);
```

#### 실행계획(F10) 확인

- index없는 컬럼

```sql
select * from employee where job_code = 'J2'; --job_code 인덱스 없음

코드 위에서 f10 하면 계획설명 나옴
```

![**아래에서 위로 최종결과
OPTIONS → table full scan
CARDINALITY → 레코드(행)의 수
COST → 비용 (비용은 리턴된 행의 수와 관련 없음)**
](../../../../attachments/473ec638-4fb2-4ea0-8d98-227e5f985c21/Untitled.png)

**아래에서 위로 최종결과
OPTIONS → table full scan
CARDINALITY → 레코드(행)의 수
COST → 비용 (비용은 리턴된 행의 수와 관련 없음)**

- index있는 컬럼

```sql
select * from employee where emp_id = '203'; --emp_id 인덱스 있음
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b79b86f9_Untitled.png]]

**UNIQUE SCAN → 중복값이 없는 인덱스**

### 인덱스 생성

```sql
CREATE INDEX [인덱스명] ON [테이블명](컬럼1, 컬럼2, 컬럼3.......)
create index idx_employee_emp_name on employee(emp_name);
```

### 인덱스 사용시 주의사항

- 인덱스 사용여부는 optimizer(최적화처리기)가 결정을 하지만, 다음 경우는 index를 사용하지 않는다.
1. **인덱스 컬럼을 변형해 조회하는 경우** 
    1. ex) where substr(emp_no, 8, 1) = '1’ → full scan 처리 됨.
2. **null 비교하는 경우** 
    1. ex) where emp_name is null
3. **not비교하는 경우 (부정연산자 사용하는 경우)**
    1. ex) where emp_name != '송종기’
4. **인덱스컬럼과 자료형이 다른 경우** 
    1. ex)where emp_id = 201 내부적으로 형변환을 하기 때문에 인덱스사용X
    **`컬럼의 자료형이 문자로 되어있기 때문에 숫자로 찾게되면 내부적으로 형변환이 일어남`**

```sql
select * from employee where substr (emp_no, 8, 1) = '1';
select * from employee where emp_id = 201;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/4c2211bb_Untitled.png]]

### index 삭제

- pk, uq제약조건으로 생성된 인덱스는 직접 삭제가 불가하다. 제약조건을 제거하면, 자동으로 삭제처리된다.

```sql
DROP INDEX [인덱스명]

--pk,uk제약조건을 제거해야 자동생성된 인덱스 삭제처리됨.
--제약조건삭제
ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건이름];
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
