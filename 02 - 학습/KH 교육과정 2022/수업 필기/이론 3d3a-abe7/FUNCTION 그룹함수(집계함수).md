---
별칭:
  - "강의 - FUNCTION 그룹함수(집계함수)"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/17b4f0569b1043c692dfa871ddf43cf3
---

# 강의: FUNCTION 그룹함수(집계함수)

## 강의 내용

---

---

## 그룹함수

- 그룹단위로 처리되는 함수
- group by 지정이 없다면 전체행을 하나의 그룹으로 처리
- 일반컬럼과 혼용해 쓸 수 있다.

---

### 그룹함수 자주사용하는 함수

**SUM** : 해당 열의 총 행의 합계를 구하는 함수

**AVG** : 해당 열의 총 행의 평균을 구하는 함수

**COUNT** : 행의 건수를 카운트 하는 함수

**MIN** : 해당 열의 총 행중에 최소 값을 구하는 함수

**MAX** : 해당 열의 총 행중에 최대 값을 구하는 함수

---

#### sum(컬럼) : 총합리턴 / avg(컬럼) : 평균

```sql
select
--  emp_name, --> ORA-00937: 단일 그룹의 그룹 함수가 아닙니다
    sum(salary), --74576240
    trunc(avg(salary)) --3107343
from
    employee;

-- 컬럼값이 null인 경우, 그룹함수에서 제외된다.
select
    sum(bonus) --null 제외하고 계산됨 --1.95
from
    employee;

-- 실급여 합계구하기(가상컬럼)
select
    sum(salary + (salary * nvl(bonus, 0))) --81777424
from   
    employee;
```

#### count(컬럼) : 해당컬럼이 null이 아닌 행의 수를 리턴

- count하는데에 null은 제외된다.

```sql
-- count(컬럼) : 해당컬럼이 null이 아닌 행의 수를 리턴
select
    count(bonus), --9
    count(dept_code), --22
    count(*) -- *는 한행을 의미, 행이 존재하면 카운팅.  --24
from
    employee;
--
select
    count(*)
from
    employee
where
    bonus is not null; --9 // is null '15'
    
-- sum을 이용해 bonus 받는 사원 조회
select
    sum(
        case
            when bonus is null then 0
            when bonus is not null then 1
        end --9
    ),
    count(bonus) --9
from
    employee;
```

#### max / min ⇒ 숫자, 날짜, 문자열(사전등재순)

```sql
select
    max(salary), --8000000
    min(salary), --1380000
    max(hire_date), -- 미래 > 과거 17/06/19
    min(hire_date), --             90/02/06
    max(emp_name), -- ㅎ > ㄱ      하이유
    min(emp_name)  --              고두밋
from
    employee;
```

#### 수업시간 예제

```sql
-- 1. 남자사원의 급여 총합을 조회
select
   to_char(sum(salary),'FML999,999,999') 급여총합
from
    employee
where
    substr(emp_no, 8, 1) in (1, 3);
    
-- 2. 부서코드가 D5인 사원들의 보너스 총합 조회 (보너스금액)
select
    to_char(sum(salary * nvl(bonus, 0)),'fml999,999,999')
from
    employee
where
    dept_code = 'D5';
-- 3. 남/여 사원의 급여 총합/평균 조회
select
    to_char(sum(salary),'fml999,999,999') 급여총합,
    ro_char(trunc(avg(salary))) 급여평균
    
from
    employee
where
--  substr(emp_no, 8, 1) in (1, 3);
    substr(emp_no, 8, 1) in (2, 4);
    
-- 남자사원급여 가상컬럼, 여자사원급여 가상컬럼
select
    decode(substr(emp_no, 8, 1), '1', '남', '3', '남', '여') 성별,
    decode(substr(emp_no, 8, 1), '1', salary, '3', salary, 0) 남자사원급여만,
    decode(substr(emp_no, 8, 1), '2', salary, '4', salary, 0) 여자사원급여만
from 
    employee;
    
select
    sum(decode(substr(emp_no, 8, 1), '1', salary, '3', salary)) 남자사원급여총합,
    avg(decode(substr(emp_no, 8, 1), '1', salary, '3', salary)) 남자사원급여평균,
    sum(decode(substr(emp_no, 8, 1), '2', salary, '4', salary)) 여자사원급여총합,
    avg(decode(substr(emp_no, 8, 1), '2', salary, '4', salary)) 여자사원급여평균
from
    employee;

-- 4. 전사원의 보너스율 평균을 소수점 둘째자리까지 반올림처리해서 출력
select
    round(avg (nvl(bonus, 0)),2) "보너스율 평균" --24명의 평균
--  avg(bonus), -- 9명의 평균

from
    employee;
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
