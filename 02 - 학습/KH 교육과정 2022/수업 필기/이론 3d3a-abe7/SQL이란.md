---
별칭:
  - "강의 - SQL이란"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/d269b5736a62498c869c8a431de798e7
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 강의: SQL이란

## 강의 내용

### SQL

1. SQL이란?

- Structured Query Language의 약자 (구조화된 질의 언어)
- 관계형 데이터베이스에서 데이터를 조회하거나 조작하기 위해 사용하는 표준 검색 언어
- 원하는 데이터를 찾는 방법이나 절차를 기술하는 것이 아닌 조건을 기술하여 작성함(ANSI)
- DBMS(벤더)에 따라 사용되는 SQL 문법이 다름

2. 기본 SQL 문법 종류

- 데이터 정의어 : DDL (Data Definition Language)
- 데이터 조작어 : DML (Data Manipulation Language)

                                    - DQL (Data Query Language)를 보통 포함한 개념

- 데이터 제어어 : DCL (Data Control Language)
- 트랜젝션 제어어 : TCL (Transaction Control Language)

3. DDL (Data Definition Language)

- 데이터베이스의 구조를 정의하거나 변경, 삭제 하기 위해 사용하는 언어
- 주로 DB 관리자 또는 설계자가 사용함
- CREATE(개체 생성), ALTER(개체 수정), DROP(개체 삭제), TRUNCATE(개체 초기화)
- ex) DB를 생성/수정/삭제 하거나 TABLE을 생성/수정/삭제 등

4. DML (Data Manipulation Language)

- Data를 조작하기 위해 사용하는 언어
- Data의 삽입, 수정, 삭제, 조회 등의 동작을 제어함
- Data를 이용하려는 사용자(어플리케이션)와 시스템간의 인터페이스를 직접적으로 제공하는 언어
- 가장 많이 사용됨
- INSERT(데이터 삽입), UPDATE(데이터 수정), DELETE (데이터 삭제)
- DQL (Data Query Language) : DML 중에서 SELECT를 따로 정의함.
    - 데이터를 검색(추출)하기 위해 사용되는 언어
    - SELECT (데이터 검색)

5. DCL (Data Control Language)

- 사용자의 권한이나, 관리자 설정 등을 처리
- GRANT(유저 권한 생성), REVOKE(유저 권한 삭제/회수)

6. TCL (Transaction Control Language)

- 트랜 잭션 관리 처리 언어
- COMMIT(트랜잭션 종료처리후 저장), ROLLBACK(트랜잭션 취소), SAVEPOINT(임시저장)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
