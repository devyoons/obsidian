---
별칭:
  - "강의 - Database Object 1-2"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/31fcaa9587e148b399ad196389829afa
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: Database Object 1-2

## 강의 내용

---

---

## PL/SQL

- Procedural Language extension to SQL
- 기존 sql에 `절차적 언어 방식`을 추가해서 변수선언, 조건처리, 반복처리 지원하는 문법
    - 오라클 자체에 내장되어 있는 절차적 언어
- begin ~ end 와 같은 블록 구조를 가지므로 블록 안의 여러 sql구문이 한번에 서버로 전송되므로 
수행속도가 향상되고 통신량도 줄일 수 있다.

### pl/sql 유형

1. **익명블럭** : Anonymous Block 매번실행(이름이없는 블럭이라 호출이 안됨)
2. **프로시져** : pl/sql구문을 저장해서 호출해서 재사용 가능함.
3. **함수** :  pl/sql구문을 저장해서 호출해서 재사용 가능 (반드시 하나의 리턴값을 가진다.)

### 서버콘솔 출력

- 프로시저를 사용하여 출력해 주는 내용을 화면에 보여주도록 설정
- 기본값이 off이므로 매번 session생성시마다 1회 실행할 것!
    - sql 껐다가 다음 날 실행하면 session이 새로 생성됨
- **`이걸해야 결과를 콘솔에서 확인할 수 있음`**

```sql
set serveroutput on; -- 오류발생시 on을 대문자로 해보기

begin
    dbms_output.put_line('Hello World');
end;
/
```

### 익명블럭 구조 : declare로 선언되면 익명 블록

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b533caf9_Untitled.png]]

| 구성키워드 | 필수/선택 | 설명 |
| --- | --- | --- |
| declare (선언부) | 선택 | 실행에 사용될 변수 · 상수 · 커서 등을 선언 |
| begin (실행부) | 필수 | 조건문 · 반복문 · `select` · `DML` · 함수 등을 정의 |
| exception(예외 처리부) | 선택 | pl/sql 실행 도중 발생하는 오류(예외 상황)를 해결하는 문장 서술 |

```sql
		declare
        -- 변수선언부(선택)
    begin
        -- 실행부(필수)
    exception
        -- 예외처리부(선택)
    end;
    /

    sql문을 ;(세미콜론)으로 각 sql문을 구분했으나, 
		pl/sql에서는 블럭안에 여러개의 sql문이 올 수 있다.
    
		/가 익명블록의 종료를 의미함.
---------------------예시코드
declare
	v_emp_id char(3); --변수선언
begin
	select
		emp_id
	into
		v_emp_id
	from 
		employee
	where
		emp_name = '선동일';
	dbms_output.put_line('emp_id : ' || v_emp_id); --출력문
exception
	when no_data_found then dbms_output.put_line('찾으시는 사원이 없습니다');
end;
/
```

## 익명블럭

- declare 변수
- 변수명 [constant] 자료형 [not null] [:= 값];
    - `:=` 키워드 (오른쪽 값을 왼쪽 변수에 대입)

```sql
declare
    name varchar2(100);
    num number:= 10 * 20;
    KKK constant number := 333;
begin
    name := '김사랑';
--    KKK := KKK * 100; --ORA-06550: 줄 7, 열5:PLS-00363: 'KKK' 식은 피할당자로 사용될 수 없습니다
    
    dbms_output.put_line(name);
    dbms_output.put_line(num);
    dbms_output.put_line(KKK);
end;
/
```

### 변수의 자료형

1. 기본 자료형 (스칼라형)
    1. varchar2, char, clob
    2. number, binary_integer, pls_integer
    3. date
    4. boolean (true, false, null)
2. 복합자료형
    1. record
        1. 여러 종류 자료형의 데이터를 저장 (테이블의 행과 유사)
    2. cursor
    3. collection(varray(배열), nested_table(List),associative array(Map)) 
        1. 한 가지 자료형의 데이터를 여러 개 저장 (테이블의 열과 유사)
    

