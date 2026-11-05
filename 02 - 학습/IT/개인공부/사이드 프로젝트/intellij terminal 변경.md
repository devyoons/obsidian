---
별칭:
  - "학습 - intellij terminal 변경"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/698d550c2a38482bafa966a6751910b6
주제:
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 학습: intellij terminal 변경

## 세부 내용

---

intellij 기본 터미널이 cmd.exe라서 불편한게 많음

자구 사용하는 Git Bash로 기본 설정 변경

### 설정 변경

Setting (`ctrl`+`alt`+`s`) > `Tools` > `Terminal` 메뉴 이동

Shell path 가 default 로 cmd.exe로 되어있는데 아래와 같이 변경

`"C:\Program Files\Git\bin\sh.exe" -login -i`

![[02 - 학습/IT/개인공부/사이드 프로젝트/첨부/93d75052_Untitled.png]]

#### 재시작 후 확인

- 저장 후 인텔리제이 재시작한 뒤 터미널 탭(`alt` + `f12`)이  git bash로 변경됨

![[02 - 학습/IT/개인공부/사이드 프로젝트/첨부/7f790e4d_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/IT/개인공부/개인공부|개인공부]]
