---
별칭:
  - "강의 - DQL"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/1edb925d36234f689bc4ea18525ac7e2
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: DQL

## 강의 내용

---

---

### SQL (structured Query Language)

관계형 데이터베이스에서 데이터를 조회하거나 조작하기 위해 사용하는 표준 언어

구조화된 질의 언어. 오라클에서 사용

- **DML (Data Manifulation Language)** : 테이블안에 데이터에 대한 것
    - —행단위—
    - INSERT : 데이터 추가
    - UPDATE : 데이터 수정 `(WHERE절 필수)`
    - DELETE :  데이터 삭제 `(WHERE절 필수)`
    - **DQL (Data Query Language)** : 데이터 검색
        - SELECT : 데이터 검색 → 컬럼 선택, 컬럼 연산, 별칭 → 필터링
- **DDL (Data Definition Language)** : 데이터 베이스에 객체에 대한 것(user, table, view,index)
    - CREATE : 생성
    - DROP : 테이블 구조 자체를 삭제
    - ALTER : 수정(MODIFY), 삭제(DROP), 추가(ADD)
    - TRUNCATE : 초기화 → 테이블의 구조는 남겨두고 데이터만 전부 삭제
- **DCL (Data Control Language)** : 사용자 권한 관리자 설정
    - GRANT : 권한 부여
    - REVOKE : 권한 해제
    - **TCL (Transaction Control Language)** : 트랜잭션 제어
        - 일괄 처리. INSERT, UPDATE, DELETE 에서만 사용
        - COMMIT : 정상적으로 저장
        - ROLLBACK : 취소
        - SAVEPOINT : 취소하려는 지점을 명시한 뒤, 그 지점까지 작업을 취소

---

### 표(Table)관련 용어

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/1c4592a8_Untitled.png]]

**Relation( = Table,Entity)** : 관계형 데이터 베이스에서 정보를 구분하여 저장하는 기본 단위.

**① row(**행), **record**(레코드), **tuple**(튜플)

**② 열**, **colume**(컬럼), **filed**(필드), 속성, **attribute**(애트리뷰트)

**③** 기본키(Primary Key)

**④** 외래키(Foreign Key)

**⑤** Null

**⑥** 컬럼값, 속성값

---

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/f46468b8_Untitled.png]]

- Relation(= Table): 관계형 데이터 베이스에서 정보를 구분하여 저장하는 기본 단위.
- Tuple(=Record): 테이블에서 행을 의미. 튜플은 릴레이션에서 같은 값을 가질 수 없다. 튜플의 수는 카디날리티(Cardinality)라고 한다.
- Attribute( =Field): 테이블에서 열을 의미. 같은 말로는 칼럼이라고도 하며 어트리뷰트의 수는 디그리(Degree)라고도 한다.
- 식별자(Identifier): 여러개의 집합체를 담고있는 관계형 데이터 베이스에서 각각의 구분할 수 있는 논리적인 개념
    - 특성
        - 유일성: 하나의 릴레이션에서 모든 행은 서로 다른 키 값을 가져야 한다.
        - 최소성: 꼭 필요한 최소한의 속성들로만 키를 구성해야 한다.
        

**Key**

데이터베이스에서 조건에 만족하는 튜플을 찾거나 순서대로 정렬할 때 튜플들을 서로 구문할 수 있는 기준이 되는 어트리뷰트.

- 후보키(Cardidate Key)
    - 릴레이션을 구성하는 속성들 중에서 튜플을 유일하게 식별하기 위해 사용하는 속성들의 부분집합.
    - 기본 키로 사용할 수 있는 속성들을 의미.
    - 모든 릴레이션에는 반드시 하나 이상의 후보키가 존재한다.
    - 유일성과 최소성을 만족시켜야 한다.
- 기본키(Primary Key) : PK
    - 후보키 중에서 선택한 Main Key이다.
    - 한 릴레이션에서 특정 튜플을 유일하게 구별할 수 있는 속성.
    - null 값을 가질 수 없다.
    - 동일한 값이 중복되어 저장될 수 없다.
