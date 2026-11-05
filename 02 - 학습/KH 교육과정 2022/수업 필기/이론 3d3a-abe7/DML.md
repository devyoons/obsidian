---
별칭:
  - "강의 - DML"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/657e57d848a94c9bb079a283d9568970
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: DML

## 강의 내용

---

---

## DML

- Data Manipulation Language 데이터 조작어
- 테이블의 데이터를 조작하는 명령어 모음
- insert / update / delete / select
- 처리된 행의 개수를 리턴
- 명령어 실행으로는 DB에 실제 반영되지 않으므로, TCL commit명령어를실행해야한다.
- rollback처리하면 마지막 commit시점으로 돌아간다.

### INSERT

- 특정 테이블에 새로운 행(row/record)을 추가하는 명령어
- 정상실행시 테이블에 행이 추가됨.

```sql
문법1 - 컬럼명을 지정하지 않는 경우 (모든 컬럼을 테이블의 정의된 순서대로 작성)
        insert into 테이블명
        values (컬럼1값, 컬럼2값,...);

문법2 - 컬럼명을 지정하는 경우 (지정한 컬럼한 데이터를 작성. not null컬럼은 생략이 불가)
        insert into 테이블명 (컬럼명1, 컬럼명2, ...)
        values (컬럼1값, 컬럼2값,...);
```

#### 예제

```sql
--테이블 생성
		create table sample(
    code number,
    name varchar2(100) not null,
    nickname varchar2(100) default '홍길동',
    email varchar2(100) default 'honggd@gmail.com' not null,
    enroll_date date default sysdate
);

-- 데이터추가
		insert into
		    sample
		values(
		    123,'고길동','미스터고고','go@gmail.com',default
		);

		select * from sample;
```

#### 오류 발생

- `자료형이 일치하지 않을때` ORA-01722: 수치가 부적합합니다
- `컬럼수가 맞지 않는 경우` ORA-00947: 값의 수가 충분하지 않습니다
- `not null 컬럼에 null값 대입하는 경우` ORA-01400: NULL을 ("KH"."SAMPLE"."NAME") 안에 삽입할 수 없습니다
- `지정한 자료형 크기보다 큰값을 추가할 때` ORA-12899: "KH"."SAMPLE"."NICKNAME" 열에 대한 값이 너무 큼(실제: 420, 최대값: 100)
- `not null컬럼은 생략할 수 없다.` ORA-01400: NULL을 ("KH"."SAMPLE"."NAME") 안에 삽입할 수 없습니다
    - not null이어도 default값이 지정된 경우는 생략할 수 있다.

- 제약조건, 기본값은 모두 제거되어서 새로 넣어줘야한다.

```sql
-- ex_employee 생성!
-- subquery를 이용해 table을 생성하면, not null을 제외한 제약조건, 기본값은 모두 제거된다.
create table ex_employee
as
select
    *
from
    employee;

select * from ex_employee;

-- not null 확인
desc employee;

-- 기본값 확인
select
    *
from
    user_tab_cols
where
    table_name = 'EX_EMPLOYEE';

-- 기본값, 제약조건 추가
alter table ex_employee
add constraint pk_ex_employee primary key(emp_id) --emp_id 기본키지정(식별자컬럼)
modify quit_yn default 'N'                        -- 기본값 지정
modify hire_date default sysdate;                 -- 기본값 지정
```

### UPDATE (where조건절 필수)

- 특정행을 찾고, 해당행의 컬럼값을 변경
- 처리이후 행의 수의 변화는 없다.
- 요청후 수정된 행의 수를 반환한다.

```sql
-- 205번 사원의 급여를 100000원인상, 직급은 J4로 변경
select
    *
from
    ex_employee
where
    emp_id = '205';

update 
    ex_employee
set
    job_code = 'J4',
    salary = salary + 100000
where
    emp_id = '205';
```

- where 절에 행이 여러개 조회되면 동시에 여러행을 수정가능

```sql
-- D5부서원의 급여를 10%로 인상
select * from ex_employee where dept_code = 'D5'; -- 기존 급여 확인 코드
--여러행 동시 수정
update  
    ex_employee
set
    salary = salary + (salary * 0.1)
where
    dept_code = 'D5';
```

```sql
-- where절에 조건컬럼은 식별자컬럼을 사용하는 것이 좋다.
update 
    ex_employee 
set 
    job_code = (select job_code from job where job_name = '과장')
where 
    emp_id = '219';

select * from ex_employee where emp_name = '임시환';
select * from job;

```

### DELETE (where조건절 필수)

- 특정행을 삭제하는 구문
- 처리결과 행의 수가 줄어든다.
- `where절 사용하지 않으면 전체행이 삭제`

```sql
delete from
    ex_employee
where
    emp_id = '302';

select * from ex_employee;

--302번 김테리 삭제됨
```

### TRUNCATE

- DDL로써, 전체행을 삭제한다.
- auto-commit되므로, rollback으로 복구할 수 없다.
- delete와 달리 before-image를 생성하지 않으므로, 처리속도가 매우 빠르다.

```sql
truncate table ex_employee;

rollback; -- 아무리해도 되돌릴 수 없다.
select * from ex_employee; -- 데이터 전체 삭제됨.
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
