---
별칭:
  - "강의 - Database Object 2"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/bab0358b672b4727b40ee5ce4903fee9
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: Database Object 2

## 강의 내용

---

---

## STORED FUNTION : 리턴값 O , create로 시작

- stored 는 db에 이미 저장된 객체를 의미
- 리턴값이 반드시 존재하는 프로시저 객체 (매개변수, 리턴타입도 자료크기는 지정하지않음)
- 함수객체는 일반 sql문, 다른 프로시저, 익명블럭에서 호출이 가능
- 기존 sql을 실행과 달리, 미리 컴파일하므로 실행속도가 빠르다.

```sql
<문법>
		-- 테이블을 제외한 객체들은 replace 옵션을 가지고 있음
		create [or replace] function 함수명(매개변수1, 매개변수2, ...)
    return 자료형
    is
        -- 지역변수선언
    begin
        -- 실행코드
        return 리턴값;
    exception
        -- 예외처리
        return 예외발생시 리턴값;
    end;
    /
```

> **예제코드**
> 
- 주민번호를 주고 성별을 리턴
- 주민번호를 주고 나이를 리턴 등등 사용할 수 있다.

```sql
-- 양모자씌우기
-- 매개변수, 리턴타입도 자료크기는 지정하지 않는다.
-- pl/sql의 varchar(32676byte)가 최대이다.
create or replace function myfunc(p_emp_name employee.emp_name%type)
return varchar2
is
    result varchar2(32676);
begin
    result := 'd' || p_emp_name || 'b';
    dbms_output.put_line(result || '@myfunc');
    return result;
end;
/
-- 익명블럭에서 호출
begin
    dbms_output.put_line(myfunc('&이름'));
end;
/

-- 일반 sql문에서 호출
-- 함수내부의 로그출력없음
select
    myfunc(emp_name)
from
    employee;
```

> **펑션 조회하기**
> 
- data dictionary에서 확인
- user_procefures에서 object_type = ‘FUNTION’

```sql
select 
    *
from
    user_procedures
where
    object_type = 'FUNCTION';
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/070544a0_Untitled.png]]

> **주민번호를 인자로 성별을 리턴하는 저장함수**
> 

```sql
create or replace function fn_get_gender(
    p_emp_no employee.emp_no%type
)
return char
is
    v_gender char(3);
begin
    case substr(p_emp_no, 8, 1)
        when '1' then v_gender := '남'; 
        when '3' then v_gender := '남'; 
        else v_gender := '여';
    end case;
    return v_gender;
end;
/
--확인
select
    emp_name,
    emp_no,
    fn_get_gender(emp_no) gender
from
    employee;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/807001b0_Untitled.png]]

> **주민번호를 인자로 받아서 한국나이를 리턴하는 저장함수**
> 

```sql
create or replace function fn_get_age (
    p_emp_no employee.emp_no%type
)

return number
is 
    v_age number;
begin
    case substr(p_emp_no, 8, 1)
        when '1' then v_age := '1900';
        when '2' then v_age := '1900';
        else v_age := '2000';
    end case;
    v_age := extract(year from sysdate) 
							- (v_age + substr(p_emp_no, 1, 2)) + 1;
    return v_age;
end;
/
-------선생님 코드
create or replace function fn_get_age(
    p_emp_no employee.emp_no%type
)
return number
is
    sys_year number := extract(year from sysdate);
    birth_year number;
begin
    -- 출생년도
    case 
        when substr(p_emp_no, 8, 1) in ('1', '2')
            then birth_year := 1900 + substr(p_emp_no, 1, 2);
        else 
            birth_year := 2000 + substr(p_emp_no, 1, 2);
    end case;
    -- 나이 리턴
    return sys_year - birth_year + 1;
end;
/
-------------------
-- 확인
select
    emp_name,
    fn_get_age(emp_no) age
from
    employee;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/2c40a4a4_Untitled.png]]

## STORED PROCEDURE : 리턴값 X , create로 시작

- 일련의 작업절차를 객체로 저장하고 호출해서 사용하는 객체
- 리턴값이 없다. out매개변수를 이용해서 호출부로 값전달 가능
- 미리 컴파일해두므로 일반 sql대비 처리효율이 좋다.
- select문에서 호출불가. 익명블럭 또는 다른 프로시저에서 호출가능
- mod
    - in  ⇒ 프로시저 값을 전달(기본값)
    - out  ⇒ 프로시저의 처리 내용을 담아서 호출부로 전달
    - inout  ⇒ 두 가지를 한번에 처리하는 함수

```sql
<문법>
create [or replace] procedure 프로시저명(매개변수1 mode 자료형, 매개변수2 mode 자료형, ...)
    is
        -- 지역변수 선언
    begin
        -- 실행코드
    end;
    /
    
    mod : in | out | inout
        - in : 프로시저 값을 전달 (기본값)
        - out : 프로시저의 처리내용을 담아서 호출부로 전달
        - inout : 두가지를 한번에 처리함
