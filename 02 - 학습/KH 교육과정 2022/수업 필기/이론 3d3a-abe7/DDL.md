---
별칭:
  - "강의 - DDL"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/c1821ce86bd546e4bd74aa44d2761f45
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: DDL

## 강의 내용

---

---

## DDL / DML 혼용 주의점

```sql
commit;

create table tb_test(  -- rollback하면 테이블생성만 된 상태까지 롤백됨. 마지막 커밋
    id varchar2(20)
);

insert into tb_test values('honggd');
insert into tb_test values('sinsa');

select * from tb_test;
rollback;
```

```sql
create table tb_test(  
    id varchar2(20)
);

insert into tb_test values('honggd');
insert into tb_test values('sinsa');
-- 커밋안한상태

-- 중간에 끼어든 DDL작업
-- commit실행시, 이전 작업내용 포함
create table tb_test2(   -- 여기에서 커밋이 됨.
    id varchar2(20)
);
```

## DDL

- Date Definition Language 데이터정의어
- database객체를 생성/수정/삭제하는 명령어 (유저도객체, 테이블도 객체)
- create / alter / drop
- 자동커밋되므로 DML과 혼용시 주의해야 한다.

```sql
DB의 객체 조회

select
    object_type
from
    all_objects; --Data Dictionary 객체의 메타정보를 관리하는 테이블

/*
    오라클 database객체 종류
    - table
    - user
    - view
    - sequence
    - index
    - package
    - procedure
    - function
    - trigger
    - synonym
    - job scheduler
    ...
*/

```

```sql
-- 객체 삭제
-- sql작성시에도 항상 주석해둘 것!
-- drop table tb_user_before;

-- 자식테이블이 참조하는 부모테이블을 삭제
select * from shop_member;
select * from shop_buy;
-- truncate table shop_member;
-- delete from shop_member where member_id = '1';
insert into shop_member values('honggd','홍길동');
insert into shop_buy values('123','honggd','농구화');

--drop table shop_member; -- ORA-02449: 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
--drop table shop_member cascade constraint; 
-- 제약조건을 날리므로 자식테이블에 데이터는 그대로있고 부모테이블 참조하던게 날라간 것.

select
    constraint_name,
    uc.table_name,
    ucc.column_name,
    uc.constraint_type,
    uc.search_condition
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'SHOP_BUY';
```

### CREATE

- 주석
- 테이블 생성시, 테이블에 대해, 컬럼에 대해 주석을 작성할 수 있다.

```sql
-- 테이블 주석 확인
select
    *
from
    user_tab_comments
where
    table_name = 'EX_EMPLOYEE';

--컬럼 주석 확인
select
    *
from
    user_col_comments
where
    table_name = 'EX_EMPLOYEE';

-- 테이블 / 컬럼 주석
-- 수정메소드가 따로 없기 때문에 덮어쓰면된다.
comment on table ex_employee is '사원관리 연습테이블';
comment on table ex_employee is ''; --db ''빈문자열은 null과 같다.

comment on column ex_employee.emp_id is '사번';
comment on column ex_employee.emp_name is '사원명';
comment on column ex_employee.emp_no is '주민번호';
```

## 제약조건 constraint

- 각 컬럼에 대해 데이터 제약을 설정할 수 있다.
- 하나의 레코드(행)에서 하나의 컬럼이라도 제약조건을 위반하면 레코드 자체가 insert되지 않는다.
- 데이터 무결성을 지키기 위해 필수적이다.
- (데이터의 정확성, 일관성을 지켜내는 것)

#### 제약조건 종류

1. **not null (C)**: **null을 허용하지 않음.** 필수 컬럼에 지정 **(C)** 컬럼레벨에만 사용
2. **unique (U)**: 다른 레코드와 **중복값을 허용하지 않음.** **null허용**(ex. 중복ID) **(UQ)**
3. **primary key (p)**: 식별자컬럼. 기본키 
    1. 다른 레코드와 **중복값을 허용하지 않고, null도 허용하지 않음.**
    2. 테이블당 **하나만 지정 가능** (not null이나 unique 같은 경우는 다른 레코드에 중복제한 여러개 허용)
        1. 식별자컬럼 : 다른 행과 구분할 수 있는 하나의 값
            1. 자연키
            2. 대리키 
4. **foreign key (R)**: 외래키.**부모테이블에 있는 값만 참조할 수 있다.(참조무결성을 지키는 장점)**
    1. department.dept_id => employee.dept_code **(FK)**
