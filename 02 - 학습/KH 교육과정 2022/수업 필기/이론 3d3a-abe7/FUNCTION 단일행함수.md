---
별칭:
  - "강의 - FUNCTION 단일행함수"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/18e74164cdc4440d84ea85a085e75f7c
---

# 강의: FUNCTION 단일행함수

## 강의 내용

---

---

### 함수

- 일련의 작업절차를 모아놓은 서브프로그램
- 호출시 매개인자를 전달하고, 그에 따른 수행결과를 반드시 리턴한다.(리턴값이 없을 수 없다)
- 객체의 소속일때 메소드 그 외는 펑션
- 오라클 펑션에 특징 무조건 리턴값이 있음

#### 함수의 종류

1. 단일행처리 함수 : 행마다 처리되는 함수 ( 한 번에 하나씩 처리)
    - 1.  문자처리함수
        
        **UPPER** (값) : 문자를 대문자로 바꾼다.
        
        **LOWER** (값) : 문자를 소문자로 바꾼다.
        
        **INITCAP** (값) : 문자의 첫글자를 대문자로 나머지는, 소문자로 바꾼다.
        
        **LENGTH** (값) : 문자의 길이를 숫자로 반환한다.
        
        **CONCAT** (값1, 값2) : 두 문자열을 이어붙인다.
        
        **SUBSTR** (문자열, 시작 문자, 추출 개수) : 문자열에서 특정 문자만 추출한다.
        
        **INSTR** (문자열, 추출할 문자) : 문자열에서 특정 문자의 위치를 숫자로 반환한다.
        
        **LPAD** (문자열, 총 문자 수 제한, 채울 문자) : 문자열의 왼쪽 여백을 채운다.
        
        **RPAD** (문자열, 총 문자 수 제한, 채울 문자) : 문자열의 오른쪽 여백을 채운다.
        
        **LTRIM** (문자열, 지울 문자) : 문자열의 왼쪽에 위치한 특정 문자를 제거할 때 사용한다.
        
        **RTRIM** (문자열, 지울 문자) : 문자열의 오른쪽에 위치한 특정 문자를 제거할 때 사용한다.
        
        **TRIM** (지울문자 FROM 문자열) : 문자열의 특정 문자를 양쪽 모두 제거할 수 있다.
        
        **REPLACE** (문자열, 바꿀 문자, 변경 후 문자) : 문자열의 특정 문자를 다른 문자로 변환한다.
        
        **TRANSLATE** (문자열, 바꿀 문자, 변경 후 문자) : 문자열의 특정 문자를 다른 문자로 변환한다. (Replace랑 조금 다름)
        
    - 2.  숫자처리함수
        
        **ROUND** (숫자, 반올림할 자리수) : 숫자를 지정한 소수 자리까지 반올림한다.
        
        **TRUNC** (숫자, 버림처리할 자리수) : 숫자를 지정한 소수 자리까지 버림처리한다.
        
        **CEIL** (숫자) : 숫자를 정수로 올림처리한다.
        
        **FLOOR** (숫자) : 숫자를 정수로 내림처리한다.
        
        **MOD** (숫자, 나눌 값) : 숫자를 나눈 값의 나머지를 반환한다.
        
        **POWER** (숫자, 제곱할 횟수) : 숫자를 제곱한다.
        
    - 3.  날짜처리함수
        
        **ADD_MONTHS** (날짜, 더할 값) : 날짜를 월 단위로 더한다.
        
        **MONTHS_BETWEEN** (날짜1, 날짜2) : 지정한 날짜와 날짜 사이의 개월 수를 반환한다.
        
        **LAST_DAY** (날짜)  : 지정한 날짜의 월말일을 반환한다.
        
        **NEXT_DAY** (날짜, 요일) : 지정한 날짜의 돌아오는 요일의 날짜를 반환한다..
        
        **EXTRACT** (날짜형식 FROM 날짜) : 날짜의 년/월/일 을 골라서 추출한다.
        
    - 4.  형변환함수
        
        **TO_CHAR** (날짜/숫자, 변경할 형식) : 날짜 데이터나 숫자 데이터를 원하는 문자형식으로 변환한다.
        
        **TO_DATE** (문자, 날짜형식) : 문자 형식의 날짜 데이터를 날짜 형식으로 변환한다.
        
        **TO_NUMBER** (문자 타입의 숫자) : 문자 형식의 숫자 데이터를 숫자 형식으로 변환한다.
        
    - 5.  기타함수
        
        **NVL** (비교할 값, null 일 경우 출력할 값) : NULL 값을 만나면 지정한 값을 반환한다.
        
        **NVL2** (비교할 값, null 일 경우, null이 아닐 경우) : NULL이면 반환할 값, NULL이 아니면 반환할 값을 지정할 수 있다.
        
        **NULLIF** (비교값1, 비교값2) : 비교값 1과 2가 같으면 NULL을 반환한다.
        
        **COALESCE** (비교값1, 비교값2, 비교값3, ....) : 비교값이 NULL이 아닐 때까지 찾아서 NULL이 아닌 값을 반환한다.
        
        **DECODE** (비교값, 조건, 참일 경우 값, 아닐 경우 값) : TRUE/FALSE 일 때 반환할 값을 지정하는 조건절이다.
        