### 변수유형

1. 스칼라변수(값) : 내부 구성요소가 없는 단인 값
2. 참조변수(테이블, 컬럼타입)
    1. `%rowtype` : 테이블의 모든 컬럼을 참조하는 타입 (행구조)
    2. `%type` : 변수자료형을 직접 선언하지 않고,(다른 테이블).(특정 컬럼)을 참조 (열)
    3. `record` : 원하는 컬럼만 가지고 있는 record자료형을 만들고 사용한다.

#### **참조변수1 `%type`**

- 변수자료형을 직접 선언하지 않고,(다른 테이블).(특정 컬럼)을 참조

```sql
-- 부서명도 함께 출력하기
declare
    v_emp_name employee.emp_name%type;
    v_phone employee.phone%type;
    v_dept_title department.dept_title%type;
begin
    select 
        emp_name, phone, (select dept_title from department d where e.dept_code = d.dept_id)
    into 
        v_emp_name, v_phone, v_dept_title
    from 
        employee e
    where 
        emp_id = '&사번'; -- 대체변수 입력창 : 사번 임시변수에 사용자 입력값 받아서 조회
        
    dbms_output.put_line('이름 : ' || v_emp_name);
    dbms_output.put_line('전화번호 : ' || v_phone);
    dbms_output.put_line('사번 : ' || v_dept_title);
end;
/
```

#### **참조변수2 `%rowtype`**

- 테이블의 모든 컬럼을 참조하는 타입

```sql
declare
    emp_row employee%rowtype;
begin
    select 
        *
    into
        emp_row
    from
        employee
    where
        emp_id = '&사번';

    dbms_output.put_line('사원명 : ' || emp_row.emp_name);
    dbms_output.put_line('이메일 : ' || emp_row.email);

end;
/
```

#### **참조변수3 `%record`**

- 원하는 컬럼만 가지고 있는 record자료형을 만들고 사용한다.

```sql
declare
    type my_emp_type is record(
        emp_name employee.emp_name%type,
        dept_title department.dept_title%type
    );
    erow my_emp_type;
begin
    select
        e.emp_name,d.dept_title
    into 
        erow
    from
        employee e left join department d
            on e.dept_code = d.dept_id
    where
        emp_id = '&사번';
        
    dbms_output.put_line('이름 : ' || erow.emp_name);
    dbms_output.put_line('부서 : ' || erow.dept_title);
        
end;
/
----------------------연습문제
-- 사원명, 직급명을 처리할 수 있는 레코드를 선언하고 사번을 통해 조회하세요.
declare
    type emp_type is record(
        emp_name employee.emp_name%type,
        job_name job.job_name%type
    );
    erow emp_type;
begin
    select
        e.emp_name, j.job_name
    into
        erow
    from 
        employee e join job j
            using(job_code)
    where
        emp_id = '&사번';
        
    dbms_output.put_line('이름 : ' || erow.emp_name);                  
    dbms_output.put_line('직급명 : ' || erow.job_name);     
    
exception
        when no_data_found then dbms_output.put_line('찾으시는 사원이 없습니다.');    
   
end;
/
```

#### **begin절에서 DML사용하기**

- 익명블럭안에서 트랜잭션 처리까지 완료해야 한다