- 슈퍼키(Super Key)
    - 한 릴레이션 내에 있는 속성들의 집합으로 구성된 키로서 릴레이션을 구성하는 모든 튜플들 중 슈퍼키로 구성된 속성의 집합과 동일한 값을 나타나지 않는다.
    - 릴레이션을 구성하는 모든 튜플에 대해 유일성을 만족시키지만, 최소성을 만족시키지 못한다.
    - (ex) 학번 + 주민번호를 사용하여 슈퍼키를 만들면 유일성은 만족하지만, 학번이나 주민번호 하나만 가지고도 다른 튜플들을 구분할 수 있으므로 최소성은 만족시키지 못한다.
- 외래키(Foregin Key) : FK
    - 어떤 릴레이션간의 기본키를 참조하는 속성. 테이블들 간의 관계를 나타내기 위해서 사용된다.
    - 다른 릴레이션의 기본 키를 그대로 참조하는 속성의 집합을 의미.
    - 외래키가 되는 속성과 기본키가 되는 속성의 이름은 달라도 되지만, 외래키의 속성의 도메인과 참조되는 기본키 속성의 도메인은 반드시 같아야 한다. 도메인이 같아여 연관성 있는 투플을 찾기 위한 비교 연산이 가능하기 때문이다.
    - 외래키가 없으면 2013년 1월1일에 제품을 주문한 고객의 이름을 검색할 수 없지만, 외래키가 있어서 이 날짜에 주문한 고객이 김현준임을 쉽게 알 수 있다.
    - 외래키는 기본키를 참조하지만 기본키가 아니기 때문에 null값을 가질 수 있고, 서로다른 투플이 같은 값을 가질 수 있다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/3774ada9_Untitled.png]]
    
    ---
    
    ## DQL 실행순처 / 처리 과정
    
    - Data Query Language
    - DML의 한 종류로써, 테이블데이터를 검색하는 언어
    - select명령에 대한 응답을 결과집합 (Result Set)이라호 함.
    - Result Set에는 0개 이상의 행이 포함된다. (없을 수도 있다는 말)
        - Result Set : select문을 통해 조회된 결과물(조회된 행들의 집합)
    - Result Set은 특정기준에 따라 필터링되거나 정렬될 수 있다.
    
```sql
-- 문법 순서
1. SELECT   : 원하는 컬럼 지정
2. FROM     : 조회할 대상 테이블
3. WHERE    : 특정 조건을 만족하는 행만 필터링
4. GROUP BY : 그룹핑
5. HAVING   : 그룹핑된 결과를 필터링
6. ORDER BY : 특정컬럼 기준으로 행을 정렬
```

```sql
-- 실행 순서

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
```

> **실행 순서 추상화**
> 

해당 데이터가 있는 테이블을 찾아가서 (FROM)

조건에 맞는 데이터로 필터링하고 (WHERE)

원하는 데이터로 그룹핑하고 (GROUP BY)

가공한 데이터에서 조건에 맞는 것만 (HAVING)

뽑아내서 (SELECT)

정렬한다 (ORDER BY)


---

#### INSERT : 데이터 추가(명령규칙)

```sql
INSERT INTO <테이블> VALUES <값목록>
```

**모든 필드 값을 입력하기**

- 회원가입에 대한 예시
- 옵션없이 모든 값을 입력해야하는 방식 필수적인 값만 입력받으려면 아래 예제확인

```sql
INSERT INTO MEMBER VALUES('o0o1234',1234,'김아무개','여성','2000-01-02','010-1234-1234');
```

**원하는 필드만, 원하는 순서대로 입력하기**

- 회원가입에 대한 예시
- 2개외에 나머지컬럼들은 `null값`이 들어간다.

```sql
-- ID와 PWD 위치만 알맞게 VALUES값에 입력
INSERT INTO MEMBER(ID, PWD) VALUES('o0o1234','1234');
INSERT INTO MEMBER(PWD, ID) VALUES('1234','o0o1234');
```

<aside>
❓ <MEMBER데이터 안에 있는 모든 컬럼을 꺼내볼 수 있다.>
SELECT * FROM MEMBER;

</aside>

---

#### UPDATE : 데이터 수정

- WHERE 절 필수

```sql
INSERT INTO MEMBER(ID, PWD) VALUES('o0o1234','1234');
위 데이터의 비밀번호를 아래 번호로 변경하고자 할 때

UPDATE MEMBER SET PWD = '4321' WHERE ID = 'o0o1234';
--> 조건에 맞는 사용자의 비밀번호만 변경해야함 
--> where절 없이 실행하게되면 모든 회원의 비밀번호가 '4321'로 변경됨
-------------------<PWD와 다른 컬럼을 동시 변경하려면>------------------
UPDATE MEMBER SET PWD = '4321',NAME = '-3-1234' WHERE ID = 'o0o1234';
--구분자로 ,콤마 사용
```

