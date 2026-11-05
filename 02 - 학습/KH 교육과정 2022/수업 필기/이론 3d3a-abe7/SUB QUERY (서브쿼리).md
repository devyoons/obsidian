---
별칭:
  - "강의 - SUB QUERY (서브쿼리)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/892268a90c12461ba8e367312f2930fb
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: SUB QUERY (서브쿼리)

## 강의 내용

---

---

### SUB QUERY

- 하나의 sql문안에 포함된 또 하나의 sql을 subquery라함
- main query하위에 subquery가 포함되어 있음.
- main query 실행중에 subquery를 실행하고, 그 결과를 mainquery에 전달하는 방식

**유의사항**

- subquery는 반드시 소괄호로 묶어야 한다.
- 비교연산시 우항에 작성할 것.
- order by문법 지원되지 않음.

### 서브쿼리의 유형

- 단일행 단일컬럼 ⇒ (1행1열) : 동등비교 가능함
- 다중행 단일컬럼  ⇒(n행1열) : 동등비교 안됨 여러개라서
- 다중열(단일행/다중행) ⇒ (n행 m열)
- 상관 ⇒ 메인쿼리에서 값을 전달받아 처리
- 스칼라 ⇒ select절에 사용된 단일값 상관서브쿼리
- 인라인뷰 ⇒ from절에 사용된 서브쿼리

**간단예시코드**

```sql
select
    manager_id
from
    employee
where
    emp_name = '노옹철';
---------------------------서브쿼리 사용하면
select
    emp_name
from
    employee
where
    emp_id = (select
                    manager_id
                from
                    employee
                where
                    emp_name = '노옹철');
```

#### 단일행 단일컬럼 서브쿼리

- 서브쿼리 조회결과가 1행1열인 경우

```sql
--윤은해와 같은 금액의 급여를 받는 사원을 조회(사번, 사원명, 급여)
select
    emp_id,emp_name,salary
from
    employee
where
    salary = (select salary from employee where emp_name = '윤은해')
   and 
    emp_name != '윤은해';
    
--사원테이블에서 급여가 최대/최소인 사원 조회(사번 사원명 급여)
select
    emp_id,emp_name,salary
from
    employee
where
    salary in ((select max(salary) from employee), (select min(salary) from employee));

//결과
emp_id  emp_name  salary
211     전형돈    2000000
```

#### 다중행 단일컬럼 서브쿼리

- 서브쿼리 조회결과가 1열n행일 때 서브쿼리
- in | not in, any(some), all, exists | not exists 연산자와 함께 사용가능
- in 값목록에 포함되어 있는지 검사
- in (값1, 값2, 값3...) - 목록자리에 다중행 서브쿼리 사용가능

**in 연산자**

```sql
-- 송종기, 하이유 사원이 속한 부서원 조회
select
    emp_name,
    dept_code
from
    employee
where
    dept_code in (
                    select
                        dept_code
                    from
                        employee
                    where
                        emp_name in ('송종기','하이유')
        
                 );
//결과
emp_name   dept_code
선동일      D9
송종기      D9
노옹철      D9
박나라      D5
하이유      D5
김해술      D5
심봉선      D5
윤은해      D5
대북혼      D5
```

```sql
-- 차태연, 박나라, 이오리사원과 같은 직급 사원 조회(사원명, 직급명(직급코드))

select
    emp_name 사원명,
    job_name || '(' || job_code || ')' "직급명(직급코드)"
from employee e 
    join job j
        using(job_code)   
where
    job_code in (
                select 
                    job_code
                from 
                    employee
                where 
                    emp_name in ('차태연', '박나라', '이오리')
                );
//결과
사원명     직급명(직급코드)
박나라     사원(J7)
윤은해     사원(J7)
전형돈     대리(J6)
장쯔위     대리(J6)
하동운     대리(J6)
방명수     사원(J7)
차태연     대리(J6)
전지연     대리(J6)
이오리     사원(J7)
이태림     대리(J6)
```

**exists 연산자(상관처리때 많이 사용함.)**

```sql

```

### 다중열서브쿼리

- 서브쿼리의 결과가 n열 m행(1행이상)인 경우
- 동등비교 (=)보다 `in`을 사용해주는게 좋다.
    - = 연산자인 경우 서브쿼리 리턴결과가 딱 1행일때만 처리할 수 있다.
    - in 연산자인 경우 서브쿼리 리턴결과 1 ~ n행일때 처리할 수 있다.

