---
별칭:
  - "강의 - GIT 클론 & 브랜치 설정"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/4348ae4f2e1842d8853f3e1da07fb451
주제:
  - "[[00 - 대시보드/주제/Git·GitHub|Git·GitHub]]"
---

# 강의: GIT 클론 & 브랜치 설정

## 강의 내용

---

---

#### 1. project clone

1. Git Repository에서 clone 
>> window → show view → other 에서 검색해서 view창 꺼내기
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/04fea353_Untitled.png]]
    
2. git project Code → 복사해오기
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8c0ba073_Untitled.png]]
    
3. 복사해온 주소를 URI에 붙여넣기하면 기존 git토큰을 가져와서 알아서 작성해줌
>> 토큰이 없다면 git 토큰발급방법 찾아보기[KH GIT_협업편 2:02:00 부터 보기]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/98e939a6_Untitled.png]]
    
    **store in secure store 꼭 체크해주기!!!!!! 나중에 아이디,비번 다시 작성하기 싫으면** 
    
4. 모든 브랜치 체크해서 next
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/deeae032_Untitled.png]]
    
5. 프로젝트 경로 설정하고 finish
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d0cf0f98_Untitled.png]]
    
6. 내 작업공간에 프로젝트 import하기 → finish
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f75afc53_Untitled.png]]
    
7. 서버 연결전에 서버이름 설정다시하기
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/bdba369d_Untitled.png]]
    

#### 2. 브랜치 설정하기

1. Git Repositories에서 푸시(올릴 때)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b409ff9d_Untitled.png]]

1. advanced…

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/89fafb59_Untitled.png]]

1. 내 브랜치 설정하기 **[Destination ref에서 내 아이디로 설정]**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/05a9414b_Untitled.png]]

Add Spec → Save

---

### GIT 개념

: 내 지역저장소에 마스터로 원격저장소에 있는 내 브랜치에 푸시해주고 팀장이 확인 후 원격저장소 마스터로 pull request를하여 최종으로 코드가 합쳐지는것

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/049978d0_Untitled.png]]

<aside>
📌 **작업 전 PULL!! 작업 끝내고 PULL!!**

</aside>

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/b01f832c_Untitled.png]]

원격 저장소로 부터 내려받기 : **fetch**

내려받은 데이터를 병합 : **merge**

위의 두 명령을 한번에 처리하는 명령 : **pull**

![](https://blog.kakaocdn.net/dn/ed179E/btqH4jxLT7u/GdlOTLvhEICazGkDHQIe2K/img.png)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