---

#### DELETE : 데이터 삭제

- WHERE 절 필수

```sql
INSERT INTO MEMBER(ID, PWD) VALUES('o0o1234','1234');
INSERT INTO MEMBER(ID, PWD) VALUES('abcd1234','1234');
--------------위 와 같은 데이터가 있을 때-------------------
DELETE MEMBER WHERE ID = 'abcd1234'; // 값은 소대문자를 구분함. 대문자로 검색되는 사용자X
```

---

#### SELECT문에서 정렬하는 방법

```sql
SELECT[컬럼명]FROM[테이블명]ORDER BY[컬럼명][ASC|DESC]
```

**오름차순(ASC)** : 1, 2, 3, 4, ..., ㄱ,ㄴ,ㄷ...,A,B,C...

- 오름차순은 ORDER BY의 DEFAULT 기본값이기 때문에 생략가능

**내림차순(DESC)** : 10, 9, 8, 7, 6,... 

- 내림차순은 생략불가하여 명시해야함.(큰수부터 작은수)

#### WHERE

- 대상 테이블에서 특정행을 필터링하는 구문
- 행에 대해서 조건절의 결과를 TRUE/FALSE로 구분, TRUE인 행만 결과집합에 포함시킨다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/e6da15cc_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/99f4c28c_Untitled.png]]

---

#### ORDER BY

- 마지막에 실행되며 행의 순서를 재배치한다.
- 오름차순(작은수 -> 큰수, 사전등재빠른순 -> 사전등재늦은순, 과거 -> 미래)
- 1개이상의 정렬기준컬럼을 작성가능

<aside>
❓ **ASC / DESC**

</aside>

<aside>
❓ (컬럼명)부서별로 급여많이 받는 순서

</aside>

![-nulls first 를 사용하면 null 값이 제일 앞으로 오고 기본은 last이다.
- 정렬하고 싶은 컬럼별로 콤마로 구분자로 사용하면된다.](../../../../attachments/9243b687-fab4-4dc8-8c2b-efacc8e92918/Untitled.png)

-nulls first 를 사용하면 null 값이 제일 앞으로 오고 기본은 last이다.
- 정렬하고 싶은 컬럼별로 콤마로 구분자로 사용하면된다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/399b4d65_Untitled.png]]

<aside>
❓ (컬럼명 대신 별칭, 컬럼순서) → order by가 select보다 처리순서가 늦기 때문에 가능한 것

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c81e83ba_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/ae89584b_Untitled.png]]

- sql ⇒ 1- based index
- java ⇒ 0 - based index

---

### ANSI-SQL 자료형

- 오라클 자료형

#### 1. 문자형 ⇒ 多사용 : varchar2

- 문자 + 문자열
- 자바의 String과 유사
- char vs varchar 차이> 자리수의 고정 유무

1. char
    - 고정 자리수 문자열 (최소 1byte ~ 최대 2000  byte)
    - char(n) : n자리 문자열
    - 주어진 공간을 데이터가 채우지 못하면 **나머지 공간을 스페이스로 채운다**.
    
    ex) char(3) : 최대 3바이트짜리 문자열 저장
    
    ex) char(10) : 최대 10바이트짜리 문자열 저장
    
    ex) char(10) : 영어 몇글자(10자), 한글 몇글자(3자) ⇒ 영어 1글자 : 1byte, 한글 1글자 ⇒ 3byte
    
2. varchar2
    - 가변 자리수 문자열(최소 1byte ~ 최대 4000byte)
    - 주어진 공간을 데이터가 채우지 못하면 **나머지 공간을 버린다**. → 데이터의 크기만큼 공간을 차지함
    - varchar2(n) : n자리 문자열, n(바이트)
    
3. long
    - 가변 자리수 문자열 (최대 2gb)
    
4. clob  (Character ******large objec)
    - 대용량 텍스트(최대 4gb)
    

<aside>
❓ **LENGTH** : 문자의 개수
**LENGTHB** : 바이트의 개수
영문자 1개 → 1바이트 
한글 1개     → 3바이트

</aside>

