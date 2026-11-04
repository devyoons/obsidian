---
별칭:
  - "강의 - DB정규화"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/55c4c588c7cd4cada8e9b59bbe0a599d
---

# 강의: DB정규화

## 강의 내용

## 정규화 Normalization 란

고유한 식별자를 가지는 모든 개체(테이블)에 대해 더 이상 분리할 수 없는 상태로 나누는 과정을 말한다. 정규화 과정을 통해 불필요하게 **중복된 데이터 제거** 작업을 하게 된다.

정규화를 통한 개체의 분리는 관계가 있는 개체간의 참조 관계로 **데이터를 유지 보수하게 된다.** 정규화 수준을 높이면 데이터량이 줄고 데이터 갱신 속도가 빠르며 같은 자료가 여러 개체에 분산된 것보다 **일관성을 유지하기 쉽다.** 그러나 관계된 **여러 속성을 동시에 조회하는 작업을 수행하기 위해서는 여러 개체를 JOIN하여 작업해야 하는 어려움이 있을 수 있다.**

또 갱신 작업에 있어 여러 개체(테이블)에 동시에 반영해야 하는 작업의 경우는 명시적으로 트랜잭션 처리해야 하는 수고가 따른다. 따라서 **먼저 정규화 과정을 수행**하고 **수행속도나 프로그램을 구현하기 어려운 경우에는 비정규화(역정규화) 과정으로 문제를 보완**하게 된다.

> 정규화 된 정도를 정규형(Normal Form) 으로 표현하는데, 정규형에는 1NF, 2NF, 3NF, BCNF, 4NF, 5NF 까지 있다. 비공식적 표현으로는 **3NF 가 되었으면 정규화** 되었다고 말한다. **3NF 테이블의 대부분이 삽입, 변경, 삭제 이상이 없으며**, 3NF 테이블의 대부분이 BCNF, 4NF, 5NF를 만족한다. 규화 목적
> 
1. 중복 데이터를 제거해서 무결성을 유지한다.
2. 이상현상(anomaly)을 방지한다.
    - Insertion Anomaly 삽입이상
        - 릴레이션 R에서 특정 투플을 삽입할 경우 원하지 않는불필요한 정보까지도 삽입해야 하는 현상
    - Update Anomaly 갱신이상
        - 릴레이션 R에서 특정 속성값 갱신 시 중복 저장되어 있는 속성값 중 하나만 갱신하고, 나머지는 갱신하지않아서 발생하는 데이터의 불일치 현상(Data Inconsistency)
    - Deletion Anomaly 삭제이상
        - 릴레이션 R에서 특정 투플을 삭제할 경우 원하지 않는정보까지도 삭제되는 현상

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/anomaly/anomaly|anomaly]]

### 함수종속성

```
X -> Y
```

- X 는 결정자, Y 는 종속자라고 한다.
- X 가 Y 를 함수적으로 결정한다.
- Y 가 X 에 함수적으로 종속되어 있다.

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/Functional Dependency/Functional Dependency|Functional Dependency]]

#### 완전/부분 함수적종속

<aside>
💡 복합 PK인 경우, 완전/부분 함수적종속를 따져본다.

</aside>

- 부분 함수적 종속 : 속성집합 Y 가 속성집합 X 의 전체가 아닌 일부분에도 함수적으로 종속됨
- 완전 함수적 종속 : 속성집합 Y 가 속성집합 X 전체에 대해서만 함수적으로 종속

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/Full Partial Functional Dependency/Full Partial Functional Dependency|Full/Partial Functional Dependency]]

### 정규화 절차

![](http://www.jidum.com/upload/ckeditor/2016/07/20160725104543185.png)

## 1NF

릴레이션에 속한 모든 속성의 도메인이 원자 값으로만 구성되어야 함.

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_1nf/before_1nf|before_1nf]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_1nf/after_1nf|after_1nf]]

## nullnull한 데이터

<aside>
💡 컬럼이 원자값을 가지게 하려고, 컬럼수를 늘린다면?

</aside>

