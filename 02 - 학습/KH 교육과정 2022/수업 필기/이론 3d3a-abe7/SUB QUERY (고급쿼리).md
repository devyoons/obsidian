---
별칭:
  - "강의 - SUB QUERY (고급쿼리)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/710a778e8b6e4b18b2db4004d0830045
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: SUB QUERY (고급쿼리)

## 강의 내용

---

---

### TOP-N 분석

- 특정컬럼기준으로 정렬후에 가장 앞선 n개의 행만 결과집합에 담아 리턴
    
    ### rownum
    
    - 테이블생성후 각행이 insert될때 oracle에서 자동으로 부여하는 각 행에 대한 일련번호.
    - 한번 부여되면 변경불가
    - where절에 새로운 조건이 추가되었을 때, inline-view를 사용했을 때 새로 부여된다.

```sql
-- 회사에서 급여가 높은 top-5 조회
-- 1. 급여내림차순정렬. 
-- 2. inline-view(rownum새로부여) 
-- 3. rownum 1 ~ 5 필터링
select
    rownum,
    e.*
from(
    select
        emp_name, salary
    from    
        employee 
    order by
        salary desc
    )e
where
    rownum between 1 and 5;
```

```sql
-- 최근 입사한 5명 사원 조회
select
    rownum,
    e.*
from(
    select
        emp_name,
        hire_date
    from 
        employee
    order by
        hire_date desc
		)e
where
    rownum between 1 and 5;
```

```sql
-- 직급이 대리인 사원중에서 연봉상위 3명 조회
select
    rownum 연봉순위
    , e.*
from(
    select
        e.emp_name 사원명,
        j.job_name 직급명,
        (e.salary + (e.salary * nvl(bonus, 0)))*12 연봉
    from
        employee e
            join job j
                on e.job_code = j.job_code
    where
        j.job_name = '대리'
    )e
where rownum between 1 and 3;
```

```sql
-- 부서별 급여평균  top3 조회(부서명, 평균급여)
select
    rownum,
    (select dept_title from department d where d.dept_id = e.dept_code) 부서명,
    e.avg_sal
from(
    select 
        dept_code, trunc(avg(salary)) avg_sal
    from 
        employee
    group by 
        dept_code
    order by 
        avg_sal desc
    )e
where rownum between 1 and 3;
```

<aside>
❓ rownum은 1부터 시작하는 순서는 잘 뽑아내지만 그게 아니라면 별칭을 사용하고 from으로 한 레벨 더 필요하다.

</aside>

```sql
-- 급여 상위 랭킹 6 ~ 10위 조회
-- rownum은 where절이 완전히 끝났을 때 부여 또한 끝이 난다.
-- 1부터 시작하지 않고, offset이 있는 경우 inline-view가 한레벨 필요하다.
select 
    *
from(
    select
        rownum rnum,
        e.*
    from(
        select
            emp_name, salary
        from    
            employee 
        order by
            salary desc
        )e
    )    
where
    rnum between 6 and 10;
```

#### with절 (잘사용은안함)

- inline-view에 이름을 붙여서 재사용가능하도록 하는 구문

```sql
-- with절
-- inline-view에 이름을 붙여서 재사용가능하도록 하는 구문
with some_view
as( 
    select 
        dept_code, trunc(avg(salary)) avg_sal
    from 
        employee
    group by 
        dept_code
    order by 
        avg_sal desc
  )
select 
    rownum,
    e.*
from (
    some_view
) e
where
    rownum between 1 and 3;
```

#### WINDOW FUNTION

- 행과 행간의 관계를 쉽게 파악/정의하기 위한 ansi표준함수

```sql
<문법>
window_function (args) over([partition by절][order by절][windowing절])
```

- args 함수인자(컬럼명) 0 ~ n개
- partition by : 전체집합을 다시 그룹핑하기 위한 구문
- order by : 행간의 정렬
- windowing절 : 대상행을 지정

#### rank() over() / dense_rank() over()

- rank() over()
    - 중복된 값이 있다면 중복된 만큼 건너뛰고 순위를 부여
- dense_rank() over()
    - 중복된 값이 있어도 중복된 만큼 건너뛰지 않고 순위를 부여

```sql
-- rank() over()
-- 중복된 값이 있다면 중복된 만큼 건너뛰고 순위를 부여
select
    emp_name,
    salary,
    rank() over(order by salary desc) rank,
    dense_rank() over(order by salary desc) rank 
from
    employee;
```

```sql
select
    *
from(
    select
        emp_name,
        salary,
        rank() over(order by salary desc) rank
    from
        employee
)
where
    --rank between 1 and 5;
			rank between 6 and 10; -- 한레벨 안씌워도 rank로는 offset순위 조회 가능
```

#### partition

```sql
select
    emp_name,
    dept_code,
    salary,
    rank()over(partition by dept_code order by salary desc) rank_by_dept, --부서별 급여순
    rank()over(order by salary) rank_by_all --전체 급여순
from
    employee
order by
    dept_code;
```

#### rank, dense_rank, row_number

```sql
-- 부서별 입사순서를 조회(사원명, 부서명, 입사일, 부서별 입사순번)

select
    emp_name 사원명,
    (select dept_title from department d where e.dept_code = d.dept_id) 부서명,
    hire_date 입사일,
    rank() over(partition by dept_code order by hire_date) 부서입사순번,
		-- 중복시 1, 1, 3
    dense_rank() over(partition by dept_code order by hire_date) 부서입사순번,
		-- 중복시 1, 1, 2
    row_number() over(partition by dept_code order by hire_date) 부서입사순번
		-- 중복시 1, 2, 3
from 
    employee e
order by 
    2, 4;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c8254bb4_Untitled.png]]

### 집계처리 윈도우 함수

- 집계/누계 관련 처리를 하는 윈도우 함수

#### sum() over()

- 그룹함수와 일반컬럼을 같이 쓸 수 없지만, 윈도우함수와 일반컬럼은 함께 사용 가능

```sql
select
    emp_name,
    dept_code,
    salary,
    sum(salary) over() "전사원 급여합계",
    trunc(salary/sum(salary) over() * 100, 1) "전체급여대비%",
    sum(salary) over (partition by dept_code) 부서별급여합계,
    sum(salary) over (partition by dept_code order by salary) "부서별 누계"
from
    employee;
```

#### max, min, count, avg () over ()

```sql
select
    emp_id 사번,
    emp_name 사원명,
    dept_code 부서코드,
    to_char(salary,'fml999,999,999') 급여,
    to_char(trunc(avg(salary) over (partition by dept_code)),'fml999,999,999') "부서별 평균급여",
    to_char(trunc(avg(salary) over()),'fml999,999,999') "전체사원 평균급여",
    max(salary) over(),
    min(salary) over(),
    count(*) over()
from
    employee;
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