```sql
CREATE TABLE MEMBER
(
	ID VARCHAR (50),
	PWD VARCHAR (50),
	NAME VARCHAR (50),
	GENDER NCHAR (2), --남성, 여성 NCHER는 한글자를 2바이트만 사용
	AGE NUMBER,
	BIRTHDAY CHAR (10) , --2000-01-02
	PHONE CHAR (13), --010-1234-2345
); --1.실행

INSERT INTO MEMBER (GENDER) VALUES('여성'); --2.실행
SELECT LENGTHB (GENDER) FROM MEMBER; --3.실행
```

---

#### 2. 숫자형 ⇒ 多사용 : number

정수, 실수

1. number
    - (유효자리) 38자리 이하의 숫자를 표현하는 자료형
    - 5 ~ 22byte
    - number(**p**recision)
    - number(**p**recision, **s**cale)
        1. **p**recision : 소수 이하를 포함한 전체 자리수 ( 1 ~ 38 )
        2. scale : 소수점 이하 자리수 ( 0  ~127 )
    
    ex) number : 38자리 표현 가능한 모든숫자 (정수, 실수 포함)
    
    ex) number(3) : 3자리 정수(-999 ~ +999) `★제일많이사용`
    
    ex) number(4, 2) : 전체 4자리, 소수이하 2자리, 실수 (-99.99 ~ +99.99)
    
    ex) number(10, 3) : -9999999,999 ~ +9999999,999 ⇒ 숫자 자체의 개수를 의미
    

<aside>
❓ 지정한 자리수를 넘기면 **행자체가 추가안됨** (**엄격** → 데이터 무결성(정합성))

</aside>

---

#### 3. 날짜시간형 ⇒ 多사용 : Date

자바의 Calendar, Date, Time..

1. Date
    - 년, 월, 일, 시, 분, 초 `★제일많이사용`
    - sysdate : 현재 날짜(시, 분, 초) 정보를 반환
2. Timestamp
    - 년, 월, 일, 시, 분, 초 + 밀리초 지역대

**산술연산이 가능하다.**

| 연산 | 결과타입 | 내용 |
| --- | --- | --- |
| 날짜 + 숫자 | date | 날짜에서 지정한 숫자(일단위)후의 날짜 리턴 |
| 날짜 - 숫자 | date | 날짜에서 지정한 숫자(일단위)전의 날짜 리턴 |
| 날짜 - 숫자 | number | 두 날짜의 차이(일단위)를 리턴 |

ex) 1 (하루) → 1 / 24 (한시간) → 1 / 24 / 60 (1분)

ex) 30분을 구할 땐 : 30 * (1 / 24 / 60) 