```sql
-- 퇴사한 직원과 같은 부서, 같은 직급에 해당하는 사원을 조회(이름, 직급코드, 부서코드)
select
    emp_name,dept_code,job_code
from
    employee
where
    (dept_code, job_code) = ( --서브쿼리할때만 가능한 문법이고 'D8','J6' 안됨
                            select
                                dept_code, job_code
                            from
                                employee
                            where
                                quit_yn = 'Y'
                            );
//결과
emp_name  dept_code  job_code
전형돈       D8         J6
장쯔위       D8         J6
이태림       D8         J6

---------------------------------------------------------------
-- 퇴사처리 후 위 코드를 실행하면 나는 오류
-- ORA-01427: 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
-- 하나일 때는 동등비교로 처리가능하나 값이 2개이상이면 동등비교안됨
select * from employee;
update 
    employee
set 
    quit_date = sysdate,
    quit_yn = 'Y'
where
    emp_id = '221';
----------------------------------------------------------------
-- 이때 연산자를 = -> in 으로 변경해주면 해결가능
select
    emp_name,dept_code,job_code
from
    employee
where
    (dept_code, job_code) in (
                            select
                                dept_code, job_code
                            from
                                employee
                            where
                                quit_yn = 'Y'
                            );
```

```sql
-- 직급별 최소 급여를 받는 사원 조회(이름, 직급코드, 급여)
select
    emp_name,job_code, salary
from
    employee
where
    (job_code, salary) in (
                            select 
                                job_code, 
                                min(salary)
                            from 
                                employee
                            group by 
                                job_code
                           );
//결과

emp_name     job_code    salary
하이유          J5        2200000
전형돈          J6        2000000
노옹철          J2        3700000
방명수          J7        1380000
임시환          J4        1550000
선동일          J1        8000000
유재식          J3        3400000
```

#### 심화문제

```sql
---------------------------------
--실습예제 03/18
---------------------------------
--부서별 최대급여를 받는 사원의 사원명, 부서명, 급여를 출력. 
select
    e.emp_name 사원명
    ,d.dept_title 부서명
    ,to_char(e.salary,'fml999,999,999') 급여
from
    employee e
        join department d
            on e.dept_code = d.dept_id
where
    (dept_code, salary) in 
		(select dept_code, max(salary) from employee group by dept_code)
order by 3 desc;
-- 정답
select emp_name, dept_title, salary
from employee left join department on dept_code = dept_id
where (dept_code, salary) in (select dept_code, max(salary) 
                        from employee
                        group by dept_code)
order by 2,1;--6행

--(심화1) 최소급여를 받는 사원도 출력.
select
    e.emp_name 사원명
    ,d.dept_title 부서명
    ,to_char(e.salary,'fml999,999,999') 급여
from
    employee e
        join department d
            on e.dept_code = d.dept_id
where
    (dept_code, salary) in 
		(select dept_code, max(salary) from employee group by dept_code)
    or
    (dept_code, salary) in 
		(select dept_code, min(salary) from employee group by dept_code)
order by 3;

--정답
select emp_name, dept_title, salary
from employee left join department on dept_code = dept_id
where (dept_code, salary) in (
												select dept_code, max(salary) 
                        from employee
                        group by dept_code)
    or (dept_code, salary) in (
												select dept_code, min(salary) 
                        from employee
                        group by dept_code)
order by 2,1;--12행

--(심화2) 인턴사원도 포함시키기
select
    e.emp_name 사원명
    ,d.dept_title 부서명
    ,to_char(e.salary,'fml999,999,999') 급여
from
    employee e
        left join department d
            on e.dept_code = d.dept_id
where
    (nvl(dept_code,'인턴'), salary) in 
		(select nvl(dept_code,'인턴'), max(salary) from employee group by dept_code)
    or
    (nvl(dept_code,'인턴'), salary) in 
		(select nvl(dept_code,'인턴'), min(salary) from employee group by dept_code)
order by 3;

SELECT
    SUBSTR('210505',1,2) +2000 + (SUBSTR('210505',3,4)-1)
FROM
 DUAL;
-- 정답
select emp_name, nvl(dept_title,'인턴') 부서, salary
from employee left join department on dept_code = dept_id
where (nvl(dept_code,-1), salary) in (select nvl(dept_code,-1), max(salary) 
                        from employee
                        group by dept_code)
    or (nvl(dept_code,-1), salary) in (select nvl(dept_code,-1), min(salary) 
                        from employee
                        group by dept_code)
order by 2,1;--14행
```