5. **check(C)** : 지정한 도메인의 값만 사용할 수 있다. **(CK)**
    1. domain  : 하나의 속성(컬럼)이 가질수 있는 원자값들의 집합(ex. 남/여, 1/0)
    2. **도메인의 범위를 지정함.**

<aside>
❓ CONSTRAINT_TYPE C는 not null 또는 check제약조건을 의미하므로 search_condition컬럼을 확인할 것

</aside>

```sql
-- 제약조건 조회
select
    *
from
    user_constraints
where
    table_name = 'EMPLOYEE';

select
    *
from
    user_cons_columns
where
    table_name = 'EMPLOYEE';
```

#### 자주 사용되는 제약조건 조회쿼리

```sql
select
    *
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'EMPLOYEE';

--- 자주 사용하는 것만 뽑아내면
select
    constraint_name,
    uc.table_name,
    ucc.column_name,
    uc.constraint_type,
    uc.search_condition
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'EMPLOYEE';
```

### 제약조건 작성방법

1. 컬럼레벨 nn, pk, uq, fk, ck
2. 테이블레벨 pk, uq, fk, ck

#### 제약조건 추가

```sql
ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건이름] [제약조건] (컬럼명)

-- 테이블 생성시 제약조건 추가 예시
alter table ex_employee
add constraint pk_ex_employee primary key(emp_id) --emp_id 기본키지정(식별자컬럼)
modify quit_yn default 'N'                        -- 기본값 지정
modify hire_date default sysdate;                 -- 기본값 지정

-- 기존테이블 제약조건 추가 예시
alter table ex_employee 
add constraint pk_ex_employee primary key(emp_id);
```

```sql
-- 제약조건 테스트용 테이블
create table tb_member(
    id varchar2(20),
    name varchar2(50) not null,
    password varchar2(20) not null,
    email varchar2(50) constraint uq_tb_member_email unique, -- unique 제약조건작성
    gender char(1),
    reg_date date
    ------------------------table level
);

-- unuque제약조건
-- 각 레코드별로 고유한 값을 사용해야한다.

insert into
    tb_member
values(
    'honggd','홍길동','1234','gd@gmail.com','M',sysdate
);

------------중복된 이메일을 넣는다면?
insert into
    tb_member
values(
    'gogd','고길동','1234','gd@gmail.com','M',sysdate
); 
--ORA-00001: 무결성 제약 조건(KH.UQ_TB_MEMBER_EMAIL)에 위배됩니다

------------null 값으로 처리하면?
insert into
    tb_member
values(
    'gogd','고길동','1234',null,'M',sysdate
); 
-- 1 행 이(가) 삽입되었습니다.
```

#### 제약조건 삭제

```sql
ALTER TABLE [테이블명] DROP CONSTRAINT [제약조건이름];

--예시
alter table ex_employee drop constraint pk_ex_employee;
```

#### unique 제약조건

```sql
-- 여러컬럼을 포함하는 unique제약조건 생성가능
create table abc(
    a varchar2(10) not null,
    b varchar2(20) not null,
    constraint uq_abc_ab unique (a,b)
);
-- drop table abc;
insert into
    abc
values(
    '안녕','잘가'
);

insert into
    abc
values(
    '안녕','잘자'
);

insert into
    abc
values(
    '안녕',null
);
--ORA-01400: NULL을 ("KH"."ABC"."B") 안에 삽입할 수 없습니다

select * from abc;
```

#### PRIMARY KEY 제약조건

- 식별자 컬럼
- 다른 레코드와 구분할 수 있는 식별자. 테이블당 하나만 허용한다.
- RDBMS에서 테이블간 참조를 위한 컬럼으로 주로 사용된다.

```sql
-- 제약조건 테스트용 테이블
-- drop table tb_member;

create table tb_member( 
    id varchar2(20),
    name varchar2(50) not null,
    password varchar2(20) not null,
    email varchar2(50),
    gender char(1),
    reg_date date,
    ------------------------table level
    -- not null을 제외하고 테이블레벨에 사용함. (가독성때문)
    constraint pk_tb_member primary key(id),
    constraint uq_tb_member_email unique(email)
);

insert into tb_member values('honggd','홍길동','1234',null,null,sysdate);
insert into tb_member values('honggd','홍길동','1234',null,null,sysdate); 
--ORA-00001: 무결성 제약 조건(KH.PK_TB_MEMBER)에 위배됩니다
insert into tb_member values( null,'홍길동','1234',null,null,sysdate); 
--ORA-01400: NULL을 ("KH"."TB_MEMBER"."ID") 안에 삽입할 수 없습니다
--primary key는 null을 허용하지 않음
```

