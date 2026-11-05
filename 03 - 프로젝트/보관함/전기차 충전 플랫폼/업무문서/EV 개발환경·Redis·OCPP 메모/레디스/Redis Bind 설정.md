---
별칭:
  - "업무 - Redis Bind 설정"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/2a30f4379cbc4934996c090de9d66d04
주제:
  - "[[00 - 대시보드/주제/Redis|Redis]]"
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
---

# 업무: Redis Bind 설정

## 내용

---

최종 변경 : 2023.07.25

---

#### Redis Bind 설정

- conf 파일 접근

```bash
sudo vi /etc/redis/redis.conf
```

- bind 항목 변경

```scheme
bind 0.0.0.0 ::1
```

- 서버 재시작

```bash
sudo systemctl restart redis-server
```

---

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/레디스/레디스|레디스]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