#### 상관 서브쿼리

- 상관(상호연관)
- 메인쿼리의 값을 전달받아 서브쿼리를 수행하고, 그 겨과값을 반환
- 일반서브쿼리와는 다르게 단독실행(블럭)이 불가하다.

```sql
--직급별 평균급여보다 많은 급여를 받는 사원 조회

select e.emp_name, e.job_code, e.salary
from 
    employee e join(
                    select job_code , avg(salary) sal 
                    from employee 
                    group by job_code
                    ) t
                on e.job_code = t.job_code
where e.salary > t.sal;

--상관 서브쿼리로 처리
select
    emp_name, job_code, salary
from
    employee e
where
    salary > (select avg(salary) from employee where job_code = e.job_code);

-- 부서별 평균급여보다 많은 급여를 받는 사원 조회(인턴 포함)

select
    e.emp_name 사원명, nvl(e.dept_code,'인턴') 부서, e.salary 급여,
    trunc((select avg(salary) from employee where nvl(dept_code,'D0') 
																										= nvl(e.dept_code,'D0'))) avg_sal
    --스칼라서브쿼리 select절의 상관서브쿼리
from 
    employee e 
where 
    salary > (select avg(salary) from employee where nvl(dept_code,'D0') 
																										= nvl(e.dept_code,'D0'));
```

#### exists

- 행이 존재하는지 안하는지 확인
- exists (sub-query) 존재한다라는 뜻 (서브쿼리에 행 수를 보고 파악함)
- 서브쿼리의 결과집합이 1행이상인 경우 true로 처리, 0행인 경우 false로 처리

```sql
<<<사용방법>>>
select
    *
from
    employee
where
--    1 = 1; -- 무조건 ture.
    1 = 0; -- 무조건 false. 매 행마다 false로 처리되게함 실제로 검사하지 않은 것.
```

```sql
<<<간단예시>>>
select 
    *
from
    employee
where
--    exists (select * from employee);-- 조회된 행이 있으므로 true처리
    exists (select * from employee where 1 = 0);-- 조회된 행이 없으므로 false처리 
```

```sql
<<<코드예제>>>
-- 실제 부서원이 존재하는 부서만 조회
select
    1 -- 행이 있냐 없냐만 확인하기 때문에 1값을 넣어도 행이 없으면 false
from    
    department d
where 
    exists(
        select
            *
        from
            employee
        where
            dept_code = d.dept_id --dept_id에 행이 존재한다면 true처리
    );
```

#### not exists

```sql
-- 실제 부서원이 존재하지 않는 부서만 조회
-- 서브쿼리의 행이 존재하면 false, 서브쿼리의 행이 존재하지 않으면 true -> 결과집합에 포함.
select
    1
from    
    department d
where 
    exists(
        select
            *
        from
            employee
        where
            dept_code = d.dept_id --dept_id에 행이 존재한다면 true처리
    );
```

```sql
-- 관리자사원 조회(부하직원의 manager_id가 관리자사원의 emp_id를 가리킨다)
-- 관리자 emp_id가 부하직원의 manager_id로 참조되는 사원조회
select
    *
from
    employee e
where
    exists(
        select
            *
        from
            employee
        where 
            manager_id = e.emp_id
    );
```

```sql
-- not exists활용해 최대/최소에 해당하는 행을 조회
select 
    * 
from 
    employee e -- 내 급여가
where
    not exists (
        select
            1
        from
            employee
        where
            salary > e.salary -- 내 급여보다많이 받는 사원이 존재하는지(최소 <)
	        )                   -- 있다면 true
```

#### SCALA 서브쿼리

- scala값은 단일값.
- select절에 사용하는 결과값이 하나인(1행1열) 상관서브쿼리

#### INLINE VIEW

- 실제테이블을 주어진 view를 통해 제한적으로 사용가능하도록 함.
- inline view (1회용)
- stored view - 별도의 객체로 저장해 재사용가능하도록 함.

```sql
-- 사원테이블에서 여사원의 사번, 사원명, 부서코드, 성별을 조회

select
    emp_id, emp_name, dept_code, gender
from(
    select
        e.*, -- 이때 지정컬럼을 넣으면 다른 컬럼은 위 select절에서 사용불가
        decode(substr(emp_no,8,1), '2', '여', '4', '여', '남') gender
    from
        employee e
    )
where
    gender = '여';
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
