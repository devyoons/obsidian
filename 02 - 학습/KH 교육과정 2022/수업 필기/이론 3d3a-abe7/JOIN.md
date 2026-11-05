---
별칭:
  - "강의 - JOIN"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/6ab0fb23ebc54b048d2ab03606537836
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: JOIN

## 강의 내용

---

---

## join과 union의 차이

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/1790167f_Untitled.png]]

**join** : 특정컬럼을 기준으로 행과 행을 연결(가로)

**union** : 동일한 컬럼을 가진 테이블 연결(세로)

---

### join

- 정규화된 테이블과 테이블을 합쳐서 가상테이블(relation)을 생성

join의 종류

1. Equi join : 동등조건(=)에 의해 연결되는 경우 (★대부분 이걸로 사용)
    - **inner join (내부조인)**
    - **outer join (외부조인)**
    - **cross join**
    - self join
    - multiple join
2. Non-Equi Join : 동등조건(=)이 아닌 조건 (between and, in, not, in...)에 의해 연결되는 경우

### join 문법

1. **ANSI 표준문법 : join, on 키워드 사용**
2. 오라클 전용문법 : ,(콤마) 사용

---

## 🧐EQUI_JOIN

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b548d04b_Untitled.png]]

- INNER JOIN 제외하고 나머지는 전부 OUTER JOIN이다.
- OUTER JOIN 교집합은 기본적으로 가지고 있고 그 외에서 나뉜다.

### INNER JOIN(교집합)

- 내부 조인(교집합)
- 왼쪽/ 오른쪽 테이블의 일치하는 행만 조회
- 기준컬럼이 NULL이면 제외, 상대테이블에서 매칭되는 행이 없으면 제외
- inner키워드 생략가능

```sql
--employee에서 dept_code 가 null인 사원 2행 제외
--department에서 employee에서 참조되지 않은 D3,D4,D7 3행 제외
select
    *
from
--  employee e inner join department d 
    employee e  join department d --inner 생략가능
        on e.dept_code = d.dept_id; -- 22행나옴(원래는 총24행)
```

- 오라클 전용문법
    
```sql
select
    *
from
    emplyee e, department d
where
    e.dept_code = de.dept_id;
   and
    e.dept_code = 'D9';
```


### OUTER JOIN (좌 , 우 , 전체 : 교집합 항상 포함)

- 외부조인 left outer join, right outer join
- outer키워드 생략가능

#### 1.left outer join

- 왼쪽테이블의 모든 행 포함. 오른쪽테이블에서는 조인조건에 만족하는 행만 포함.
- 우측테이블에 매칭되는 행이 없다면 모든 null로 채워서 처리

```sql
select
    *
from
    employee e left outer join department d
        on e.dept_code = d.dept_id; -- 24 (22 + 2)
```

- 오라클 전용문법
    
```sql
-- 외부조인(+)를 상대테이블 컬럼에 추가
select
    *
from
    employee e, department d
where
    e.dept_code = d.dept_id(+); --좌측(null)을 채워줌
```


#### 2. right outer join

- 우측테이블의 모든 행 포함. 왼쪽테이블에서는 조인조건에 만족하는 행만 포함.
- 좌측테이블에 매칭되는 행이 없다면 모든 null로 채워서 처리

```sql
select
    *
from
    employee e right outer join department d
        on e.dept_code = d.dept_id; -- 25 (22 + 3) = D3,D4,D7추가
```

- 오라클 전용문법
    
```sql
--[oracle전용] : 오라클전용문법은 join순서 중요하지 않음 
select *
from
    employee e, department d
where
    e.dept_code(+) = d.dept_id;
```


#### 3. full outer join(실무에서 쓸 일 거의 없음)

- 양쪽 테이블의 모든 행 포함.
- 서로 매칭되는 행이 없다면 모든 null로 채워서 처리
- full outer join은 [oracle 전용문법]이 없다

```sql
select
    *
from
    employee e full outer join department d
        on e.dept_code = d.dept_id; -- 27 (22 + 5) 쓸 일 거의 없음
```

### CROSS JOIN(쓸데없음)

- 상호조인
- Cartesian Product(카테시안곱) - 모든 경우의 수
- 좌우측 테이블이 상대테이블의 행과 만날 수 있는 모든 경우

```sql
select 
    *
from   
    employee e cross join department d; --216(24 * 9)
```

- 오라클전용
    
```sql
select
    *
from
    employee e, department d;
```


### SELF JOIN

- 같은 테이블을 연결하는 조인
- 사원명, 관리자명을 조회
- 담당, 구성, 연락  → 데이터가 서로 포함관계를 가지는 경우 사용

