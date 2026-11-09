---
tags:
  - type/study
  - theme/dev
---

# 06 화면 이동 - React Router

## 역할

- 주소 → 어떤 컴포넌트를 그릴지 연결
- 2.0의 `@GetMapping("/…")` 이 view 이름 return 하던 것과 비슷
	- 차이: 서버가 아니라 브라우저 안에서 판단
	- 화면 이동해도 서버에 HTML 요청 안 함

## 프로젝트에서 보기: `src/app/router.tsx`

```tsx
export const router = createBrowserRouter([
  { path: '/login', element: <LoginPage /> },
  { path: '/worker/*', element: <WorkerApp /> },
  {
    element: <RequireSession />,
    children: [
      { path: '/', element: <StartPage /> },
      { path: '/:group/:sub?', element: <AdminLayout /> },
    ],
  },
])
```

- 일부만 발췌
- `RequireSession`
	- `features/auth/RequireSession.tsx`
	- `useQuery(sessionQuery)` 로 로그인 정보 조회
	- 있으면 `<Outlet />` 자리에 children 화면을 그림
	- 없으면 로딩 또는 오류 안내
	- Spring Security 필터 같은 역할을 화면 쪽에서 함 (서버 검사는 별도로 그대로 필요)
- `/:group/:sub?`
	- `:group`, `:sub` 는 주소 변수 (`@PathVariable` 비슷)
	- `?` 는 생략 가능

## 관리자 화면이 고르는 방식

- `features/admin-shell/AdminLayout.tsx`

```tsx
const { group, sub } = useParams()
const g = navGroup(group)
const x = g.subs.find((y) => y.key === sub) ?? g.subs[0]
const { Page, Actions } = SCREENS[x.key]
```

- `/site/companies` 이면
	- group = `site`, sub = `companies`
	- `navigation.ts` 의 `site` 그룹 → `companies`("연결된 회사")
	- `screens.ts` 의 `companies: { Page: CompaniesPage, Actions: CompaniesActions }`
- 새 화면 추가 순서 (`AGENTS.md`)
	1. `src/features/<업무>/<이름>Page.tsx`
	2. 제목 줄 단추가 있으면 같은 파일에 `<이름>Actions`
	3. `navigation.ts` 에 메뉴 등록
	4. `screens.ts` 에 화면 등록

## 근로자 화면은 다름

- `/worker/*` 는 Stackflow 로 화면을 쌓음
	- `features/worker-app/workerStack.tsx`
	- 이동은 `useFlow()` 의 `push` · `pop` · `replace`
	- `react-router` 의 `navigate` 안 씀 (`AGENTS.md`)
- 앱처럼 화면이 옆으로 쌓이는 이동용

## 개발 전용 주소

- `MODE === 'development'` 일 때만 `/design-system`
- `import.meta.env.DEV` 일 때만 `/__compare`, `/__icons`
- 운영 빌드에는 안 들어감
