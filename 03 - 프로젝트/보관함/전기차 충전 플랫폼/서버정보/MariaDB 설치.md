---
별칭:
  - "서버 - MariaDB 설치"
tags:
  - type/server
  - context/work
  - theme/dev
  - status/completed
  - domain/데이터베이스
생성일: 
수정일: 2026-11-04
프로젝트: "[[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]"
환경: 
노션원본: https://www.notion.so/9809f0dd79944914999afbe5b5a041e7
주제:
  - "[[00 - 대시보드/주제/MariaDB·MySQL|MariaDB·MySQL]]"
  - "[[00 - 대시보드/주제/서버·인프라|서버·인프라]]"
---

# 서버: MariaDB 설치

## 내용

터미널 실행 (ctrl + alt + T)

```c

# 설치 전 패키지 업데이트
sudo apt update

# MariaDB 서버 설치
sudo apt install mariadb-server

# MariaDB secure 설정
sudo mysql_secure_installation

# root 비밀번호 입력
root 접속을 위한 비밀번호를 입력하세요.
Enter current password for root (enter for none):

# 질의응답
root 비밀번호를 변경하시겠습니까?
Change the root password? [Y/n]

anonymous 계정을 지우시겠습니까?
Remove anonymous users? [Y/n]

test db를 지우시겠습니까?
Remove test database and access to it? [Y/n]

바로 적용하시겠습니까?
Reload privilege tables now?

# 설치 완료 문구
All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!

```

[우분투(Ubuntu) 22.04 Server MariaDB 계정 추가 및 외부 접속 설정 | YeopBox](https://yeopbox.com/우분투ubuntu-22-04-server-mariadb-계정-추가-및-외부-접속-설정/)

## 관련 노트

- 상위: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/서버정보/EV 서버 구축·코스텔 연동|EV 서버 구축·코스텔 연동]]
- 프로젝트: [[03 - 프로젝트/보관함/전기차 충전 플랫폼/전기차 충전 플랫폼 (2023.07~2024.08)|전기차 충전 플랫폼 (2023.07~2024.08)]]
