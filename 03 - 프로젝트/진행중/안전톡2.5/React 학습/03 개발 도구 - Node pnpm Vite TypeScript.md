---
tags:
  - type/study
  - theme/dev
---

# 03 개발 도구 - Node pnpm Vite TypeScript

## Java 쪽과 비교

| 역할 | 2.0 (Java) | 2.5 web |
|---|---|---|
| 실행 환경 | JDK | Node.js |
| 라이브러리 관리 | Gradle(Maven) | pnpm |
| 의존성 목록 | `build.gradle` | `package.json` |
| 버전 고정 파일 | (Gradle lock 등) | `pnpm-lock.yaml` |
| 라이브러리 저장 위치 | `~/.gradle`, `~/.m2` | `node_modules/` |
| 빌드·개발 서버 | Gradle + Spring Boot | Vite |
| 언어 | Java | TypeScript |
| 테스트 | JUnit | Vitest |

## Node.js

- 브라우저 밖에서 JS를 돌리는 실행기
- 화면 자체는 브라우저에서 돔
	- Node는 개발 도구(Vite, pnpm 등)를 돌리는 용도

## pnpm

- `pnpm install`: `package.json` 대로 `node_modules/` 에 설치
- `pnpm <이름>`: `package.json` 의 `scripts` 실행
	- `pnpm dev` → `vite`
	- `pnpm build` → `tsc -b && vite build`
	- `pnpm test` → `vitest run`
	- `pnpm check` → 타입·린트·디자인·코드규칙·테스트·빌드 전부

## package.json 읽기

- `dependencies`: 화면에 실제 들어가는 라이브러리
	- `react`, `react-dom`: React 본체
	- `react-router`: 주소별 화면
	- `@tanstack/react-query`: 서버 데이터 조회·저장
	- `zustand`, `immer`: 화면 상태
	- `@stackflow/*`: 근로자 앱 화면 쌓기
	- 그 외 업무용: `exceljs`, `pdf-lib`, `pdfjs-dist`, `jsqr`, `qrcode`, `centrifuge`(실시간) 등
- `devDependencies`: 개발할 때만 씀
	- `vite`, `typescript`, `vitest`, `oxlint`, `prettier` 등
- 버전 앞 `^`: 같은 큰 버전 안에서 올라갈 수 있음

## Vite

- 개발: 저장 즉시 반영되는 개발 서버 ([[02 서버가 왜 따로 뜨나]])
- 빌드: `.tsx` 들을 묶고 줄여서 `dist/` 생성
- 설정: `vite.config.ts`

## TypeScript

- JS + 타입
	- Java처럼 변수·함수에 타입을 붙임
	- 실행 전에 타입 오류를 잡음 (`pnpm typecheck`)
- 확장자
	- `.ts`: 일반 코드
	- `.tsx`: 화면(JSX) 들어간 코드
- 자주 보는 문법

```ts
interface Company {        // Java의 DTO 클래스 모양 정의와 비슷
  id: string
  name: string
  children: Company[]
}

type ButtonSize = 'sm' | 'md' | 'lg'   // 이 세 값만 허용 (enum 비슷)

const name = contact?.name ?? ''       // ?. : null이면 멈춤, ?? : null이면 기본값
```

## 환경 파일

- `.env.development`, `.env.stg`, `.env.prod`
- `VITE_` 로 시작하는 값만 화면 코드에서 읽힘
	- `src/config/env.ts` 의 `import.meta.env.VITE_API_BASE_URL`
- `API_PROXY_TARGET` 같은 값은 Vite 설정(`vite.config.ts`)에서만 씀
	- 화면 코드로는 안 들어감
