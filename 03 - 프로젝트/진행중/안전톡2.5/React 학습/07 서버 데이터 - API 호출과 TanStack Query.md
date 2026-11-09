---
tags:
  - type/study
  - theme/dev
---

# 07 서버 데이터 - API 호출과 TanStack Query

## 2.0과 비교

- 2.0
	- Controller가 조회 → Model에 담음 → Thymeleaf가 출력
	- 또는 jQuery `$.ajax` 로 JSON 받아 DOM 수정
- 2.5
	- 화면이 `fetch` 로 JSON API 호출
	- 받은 데이터를 TanStack Query가 보관(캐시)
	- 데이터가 오면 화면이 다시 그려짐

## 1단계: API 호출 함수 `src/shared/api/client.ts`

- 화면에서 `fetch` 직접 쓰지 않음 (`AGENTS.md`)
- 공통 응답 모양

```ts
export interface ApiResponse<T> {
  timestamp: string
  errorCode?: string
  success: boolean
  message?: string
  data: T
  traceId?: string
}
```

- 하는 일
	- `${env.apiBaseUrl}${path}` 로 호출 → 실제로는 `/api/...`
	- `credentials: 'include'`: 쿠키(로그인 토큰) 같이 보냄
	- `success` 가 false 면 `ApiError` 를 던짐
	- 세션 오류 코드(`EXPIRED_TOKEN` 등)면 세션 갱신 후 한 번 다시 호출 (`withSessionRenewal`)
- 함수 두 종류
	- `apiGet` · `apiPost` 등: 기존 safety-back 용
	- `backPost` · `backPostMultipart`: 새 `back/` 용, 타입 검사 있음

## back API 타입 자동 생성

- `pnpm api:types`
	- `../docs/api/openapi.yaml` 로 `src/shared/api/schema.d.ts` 생성
	- 손으로 고치지 않음 (`AGENTS.md`)
- 효과
	- `backPost('/organization/network/selectNetworkList', { … })`
	- 없는 경로나 틀린 요청 값이면 타입 오류로 바로 잡힘
	- 백엔드 DTO 모양이 화면 타입으로 그대로 옴

## 2단계: 조회 정의 `queryOptions` (`features/<업무>/queries.ts`)

- 예: `features/site/queries.ts`

```ts
export const siteCompaniesQuery = (siteId: string) =>
  queryOptions({
    queryKey: ['sites', siteId, 'companies'],
    queryFn: async () => {
      const { data } = await backPost('/organization/network/selectNetworkList', { schPobId: siteId })
      return toSiteNetwork(data, siteId)
    },
  })
```

- `queryKey`: 이 데이터의 이름표
	- 같은 key 면 다른 화면에서도 저장된 값 재사용
- `queryFn`: 실제 가져오는 방법
	- 받은 서버 DTO를 `toSiteNetwork` 로 화면용 모양으로 바꿔서 돌려줌

## 3단계: 화면에서 쓰기 `useQuery`

- 예: `features/site/CompaniesPage.tsx`

```tsx
const { data: network, error, isLoading } = useQuery({ ...siteCompaniesQuery(siteId), enabled: Boolean(site) })
```

- `isLoading`: 가져오는 중 → `<LoadingState />`
- `error`: 실패 → `<Notice tone="danger">{apiErrorMessage(error)}</Notice>`
- `data`: 결과 → 목록 그림
- `enabled`: 현장이 정해진 뒤에만 호출

## 저장·수정·삭제 `useMutation`

- 예: `features/site/EmergencyContactDrawer.tsx`

```tsx
const save = useMutation({
  mutationFn: () =>
    contact ? updateEmergencyContact(siteId, contact.id, form) : insertEmergencyContact(siteId, form),
  onSuccess: () => {
    refreshContacts()
    closeDrawerWithToast(contact ? '연락처를 고쳤습니다' : '연락처를 추가했습니다')
  },
})
```

- `save.mutate()` 로 실행, `save.isPending` 으로 진행 중 표시
- `refreshContacts()`
	- `queryClient.invalidateQueries({ queryKey: ['sites', siteId, 'emergency-contacts'] })`
	- "이 목록은 낡았다" 표시 → 다시 조회 → 화면 갱신

## 공통 설정 `src/shared/api/queryClient.ts`

- 세션 오류면 로그인 화면으로 (`redirectToLogin`)
- `ApiError`(서버가 실패라고 답한 경우)는 재시도 안 함
	- 그 외(연결 실패 등)는 최대 2번 재시도
- 창 다시 볼 때 자동 재조회 안 함 (`refetchOnWindowFocus: false`)
