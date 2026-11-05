---
별칭:
  - "강의 - SET OPERATOR 집합연산자(union)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/708e0b004e084946a38ffd7f016febd4
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: SET OPERATOR 집합연산자(union)

## 강의 내용

---

---

### SET OPERATOR

#### 유의사항

- 여러 결과집합을 세로로 연결후 하나의 가상테이블을 생성한다.
- select절의 컬럼수가 동일
- select절의 해당컬럼의 자료형이 상호호환 가능(char, varchar2 상호호환)
- 컬럼명이 다른 경우, 첫번째 컬럼집합의 컬럼명을 사용
- order by절은 마지막 결과집합에 한번만 사용가능

**수업예제**

```sql
select
    'a' "aaaa",123,sysdate
from
    dual
union
select
    'b' "bbbb",456,sysdate
from
    dual;

--위아래로 붙인다.
		'aaaa' 123 sysdate
--------------------
1  |  a    123 22/03/18 
2  |  b    456 22/03/18 
```

#### 연산자 종류

1. **union 합집합** : 두 결과집합을 합친 후 중복제거, 첫번째 컬럼기준 오름차순 정렬.
2. **union all 합집합** : 두 결과집합을 모두 포함. `작업속도 빠름`
3. **intersect 교집합** : 교집합의 값을 리턴한다.
4. **minus 차집합** : 먼저 선언된 쿼리의 모든 값에서 이후에 선언된 쿼리의 중복값을 제거후 출력

### union 과 union all

**union all** : 두개의 결과집합을 추가작업 없이 그냥 연결한다. 작업속도 빠름

**union** : 두개의 결과집합을 합친 후, 중복된 행을 제거, 첫번째 컬럼 기준 오름차순정렬

```sql
-- 부서코드가 dept_code 'D5'인 조회
-- salary가 300만원이상인 사원 조회

select emp_id,emp_name,dept_code,salary
from   employee
where  dept_code = 'D5'

union -- 중복된 행 제거해서 총 13행 / union all 하면 중복된 행 제거없이 총 15행

select emp_id,emp_name,dept_code,salary
from   employee
where  salary >= 3000000;
```

#### intersect 와 minus

**intersect** : 중복된 행만 출력, 모든 컬럼값이 같을 때 중복으로 취급.

**minus** : 첫번째 결과집합에서 두번째 결과집합과의 중복된 행을 제거후 출력

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/4689ae7f_Untitled.png]]

```sql
select
    emp_id,emp_name,dept_code,salary
from    
    employee
where
    dept_code = 'D5'

minus --부서코드가 'D5'이고 salary가 300만원이하인 사원 조회
intersect -- 부서코드가 'D5'이고 salary가 300만원이상인 사원 조회

select
    emp_id,emp_name,dept_code,salary
from    
    employee
where
    salary >= 3000000;
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