2. 그룹처리 함수 : 행을 그룹핑한 후 그룹에 대해서 처리하는 함수 (여러 건의 데이터 동시에 처리)

---

## 단일행 함수

**`: 단일 행 함수는 여러 건의 데이터를 한꺼번에 처리하는 것이 아닌 한 번에 하나씩 처리하는 함수`**

### 문자처리함수

#### <문자열 길이 `length` , `lengthb(컬럼/ 값)`>

- length(컬럼/값) : 길이값을 리턴
- lengthb(컬럼/값) : 바이트값을 리턴

```sql
select length('붕어빵'), lengthb('붕어빵') --3,9
```

#### <인덱스 추출 `instr(문자열, 검색문자열, 시작인덱스, 출현횟수)`>

- index반환

```sql
select
    instr('kh정보교육원 국가정보원 정보문화사', '정보'), --3
    instr('kh정보교육원 국가정보원 정보문화사', '정보',10), --11
    instr('kh정보교육원 국가정보원 정보문화사', '정보',1, 3), --15
    instr('kh정보교육원 국가정보원 정보문화사', '정보',-1),--시작인덱스 음수인경우 뒤에서 검사
    instr('kh정보교육원 국가정보원 정보문화사', '안녕') --없는 문자열 검색시 0
from 
    dual;
```

#### <문자열 추출`substr(대상문자열, index [, length])`>

- 문자열 리턴

```sql
select
    substr('SHOWMETHEMONEY',5 ,2), -- ME
    substr('SHOWMETHEMONEY',5),    -- METHEMONEY
    substr('SHOWMETHEMONEY',-5)    -- MONEY
from
    dual;
```

#### <지정문자로 변경 `replace, translate(문자열, 검색문자열, 치환문자열)`>

- 문자열 리턴

```sql
select replace('where we are', 'we', 'you') from dual; --where you are
select translate('where we are', 'we', 'you') from dual; --yhoro yo aro
--> translate는 w -> y 
--							e -> o  
--						  u -> 의미없음
```

#### <자리채우기 `LPAD`,`RPAD(문자열, 길이,’채울문자’)`>

- 문자열 패딩 함수
- 채울문자 자리 생략시 공백으로 처리
- 문자열 리턴

