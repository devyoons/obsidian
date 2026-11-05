---
별칭:
  - "학습 - ERD 수정"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
"회의 주제": "ERD, 기획"
"참여인원": "김용민 이경석"
"회의 날짜": "July 23, 2022"
노션원본: https://www.notion.so/341a5eec80074c57a242f0d65b5be46d
---

# 학습: ERD 수정

## 세부 내용

## ERD 변경사항

1. 회원 테이블
    - 회원 번호 컬럼 삭제
    - PK 변경 : 회원 번호 -> 회원 닉네임 (SQL문 작성시 서브쿼리 및 Join 간수화 위함)
    - 모든 테이블은 회원 닉네임을 FK로 받아와서 사용
2. 모든 댓글 테이블
    - 회원 테이블에서 FK로 회원 PK 받아옴
    - 작성한 주체이므로 회원 테이블에서 받아오는게 맞다고 판단

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/회의록/회의록/회의록|회의록]]