```sql
select 
				-- 1 하루
        to_char(sysdate ,'yyyy-mm-dd hh24:mi:ss'), 

				-- 1 / 24 한시간
        to_char(sysdate + 1 / 24 , 'yyyy-mm-dd hh24:mi:ss'), 

				-- 1 / 24 / 60  1분 ---> 30 *(1 / 24 / 60)
        to_char(sysdate - 30 *(1 / 24 / 60) , 'yyyy-mm-dd hh24:mi:ss')
				
from
				-- dual 가상테이블(1행) 사용
        dual;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/2bd37c06_Untitled.png]]

---

### 오라클 NVL, NVL2 함수 사용법

- null과 산술연산, 비교연산이 불가하다.
- 해당 컬럼의 값이 NULL값인 경우 특정값으로 출력하고 싶으면 NVL함수를 사용
- NULL값이 아닐 경우 특정값으로 출력하고 싶으면 NVL2 함수를 사용

<aside>
❓ 오라클에서 빈 문자열(’ ‘)은 null로 인식하기 때문에, 컬럼의 값이 빈 문자열이면 null과 동일한 조건으로 쿼리를 작성해야한다.

</aside>

> **NVL 함수**
> 

NVL 함수는 값이 null인 경우 지정값을 출력하고, null이 아니면 원래 값을 그대로 출력

⇒ 함수 : NVL(값, 지정값)

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/22baddf9_Untitled.png]]

> **NVL2 함수**
> 

**NVL2 함수는 null이 아닌 경우 지정값1을 출력하고, null인 경우 지정값 2를 출력한다.**

⇒ 함수 : NVL2(값, 지정값1, 지정값2) // NVL2(값, NOT NULL, NULL)

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/73ecc05e_Untitled.png]]

<aside>
❓ NVL함수를 사용할 때 null이 아닌경우 자신의 값을 그대로 출력할 수 있음
⇒ NVL2(comm, comm, ‘보너스없음’)

</aside>

---

### 별칭(Alias) 대소문자 적용 방법

- as “별칭”
- as와 쌍따옴표는 생략이 가능
- 별칭에 공백을 넣고 싶으면 쌍따옴표 필수
- 숫자로 시작할 때에도 쌍따옴표 필수

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/a5b16fad_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/5ef14a41_Untitled.png]]

오라클에서 데이터 조회시 컬럼 별칭을 대소문자를 구분하여 쿼리문을 작성해도 조회결과의 컬럼명은 모두 대문자로 변경된다.

별칭을 쌍따옴표(” ”)로 감싸주면 ⇒ 대소문자도 구분가능

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/a91cfa76_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/2600c418_Untitled.png]]

---

### distinct를 활용한 중복데이터 제거

- distinct 중복값을 제거하는 용도
- select구문에 딱 한번만 사용할 수 있음
    - 하나 이상의 컬럼에 대해 중복값을 검사하고, 중복된 행을 제거

distinct키워드를 사용하여 중복을 제거하면 select절에 distinct키워드만 명시하면 되기 때문에 쿼리가 복잡하지 않고 간결해진다.

하지만 distinct의 경우는 temp tablespace에 임시로 저장하고 작업하는 방식이기 때문에 시스템에 부하를 줄 수 있는 단점이 있다.

> **distinct를 사용하여 중복제거한 select 절**
> 

1. **하나의 컬럼 중복제거하여 출력 (단일 distinct)**
    
    **⇒ distinct 컬럼명1** 
    
    **컬럼명1의 중복값을 제거한 행을 select**
    

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/5f7578fe_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/e7a6e359_Untitled.png]]

1. **여러개의 컬럼 중복제거하여 출력** 
    
    **⇒ distinct 컬럼명1, 컬럼명2** 
    
    **컬럼명1과 컬럼명2의 조합에 대한 유일한 값을 select**
    

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/78b5b28b_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/9f1ecaa7_Untitled.png]]

1. **count(distinct)**
    
    **⇒ count(distinct 컬럼명)**
    
    **컬럼명의 중복을 제거한 행의 개수 select**
    

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/79893426_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/20ce51b2_Untitled.png]]

---

### 문자열 합치기 연산자( || )

```sql
문자열1 || 문자열2 || 문자열3....
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/73028a10_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/d7693948_Untitled.png]]

<aside>
❓ 위에 ‘원’은 고정값을 출력하는 것
모든 행에 같은 값이 반복 출력되게 한 것이다.

</aside>

**이름 + ID 출력해보기**

- 예 ⇒ 선동일(200)

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/c7dc7091_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/629feebc_Untitled.png]]

<aside>
❓ SQL에서는 **‘+’ 연산자는 숫자로만 가능**하다
⇒ SELECT 1 + ‘3’ FROM DUAL;
⇒ 결과 4
——————————————————————
⇒ SELECT 1 + ‘A’ FROM DUAL;
⇒ 결과 오류발생

</aside>

---

#### DUAL 테이블이란

1. 오라클 자체에서 제공되는 테이블
2. 간단하게 함수를 이용해서 계산 결과값을 확인 할 때 사용하는 테이블
3. SYS사용자가 소유하는 오라클의 표준테이블
4. SYS사용자가 소유하지만 어느 사용자에서든 접근 가능함.
5. 오직 한 행, 한컬럼을 담고 있다.

<aside>
❓ **DUAL테이블은 함수에 대한 쓰임을 알고 싶을 때 특정 테이블을 생성할 필요없이 DUAL테이블을 이용하여 함수의 값을 리턴받을 수 있음**

</aside>

---

### 비교 연산자

| = | 같다 |
| --- | --- |
| **!=**, ^=, <> | 같지 않다 |
| > | 보다 크다 |
| < | 보다 작다 |
| >= | 보다 크거나 같다 |
| <= | 보다 작거나 같다 |
| IS NULL  | NULL값인지 |
| IS NOT NULL | NULL값이 아닌지 |

 

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/d7a9bece_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/60baba43_Untitled.png]]

#### is null 대신에 nvl 사용하는 방법

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/5a9d729d_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/62978b54_Untitled.png]]

---

### 관계 연산자 NOT, AND, OR, BETWEEN, IN

**`null은 아예 비교대상에서 제외`**

**AND 연산자**