```sql
select * from tb_member;
desc tb_member; -- 테이블 구조확인
begin
    insert into
        tb_member
    values(
        'sinsa','신사임당','1234','sinsa@naver.com','F',default
    );
    --트랜잭션처리까지 완료하기
    commit;

end;
/
-------------------------------연습문제
-- ex_employee의 마지막 번호를 조회한 후, +1 사번을 부여해서 다음정보를 insert하세요.
-- 김테리 880808-2345678 taeri@gmail.com 01012341234 null J4 S3 3500000 null 200 null N
select * from ex_employee;
desc ex_employee;
-- drop sequence seq_ex_employee_id;

declare
    v_emp_id ex_employee.emp_id%type;
begin
    --1. 마지막 번호 조회
    select 
				max(emp_id)
    into 
				v_emp_id 
    from 
				ex_employee;
    --2. insert
    insert into ex_employee 
        values(
						v_emp_id + 1 ,'김톄리', '880808-2345678', 'taeri@gmail.com', 
						'01012341234', null, 'J4', 'S3' ,3500000, null ,200, sysdate, null, 'N'
							);
    --2.1 트랜잭션처리
    commit;
end;
/
```

## 조건문

### if, else if, if else 조건문

```sql
    -----------------------
    if 조건문 then
        실행구문
    end if;
    -----------------------
    if 조건식 then
        참일 때 실행코드
    else
        거짓일때 실행코드
    end if;
    -----------------------
    if 조건식1 then
        실행코드1
    elsif 조건식2 then
        실행코드2
    elsif 조건식3 then
        실행코드3
    ...
    end if;
    -----------------------
```

```sql
declare
    n number := &숫자;
begin
    dbms_output.put_line(n);
    
--    if mod(n, 2) = 0 then
--        dbms_output.put_line('짝수를 입력하셨습니다.');
--    else
--        dbms_output.put_line('홀수를 입력하셨습니다.');
--    end if;
    
    if n > 0 then
        dbms_output.put_line('양수입니다.');
    elsif n = 0 then
        dbms_output.put_line('0입니다.');
    else
        dbms_output.put_line('음수입니다.');
    end if;
    
    dbms_output.put_line('끝');
end;
/
----------------------예시 코드

```

### case문

```sql
[문법1]
        case 표현식
            when 값1 then 실행코드1;
            when 값2 then 실행코드2;
            ...
            else 기본실행코드;
        end case;
        
[문법2]
        case
            when 조건식1 then 실행코드1;
            when 조건식2 then 실행코드2;
            when 조건식3 then 실행코드3;
            else 기본실행코드;
        end case;
```

> **문법1 예시코드**
> 

```sql
declare
    n number := &가위바위보123; <-홑따옴표로 감싸면 사용자 입력값을 문자열로 처리
begin
    case (n)
        when 1 then dbms_output.put_line('가위');
        when 2 then dbms_output.put_line('바위');
        when 3 then dbms_output.put_line('보');
        else dbms_output.put_line('잘못 입력하셨습니다.');
    end case;
end;
/
```

> **문법2 예시코드**
> 

```sql
declare
    n number := &가위바위보123;
begin	
		case
        when n = 1 then dbms_output.put_line('사용자 : 가위');
        when n = 2 then dbms_output.put_line('사용자 : 바위');
        when n = 3 then dbms_output.put_line('사용자 : 보');
        else dbms_output.put_line('잘못 입력하셨습니다.');
    end case;
```

> **가위바위보**
> 

```sql
declare
    com number := trunc(dbms_random.value(1, 4)); -- 1.0 보다 크거나 같고, 4.0보다 작은 실수 반환(4.0포함안됨)
    n number := &가위바위보123; -- 사용자입력값이 숫자로 받으려면 이렇게 지정해야함. 홑따옴표로하면 문자열로처리됨
begin
    dbms_output.put_line(com);
    case
        when com = 1 then dbms_output.put_line('컴퓨터 : 가위');
        when com = 2 then dbms_output.put_line('컴퓨터 : 바위');
        when com = 3 then dbms_output.put_line('컴퓨터 : 보');
    end case;
    
    case
        when n = 1 then dbms_output.put_line('사용자 : 가위');
        when n = 2 then dbms_output.put_line('사용자 : 바위');
        when n = 3 then dbms_output.put_line('사용자 : 보');
        else dbms_output.put_line('잘못 입력하셨습니다.');
    end case;
    
    -- 결과평가
    case
        when 
            com = n 
                then dbms_output.put_line('> 비겼습니다.');
        when 
            ((n = 1 and com = 3) or (n = 2 and com = 1) or (n = 3 and com = 2)) 
                then dbms_output.put_line('> 당신이 이겼습니다.');
        else dbms_output.put_line('> 당신이 졌습니다.');
    end case;
    
end;
/
```

