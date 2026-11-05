---
별칭:
  - "강의 - 댓글 DB 테이블생성"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/bad40af6beea49fdbd41d8e40feb2d9e
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
  - "[[00 - 대시보드/주제/웹 기능 구현|웹 기능 구현]]"
---

# 강의: 댓글 DB 테이블생성

## 강의 내용

---

---

#### 댓글 테이블 생성

```sql
create table board_comment (
    no number, -- pk
    comment_level number default 1, -- 댓글(1) / 대댓글(2)
    member_id varchar2(15),
    content varchar2(2000),
    board_no number, -- 참조게시글
    comment_ref number, -- 대댓글인 경우, 참조하는 댓글no (댓글인 경우는 null)
    reg_date date default sysdate,
    constraint pk_board_comment_no primary key(no),
    constraint fk_board_comment_member_id foreign key(member_id) references member(member_id) on delete set null,
    constraint fk_board_comment_board_no foreign key(board_no) references board(no) on delete cascade,
    constraint fk_board_comment_ref foreign key(comment_ref) references board_comment(no) on delete cascade
);
```

#### 1부터 1씩증가하는 시퀀스

```sql
create sequence seq_board_comment_no;
```

#### 샘플데이터

```sql
insert into board_comment
values(
    seq_board_comment_no.nextval,
    default,
    'honggd',
    'def',
    182,
    null,
    default
);
insert into board_comment
values(
    seq_board_comment_no.nextval,
    default,
    'admin',
    '안녕하세요, 관리자입니다.',
    182,
    null,
    default
);
insert into board_comment
values(
    seq_board_comment_no.nextval,
    default,
    'qwerty',
    '한주가 쏜살같이 지나갔네요~',
    182,
    null,
    default
);
```

### 계층형 쿼리

---

- 143번 게시물에 대한 댓글만 추려냄
- 부모행 선언
    - 부모행과 자식행 연결
    - prior 를 부모행 앞에 적어준다.
    
```sql
select * 
from board_comment
where board_no = 143
start with comment_level = 1
connect by comment_ref = prior no;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4f811cdd_Untitled.png]]


```sql
select level, bc.*
from board_comment bc
where board_no = 143
start with comment_level = 1
connect by comment_ref = prior no;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ed0cb75a_Untitled.png]]

### 계층형쿼리 하향식

#### 댓글, 대댓글 차이나게 확인하기

```sql
select 
    level,
    lpad(' ',(level - 1) * 5) || bc.content,
    bc.*
from
    board_comment bc
where
    board_no = 143
start with 
		comment_level = 1 -- 루트행의 조건
connect by 
		comment_ref = prior no;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a35739c7_Untitled.png]]

- CSS에서 대댓글은 패딩효과를 주는걸로 진행할 예정

#### employee 테이블로 계층형쿼리 연습

```sql
-- kh계정에서 관리자-관리사원정보 계층형 쿼리
select * from employee;

select 
    level,
    lpad(' ' , (level-1) * 5) || e.emp_name 
from
    employee e
start with emp_id  = 200
connect by manager_id = prior emp_id;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/49e02355_Untitled.png]]

```sql
select 
    level,
    lpad(' ' , (level-1) * 5) || e.emp_name 
from
    employee e
start with manager_id is null
connect by manager_id = prior emp_id;
```

- 계층구조의 최상위
manager_id = null 인 사원

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c10b592b_Untitled.png]]

### 계층형쿼리 상향식

- 자식행에 prior를 작성하면 상향식이 된다.

```sql
select 
    level,
    emp_name
from 
    employee
start with emp_name = '윤은해'
connect by prior manager_id = emp_id;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c96da3e9_Untitled.png]]

- 본인 제외 테이블 조회

```sql
select 
    level,
    emp_name
from 
    employee
where
    level > 1
start with emp_name = '윤은해'
connect by prior manager_id = emp_id;
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6ea42333_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
