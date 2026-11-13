---
별칭:
  - "학습 - 04. CLAUDE.md와 메모리"
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

# 04. CLAUDE.md와 메모리

## 학습 목표

- CLAUDE.md의 위치별 쓰임(사용자, 프로젝트, 개인 로컬)을 구분한다.
- `/init`으로 프로젝트 CLAUDE.md를 만들고 다듬는다.
- 자동 메모리(auto memory)가 무엇이고 어디에 쌓이는지 안다.

## 설명

### CLAUDE.md란

세션을 시작할 때마다 Claude가 자동으로 읽는 안내문입니다. "이 프로젝트에서는 이렇게 일해"를 매번 말하지 않게 해 줍니다.

| 위치                                     | 범위                                 | 공유               |
| -------------------------------------- | ---------------------------------- | ---------------- |
| `~/.claude/CLAUDE.md`                  | 내 모든 프로젝트                          | 나만               |
| `./CLAUDE.md` 또는 `./.claude/CLAUDE.md` | 이 프로젝트                             | git으로 팀과 공유      |
| `./CLAUDE.local.md`                    | 이 프로젝트, 나만                         | `.gitignore`에 추가 |
| `.claude/rules/*.md`                   | 주제별 규칙. `paths` 앞머리로 특정 경로에만 적용 가능 | 팀                |

Windows에서 `~`는 `C:\Users\<사용자>`입니다.

### 무엇을 쓰나

- 빌드·테스트·린트 명령(`npm run test` 등)
- 코드 스타일, 폴더 구조의 숨은 규칙
- "이건 절대 하지 마" 같은 함정
- 다른 파일 불러오기: `@docs/architecture.md`

### 짧게 유지하기

공식 문서는 **200줄 이하**를 권합니다. 길면 중요한 말이 묻힙니다. 여러 단계 절차는 스킬(09단계)로 옮기세요. CLAUDE.md는 권고일 뿐이라, 반드시 지켜야 할 규칙은 권한 거부 규칙이나 훅(10단계)으로 강제합니다.

### 자동 메모리

Claude가 작업하면서 배운 것을 스스로 적어 두는 기능입니다. 로컬 세션에서는 기본으로 켜져 있습니다.

- 위치: `~/.claude/projects/<프로젝트>/memory/` (`MEMORY.md` 목차 + 주제별 파일)
- 매 세션 `MEMORY.md`의 앞 200줄(또는 25KB)을 읽습니다.
- `/memory`에서 CLAUDE.md 편집, 자동 메모리 켜고 끄기, 저장된 항목 보기를 합니다.
- 끄려면 설정 `autoMemoryEnabled`를 false로 하거나 환경 변수 `CLAUDE_CODE_DISABLE_AUTO_MEMORY=1`.

### 지금 무엇이 읽혔는지 보기

`/context all`을 입력하면 불러온 메모리 파일 목록이 나옵니다.

## 실습 과제

연습용 프로젝트가 필요합니다. 기존 프로젝트를 쓰거나 아래처럼 만듭니다.

```text
practice 폴더에 Node.js로 간단한 할 일 API(express)를 만들고, npm test로 돌아가는 테스트 하나를 넣어 줘.
```

### 실습 1. `/init`

```text
/init
```

생성된 CLAUDE.md를 열어 읽고, 틀리거나 빠진 내용을 고칩니다.

### 실습 2. 규칙 추가하고 효과 보기

```text
CLAUDE.md에 "커밋 메시지와 코드 주석은 한국어로 쓴다"와 "새 API를 만들면 테스트를 함께 만든다"를 추가해 줘.
```

`/clear`로 새로 시작한 뒤 확인합니다.

```text
할 일을 삭제하는 DELETE /todos/:id API를 추가해 줘.
```

테스트가 함께 생기고 주석이 한국어인지 봅니다.

### 실습 3. 개인 설정 분리

```text
CLAUDE.local.md를 만들어 "답변은 짧게, 결론부터"를 적고 .gitignore에 추가해 줘.
```

### 실습 4. 메모리 들여다보기

```text
/memory
```

```text
/context all
```

## 확인 체크리스트

- [ ] 사용자·프로젝트·로컬 CLAUDE.md의 차이를 설명할 수 있다.
- [ ] `/init`으로 만든 CLAUDE.md를 직접 다듬었다.
- [ ] CLAUDE.md 규칙이 새 세션에 반영되는 것을 확인했다.
- [ ] CLAUDE.local.md를 만들고 git에서 뺐다.
- [ ] `/memory`와 `/context all`로 불러온 메모리를 확인했다.
- [ ] "꼭 지켜야 할 규칙은 CLAUDE.md가 아니라 권한·훅으로" 이유를 안다.

## 출처

- https://code.claude.com/docs/en/memory
- https://code.claude.com/docs/en/best-practices

---
[[02 - 학습/IT/개인공부/클로드/03-프롬프트-잘-쓰기|← 03 프롬프트]] · [[02 - 학습/IT/개인공부/클로드/클로드|로드맵]] · [[02 - 학습/IT/개인공부/클로드/05-계획-모드와-권한|다음: 05 계획 모드와 권한 →]]
