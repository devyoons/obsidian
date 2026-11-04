---
별칭:
  - "강의 - Git(이클립스)"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/68a5fedefd25424db5da16ac2d95fbc1
---

# 강의: Git(이클립스)

## 강의 내용

---

---

### git

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/04d4edf0_Untitled.png]]

**소스 코드를 효율적으로 관리하기 위해 만들어진 "분산형 버전 관리 시스템"**
 입니다.

1. **소스 코드의 변경 이력을 쉽게 확인 가능**합니다.
2. 특정 시점에 저장된 버전과 **비교하거나 특정 시점으로 되돌아갈 수 있습니다**.
3. backup 
4. collaboration 협업

### git 저장소

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a5dad1b2_Untitled.png]]

Local 저장소와 Remote(=원격) 저장소로 나뉜다.

- **Local** Repository: **나의 PC에 저장**되는 개인 전용 저장소
- **Remote** Repository: 원격 저장소 **전용 서버에 저장**되는 저장소

`# Commit`

커밋이란, 변경 사항을 로컬 저장소에 <u>**기록**</u>하는 것을 말합니다.

`# Index`

git에서는 **Commit을 하기 전에 그 사이의 공간인 "인덱스"라는 공간에 파일의 상태를 기록하게 되어있습니다.**

그 이유는 철수가 first.html과 second.html을 생성하고 작업하고있는데, 짱구가 작업한거 올려달라고 했을 때

second.html은 작업이 덜되어 first.html만 올리고 싶을 때! 이 때 필요한게 Index입니다.

**자신이 로컬 저장소에서 변경/작업한 파일 중 선택하는 작업을 "Index에 등록"한다고 표현합니다.**

`# Branch`

Branch는 **일련의 작업을 독립적으로 만들기 위한 개념**입니다.

특정 시점(마지막 Commit)에서 여러가지 작업을 해야할 때, 여러 작업을 동시에 진행할 수 있게 해줍니다.

**개인적으로 Git에서 가장 중요한 개념이라고 생각합니다**

Master Branch(관리자 Branch)를 기준으로, attchBranch를 만들고 작업을 하고 있었다면 작업을 하던 도중 Commit을 하고 Master Branch로 돌아가서 bugBranch를 만들어서 작업하면 됩니다.

- > **Master Branch로 돌아가면 마지막 master Brnach의 Commit 시점으로 파일들이 변경되기때문에** 타 Branch의 작업과 **독립적으로 작업**할 수 있습니다. 첨부파일의 작업은 모두 attachBranch에 저장되어 있습니다.

**`# Push`**

**원격 저장소에 Commit 내용을 업로드**하는 것을 말합니다.

#### SCM

**software configuration Management**

- 코드추적 (버전관리)외에 build, packaging, deploy등 프로젝트관련 프로세스를 관리

#### VCS

**Version control System**

- 프로젝트 작성/수정/보완에 따른 변경내역을 버전으로 관리

#### 버전관리 프로그램

- **`server-client`** : 중앙저장소를 공유한 각각의 클라이언트에서 저장소의 일부만 가져와서 작업후, 중앙저장소에 반영
    - subversion
- **`분산형`** : 참여하는 각각의 클라이언트(개발자)에서 전체저장소에 대한 복제본을 가지고 작업
    - git

git cli 

- git bash

git gui 

- source tree
- github desktop
- egit (따로 설치않고 진행할 것)

### 📍협업을 위한 설정

---

1. **지역 저장소 생성**
    1. 프로젝트 우클릭 → Team → Share Project 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b86d4b63_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d6efed1b_Untitled.png]]

create ⇒ 새로운 경로 지정

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b1059e81_Untitled.png]]

다른곳에 지역저장소를 만들어서 관리할 수 있다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/29bc3f48_Untitled.png]]

지역저장소 확인하기 window → show view → git

![버전관리 
변경사항이 생기면 staging area에 올리고 ](../../../attachments/4e1b6eb5-08d8-4a06-9b7d-4e75a1d55948/Untitled.png)

버전관리 
변경사항이 생기면 staging area에 올리고 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d1488dcb_Untitled.png]]

버전 관리하는 기록을 볼 수 있음.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/aa06ef69_Untitled.png]]

### 📍.gitignore 버전관리하지 않을 파일 (.으로 시작하면 히든)

---

- [.gitignore](https://www.toptal.com/developers/gitignore) 하위에 파일은 버전관리 하지 않겠다는 것.
    - 위 링크에서 버전관리가 필요없는 파일 .gitignore 설정을 만들어줌.
    - 복사해서 .gitignore파일에 붙여넣기
- 설정파일들은 미리 관리하지 않도록 설정하는 것.
    - .classpath
    - .settings
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8597b9a9_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fdfb72f3_Untitled.png]]
    

### 📍버전생성

---

- 생성된 버전을 staged에 올려준다.
- commit message를 입력후 commit

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c9494893_Untitled.png]]

### 📍 History로 버전생성 확인하기

---