```

> **사번으로 사원이름 전화번호 조회하는 함수**
> 

```sql
-- p 파라미터라는 접두어로 사용되고 있음
create or replace procedure proc_get_emp(
    p_emp_id in employee.emp_id%type, -- 진짜 값이 넘어와야하고
    p_emp_name out employee.emp_name%type, -- 공간에 대한 주소값
    p_phone out employee.phone%type
)
is
    -- 없어서 생략
begin
    -- 해당사원조회
    select
        emp_name, phone
    into
        p_emp_name, p_phone
    from
        employee
    where
        emp_id = p_emp_id;
        
    dbms_output.put_line('사원명@proc_get_emp : ' || p_emp_name);
    dbms_output.put_line('전화번호@proc_get_emp : ' || p_phone);
end;
/
--익명블럭에서 호출
declare
    v_emp_id employee.emp_id%type := '&사번';
    v_emp_name employee.emp_name%type;
    v_phone employee.phone%type;
begin
    -- 프로시저호출
    proc_get_emp(v_emp_id, v_emp_name, v_phone);
    
    -- 값 확인
    dbms_output.put_line('사원명 : ' || v_emp_name);
    dbms_output.put_line('전화번호 : ' || v_phone);
end;
/

익명블럭에서 proc 호출할 때 주소값을 넘겨놓고 proc에서 그 주소에 값을 채운것
호출 후에 주소값을 참조하면 proc에서 넣은 값을 확인할 수 있음
=> 호출부에서 그 주소안에 있는 값을 확인할 수 있다.
```

> **사번입력 받아서 사원 삭제 프로시저**
> 
- 프로시저 안에서도 DML 사용가능하다
- DML처리시에는 트랜잭션처리까지 함께 해야함.

```sql
-- 사원 삭제 프로시저
-- DML 처리시에는 트랜잭션처리까지 함께 할 것!
select * from ex_employee;

create or replace procedure proc_del_emp(
    p_emp_id ex_employee.emp_id%type -- in mode(기본값)
)
is
begin
    -- 삭제
    delete from
        ex_employee
    where
        emp_id = p_emp_id;
    -- 트랜잭션처리
    commit;
    -- 콘솔로깅
    dbms_output.put_line(p_emp_id || '번 사원을 삭제했습니다.');
end;
/

select * from ex_employee;
-- 일반 sql에서는 사용불가 . 익명블록, 다른 프로시저에서 호출해서 사용가능함
begin
    proc_del_emp('&사번');
end;
/
```

> **인자로 전달한 직급코드, 직급명에 따라 insert 또는 update 처리를 하는 프로시저**
> 

```sql
create or replace procedure proc_upsert_ex_job(
    p_job_code ex_job.job_code%type,
    p_job_name ex_job.job_name%type
)
is
    v_cnt number;
begin
    -- 1.p_job_code가 존재하는지 여부
    select
        count(*)
    into
        v_cnt
    from
        ex_job
    where
        job_code = p_job_code;

    -- 2.존재하면 update, 존재하지 않으면 insert
    if v_cnt = 0 then
        insert into
            ex_job
        values (
            p_job_code, p_job_name
        );
    else 
        update
            ex_job
        set
            job_name = p_job_name
        where
            job_code = p_job_code;
    end if;
    
    -- 3.트랜잭션처리
    commit;
end;
/

begin
--    proc_upsert_ex_job('J8','인턴'); -- insert
    proc_upsert_ex_job('J8','수습'); -- update
end;
/
select * from ex_job;