```sql
select
    lpad('hello', 10, '#'), --#####hello
    rpad('hello', 10, '#'), --hello#####
    lpad(123, 5, 0), -- 00123
    'kh-' || to_char (sysdate, 'yymmdd') || '-' || lpad(123,5,0) 주문번호
		--kh-220315-00123
from 
    dual;
--------------------<한글일 경우 주의>---------------------
-- 이름을 3글자로 지정하고 외자를 가진 이름뒤에 0을 붙이고 싶을 때
select rpad (name, 3, '0') from member; 
-- 한글은 3바이트라고하지만 길이의 문제이다. 길이 * 2배라고 생각하면 된다.
-- 저장되어있는 값은 '홍길'이지만 위 코드로 출력하면 '홍'만 나온다.
select rpad (name, 6, '0') from member; 
```

- 문자함수 수업예제
    
    ```sql
    -- 사원테이블에서 남자사원의 사번, 이름, 주민번호를 조회
    -- (주민번호의 뒤 6자리는 *로 숨김처리) 1,3 남자/ 2,4 여자
    select
        emp_id 사번,
        emp_name 이름,
        rpad(substr(emp_no, 1, 8), 14, '*') 주민번호
    from
        employee
    where
        substr(emp_no, 8, 1) in (1, 3); -- 오라클이 자동형변환해줌 '1', '3'
    ```
    

#### <문자열 트림 함수 `ltrim`, `rtrim`, `trim`>

```sql
select ltrim ('  hello  ') from dual; --hello__  => 좌측공백삭제
select rtrim ('  hello  ') from dual; --  hello  => 우측공백삭제
select trim ('  hello  ') from dual; --hello     => 양쪽공백삭제
```

#### <소문자 또는 대문자로 변경 `lower` , `upper`>

- lower : 소문자로 전체 변경
- upper : 대문자 전체 변경

```sql
select lower ('HeLlo') from dual; -- hello
select upper ('HelLo') from dual; -- HELLO

-->검색시 소문자도 대문자도 검색할 수 있게 하려면 양쪽을 다 대문자로하든지 소문자로 하든지
select * from member where upper(id) = 'KIMS';
			                     대문자       대문자
```

#### <첫 글자를 대문자로 변경 `initcap(문자열)`>

```sql
select initcap('the ...') from dual;
-- The...
select initcap('the most important thing is...') from dual;
-- The Most Important Thing Is...
-- 모든 단어의 첫글자가 대문자로 변경
```

### 숫자처리함수

#### <나머지 값 구하기 `mod (숫자, 나눌 수)`>

- 나머지를 리턴

```sql
select
    mod(10, 3) -- 1
from
    dual;
-------------------------------
-- 생일 끝자리가 짝수인 사원만 조회 <수업시간예제>
select
    *
from
    employee
where
    mod(substr(emp_no ,6 , 1), 2) = 0 ;

-- substr -> 631126-1548654 인덱스 6자리에서 1글자 가져오기
-- 가져온 1글자를 mod(가져온1글자 , 나눌수2) = 0 나눴을때 나머지가0이어야지 짝수
```

#### <실수를 정수로 올림`ceil(number)`>

- 숫자로 리턴

```sql
select
    ceil(123.456), -- 소수점기준으로 반올림 124
    ceil(123.456 * 100) / 100  -- 123.46
from
    dual;
```

#### <반올림 `round (number, 소수점이하자리수)`>

- 숫자로 리턴

```sql
select
    round(1234.56),    --1235
    round(1234.56, 1), --1234.6
    round(1234.56, -2) --1230
from
    dual;
```

#### <소수점자리 버림 `floor (number)`>

```sql
select
    floor(234.566), --234
    floor(234.566 * 100) / 100 --234.56
from
    dual;
```

#### <원하는 위치까지 버림`trunc(number, 소수점이하자리수)`>

```sql
select
    trunc(234.566),    --234
    trunc(234.566 ,2), --234.56
    trunc(234.566 ,-2) --200
from
    dual;
```

### 날짜처리함수

#### <개월수 더하기,빼기`add_months(date, number)`>

- data를 반환

