---
별칭:
  - "강의 - Git CLI"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/3b7be75419cc44489a385583719b1e0c
주제:
  - "[[00 - 대시보드/주제/Git·GitHub|Git·GitHub]]"
---

# 강의: Git CLI

## 강의 내용

---

---

### Git CLI

- 옵션값을 다양하게 사용할 수 있는 것.

### Git GUI

- source tree
- github desktop
- gitkacken
- egit(이클립스)
- ...

### git 기본 용어

**`Repository: 저장소`**

- 저장소는 히스토리, 태그 소스

**`로컬 저장소 (local repository)`**

- git init 명령으로 생성되는 “.git”폴더
- 커밋, 커밋을 구성하는 객체, 스테이지가 모두 이 폴더에 저장

**`원격 저장소(remote repository)`**

- 로컬 저장소를 업로드하는 곳
- GitHub, GitLab과 같은 저장소가 원격 저장소

## Git

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/04d4edf0_Untitled.png]]

**깃은 버전 관리 시스템이다.**

방대한 소스코드를 공동으로 관리하기 위해 만들어진 시스템이며, **깃의 용도는 버전관리, 백업, 협업을 위주**로 한다.

- **버전관리** : 수많은 파일들의 변경 사항 이력을 추적하고 관리할 수 있다.
    
    여기서 **Commit이라는 단어는 새로운 버전을 생성한다는 의미**, 하나의 버전에서 여러 종류의 파일을 함께 관리 할 수 있다.
    
- **백업** : 컴퓨터라는 하드웨어는 언젠가는 손상되기 때문에, **다른 공간에도 작업 파일을 보관해야한다.**

- **협업** : 모두 다른 공간에 있어도 **원격 저장소를 매개로 함께 작업을 동시에 진행할 수 있다.**
    
    **`pull`**은 다른 사람이 작업하던 것을 내 컴퓨터로 가져와서 작업해야할 때 사용
    
    **`branch`**는 여러 사람이 공통된 파일을 기반으로 서로 다른 작업을 병행해야 할 때 사용하는 기능
    

### Git 버전 관리

- 버전으로 만들어지기 전 파일을 수정하는 곳 :  working directory
- 버전관리를 원하는 파일을 모으는 곳 : staging area
- 만들어진 버전들이 모인 곳 : repository

**`git config` :** 사용자 정보를 설정한다.(최초 1회만 실행)

```bash
$ git config --global user.name "yoonseo94"
$ git config --global user.email "o0o0526@naver.com"
$ git config --global core.editor code

$ git config --list    // 설정값 전체 확인

$ git config user.name // 특정 설정값 확인
```

### 1. 디렉토리 이동

| 분류 | 명령어 | 내용 설명 |
| --- | --- | --- |
| 홈 디렉토리로 이동 | `$ cd ~`  | c드라이브로 이동시 
`$ cd /c/` |
| 디렉토리명으로 이동 | `$ cd [디렉토리명]` |  |
| 현재 경로를 출력 | `$ pwd` |  |
| 디렉토리의 내용을 출력 | `$ ls` |  |
| 디렉토리의 숨김 파일 포함 출력 | `$ ls -a` | 위 옵션과 합쳐서 `ls-al` 로 사용가능 |
| 터미널 창의 내용을 삭제  | `$ clear` |  |
| 터미널 창을 종료  |  |  |

### 2. git 유저/ 업로드 설정

| 현재 위치에서 지역 저장소를 생성 | `$ git init` |
| --- | --- |
| 깃 환경에서 사용자 이름을 [사용자명]으로 지정 | `$ git config --global user.name “yoonseo94”` |
| 깃 환경에서 사용자 이메일을 [사용자이메일명]으로 지정 | `$ git config --global user.email “o0o0526@naver.com”` |
| 깃의 상태를 확인 | `$ git status` |

### 3. commit 명령어

| [파일명.확장자명]을 스테이지에 올림 | `$ git add [파일명.확장자명]` | `$ git add .` 
현재 경로의 파일을 전체 올림 |
| --- | --- | --- |
| 커밋 메세지 [메세지명]을 붙여 커밋 | `$ git commit -m “[메세지명]”` |  |
| 커밋 내역 확인 | `$ git log`
`$ git log --pretty=oneline`  | 
한줄로 표기하기 |
|  | `$ git show [커밋id]` | 특정 커밋 내역 확인 |
| 최근 버전과 작업 폴더의 수정파일 사이의 차이를 출력 | `$ git diff`
`$ git diff [이전커밋id] [이후커밋id]` |  |
| 지정한 커밋 해시로 이동 | `$ git checkout [커밋 해시]` |  |
| 가장 최근 커밋을 취소 | `$ git reset HEAD^`
`$ git reset HEAD~n` | 현재 HEAD의 이전 커밋으로 되돌리기 
현재부터 n번째 이전 커밋으로 되돌리기 |
| reset 옵션 | `$ git reset --soft [커밋id]`
`$ git reset --mixed [커밋id]`
`$ git reset --hard [커밋id]` | head만 바뀜
staging도 그때로 바뀜
working디렉토리/staging 모두 그때로 바뀜 |
| 지정한 커밋 해시의 변경 이력을 취소 | `$ git revert [커밋 해시]` |  |
| 커밋 수정하는 법 | 파일 수정 후 
`$ git add .
$ git commit --amend` : 최신 커밋 수정 |  |

### 4. 브랜치 명령어

| 새로운 브랜치 [브랜치명]을 생성 | `$ git branch [브랜치명]` |
| --- | --- |
| 브랜치 조회 | `$ git branch`    |
| 브랜치 삭제 | `$ gitbranch -d [브랜치명]` |
| 커밋 로그에서 한 줄에 한 커밋씩 출력 | `$ git log --oneline` |
| 커밋 로그에 각 브랜치의 커밋을 그래프로 표시 | `$ git log --branches --graph` |
| [브랜치명]을 master 브랜치와 병합 | `$ git merge [브랜치명]`
`$ git merge [브랜치명] --edit`
: 병합 후 편집기로 커밋 메세지 수정 가능
`$ git merge [브랜치명] --no-edit`
: 커밋 메세지 수정없이 바로 병합 |
| merge 취소하기  | `$ git merge --abort` |

### 5. git hub 원격 저장소

| 원격 저장소에 연결 | `$ git remote add origin [github 레포지 주소]`
`$ git remote add origin [branch 이름]` |
| --- | --- |
| 원격 저장소 연결 확인 | `$ git remote -v`  |
| 지역 저장소의 커밋을 맨 처음 원격 저장소에 올리는 경우 | `$ git push -u origin master` |
| 위 내용 확인한 후에 지역 저장소의 커밋을 원격 저장소에 올리는 경우(업로드) | `$ git push`
`$ git push origin master` |
| 원격 저장소의 커밋을 지역 저장소로 가져옴 | `$ git pull`
`$ git pull origin master` |
| 원격 저장소를 [지역저장소명]에 복제하기 | `$ git clone [원격 저장소 주소]` |

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
