---
별칭:
  - "학습 - 07. git 연동 — 커밋, 브랜치, worktree, 되돌리기"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 2026-11-12
수정일: 2026-11-12
주제:
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 07. git 연동 — 커밋, 브랜치, worktree, 되돌리기

## 학습 목표

- Claude에게 커밋, 브랜치, PR 작업을 안전하게 맡긴다.
- git worktree로 여러 작업을 서로 섞이지 않게 나란히 돌린다.
- 체크포인트(되돌리기)와 git의 차이를 안다.

## 설명

### Claude에게 git 맡기기

Claude는 `git` 명령을 직접 씁니다. 자연어로 시키면 됩니다.

- "지금 변경 사항을 보고 커밋 메시지를 써서 커밋해 줘"
- "`feat/priority` 브랜치를 만들어서 거기서 작업해"
- "main과 비교해서 무엇이 바뀌었는지 요약해 줘"
- GitHub CLI(`gh`)가 있으면 "PR을 만들어 줘"도 됩니다.

안전 수칙: `git push`, `reset --hard`, 강제 push는 거부 규칙에 넣어 두고(05단계), 필요할 때 내가 직접 하거나 그때그때 승인합니다.

### worktree: 작업마다 따로 된 작업 폴더

같은 저장소를 브랜치별 폴더로 나눠, 세션끼리 파일이 섞이지 않게 합니다.

- CLI: `claude --worktree feature-auth` (또는 `-w`). 커밋이 하나 이상 있는 저장소여야 합니다.
- 데스크톱 앱: 세션을 시작할 때 worktree 토글을 켭니다(기본은 꺼짐). 폴더는 `<프로젝트>/.claude/worktrees/`에 생깁니다. 위치와 브랜치 접두어는 설정 > Code에서 바꿉니다.
- `.env`처럼 git이 무시하는 파일도 worktree에 복사하려면 `.worktreeinclude`에 적습니다.

### 체크포인트 vs git

| | 체크포인트(`/rewind`, `Esc Esc`) | git |
|---|---|---|
| 대상 | 이 세션에서 Claude가 바꾼 것 | 저장소 전체 이력 |
| 용도 | "방금 한 거 취소" | 오래 남길 기록, 협업 |
| 주의 | 세션 밖 변경은 못 되돌림 | 커밋해야 남음 |

체크포인트는 실행 취소 버튼, git은 저장 버튼이라고 생각하세요.

## 실습 과제

할 일 API 프로젝트를 git 저장소로 만듭니다.

```text
이 프로젝트를 git 저장소로 초기화하고, node_modules를 뺀 .gitignore를 만든 다음 첫 커밋을 해 줘.
```

### 실습 1. 브랜치에서 작업하고 커밋

```text
feat/search 브랜치를 만들고, 제목으로 할 일을 검색하는 GET /todos?q= 기능을 테스트와 함께 추가해 줘.
끝나면 변경 내용을 보고 커밋 메시지를 직접 써서 커밋해 줘.
```

```text
!git log --oneline -5
```

### 실습 2. worktree로 두 작업 나란히

터미널 두 개를 엽니다.

```powershell
claude -w feat-export
```

```text
할 일 목록을 CSV로 내보내는 GET /todos/export를 만들어 줘.
```

다른 터미널에서:

```powershell
claude -w fix-validation
```

```text
제목이 빈 문자열이면 400을 돌려주게 고쳐 줘.
```

데스크톱 앱이라면 worktree를 켠 세션 두 개로 같은 일을 합니다. 끝나면 각 브랜치를 main에 합칩니다.

```text
feat-export와 fix-validation 브랜치를 main에 병합해 줘. 충돌이 나면 설명하고 해결해.
```

### 실습 3. 되돌리기와 git 비교

```text
README.md를 전부 영어로 바꿔 줘.
```

`/rewind`로 되돌린 뒤 `!git status`로 변경이 사라졌는지 봅니다.

## 확인 체크리스트

- Claude가 쓴 커밋 메시지로 커밋했다.
- 브랜치를 만들어 작업하고 `git log`로 확인했다.
- worktree 세션 두 개를 나란히 돌리고 병합했다.
- 체크포인트와 git의 차이를 설명할 수 있다.
- 위험한 git 명령을 거부 규칙에 넣어 두었다.

## 출처

- https://code.claude.com/docs/en/worktrees
- https://code.claude.com/docs/en/desktop
- https://code.claude.com/docs/en/checkpointing

---
[[02 - 학습/IT/개인공부/클로드/06-개발-워크플로|← 06 개발 워크플로]] · [[02 - 학습/IT/개인공부/클로드/클로드|로드맵]] · [[02 - 학습/IT/개인공부/클로드/08-문서-보고서-작업|다음: 08 문서·보고서 →]]
