---
별칭:
  - "서버 - 게스트용 DB 접속정보"
tags:
  - type/server
  - context/work
  - theme/dev
  - status/in-progress
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]"
환경: 
노션원본: https://www.notion.so/1f324612498b8081aa5dd533297b0fef
주제:
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
---

# 서버: 게스트용 DB 접속정보

## 내용

| IP | 115.89.221.210 |
| --- | --- |
| PORT | 22002 |
| ID | guest |
| pw | Rptmxmdlqslek! (께스트입니다!)ㅇ |

- 읽기 권한만 있는 계정입니다.

```sql
CREATE USER 'guest'@'%' IDENTIFIED BY 'Rptmxmdlqslek!';

GRANT SELECT ON `awa-com`.ACCD_CASE TO 'guest'@'%';
GRANT SELECT ON `awa-com`.ACCD_CASE_FILE TO 'guest'@'%';
GRANT SELECT ON `awa-com`.ACCD_CASE_FILE_GROUP TO 'guest'@'%';

SHOW GRANTS FOR 'guest'@'%';
```

## 관련 노트

- 상위: [[03 - 프로젝트/진행중/안전톡/안전톡 v2 - 개발·배포·회의록 (2025~)|안전톡 v2 - 개발·배포·회의록 (2025~)]]
- 프로젝트: [[03 - 프로젝트/진행중/안전톡/안전톡 (스마트 건설현장 플랫폼)|안전톡 (스마트 건설현장 플랫폼)]]