--dd에서 조회
select * from user_procedures where object_type = 'PROCEDURE';
-- dd 객체 제거할 때는 drop을 이용해서 삭제 
-- 수정할 때는 덮어씌우면됨
```

## CURSOR

- 커서란? sql실행 결과를 가지고 있는 메모리영역(private sql)에 대한 포인터 객체.
- 한 행 이상의 결과 집합인 경우도 순차적으로 접근이 가능

### 커서 종류

1. 암시적 커서 : 1행
2. 명시적 커서 : n행

### 커서 처리 단계

**`커서선언 ⇒ open ⇒ fetch ⇒ close`**의 단계를 거쳐 처리하게 된다.

**커서 선언** : 어떤 sql문을 실행할지 

**open** : 이때 결과 집합이 만들어짐

**fetch** : 결과 집합에서 무조건 1행씩 가지고 옴

**close** : 다 사용하고 닫아야함

### 커서 속성

**`%rowcount`** : 최근 실행된 sql문의 결과 함수

**`%notfound`** : 결과 집합에서 fetch된 행이 존재하면 false, 존재하지 않으면 true

**`%found`** : 결과 집합에서 fetch된 행이 존재하면 true, 존재하지 않으면 false

**`%isopen`** : 최근 실행된 sql문 커서가 open상태이면 true

#### 암시적 커서

- pl/sql의 sql문처럼 하나의 결과를 리턴하는 경우 커서 선언 없이도 sql문의 실행 결과가 암시적으로 커서에 저장되므로 이를 암시적 커서라함

```sql
declare
    v_emp_id employee.emp_id%type := '&사번';
    v_emp_name employee.emp_name%type;
begin
    select
        emp_name
    into
        v_emp_name
    from
        employee
    where
        emp_id = v_emp_id; -- 최근 실행된 쿼리
        
    if sql%found then
        dbms_output.put_line('조회된 행수 : '|| sql%rowcount);
        -- else절은 필요없음. 행을 못찾으면 예외발생하기 때문에 
    end if;

end;
/
-- 결과
조회된 행수 : 1

sql%rowcount 영향받은 결과 집합의 행수 반환, 없으면 0
```

#### 명시적 커서

- 선언 - open - fetch - close
- 직접 결과집합에 접근해서 행에 대한 처리가 가능하다
- for..in문 안에서는 open/close를 자동처리해줘서 간단히 커서를 사용할 수 있다.

> **사번, 사원명 여러행 처리하기**
> 

```sql
declare
    -- 커서선언
    cursor mycursor
    is
    select * from employee;
    
    erow employee%rowtype;
begin
    -- 커서 open
    open mycursor;
    loop
        -- 커서 fetch
        fetch mycursor into erow; -- 한행씩 가져오기
        exit when mycursor%notfound; -- 더이상 가져올 행이 없는 경우, exit
        dbms_output.put_line('사번 ' || erow.emp_id || '  사원명 : ' || erow.emp_name);
    end loop;
    
    --커서 close
    close mycursor;
end;
/
-- 결과
**사번200사원명 : 선동일
사번201사원명 : 송종기
사번202사원명 : 노옹철
사번203사원명 : 송은희
사번204사원명 : 유재식
사번205사원명 : 정중하
사번206사원명 : 박나라
사번207사원명 : 하이유
사번208사원명 : 김해술
사번209사원명 : 심봉선
사번210사원명 : 윤은해
...**
```

> **위 코드를 for ...in문에서 명시적 커서 사용하기**
> 
- open, fetch, close 대신 처리.
- fetch된 행을 담을 변수도 for...in안에서 선언
- 별도의 exit를 작성하지 않아도 된다

```sql
declare
    -- 커서선언
    cursor mycursor
    is
    select * from employee;
	--select * from employee where dept_code = 'D5';
begin
		-- open, fetch, close 자동처리
    for erow in mycursor loop
        dbms_output.put_line('사번 ' || erow.emp_id || '  사원명 : ' || erow.emp_name);
    end loop;
end;
/
```

> **매개변수가 있는 커서**
> 

```sql
declare
    cursor cs_emp_by_dept(p_dept_code employee.dept_code%type)
    is
    select * from employee where dept_code = p_dept_code;
    
    v_dept_code employee.dept_code%type := '&부서코드';
begin
    dbms_output.put_line('사번    사원명     부서코드');
    dbms_output.put_line('=========================');
    for erow in cs_emp_by_dept(v_dept_code) loop
        dbms_output.put_line(erow.emp_id || '     '|| erow.emp_name || '      '||erow.dept_code);
    end loop;
