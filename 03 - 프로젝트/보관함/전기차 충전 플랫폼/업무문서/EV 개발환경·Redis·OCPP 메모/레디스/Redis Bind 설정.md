---
별칭:
  - "업무 - Redis Bind 설정"
태그:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/2a30f4379cbc4934996c090de9d66d04
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