```sql
--사원명, 관리자명을 조회
-- manager_id가 null인 사원, 관리자가 아닌 사원은 제외
select
    e1.emp_id 사번,
    e1.emp_name 사원명,
    e1.manager_id 관리자사번, 
--    e2.emp_id 관리자사번, -- manager_id or emp_id 둘 다 사용가능
    e2.emp_name 관리자명
from
    employee e1 left join employee e2
        on e1.manager_id = e2.emp_id;
```

- 오라클 전용문법
    
```sql
select
    e1.emp_name,
    e2.emp_name
from
    employee e1, employee e2
where
    e1.manager_id = e2.emp_id(+);

select emp_id, emp_name, manager_id 
from
    employee;
```


### MULTIPLE JOIN

- 여러 테이블을 조인
- left join으로 추가된 행이 누락되지 않도록 연속적으로 left join 처리해야한다.
- join되는 순서가 중요하다.

```sql
-- 사원명(employee.emp_name), 직급명(job.job_name),부서명(department.dept_title), 
-- 지역명(locarion.local_name), 국가명(nation.national_naem)

select
    e.emp_name,
    j.job_name,
    d.dept_title,
    l.local_name,
    n.national_name
from
    employee e 
        left join job j
            on e.job_code = j.job_code
        left join department d
            on e.dept_code = d.dept_id
        left join location l
            on d.location_id = l.local_code
        left join nation n 
            on l.national_code = n.national_code;
```

- 오라클 전용문법
    
```sql
select
    *
from
    employee e, department d, location l, nation n --오라클문법에서 테이블 나열순서는 상관없다.
where                          --테이블 순서는 where에서 중요하다.
    e.dept_code = d.dept_id(+) --left와 동일하게 연속처리해줘야 null값이 살아있다.
    and
    d.location_id = l.local_code(+)
    and
    l.national_code = n.national_code(+);
```


```sql
-- 직급이 대리이면서 ASIA지역에 근무하는 직원 조회
-- (사번, 이름, 직급명, 부서명, 근무지역명,급여)

select
e.emp_id 사번,
e.emp_name 이름,
j.job_name 직급명,
d.dept_title 부서명,
to_char(e.salary, 'fml999,999,999') 급여,
n.national_name 근무지역명,
l.local_name
from
employee e 
    left join job j
        on e.job_code = j.job_code
    left join department d
        on e.dept_code = d.dept_id
    left join location l
        on d.location_id = l.local_code
    left join nation n 
        on l.national_code = n.national_code
where 
j.job_name = '대리' and l.local_name like 'ASIA%';
```

- 오라클 전용문법
    
```sql
select
    e.emp_id 사번,
    e.emp_name 이름,
    j.job_name 직급명,
    d.dept_title 부서명,
    to_char(e.salary, 'fml999,999,999') 급여,
    n.national_name 근무지역명,
    l.local_name
from
    employee e, job j, department d, location l, nation n
where
    e.job_code = j.job_code(+)
    and
    e.dept_code = d.dept_id(+)
    and
    d.location_id = l.local_code(+)
    and
    l.national_code = n.national_code(+)
    and
    j.job_name = '대리' and l.local_name like 'ASIA%';
```


### 테이블 별칭의 중요성

- **동일한 컬럼명을 사용하는 경우 테이블별칭은 필수다**

```sql
select
    emp_name,
    job_name,
from 
    employee  join job 
            on job_code = job_code;
// [에러] ORA-00918: 열의 정의가 애매합니다
-----------------------------------
select
    emp_name,
    job_name,
		e.job_code,
    j.job_code
from 
    employee **e** join job **j --동일한 컬럼명을 사용하는 경우 테이블별칭은 필수다.**
            on e.job_code = j.job_code;
```

- **컬럼명이 유일하면 테이블 별칭을 생략할 수 있다.**

```sql
select
    *   
from
    employee e join department d
        on dept_code = dept_id;
```

- 동일한 컬럼명을 사용하는 경우, on 조건절 대신 using절을 사용할 수 있다.
- 해당컬럼은 별칭으로 접근할 수 없다.

```sql
select
    job_code
from
    employee e join job j
        using(job_code);
```

### using ( 별칭을 사용할 수 없어서 비추천)

- 동일한 컬럼명을 사용하는 경우, on조건절 대신 using절을 사용할 수 있다.
- 해당컬럼은 별칭으로 접근할 수 없다.

```sql
select
		* --> e.* -- 오류
    job_code -- j.job_code 오류
from
    employee e join job j
        using(job_code);

**=> 별칭을 사용하는건 전부 오류가 남**
```

#### 수업시간예제

