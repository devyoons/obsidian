---
별칭:
  - "학습 - 10. MCP, 서브에이전트, 훅"
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

# 10. MCP, 서브에이전트, 훅

## 학습 목표

- MCP 서버를 연결해 Claude가 외부 도구(GitHub, DB, 문서 등)를 쓰게 한다.
- 서브에이전트를 만들어 조사·리뷰 같은 일을 따로 맡긴다.
- 훅으로 "반드시 지켜야 할 규칙"을 자동으로 강제한다.

## 설명

### MCP(Model Context Protocol)

Claude에 외부 도구를 꽂는 표준입니다.

원격(HTTP) 서버:

```powershell
claude mcp add --transport http <이름> <URL>
claude mcp add --transport http <이름> <URL> --header "Authorization: Bearer <토큰>"
```

로컬(stdio) 서버(서버 명령 앞에 `--`):

```powershell
claude mcp add --transport stdio <이름> -- npx -y <패키지>
claude mcp add --env API_KEY=<값> --transport stdio <이름> -- npx -y <패키지>
```

| 범위(`--scope`, `-s`) | 저장 위치 | 쓰임 |
|---|---|---|
| `local`(기본) | `~/.claude.json` | 이 프로젝트, 나만 |
| `project` | 프로젝트의 `.mcp.json` | 팀과 공유 |
| `user` | `~/.claude.json` | 내 모든 프로젝트 |

관리: `claude mcp list`, `claude mcp get <이름>`, `claude mcp remove <이름>`. 세션 안에서는 `/mcp`로 상태 확인과 로그인을 합니다.

`.mcp.json` 예:

```json
{
  "mcpServers": {
    "docs": { "type": "http", "url": "https://example.com/mcp" }
  }
}
```

토큰은 파일에 직접 쓰지 말고 `${VAR}` 형식으로 환경 변수를 씁니다.

### 서브에이전트

별도 컨텍스트에서 일하고 결과만 돌려주는 보조 Claude입니다. 큰 조사를 맡기면 **본 대화의 컨텍스트가 덜 찹니다**.

- 내장: Explore(읽기 전용 탐색), Plan(계획용 조사), general-purpose(모든 도구) 등
- 직접 만들기: `.claude/agents/<이름>.md`(프로젝트) 또는 `~/.claude/agents/<이름>.md`(전체)
- 필수 앞머리: `name`, `description`. 선택: `tools`, `model`(sonnet, opus, haiku, inherit 등), `permissionMode`, `maxTurns`, `skills`, `isolation: worktree` 등
- `/agents`: 버전에 따라 만들기 마법사를 열거나 파일 위치를 안내합니다.

### 훅(hooks)

특정 시점에 내 명령을 자동 실행합니다. CLAUDE.md는 "부탁"이고 훅은 "강제"입니다.

주요 이벤트: `SessionStart`, `UserPromptSubmit`, `PreToolUse`(도구 쓰기 전, 막을 수 있음), `PostToolUse`(도구 쓴 뒤), `Stop`(응답 끝), `Notification`, `PreCompact` 등.

settings.json 모양:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [{ "type": "command", "command": "npx prettier --write ." }]
      }
    ]
  }
}
```

막기: 훅 명령이 **종료 코드 2**로 끝나면 동작이 막히고 stderr 내용이 이유로 전달됩니다. `/hooks`로 현재 설정을 봅니다.

## 실습 과제

### 실습 1. MCP 연결

쓰고 싶은 서비스의 공식 MCP 서버 주소를 찾아 연결합니다(예: 사내 Gitea, Notion, 문서 검색 등). 데스크톱 앱이나 claude.ai에 이미 연결된 커넥터가 있다면 그것도 확인해 봅니다.

```powershell
claude mcp add --transport http <이름> <URL>
claude mcp list
```

세션에서:

```text
/mcp
```

```text
<이름> MCP로 할 수 있는 일을 알려 주고, 하나를 실제로 실행해 줘.
```

### 실습 2. 리뷰 서브에이전트

`.claude/agents/reviewer.md`:

```markdown
---
name: reviewer
description: 코드 변경을 정확성·보안·테스트 누락 관점에서 리뷰할 때 쓴다. 코드를 고치지 않는다.
tools: Read, Grep, Glob
model: sonnet
---

너는 꼼꼼한 리뷰어다. 변경된 파일을 읽고 문제를 심각도 순으로 `파일:줄 - 문제 - 고칠 방법` 형식으로 보고한다. 코드는 고치지 않는다.
```

```text
reviewer 서브에이전트로 지금 변경 사항을 리뷰해 줘.
```

### 실습 3. 탐색 서브에이전트

```text
Explore 에이전트로 이 저장소에서 입력 검증을 하는 곳을 모두 찾아 목록만 돌려줘.
```

본 대화의 `/context` 사용량을 직접 찾게 했을 때와 비교해 봅니다.

### 실습 4. 훅으로 테스트 강제

`.claude/settings.json`에 추가(Claude에게 시켜도 됩니다):

```json
{
  "hooks": {
    "Stop": [
      { "hooks": [{ "type": "command", "command": "npm test --silent" }] }
    ]
  }
}
```

```text
/hooks
```

작은 기능을 시켜 보고, 응답이 끝날 때 테스트가 자동으로 도는지 확인합니다.

## 확인 체크리스트

- `claude mcp add`로 서버를 연결하고 `/mcp`에서 확인했다.
- local, project, user 범위 차이를 안다.
- 직접 만든 서브에이전트로 리뷰를 받았다.
- 서브에이전트가 컨텍스트를 아끼는 이유를 설명할 수 있다.
- 훅을 하나 걸어 자동 실행을 확인했다.
- 종료 코드 2로 동작을 막을 수 있다는 것을 안다.

## 출처

- https://code.claude.com/docs/en/mcp
- https://code.claude.com/docs/en/sub-agents
- https://code.claude.com/docs/en/hooks

---
[[02 - 학습/IT/개인공부/클로드/09-슬래시명령-스킬-플러그인|← 09 슬래시 명령·스킬·플러그인]] · [[02 - 학습/IT/개인공부/클로드/클로드|로드맵]] · [[02 - 학습/IT/개인공부/클로드/11-컨텍스트와-비용|다음: 11 컨텍스트와 비용 →]]