```sql
-- 확인용
select
    constraint_name,
    uc.table_name,
    ucc.column_name,
    uc.constraint_type,
    uc.search_condition
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'TB_ORDER_COMPOSITE';
```

#### PK 식별관계 / 비식별관계

- fk컬럼을 다시 pk로 사용하면 식별관계, pk로 사용하지 않으면 비식별관계
- 식별관계인 경우 0,1 개행이 존재할 수 있다.
- 비식별관계인 경우 0 ~ n개행이 존재할 수 있다.

```sql
-- fk를 사용하면서 pk로 사용하는 식별관계
create table tb_person (
    id varchar2(20) primary key
);

-- 부모
insert into tb_person values('sinsa');
select * from tb_person;
-- 자식
create table tb_person_address (
    person_id varchar2(20)
    , addr varchar2(500)
    , constraint fk_tb_person_address foreign key (person_id) references tb_person(id)
    , constraint pk_tb_person_address primary key (person_id)
);

insert into tb_person_address values('sinsa','서울시 강남구 역삼동');
insert into tb_person_address values('sinsa','서울시 강동구 신내동');
--ORA-00001: 무결성 제약 조건(KH.PK_TB_PERSON_ADDRESS)에 위배됩니다
select * from tb_person_address;
```

- ex) employee.dept_code 와 department.dept_id 는 비식별관계이다
    - 중복사용함

#### CHECK 제약조건

- 컬럼값의 범위를 한정하는 제약조건

```sql
create table tb_member( 
    id varchar2(20),
    name varchar2(50) not null,
    password varchar2(20) not null,
    email varchar2(50),
    gender char(1),
    point number,
    reg_date date,
    ------------------------table level
    -- not null을 제외하고 테이블레벨에 사용함. (가독성때문)
    constraint pk_tb_member_id primary key(id),
    constraint uq_tb_member_email unique(email),
    constraint ck_tb_member_gender check(gender in('M','F')),-- 소문자는 허용 안하는것
    constraint ck_tb_member_point check(point >= 0) -- 음수는 못들어옴
);

insert into tb_member values ('honggd','홍길동','1234',null,'M',-10,default);
--ORA-02290: 체크 제약조건(KH.CK_TB_MEMBER_POINT)이 위배되었습니다
insert into tb_member values ('honggd','홍길동','1234',null,'m',-10,default);
--ORA-02290: 체크 제약조건(KH.CK_TB_MEMBER_POINT)이 위배되었습니다
insert into tb_member values ('honggd','홍길동','1234',null,'M',-10,default);
--ORA-02290: 체크 제약조건(KH.CK_TB_MEMBER_POINT)이 위배되었습니다

update tb_member set point = point -1000 where id = 'honggd';
```

#### FOREIGN 제약조건

- 참조무결성을 유지하기 위한 제약조건
- 부모테이블(참조하는 테이블)에서 제공하는 값만 사용할 수 있게 제한을 거는 것.
- null을 기본적으로 허용함. 허용하지 않으려면 not null사용
- 참조하는 부모테이블 컬럼은 pk또는 uq제약조건이 걸려있어야한다.
    - 고유하게 만들어놓고 참조하는 것
- 자식테이블에서 FK제약조건이 부모테이블 pk ,uq 참조하는것

```sql
-- 회원테이블
create table shop_member(
    member_id varchar2(20),
    member_name varchar2(30),
    constraint pk_shop_member_id primary key(member_id)
);

insert into shop_member values ('honggd','홍길동');
insert into shop_member values ('sinsa','신사임당');

select * from shop_member;

-- 구매테이블
create table shop_buy (
    buy_no number,
    member_id varchar2(20),
    product_name varchar2(30),
    constraint pk_shop_buy_no primary key(buy_no),
    constraint fk_shop_buy_member_id foreign key (member_id) references shop_member(member_id)
);

insert into shop_buy values (1,'hongggggd','축구화'); --ORA-02291: 무결성 제약조건(KH.FK_SHOP_BUY_MEMBER_ID)이 위배되었습니다- 부모 키가 없습니다
insert into shop_buy values (1,'honggd','축구화');
insert into shop_buy values (2,'sinsa','볼링화');

select * from shop_buy;
```

