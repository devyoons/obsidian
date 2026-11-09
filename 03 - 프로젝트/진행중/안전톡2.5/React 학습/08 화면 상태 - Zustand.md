---
tags:
  - type/study
  - theme/dev
---

# 08 화면 상태 - Zustand

## 왜 따로 있나

- `useState` 는 그 컴포넌트 안에서만 씀
- 여러 화면이 같이 보는 값은 바깥 저장소가 필요
	- 예: 지금 선택한 현장, 선택한 날짜
- Zustand = 화면 전체가 공유하는 작은 저장소

## 규칙: 서버 데이터는 넣지 않는다

- `AGENTS.md`
	- 서버 데이터의 조회·저장 → TanStack Query
	- Zustand → 화면 상태만
- 이유
	- 서버 데이터를 두 군데 두면 어느 쪽이 최신인지 헷갈림
	- 캐시·재조회는 TanStack Query가 이미 해줌

## 예 1: 선택한 현장 `features/site-context/currentSite.ts`

```ts
const useSelectedSiteId = create<{ id: string | null }>(() => ({ id: readStoredSiteId() }))

export function selectSite(id: string): void {
  writeStoredSiteId(id)
  useSelectedSiteId.setState({ id })
}
```

- 현장 목록(서버 데이터) → `useQuery(sitesQuery)`
- 선택한 id(화면 상태) → Zustand + `localStorage`
- `useCurrentSite()` 가 둘을 합침

## 예 2: 앱 전체 저장소 `src/store/app.ts`

- 업무별 상태를 한 저장소로 조립
	- `create<이름>State` 들을 모아 `useAppStore`
- 읽기: 화면에서 `useAppStore`
- 바꾸기: `features/<업무>/actions.ts` 에서 `updateApp`

```ts
export function selectLiveAttendanceDate(date: string): void {
  updateApp((draft) => {
    draft.liveAttendanceDate = date
  })
}
```

- `updateApp` 은 immer 의 `produce` 사용
	- `draft` 를 직접 고치는 것처럼 써도 새 객체로 바꿔 줌
	- [[05 상태와 Hook]] 의 "직접 고치면 안 바뀜" 문제를 대신 처리

## 정리

| 데이터 | 둘 곳 |
|---|---|
| 서버에서 온 목록·상세 | TanStack Query |
| 한 컴포넌트 안 입력값 | `useState` |
| 여러 화면이 같이 보는 선택값 | Zustand |
| 업무 계산(급여 등) | `src/domain` 순수 함수 |
