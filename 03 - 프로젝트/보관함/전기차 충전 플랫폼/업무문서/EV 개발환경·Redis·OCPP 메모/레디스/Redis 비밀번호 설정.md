---
별칭:
  - "업무 - Redis 비밀번호 설정"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/bc6978584c644979afe768ff16811fef
주제:
  - "[[00 - 대시보드/주제/Redis|Redis]]"
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
---

# 업무: Redis 비밀번호 설정

## 내용

---

최종 변경 : 2023.07.25

---

#### Redis 비밀번호 설정

- conf 파일 접근

```bash
sudo vi /etc/redis/redis.conf
```

- 비밀번호 설정

```scheme
requirepass 비밀번호
```

- redis-cli 비밀번호 입력

```bash
auth 비밀번호

//auth 사용자명 비밀번호
```

- 서버 재시작

```bash
sudo systemctl restart redis-server
```

---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