> **관리자 성과급 지급**
> 

```sql
-- 사번을 입력받고, 관리자에 대한 성과급을 지급하려한다.
-- 관리하는 사원이 5명이상은 급여의 15% 지급 : '성과급은 ??원입니다.'
-- 관리하는 사원이 5명미만은 급여의 10% 지급 : ' 성과급은 ??원입니다.'
-- 관리하는 사원이 없는 경우는 '대상자가 아닙니다.'
declare
    salary employee.salary%type;
    num number; -- 부하직원수
begin
    --1. 사번을 가지고 부하직원수, 급여 조회
    select 
       (select count(*) from employee where manager_id = e.emp_id),
        salary
    into 
        num, salary
    from 
        employee e
    where 
        e.emp_id = '&사번';
        
    dbms_output.put_line(num || ', ' || salary);
     
    -- 2. 성과금 평가
    if num >= 5 then
        dbms_output.put_line('성과급 : ' || salary * 0.15 || '원');
    elsif num > 0 then
        dbms_output.put_line('성과금 : ' || salary * 0.1 || '원');
    else
        dbms_output.put_line('성과금 대상자가 아닙니다.');
    end if;
end;
/
```

## 반복문

### loop

- 무한반복 + 탈출문 exit

```sql
declare
    n number := 1;
begin
    
    loop
        dbms_output.put_line(n);
        n := n + 1;
        
        -- 탈출조건(필수)
        exit when n > 5;
    end loop;
    
end;
/
```

### while loop

```sql
declare
    n number := 1;
begin 
    while n <= 5 loop -- n이 5보다 작거나 같을 때 까지
        dbms_output.put_line(n);
        n := n + 1; -- 증감식
    end loop;
end;
/
```

### for in loop (多사용)

- 증감변수 별도 선언 불필요
- 증감변수 범위만큼 반복후 자동 종료
- for 증감변수 in 시작값...종료값
- 증감처리는 +1. 변경불가 (5, 4, 3, 2, 1은 다른 반복문 사용해야함.  **`reverse`**는 가능)
    - **`작은수에서 큰수로만 가능`**

```sql
begin
    for n in reverse 1..5 loop
        dbms_output.put_line(n);
    end loop;
end;
/
--결과
5
4
3
2
1
```

> **구구단 입력받아서 출력하기**
> 

```sql
declare
    dan number := &구구단수;
begin
    for n in 1..9 loop
        dbms_output.put_line(dan || ' * ' || n || ' = ' || (dan * n));
    end loop;
end;
/
```

<aside>
❓ **개행만 하고 싶은 경우 : dbms_output.new_line**

</aside>

> **2단 ~ 9단까지 출력**
> 

```sql
<< 중첩 for문을 사용하면되고 들여쓰기를 잘해야 안헷갈림>>
begin
    for dan in 2..9 loop
        for n in 1..9 loop
            dbms_output.put_line(dan || ' * ' || n || ' = ' || (dan * n));
        end loop;
        dbms_output.new_line;
    end loop;
end;
/
```

> **for문으로 사원 정보 출력**
> 
- select문의 조회 결과가 1행씩 처리

```sql
declare
    erow employee%rowtype;
begin
    for n in 200..223 loop
--        dbms_output.put_line(n);
            select
                *
            into 
                erow
            from
                employee
            where
                emp_id = n;
                
    dbms_output.put_line(erow.emp_id || '   ' || erow.emp_name || '   ' || erow.email);
    end loop;
end;
/
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