테이블에서 교재 컬럼의 개수는 교육원의 과정들 중에서 가장 많은 교재를 사용하는 과정을 기준으로 설정되어야 하며 아래의 견본 데이터에서는 5권이라 가정했다.

이렇게 데이터가 들어갈 경우 교재가 5권인 웹프로그래밍의 컬럼들은 모두 채워지지만 그 외의 과목은 최소 1개 이상의 NULL 값이 들어가지게 된다. 테이블에 NULL값이 많다는 것은 쓸데없는 데이터 저장공간의 낭비이다.

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/nullnull/nullnull|nullnull]]

## 2NF

**부분함수 종속성 제거**하고 테이블의 모든 컬럼이 **완전 함수적 종속적** 일 것.

- 부분함수 종속 : 복합 기본키 중에 특정 컬럼에만 종속된 경우
- 완전함수 종속 :  복합 기본키 모든 컬럼에 종속된 경우

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_1nf/after_1nf|after_1nf]] 에서 기본키는 `student_id, class_id` 이지만,  student_name은 student_id에만 부분종속이며, class_name은 class_id에 부분 종속이므로 별도로 분리한다.

부모테이블 student, class를 생성

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_student/after_2nf_student|after_2nf_student]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_class/after_2nf_class|after_2nf_class]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_grade/after_2nf_grade|after_2nf_grade]]

## 3NF

기본키를 제외한 속성들 간의 **이행적 함수 종속이 없는 것.**

기본키를 제외하고, 한 속성은 다른 속성에 종속적이지 않아야 한다. 

<aside>
💡 이행적 함수 종속 Transitive Functional Dependency  이란?
X, Y, Z 에 대해 `X->Y` 이고 `Y->Z` 이면 `X->Z` 가 성립한다면, 이를 Z 가 X 에 이행적으로 함수 종속되었다고 한다.

</aside>

아래 경우에서는 `student_id → dept_id → dept_name, tuition` 관계가 성립한다.

> 홍길동학생은 교육심리학과에 다니며, 350,0000원 학비를 낸다.  
이는 s001(결정자)을 통해 d001(종속자)를 알고, d001(결정자)를 통해 교육심리학과, 3500000(종속자)를 알수 있는 것이다.
> 

(학과별로 학비가 다르다)

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_3nf_student/before_3nf_student|before_3nf_student]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student|after_3nf_student]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student/after_3nf_student|after_3nf_student]]

## BCNF

3NF을 만족하면서 <u>결정자 중에서 후보키가 아니면 제거</u>한다.

3NF보다 조금 더 엄격한 제약조건을 가지기 때문에 `Strong 3NF`라고도 한다.

<aside>
💡 후보키가 1개 밖에 없는 경우는,  3NF 를 만족시키면, BCNF 도 만족한다.

</aside>

#### 조건

- 한 교수는 한 과목만 가르칠수 있다. → 교수를 알면 과목을 알수 있다.
- 한 과목은 여러 교수가 가르칠 수 있다. → 과목으로 교수를 알수 없다.

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_bcnf/before_bcnf|before_bcnf]]

위 상황에서 기본키는 `student_id, class_id` 이다. 

- <u>super key</u>  유일성을 만족하는 하나 이상의 속성(컬럼)의 집합.
    - `student_id, class_id`
    - `student_id, professor_id`
        - 교수는 한과목만 가르칠 수 있으므로, 교수를 알면 과목을 알수 있다. 즉, 어느 수업의 학점인지 구분할 수 있다.
    - `student_id, class_id, professor_id`
    - 위 3가지에 grade가 더해진 경우도 유일성을 확보한다.
- <u>candidate key 후보키</u>  super key(유일성) 중에서 최소성(컬럼수)를 만족하는 키
    - `student_id, class_id` PK
    - `student_id, professor_id` alternate key 후보키중 PK로 선정되지 못한키
    

현재상황

- `student_id, class_id → professor_id`  이므로 완전 함수 종속되므로, 2NF를 만족한다.
    - 한 과목은 여러 교수가 가르칠 수 있기때문에 class_id 만으로는 professor_id를 알수 없다.