```sql
select
    add_months(sysdate, -1) 한달전, --22/02/15
    sysdate,                       --22/03/15
    add_months(sysdate, 1) 한달뒤, --22/04/15
    add_months(to_date('22/03/31', 'yy/mm/dd'), 1) "3/31로부터 한달뒤", --22/04/30
    add_months(to_date('22/04/30', 'yy/mm/dd'), 1) "4/30로부터 한달뒤"  --22/05/31
from
    dual;
```

#### <개월수 구하기 `months_between(미래날짜, 과거날짜)`>

- 개월수차이를 리턴

```sql
select
    months_between('22/08/28',sysdate) --5.39553240740740740740740740740740740741
from
    dual;
------------------------------------수업시간예제
select
    emp_name 사원,
    floor(months_between(sysdate, hire_date)) || '개월' 근무개월수1,
    floor(months_between(sysdate, hire_date) / 12) || '년' || 
    floor(mod(months_between(sysdate, hire_date), 12)) || '개월' 근무개월수2
from
    employee;
//결과
--선동일 385개월 32년1개월
--송종기 246개월 20년6개월 ...
```

#### <특정 date추출시 `extract`>

- 년, 월, 일, 시, 분, 초 따로따로 출력할 때
- **extract (year | month | day from date)** : 숫자를 리턴
- **extract (hour | minute | second from (date as timestamp))** : 숫자를 리턴

```sql
select
    extract(year from sysdate) 년, --2022
    extract(month from sysdate) 월, --3
    extract(day from sysdate) 일, --15
    extract(hour from cast(sysdate as timestamp)) 시, --17
    extract(minute from cast(sysdate as timestamp)) 분, --48
    extract(second from cast(sysdate as timestamp)) 초 --44
from
    dual;
//결과
2022/03/15 17:48:44
```

#### <시분초버림 `trunc(date)`>

- 날짜형 리턴 (시분초 제거 → 00:00:00)

```sql
select
    to_char(sysdate, 'yy/mm/dd hh24:mi:ss') "sysdate", --22/03/15 17:51:22
    to_char(trunc(sysdate), 'yy/mm/dd hh24:mi:ss') "sysdate" --22/03/15 00:00:00
from 
    dual;
```

### 형변환 함수

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/6125e433_Untitled.png]]

#### <`to_char(number, format_char)` : 숫자나 날짜를 문자열로 변환>

- char로 리턴

**숫자 ⇒ 문자**

| 숫자 | 단위 | 결과 |
| --- | --- | --- |
| 9 | 한자리 숫자를 의미 | to_char(12345,’99999’) = ‘12345’ |
| ,(콤마) | 콤마로 표시 (천단위 표시) | to_char(12345,’99,999’) = ‘12,345’ |
| .(소수점) | 소수점 표시 | to_char(123456.7,’999,999.9’) = ‘123,456.7’ |
| $ | dollar 표시 | to_char(12345,’$99,999’) = ‘$12,345’ |
| pr | 음수일때 <>로 표시 | to_char(-123456.7,’99999pr’) = ‘<12345>’ |
| RN , rn | 로마 숫자로 표시(rn은 소문자) | to_char(12,’RN’) = ‘XII’ |
| s | 양수면 +, 음수면 - 표시 | to_char(12345,’S99999’) |
| l | 각 나라 통화기호  표시 | to_char(12345,’l99,999’) = ‘￦12,345’ |

**날짜 ⇒ 문자**

| 날짜형식 | 단위 | ‘2022/03/24 23:27:30’  |
| --- | --- | --- |
| scc | 세기를 표시 S는 기원전(BC) | 21 |
| year | 연도를 알파벳으로 | twenty twenty-two |
| yyyy,rrrr | 년도 | 2022 |
| yy,rr | 년도 | 22 |
| month, mon | 월 | 3월 |
| mm | 월 | 03 |
| day | 요일 | 목요일 |
| dy | 요일 | 목 |
| dd | 일(월 단위 1 ~ 31) | 24 |
| d | (주 단위 1 ~ 7) | 4 |
| hh24,hh | 1 ~ 24시, 1 ~ 12시 | 23, 11 |
| mi | 00 ~ 59분 | 27 |
| ss | 01 ~ 59초 | 30 |
| ww | 몇 번째 주 (01 ~ 53) | 12 |
| DL | 현재 요일까지 표기 | 2022년 3월 24일 목요일 |
| am, pm | 오전, 오후 | 오전, 오후 |

