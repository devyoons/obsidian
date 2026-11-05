---
별칭:
  - "강의 - GROUP BY, HAVING"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/4fe304a8cb4e4db78c8c55896909e9ab
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: GROUP BY, HAVING

## 강의 내용

---

---

## GROUP BY

**from ⇒** **where ⇒** **group by ⇒** **having ⇒** **select ⇒** **order by**

- GROUP BY는 **반드시 집계함수, 그룹함수와 함께 사용**
- 별도의 그룹지정이 없다면 그룹함수는 전체를 하나의 그룹으로 간주한다.
- 세부적 그룹지정을 group by절을 이용할 수 있다.
- select에는 group by에서 명시한 컬럼만 사용할 수 있다.
- **GROUP BY**로 집계된 결과 중 원하는 값을 조회하기 위해
**HAVING**절을 통해 조건절을 추가할 수 있다.

---

### group by 예제

```sql
-- 부서별 급여 평균
select
    dept_code,
    avg(salary)
from
    employee
group by
    dept_code
order by
    dept_code;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/7c0febd2_Untitled.png]]

```sql
-- 부서별 사원수를 조회
select
    nvl(dept_code,'인턴') 부서,
    count(*) 사원수
from
    employee
group by
    dept_code 
--select에는 group by에서 명시한 컬럼만 사용
order by
    1;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c49c937b_Untitled.png]]

```sql
-- 성별 사원수를 조회
-- 가상컬럼을 기준 그룹핑 가능
select
    decode(substr(emp_no, 8, 1), 
		'1', '남', '3', '남', '여') 성별,
    count(*) 사원수 -- 남15, 여 9
from
    employee
group by
    decode(substr(emp_no, 8, 1), 
		'1', '남', '3', '남', '여');
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/9666bcf0_Untitled.png]]

```sql
-- 부서별 직급별 인원수
select
    dept_code, 
    job_code,
    count(*)
from
    employee
group by
    dept_code, job_code
order by
    1,2;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/e855dfbb_Untitled.png]]

```sql
-- 부서별 성별 인원수
select
    nvl(dept_code, '인턴'),
    decode(substr(emp_no, 8, 1), 
		'1', '남', '3','남', '여') gender,
    count(*) 
from
    employee
group by
    dept_code,
    decode(substr(emp_no, 8, 1), 
		'1', '남', '3','남', '여')
order by
    1,2;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/9350c899_Untitled.png]]

#### rollup 소계를 처리함

- 0이면 실제 데이터
- 1이면 rollup에 의해 생성된 데이터

```sql
select
    dept_code,
    count(*)
from
    employee
group by
    rollup(dept_code)
order by
    dept_code;
```

![7. 인턴이고 
8. 총합인데 단순 nvl로하면 문제가 있다.](../../../../attachments/ec235c26-6713-4649-af75-a6784aeed3f5/Untitled.png)

7. 인턴이고 
8. 총합인데 단순 nvl로하면 문제가 있다.

<aside>
❓ 위 예제를 해결할 방법은 `grouping`

</aside>

```sql
select
--  dept_code,
--  grouping(dept_code), 
--  0이면 실제 데이터, 1이면 rollup에 의해 생성된 데이터
    decode(grouping(dept_code), 0, nvl(dept_code,'인턴'),1 , '총계') dept_code,
    count(*)
from
    employee
group by
    rollup(dept_code)
order by
    dept_code;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/042a46c6_Untitled.png]]

---

### **HAVING**

**from ⇒** **where ⇒** **group by ⇒** **having ⇒** **select ⇒** **order by**

- grouping한 결과행에 대해 조건절을 작성
    - group by를 사용해서 값을 묶은 뒤에는 묶은 내용에 where을 사용할 수 없다.
    - where대신 having사용
- having절은 group by절과 함께 사용된다.
- COUNT, SUM, AVG, MAX, MIN 등 **집계함수**를 사용하여 조건을 부여할 수 있다.

---

#### having 사용예제

```sql
-- 부서별 급여평균이 300만원 이상인 부서들만 조회(부서명, 급여평균)
select
    dept_code,
    avg(salary)
from
    employee
group by
    dept_code
having 
    avg(salary) >= 3000000;
-------------------------------------------------
dept_code | avg(salary)
D9        | 5900000
D6        | 3366666.66666666666666666666666666666667
```

```sql
-- 직급별 인원수가 3명이상인 직급의 정보를 조회(직급코드, 인원수, 급여평균)
select
    job_code 직급코드,
    count(*) || '명' 인원수,
    to_char(trunc(avg(salary)),'fml999,999,999') || '원' 급여평균
from 
    employee
group by 
    job_code
having 
    count(*) >= 3
order by 
    1;
--------------------------------
직급코드   인원수   급여평균
J2         3명     ￦4,726,666원
J3         3명     ￦3,600,000원
J4         4명     ￦2,330,000원
J5         3명     ￦2,820,000원
J6         6명     ￦2,624,373원
J7         4명     ￦2,017,500원
```

```sql
-- 사원테이블에서 J3직급을 제외하고(where에서 처리, having에서 제외가능), 
-- 직급별 인원수가 3명이상인 직급의 정보를 조회(직급코드, 인원수, 급여평균)
select
    job_code 직급코드,
    count(*) || '명' 인원수,
    to_char(trunc(avg(salary)),'fml999,999,999') || '원' 급여평균
from 
    employee
where
    job_code != 'J3' 
group by 
    job_code
having 
    count(*) >= 3
order by 
    1;
--------------------------------------
직급코드   인원수   급여평균
J2         3명     ￦4,726,666원
J4         4명     ￦2,330,000원
J5         3명     ￦2,820,000원
J6         6명     ￦2,624,373원
J7         4명     ￦2,017,500원
```

<aside>
❓ 1. where절에서 J3제외하기
2. having절에서 J3제외하기 <둘 다 가능하지만 having에서 사용하는걸 권유>

</aside>

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