<aside>
❓ **부모테이블의 데이터를 삭제하려면? 못지움**

</aside>

```sql
delete from shop_member where member_id = 'honggd'; 
--ORA-02292: 무결성 제약조건(KH.FK_SHOP_BUY_MEMBER_ID)이 위배되었습니다
- 자식 레코드가 발견되었습니다
```

#### 외래키 삭제옵션

- 부모테이블의 데이터를 삭제할 경우, 처리방식을 결정
    - **on delete restricted** (기본값)
    - **on delete set null** - 부모데이터 삭제시 자식 fk컬럼값을 null로 처리
    - **on delete cascade** - 부모데이터 삭제시 참조하는 자식 레코드를 따라서 삭제 (연쇄적으로일어나는)

## ALTER

- 객체를 수정하는 명령어
- table에 대해서 수정가능한 것은 컬럼/제약조건
- table의 이름수정도 가능

### 서브명령어 (alter add ~~ )

- **add** : 컬럼/제약조건 추가 (not null도가능)
- **modify** : 컬럼수정(자료형/default값, not null여부)
- **rename** : 컬럼/제약조건 이름변경
- **drop** : 컬럼/제약조건 삭제
- 제약조건은 수정할 수 없다

```sql
예시 테이블 생성
create table tb_user (
    no number primary key
    , id varchar2(20)
    , pw varchar2(20)
);

desc tb_user;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/bbe81b2c_Untitled.png]]

#### add :  컬럼/제약조건을 추가

```sql
-- 새로운 컬럼 추가
alter table
    tb_user
add
    name varchar2(50);
--
alter table
    tb_user
add
    age number default 0;
--
desc tb_user;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/165fce24_Untitled.png]]

```sql
-- 제약조건 uq
alter table
    tb_user
add
    constraint uq_tb_user_id unique(id);

select
    constraint_name,
    uc.table_name,
    ucc.column_name,
    uc.constraint_type,
    uc.search_condition
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'TB_USER';
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/ee784727_Untitled.png]]

#### MODIFY : 컬럼에 대해서만 수정이 가능

- not null은 수정이 가능
- **null 작성시 not null 해제 (제약조건 not null 위에 덮어쓰면 수정됨.)**

```sql
alter table
    tb_user
modify name varchar2(100) not null;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b97d4c9f_Untitled.png]]

<aside>
❓ **데이터가 있는 상황에서 자료형의 크기를 기존값 크기보다 적게 수정할 수 없다.
오류 보고 -ORA-01441: 일부 값이 너무 커서 열 길이를 줄일 수 없음**

</aside>

```sql
insert into tb_user values (1, 'honggd','1234','홍길동길동길동길동',33);
commit;
select * from tb_user;
modify name varchar2(20); 
--오류 보고 - ORA-01441: 일부 값이 너무 커서 열 길이를 줄일 수 없음
```

#### RENAME : 컬럼명/제약조건명 수정

```sql
alter table
    tb_user
rename
    column pw to password;
    
desc tb_user;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/be2b0d75_Untitled.png]]

```sql
<제약조건명 변경하기>
1. 우선 먼저 constraint_name 타입 P를 찾아서 이름 확인
select
    constraint_name,
    uc.table_name,
    ucc.column_name,
    uc.constraint_type,
    uc.search_condition
from
    user_constraints uc join user_cons_columns ucc
        using(constraint_name)
where
    uc.table_name = 'TB_USER';
--
alter table
    tb_user
rename
    constraint SYS_C008252 to pk_tb_user_no;
```

```sql
<gender 추가 및 check제약조건 추가>
-- gender 추가
alter table tb_user
add gender char(1);
add constraint ck_tb_user_gender unique(gender);

desc tb_user; --확인
   
insert into tb_user values (2, 'sinsa','5678','신사임당임당',35,'F');

select * from tb_user;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/bd1e8804_Untitled.png]]

#### DROP : 컬럼삭제, 제약조건삭제

```sql
-- age컬럼 삭제
alter table
    tb_user
drop column age;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/6961d3c5_Untitled.png]]

```sql
-- 제약조건삭제
alter table
    tb_user
drop constraint ck_tb_user_gender;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/173f8f4c_Untitled.png]]

```sql
-- 테이블 이름 변경
alter table 
    tb_user
rename to tb_user_after;
-- 확인용
select * from tb_user_after;

-- 간단버전
rename tb_user to tb_user_after;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/82de179a_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