**to_char(문자열, ‘형식’)**

```sql
숫자를 문자로 변환 : TO_CHAR(350000,'$999,999')→ $350,000
숫자를 날짜로 변환 : TO_CHAR(SYSDATE,'YY/MM/DD')→ 95/05/25
```

- 수업시간예제
    
    ```sql
    -- to_char(date, format_char) : char
    select
        to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') 날짜,--2022-03-16 09:32:06
        to_char(sysdate, 'yyyy-mm-dd (day) hh:mi:ss') 날짜, --2022-03-16 (수요일) 09:32:06
        to_char(sysdate, 'yyyy-mm-dd (day)(dy)(d)') 날짜,--2022-03-16 (수요일)(수)(4)
        to_char(sysdate, 'yyyy"년" mm"월" dd"일"') 날짜, --2022년 03월 16일
        to_char(sysdate, 'fmyyyy"년" mm"월" dd"일"') 날짜 --2022년 3월 16일 fm공백제거용도
        
    from
        dual;
    
    -- to_char(number, format_char) : char
    -- 세자리 콤마적용, 소수점이하 처리
    -- 실제값보다 형식,문자 자리수가 적으면 표시할 수 없다.
    select
        to_char(1234567890, '9,999'),--######
        to_char(1234567890, '999,999,999,999'), --___1,234,567,890
        to_char(1234567890, 'fmL999,999,999,999'), --1,234,567,890 <원화표시(지역통화기호):L>
        123 숫자숫자숫자, --숫자는 오른쪽정렬, 문자는 왼쪽정렬
        to_char(123.456,'99999.99999'), 
        --___123.45600 -> 해당자리수가 없을때 공백처리, 소수점이하는 ()채움처리
        to_char(123.456,'00000.00000') 
        -- 00123.45600 -> 해당자리수가 없을때 소수점이상/이하는 ()채움처리
    from
        dual;
    
    -- 사원테이블에서 사원명, 급여, 연봉(급여*12), 입사일 조회
    -- 금액형식지정, 년월일 형식으로 지정
    select 
        emp_name 사원명,   
        to_char(salary,'fmL999,999,999') 급여,
        to_char(salary * 12, 'fmL999,999,999') 연봉,
        to_char(hire_date, 'yyyy"년"mm"월"dd"일"') 입사일
    
    from employee;
    ```
    

#### <`to_number(char, format_char)` : 그룹핑된 숫자 → 변환 후 연산>

- number로 리턴
- 그룹핑처리된 숫자를 순수 숫자로 변환해서 연산처리

```sql
select
    to_number ('￦8,000,000','L999,999,999') + 1000,
    '1000' + '100', -- +는 숫자사이에서만 가능 (숫자로 자동 변환)
    '1000' ||'100' -- ||문자열 연결연산에 사용
from dual;
```

#### <`to_date(char, format_char)` : date리턴>

```sql
select
    to_date('1999년 3월 16일', 'yyyy"년" mm"월" dd"일"')날짜,--99/03/16
    extract(year from to_date('1955/01/01','yyyy/mm/dd')) 날짜, 
    extract(year from to_date('1955/01/01','rrrr/mm/dd')) 날짜, 
    extract(year from to_date('55/01/01','yy/mm/dd')) 날짜, -- 현재년도 기준으로 100년(2000 ~ 2099)
    extract(year from to_date('55/01/01','rr/mm/dd')) 날짜 --현재년도(2022) 기준으로 100년(1950 ~ 2049)
    -- 현재년도가 2055년이라면 100년 (2050 ~ 2149)
from
    dual;
```

#### ‘YY’ 와 ‘RR’의 차이점