end;
/
```

## TRIGGER : create로 시작

- 방아쇠. 연쇄반응
    - A와 B라는 작업이 있다면 A만 진행하고 B는 트리거가 진행하게 하는 작업
- 특정 이벤트(입력,갱신,삭제 등), DDL, DML등이 실행되었을때 자동적으로 수행되게 하는 사용자 정의 객체이다.

### 트리거 종류

1. Logon / Logoff trigger
2. DDL trigger
3. DML trigger
    1. insert / update / delete 구문이 실행되었을 때 트리거에 작성된 내용을 실행
    

**사용 예시**

1. 회원 탈퇴 시 탈퇴 회원 테이블에 자동으로 추가
    1. 탈퇴회원_yn 삭제하지않고 새로운 컬럼추가
    2. 탈퇴회원테이블 따로 관리 트리거사용
2. 프로필 변경시, 변경내역을 로그테이블에 추가

```sql
		<문법>
		create [or replace] trigger 트리거명
        before | after
        [insert or update or delete] on 테이블명 --원DML
        [for each row]
				[when 조건식]
    declare
        -- 지역변수 선언
    begin
        -- 실행코드
    end;
    /
		-- or replace 생성할 트리거와 같은 이름을 가지고 있어도 무시하고 새로운 것으로 갱신하는것
		-- before | after : 원DML 실행전/후 트리거 설정
    -- for each row 
        - 생략시 문장레벨트리거 : 원DML문당 1번 실행
        - 작성시 행레벨트리거   : 처리되는 행마다 실행
```

#### 행레벨 트리거시 의사레코드(pseudo record)

|  | dml실행전 | dml실행후 |
| --- | --- | --- |
| insert | null | :new.컬럼명 |
| update | :old.컬럼명(변경전 데이터) | :new.컬럼명(변경후 데이터) |
| delete | :old.컬럼명(삭제전 데이터) | null |

> **tb_user**
> 

```sql
create table tb_user(
    no number,
    name varchar2(100) not null,
    constraint pk_tb_user_no primary key(no)
);
create sequence seq_tb_user_no; --시퀀스 정수값을 순차적으로 발행하는 객체(채번기)

create table tb_user_log( -- 변경로그
    no number,
    log varchar2(4000) not null,
    log_date date default sysdate,
    constraint pk_tb_user_log_no primary key(no)
);
create sequence seq_tb_user_log_no; --시퀀스

```

#### 트리거를 이용한 재고관리

> **상품테이블(재고), 입출고테이블 생성**
> 

```sql
create table tb_product(
    pcode varchar2(20),
    pname varchar2(50),
    price number,
    stock number default 0,
    constraint pk_tb_product_pcode primary key(pcode),
    constraint ck_tb_product_stock check(stock >= 0)
);

create table tb_product_io(
    no number,
    pcode varchar2(20),
    status char(1), -- 입고 I, 출고 O
    amount number,
    io_date date default sysdate,
    constraint pk_tb_product_io_no primary key(no),
    constraint fk_tb_product_io_pcode foreign key(pcode) references tb_product(pcode)
);

create sequence seq_tb_product_io_no;
```

> **상품데이터, 입출고 데이터**
> 

```sql
-- 상품데이터
insert into 
    tb_product
values (
    'apple_iphone_x', '아이폰X', 1000000, default
);
insert into 
    tb_product
values (
    'samsung_galaxy_20', '갤럭시20', 1500000, default
);

-- 입출고 데이터 (트리거 생성후 입출고데이터사용)
insert into tb_product_io values(
    seq_tb_product_io_no.nextval, 'apple_iphone_x', 'I', 10, default
);
insert into tb_product_io values(
    seq_tb_product_io_no.nextval, 'apple_iphone_x', 'O', 3, default
);

select * from tb_product;
select * from tb_product_io;
```

> **트리거생성**
> 

```sql
create or replace trigger trig_tb_product_stock
    before
    insert on tb_product_io
    for each row --처리되는 행마다 실행되는 행레벨 트리거로 설정하는 것
begin
    if :new.status = 'I' then
        -- 입고시 + amount
        update
            tb_product
        set
            stock = stock + :new.amount
        where
            pcode = :new.pcode;
    else 
        -- 출고시 - amount
        update
            tb_product
        set
            stock = stock - :new.amount
        where
            pcode = :new.pcode;
    end if;

end;
/
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