```sql
-- 사원정보 조회(사원명,부서코드, 급여, 부서별 평균급여)
select
    emp_name,
    job_code,
    salary
    
from
    employee ;

select
trunc(avg(salary))"평균"
from
employee;

select
    e.emp_name 사원명,
    nvl(e.dept_code, '인턴') 부서코드, -- 실제 출력할 때는 여기에 명시
    to_char(e.salary, 'fml999,999,999') 급여,
    to_char(t.avg_sal,'fml999,999,999') "부서별 평균 급여"
from
    employee e left join (select 
                                trunc(avg(salary)) avg_sal, 
                                dept_code 
                          from 
                                employee 
                          group by 
                                dept_code) t
        on nvl(e.dept_code, 'D0') = nvl(t.dept_code,'D0'); -- 비교할 때만 사용
```

## 🧐NON-EQUI JOIN ⇒ 동등비교(=)

- 동등비교(=)가 조인조건을 사용하는 경우

```sql
-- employee.salary를 통해 급여등급 조회
select
    e.emp_name,
    e.salary,
    s.*
from 
    employee e join sal_grade s
        on e.salary between s.min_sal and s.max_sal;
```

- 오라클 전용문법
    
```sql
select
    *
from
    employee e, sal_grade s
where
    e.salary between s.min_sal and s.max_sal;
```


#### 실습문제 03/17