- ‘YYYY’와 ‘RRRR’ 둘 다 동일한 4자리로 꽉채울 경우 동일한 날짜가 나온다.
- to_char를 이용하여 뽑아오는것은 동일하나 **to_date를 이용해 date로 변형할 때는 다름**

**‘YY’**

- yy는 무조건 ‘20’이 앞에 붙는다.
- 입력 년도를 오라클 서버의 현재 날짜와 동시대로 계산
- ex. YY형식에서 ‘19’ ⇒ 2019년 ,‘55’ ⇒ 2055년

**‘RR’**

- rr은 50년을 기준으로 작으면 ‘20’ 크거나 같으면 ‘19’가 붙는다.
- `00 ~ 49 ⇒ ‘20’` /  `50 ~ 99 ⇒ ‘19’`

- 수업시간예제
    
    ```sql
    -- 나이 구하기
    -- 450505 -> 1945, 550505 -> 1955, 070707 -> 2007
    -- yy? rr? 둘다 아니다.
    -- 주민번호의 뒷 첫번째자리를 근거로 1900 + 생년2자리, 2000 + 생년2자리 
    select
        extract(year from to_date('550505','yymmdd')), -- 2055
        extract(year from to_date('550505','yymmdd')), -- 2055
        
        extract(year from to_date('550505','rrmmdd')), -- 1955
        extract(year from to_date('070707','rrmmdd'))  -- 2007
    from
        dual;
                  
    -- 현재시각으로 부터 1일 2시간 3분 4초뒤를 시각조회
    -- 년월일시분초 형태로 출력
    -- 날짜 + 숫자(1:하루)
    select
        to_char(sysdate + 1 + 
        2 / (2 * 24) + 
        3 / (3 * 24 * 60) + 
        4 / (4 * 24 * 60 * 60), 
        'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"') "1일 2시간 3분 4초뒤"
    from
        dual;
    ```
    
    ```sql
    -- 현재시각으로 부터 1일 2시간 3분 4초뒤를 시각조회
    -- 년월일시분초 형태로 출력
    -- 날짜 + 숫자(1:하루)
    select
        to_char(sysdate + 1 + 
        2 / (2 * 24) + 
        3 / (3 * 24 * 60) + 
        4 / (4 * 24 * 60 * 60), 
        'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"') "1일 2시간 3분 4초뒤"
    from
        dual;
        
    
    -- 2022/08/29 남은 일수 구하기
    select
        '수료일로부터 D-' || ceil(to_date('2022/08/29', 'yyyy/mm/dd') - sysdate) || '입니다.'
    from
        dual;
    ```
    

### 날짜 차이 구하기

#### <`extract` 해당 년, 월, 일 추출>

- date type의 값에서 지정한 filed(년, 월, 일) 항목을 추출

```sql
select extract(YEAR FROM sysdate) from dual; : 현재 날짜에서 년도만 추출
select extract(MONTH FROM sysdate) from dual; : 현재 날짜에서 월만 추출
select extract(DAY FROM sysdate) from dual; : 현재 날짜에서 일 수만 추출
```

#### <`numtodsinterval(number, ‘타입’)`>

- 날짜 , 시, 분, 초에 대한 시간 간격 구함

```sql
select sysdate - numtodsinterval(1, 'DAY') from dual; : 현재 날짜에서 1일을 뺌
select sysdate - numtodsinterval(1, 'HOUR') from dual; : 현재 날짜에서 1시간을 뺌
select sysdate - numtodsinterval(1, 'MINUTE') from dual; : 현재 날짜에서 10분을 뺌
select sysdate - numtodsinterval(1, 'SECOND') from dual; : 현재 날짜에서 100초를 뺌
------------------수업시간 예제
select
    numtodsinterval(to_date('2022/08/29', 'yyyy/mm/dd') - sysdate, 'day') 기간
from
		dual; -- +165 02:01:30.000000
```

#### <`numtoyminterval(number, ‘타입’)`>