- professor_id, grade 사이에는 이행적 함수 종속이  없으므로 3NF를 만족한다.
- 한 교수는 한 과목을 가르칠 수 있으므로,  `professor_id → class_id` 함수적 종속관계가 있다.
    - 즉, professor_id(결정자)가  후보키가 아닌 상황이므로 BCNF 위반이다.
    - <u>결정자인 professor_id를 원래 테이블에 남기고, `professor_id → class_id` 종속관계를 표현할 테이블이 더 필요하다.</u>
    

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_bcnf_student_class/after_bcnf_student_class|after_bcnf_student_class]]

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_bcnf_professor/after_bcnf_professor|after_bcnf_professor]]

---

## @실습문제

1. 다음 학사 데이터베이스 테이블을 적절히 정규화하세요

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization|before_normalization]]

2. 다음 판매 데이터베이스 테이블을 적절히 정규화하세요

[[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization/before_normalization|before_normalization]]

## 역정규화

데이터베이스의 물리적 설계 과정에서 성능을 향상시키기 위해 역정규화를 실행.

<aside>
💡 정규화된 릴레이션은 하나의 릴레이션을 분해하기 때문에 원하는 자료가 하나의 릴레이션에 존재하지 않아 외래키를 이용해 참조해야한다. 이는 데이터베이스에 저장된 자료를 검색하는 시간을 증가시키며 성능을 저하시킬수 있다.

</aside>

1. Relation 역정규화
    - Relation 병합
    - Relation 분할
        - 릴레이션의 데이터를 검색할때는 목록중의 데이터를 순차적으로 테이블 검색. 자주 사용하지 않는 속성이나 튜플이 릴레이션에 있을 경우 검색시 성능을 저하를 야기함. 이 경우에는 자주 사용하는 속성이나 튜플을 분해하여 성능을 향상시킬 수 있다.
        - 수직분할 : 자주 사용하지 않는 속성(컬럼) 분할
        - 수평분할 : 자주 사용하지 않는 튜플(행) 분할
2. Attribute 역정규화
    - 릴레이션의 성능을 향상시키기 위해 속성 또는 파생속성을 추가
        
        <aside>
        💡 파생 속성(Delivered Attribute) 이란? 
        현재 릴레이션에는 없는 속성이지만 작업의 효율을 위해 힌 속성으로부터의 계산이나 가공에 의해 파생되는 속성
        
        </aside>

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student 9999-a8c9/s001|s001]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student 9999-a8c9/s002|s002]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBM101|DBM101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBM101 (2)|DBM101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBM102|DBM102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBM102 (2)|DBM102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO101|DBO101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO101 (2)|DBO101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO101 (3)|DBO101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO101 (4)|DBO101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO102|DBO102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/DBO102 (2)|DBO102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/JAVA101|JAVA101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/JAVA101 (2)|JAVA101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/JAVA102|JAVA102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/JAVA102 (2)|JAVA102]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/OSL101|OSL101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization fa21-6228/OSL101 (2)|OSL101]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/Full Partial Functional Dependency/Full Partial Functional Dependency|Full Partial Functional Dependency]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/Functional Dependency/Functional Dependency|Functional Dependency]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_1nf/after_1nf|after_1nf]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_class/after_2nf_class|after_2nf_class]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_grade/after_2nf_grade|after_2nf_grade]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_2nf_student/after_2nf_student|after_2nf_student]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student/after_3nf_student|after_3nf_student]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_3nf_student|after_3nf_student]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_bcnf_professor/after_bcnf_professor|after_bcnf_professor]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/after_bcnf_student_class/after_bcnf_student_class|after_bcnf_student_class]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/anomaly/anomaly|anomaly]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_1nf/before_1nf|before_1nf]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_3nf_student/before_3nf_student|before_3nf_student]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_bcnf/before_bcnf|before_bcnf]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization/before_normalization|before_normalization]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/before_normalization|before_normalization]]
- [[02 - 학습/KH 교육과정 2022/수업 필기/DB정규화/nullnull/nullnull|nullnull]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