: 모든 조건이 충족하는 행을 반환 

```
SELECT [열 이름] FORM [테이블이름] WHERE[조건1] AND [조건2];
```

**OR 연산자**

: 조건 중 하나 이상 충족하는 행을 반환 → 연속되지 않은 값일 때 

```
SELECT [열 이름] FORM [테이블이름] WHERE[조건1] OR [조건2];
```

**BETWEEN 연산자**

: 원하는 범위내에 있는 행을 반환 → 연속된 값일 때 

- 날짜에 대해서도 처리할 수 있다.

```sql
SELECT [열 이름] FORM [테이블이름] WHERE [컬럼명] BETWEEN 조건1 AND 조건2;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/514e1aac_Untitled.png]]

월급 200 ~ 500 사이

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/1bfa50c9_Untitled.png]]

![date는 시분초도 알 수 있는데 생략된것은 00:00:00으로 되어있음 
→ 안보여도 시분초 정보는 살아있다.
→ 2000/12/31 12:00:00 에 입사한 사람은 추가가 안될 수 있다.](../../../../attachments/6a7e4a34-523f-49b0-9a03-60121716b4b6/Untitled.png)

date는 시분초도 알 수 있는데 생략된것은 00:00:00으로 되어있음 
→ 안보여도 시분초 정보는 살아있다.
→ 2000/12/31 12:00:00 에 입사한 사람은 추가가 안될 수 있다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/56703a84_Untitled.png]]

**IN 연산자**

: 연속되지 않는 값일 때 OR 연산자보다 작성하기 쉽다. 

```sql
SELECT [열 이름] FORM [테이블이름] WHERE [컬럼명] IN (조건1, 조건2,..);
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/9fca15b5_Untitled.png]]

월급이 200, 250, 300인 사원 

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/30f6bac6_Untitled.png]]

**null은 아예 비교대상에서 제외**

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/ffff42c9_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/16c71d73_Untitled.png]]

**NOT IN연산자**

: IN 연산자의 반대값을 원할 때 사용하면 됨.

```sql
SELECT [열 이름] FORM [테이블이름] WHERE [컬럼명] NOT IN (조건1, 조건2,..);
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b6b0aeac_Untitled.png]]

**null은 아예 비교대상에서 제외**

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/4d090c80_Untitled.png]]

---

### 패턴 연산자 LIKE, %, _

**: 컬럼명 LIKE**

**whilecard(특수한 의미를 가진 문자) : % , _**

**% 연산자**

: 문자가 없거나 하나 이상의 어떤 값이 와도 상관없다.

⇒ a% a다음에 문자 0개이상 -> a ab aab...

```sql
SELECT [열 이름] FORM [테이블이름] WHERE [컬럼명] LIKE '조건 %';
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/967a4631_Untitled.png]]

사원중에 ‘이’씨 성을 조회하기

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/f435f18a_Untitled.png]]

**_연산자**

: 글자 수를 지정해서 찾을 수 있다.

⇒a_ a다음에 문자 1개만 -> ab ac ad...

```sql
SELECT [열 이름] FORM [테이블이름] WHERE [컬럼명] LIKE '조건_ _'; // _글자수
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/24d6bee2_Untitled.png]]

 ‘이’씨이고 이름이 두글자인 사원조회

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/90624c67_Untitled.png]]

---

#### 패턴연산자 예제

<aside>
❓ 사원중에 ‘이’씨 성을 제외한 사원을 조회하기

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/80768038_Untitled.png]]

**not 위치 2가지 방법**

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b291ad0e_Untitled.png]]

<aside>
❓ 사원중에 ‘선’자가 들어간 사원을 조회하기

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/7bf213ff_Untitled.png]]

% 앞뒤로 사용하면 ‘선’이 어느 위치에 있든지 그 값을 조회함

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/ea8afe8b_Untitled.png]]

<aside>
❓ _앞에 글자가 세글자인 이메일 조회

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/68ad08eb_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b2c31137_Untitled.png]]

<aside>
❓ `escape` 
LIKE 연산으로**'%' 나 '_' 가 포함된 문자를 검색**하고자 할때 사용된다.
'%'나 '_' 앞에 ESCAPE로 **특수문자를 지정하면 검색**할 수 있다.
→ 오라클에서는 다른문자로도 escpae로 지정할 수 있는데 데이터에 지정한 문자가 있어서는 안된다.

</aside>

---

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