```sql
/*
1. 2020년 12월 25일이 무슨 요일인지 조회하시오.
*/
select
    to_char(to_date('2020/12/25','yyyy/mm/dd'),'yyyy/mm/dd(day)')
from
    dual;

/*
2. 주민번호가 70년대 생이면서 성별이 여자이고, 성이 전씨인 직원들의 
사원명, 주민번호, 부서명, 직급명을 조회하시오.
*/
select
    e.emp_name 사원명,
    e.emp_no 주민번호,
    d.dept_title 부서명,
    j.job_code 직급명
from
    employee e
        join job j
            on e.job_code = j.job_code
        join department d
            on e.dept_code = d.dept_id
where
        substr(emp_no,1,1) = '7' 
    and
        substr(emp_no,8,1) in('2','4')
    and 
        emp_name like '전%';

    

/*
3. 가장 나이가 적은 직원의 사번, 사원명, 나이, 부서명, 직급명을 조회하시오.
*/
select 
    e.emp_id 사번, 
    e.emp_name 사원명, 
    trunc(months_between(sysdate, to_date((decode(substr(emp_no,8,1),'1',1900,'2',1900,2000)+substr(emp_no,1,2)) || substr(emp_no,3,4)))/12) 나이,
    d.dept_title,
    j.job_code
from employee e
        left join job j
            on e.job_code = j.job_code
        left join department d
            on e.dept_code = d.dept_id;
--
select min(extract(year from sysdate)-(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))-substr(emp_no,1,2)+1) min_age from employee;
select emp_id 사번
     , emp_name 사원명
     , extract(year from sysdate)-(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))-substr(emp_no,1,2)+1 나이
     , dept_title 부서명
     , job_name 직급명
     , k.min_age
from employee 
 cross join (select min(extract(year from sysdate)-(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))-substr(emp_no,1,2)+1) min_age from employee)
 left join department on dept_code = dept_id
 left join job  using(job_code)
where 
    extract(year from sysdate)-(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))-substr(emp_no,1,2)+1 = min_age;
--
SELECT EMP_ID 사번
       , EMP_NAME 사원명
       , EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(EMP_NO,8,1),'1',1900,'2',1900,2000))-SUBSTR(EMP_NO,1,2) + 1 AS 나이
       , DEPT_TITLE 부서명
       , JOB_NAME 직급명
FROM EMPLOYEE E
    JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID)
    JOIN JOB J ON(E.JOB_CODE = J.JOB_CODE)
WHERE 
    EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(EMP_NO,8,1),'1',1900,'2',1900,2000))-SUBSTR(EMP_NO,1,2) + 1 =
(SELECT MIN(EXTRACT(YEAR FROM SYSDATE)-(DECODE(SUBSTR(EMP_NO,8,1),'1',1900,'2',1900,2000))-SUBSTR(EMP_NO,1,2)+1) FROM EMPLOYEE);
--
select 
    e.*,
    extract(year from sysdate)-(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))-substr(emp_no,1,2)+1 나이,
    k.min_age
from 
    employee e
        cross join (select min(extract(year from sysdate)
        -(decode(substr(emp_no,8,1),'1',1900,'2',1900,2000))
        -substr(emp_no,1,2))+1 min_age from employee) k;

/*
4. 이름에 '형'자가 들어가는 직원들의 사번, 사원명, 부서명을 조회하시오.
*/
select
    e.emp_id 사번,
    e.emp_name 사원명,
    d.dept_title 부서명
    
from employee e
         join department d
            on e.dept_code = d.dept_id
where 
    e.emp_name like '%형%';

--
SELECT 
    EMP_ID, EMP_NAME, DEPT_TITLE
FROM 
    EMPLOYEE E
        LEFT JOIN DEPARTMENT D 
            ON(E.DEPT_CODE = D.DEPT_ID)
WHERE 
    EMP_NAME LIKE '%형%';

/*
5. 해외영업팀에 근무하는 사원명, 직급명, 부서코드, 부서명을 조회하시오.
*/
select
    e.emp_name 사원명,
    j.job_name 직급명,
    e.dept_code 부서코드,
    d.dept_title 부서명
from employee e
         join job j
            on e.job_code = j.job_code
         join department d
            on e.dept_code = d.dept_id
where
    d.dept_title like '해외영업%';

/*
6. 보너스포인트를 받는 직원들의 사원명, 보너스포인트, 부서명, 근무지역명을 조회하시오.
*/
select
    e.emp_name 사원명,
    e.bonus 보너스포인트, 
    d.dept_title 부서명,
    l.local_name 근무지역명
    
from employee e
        left join department d
            on e.dept_code = d.dept_id
        left join location l
            on d.location_id = l.local_code
        left join nation n 
            on l.national_code = n.national_code
where
    e.bonus is not null;
/*
7. 부서코드가 D2인 직원들의 사원명, 직급명, 부서명, 근무지역명을 조회하시오.
*/
select
    e.emp_name 사원명,
    j.job_name 직급명,
    d.dept_title 부서명,
    l.local_name 근무지역명
    
from employee e
        left join job j
            on e.job_code = j.job_code
        left join department d
            on e.dept_code = d.dept_id
        left join location l
            on d.location_id = l.local_code
        left join nation n
            on l.national_code = n.national_code
where e.dept_code like 'D2';

/*
8. 급여등급테이블의 등급별 최대급여(MAX_SAL)보다 많이 받는 직원들의 사원명, 직급명, 급여, 연봉을 조회하시오.
(사원테이블과 급여등급테이블을 SAL_LEVEL컬럼기준으로 동등 조인할 것)
*/

select 
    e.emp_name 사원명,
    j.job_name 직급명,
    to_char(e.salary, 'fml999,999,999') 급여,
    to_char((e.salary * 12),'fml999,999,999') 연봉
from employee e
    join sal_grade s
        on e.sal_level = s.sal_level
    join job j
        using(job_code)
where
    s.max_sal < e.salary; 
    
--
select emp_name
      , job_name
      , salary
      , (salary + salary * nvl(bonus,0)) * 12 annual_sal
      , max_sal
from employee e
 join job j on(e.job_code = j.job_code)
 join sal_grade s using(sal_level)
where e.salary > s.max_sal;
    
/*
9. 한국(KO)과 일본(JP)에 근무하는 직원들의 
사원명, 부서명, 지역명, 국가명을 조회하시오.
*/
select 
    e.emp_name 사원명,
    d.dept_title 부서명,
    l.local_name 지역명,
    n.national_name 국가명
from
    employee e
        left join job j
            using(job_code)
        left join department d
            on e.dept_code = d.dept_id
        left join location l
            on d.location_id = l.local_code
        left join nation n
            on l.national_code = n.national_code
where
    n.national_name in ('한국', '일본');

/*
10. 같은 부서에 근무하는 직원들의 사원명, 부서코드, 동료이름을 조회하시오.
self join 사용
*/

select
    e1.emp_name 사원명,
    e1.dept_code 부서코드,
    e2.emp_name 동료이름           
from 
    employee e1
        join employee e2
            on e1.dept_code = e2.dept_code
where
    e1.emp_name != e2.emp_name
order by 2;

--select e.emp_name 사원명
      , dept_title 부서명
      , e2.emp_name 동료사원명
from employee e
 join employee e2 on(e.dept_code = e2.dept_code)
 left join department d on e.dept_code = dept_id
where e.emp_name != e2.emp_name
order by 1;

/*
11. 보너스포인트가 없는 직원들 중에서 직급이 차장과 사원인 직원들의 사원명, 직급명, 급여를 조회하시오.
*/
select
    e.emp_name 사원명,
    j.job_name 직급명,
    to_char(e.salary,'fml999,999,999') 급여
from employee e
    join job j
        using(job_code)
where 
    bonus is null and job_name in ('차장','사원');

/*
12. 재직중인 직원과 퇴사한 직원의 수를 조회하시오.
*/
select
    count(decode(quit_yn, 'N', 1)) || '명' "재직중인 직원 수",
    count(decode(quit_yn, 'Y', 1)) || '명' "퇴사한 직원 수"
from
    employee;
--
select decode(quit_yn,'N','재직','퇴사') 재직여부
     , count(*) 인원수
from employee
group by quit_yn;
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