- 년, 월에 대한 시간 간격을 구함

```sql
select sysdate - numtoyminterval (1, 'YEAR') from dual; : 현재 날짜에서 1년을 뺌
select sysdate - numtoyminterval (1, 'MONTH') from dual; : 현재 날짜에서 1달을 뺌
```

#### <`next_day(sysdate,’?요일’)` 해당 주 ?요일 몇일인지>

```java
현재날짜 : 22/03/20
select next_day(sysdate, '토요일') from dual;
select next_day(sysdate, '토') from dual;
select next_day(sysdate, '7') from dual;
--결과 22/03/26 17:07:12
```

#### <`last_day(sysdate)` 마지막 일자>

```java
select last_day(sysdate) from dual; --22/03/31 3월마지막날
select last_day(add_months(sysdate, 1)) from daul; --22/04/30 
--다음달 마지막날
```

### 기타함수

#### <`NVL`, `NVL2` null일 경우 반환값 지정>

```sql
**NVL(컬럼, NULL일경우 반환값)
------------------------------------
NVL(컬럼, 0) -- 컬럼의 값이 null인경우 0으로 치환

★ null일 경우 계산할 때 0으로 바꿔줘야함**
```

- nvl2 는 null값이거나 아니거나 둘 다 값을 지정할 수 있다

```sql
NVL2(컬럼,'NULL이 아닌 경우 지정값, null일 경우 지정값')
------------------------------------------------------
수업시간 예제
select
    emp_name,
    nvl(bonus, 0),
    nvl2(bonus, '보너스있음', '보너스없음') 보너스여부
from
    employee;
```

#### <`decode(컬럼,조건1,결과1,조건2,결과2,조건3,결과3...)`>

- if else와 비슷한 기능을 수행한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/b74340ac_Untitled.png]]

```sql
-- job_code (J1:대표, J2:부사장, J3:부장, J4:차장, J5:과장, J6:대리, J7:사원)
select
    emp_name,
    job_code,
    decode(job_code,'J1','대표', 'J2','부사장', 
										'J3','부장', 'J4','차장',
										'J5','과장', 'J6','대리', '사원') 직급명 -- 일치한게 없으면 사원
from
    employee;
```

```sql
-- 사원테이블에서 이름, 주민번호,성별(남/여)조회 -> 1,3 남자/ 2,4 여자

select
    emp_name,
    emp_no,
    decode(substr(emp_no, 8, 1), '1', '남', '3', '남','여') 성별
from
    employee;
```

#### 사원테이블에서 생일조회 예제

```sql
select
    emp_name,
    emp_no,
    to_char(to_date(substr(emp_no, 1, 6) ,'yymmdd'), 'yyyy-mm-dd') 생일,
    to_char(to_date(substr(emp_no, 1, 6) ,'rrmmdd'), 'yyyy-mm-dd') 생일,
    decode(substr(emp_no, 8, 1), '1', 1900, '2', 1900, 2000) + substr(emp_no, 1, 2)출생년도,
    to_char(to_date (decode(substr(emp_no, 8, 1), '1', 1900, '2', 1900, 2000) 
						+ substr(emp_no, 1, 2)|| substr(emp_no, 3, 4),'yyyymmdd'), 'yyyy-mm-dd') 생일
from 
    employee;
```

#### <CASE : 오라클식 if문>

- `decode`함수는 조건이 많아지면 **가독성이 떨어지고 복잡**해진다.
- 대체할 수 있는 기능인 `case표현식`이 **가독성이 좋고 더 많은 기능을 제공**한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론 3d3a-abe7/첨부/24c12074_Untitled.png]]

- 하나의 대상으로 case문은 분류할 때 유용
    - ex) 상품(컬럼) → when ‘사과’ then ‘과일’
    - when ‘청소기’ then ‘전자제품’
- **case when ~~ 라면 then ~~ 하고 else 아니라면 ~~ 한다 end 끝**

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
