---
별칭:
  - "업무 - 공통jar 반영하는 방법"
tags:
  - type/work-doc
  - context/work
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
노션원본: https://www.notion.so/982d8fc6ffdd497794c15070612df0db
주제:
  - "[[00 - 대시보드/주제/Redis|Redis]]"
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
  - "[[00 - 대시보드/주제/OCPP·EV 충전|OCPP·EV 충전]]"
---

# 업무: 공통jar 반영하는 방법

## 내용

1. Gradle에서 build → jar 더블클릭하면 jar파일이 생성된다.

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/첨부/8783cd6e_Untitled.png]]

1. `\csms-com\build\libs` 프로젝트 경로에서 만들어진 jar파일을 찾는다

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/첨부/8ce6cfb5_Untitled.png]]

1. WEB 혹은 APP 프로젝트 경로에서 `\csms-web\libs` 해당 경로에 com에 있던 jar파일을 덮어씌워준 후 모듈을 넣은 프로젝트 캐시를 지워준다

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/첨부/7d7b8be0_Untitled.png]]

![[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/첨부/1d7c17f1_Untitled.png]]

1. 재시작 후 build가 완료되면 수정한 부분 테스트 진행 후 git에 반영한다.

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/업무문서/EV 개발환경·Redis·OCPP 메모/EV 개발환경·Redis·OCPP 메모|EV 개발환경·Redis·OCPP 메모]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