- master ⇒ branch 작업단위
- HEAD ⇒ 현재 작업중인 branch를 말함
- versioning은 파일대상으로만 관리된다 (디렉토리는 변경내역 관리대상X)
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/39ad0008_Untitled.png]]
    

### 📍branch 생성

---

- 프로젝트 우클릭 → Team → Switch To → New Branch

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d063b511_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a66ffe8b_Untitled.png]]

생성된 animal 브랜치로 변경 → check out new branch

### 📍Merge

---

- 마스터로 브랜치 체크아웃한 후

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5f03bd54_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e1dc6ac5_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/b44aa68b_Untitled.png]]

좀 더 간편한 방법은 Repositories에서 branches → local에서 더블클릭으로 checkout도 가능하고 브랜치 HEAD 설정 후 merge가능

- 주체가 중요하다 master에서 animal의 내용을 병합하기 위한 작업

#### fast-forward-merge (빨리감기)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1edc4a7f_Untitled.png]]

- 병합하고자하는 버전이 master 버전을 온전히 포함하고 있을 때 새로운 버전이 생기지 않고 따라 올라가서 병합이 된다.

#### non-fast-forward-merge

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fbbc480b_Untitled.png]]

- 새로운 버전이 만들어지는 merger
- 병합하고자하는 버전이 master 버전을 포함하고 있지 않을 때 새로운 버전이 생기면서 병합된다.

- 같은 위치에 다른 코드를 작성하면 충돌이 난다.
- **직접 해결한 버전을 버전생성을 해준다.**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1b4d63c0_Untitled.png]]

머지 conflict오류발생 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/42c2f4fb_Untitled.png]]

현재 브랜치 내용 : HEAD / 다른 브랜치 내용: ====

### 📍github 올리기

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/15093608_Untitled.png]]

#### push

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8a21bf14_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/00cabb7e_Untitled.png]]

![작년부터 비밀번호를 직접 사용할 수 없게 바뀌었음 access_token 으로 대체
github에서 계정에서 tokken 발급 후 password에 입력 
한번 발급받은 토큰은 보여주지않기 때문에 따로 관리해야함](../../../attachments/66986d7d-3058-4241-a8fd-dc40f2005797/Untitled.png)

작년부터 비밀번호를 직접 사용할 수 없게 바뀌었음 access_token 으로 대체
github에서 계정에서 tokken 발급 후 password에 입력 
한번 발급받은 토큰은 보여주지않기 때문에 따로 관리해야함

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0bfa1aa9_Untitled.png]]

브랜치별로 연결시켜주는 설정 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/37e2d40e_Untitled.png]]

- 지역저장소의 브랜치와 원격저장소의 브랜치를 동일한 이름으로 연결하겠다 → all Branches

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ac9b8820_Untitled.png]]

save

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3f1d2cec_Untitled.png]]

fetch 가져오기 , push내보내기

- 첫 push후 github에서 기본브랜치가 master로 되어있는지 확인

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9071973e_Untitled.png]]

#### 브랜치 기본 master로 재설정하기

1. Setting으로 가기
2. 좌측 Branches 클릭
3. Default Branch 변경

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9b45f037_Untitled.png]]

#### fetch

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/48f95e59_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8ae461fb_Untitled.png]]

브랜치명 그대로 사용하도록 설정

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/dffdba45_Untitled.png]]

**이때 생성된 Remote Tracking에있는 브랜치는 Local브랜치와 다르다**

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/df0a0b61_Untitled.png]]

- 현재 `README.md` 파일이 추가가 되어있지 않는데 **Remote에 있는 브랜치를 merge해야 fetch가 정상적으로 완료된다.**

#### Full

- fetch한 후 별도의 병합처리한 것을 한번에 처리해줌

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7d027b25_Untitled.png]]

#### reset / revert

**`reset : 지정버전으로 돌아감`**

- hard : 이후 변경사항 모두 제거
- mixed : 이후 변경사항을 unstaged changes에서 관리
- soft : 이후 변경사항을 staging area에 추가

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3ac6692f_Untitled.png]]

**`revert : 지정한 버전의 취소버전을 새로 추가`**

- history를 변경할 수 없는 경우 유용하다.
- conflict 발생가능성 있음.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/19df318f_Untitled.png]]

### 📍Github에서 프로젝트 다운로드하기

1. 깃헙에서 원하는 프로젝트 주소를 복사한다.
2. 이클립스에서 Git Repositories에 clone repository 를 클릭한다.
3. 복사한 url을 넣고 가져온 후 원하는 프로젝트 폴더를 우클릭하여 import한다.

### 📍협업 체크리스트

---

- [ ]  1. 새 branch를 만들수 있다.
- [ ]  2. 체크아웃해서 작업할 수 있다.
- [ ]  3. 완료된 작업을 master에 반영할 수 있다. `merge`
- [ ]  4. fast-forward-merge 와 non-fast-forward-merge 를 구분할 수 있다.
- [ ]  5. conflict 발생시 해결할 수 있다.

### 📍 github에서 나만의 라이센스템플릿 추가하기

---

GNU General Public License : 엄격하게 관리하는 것

MIT License : 기본 (거의 무료 공개)

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
