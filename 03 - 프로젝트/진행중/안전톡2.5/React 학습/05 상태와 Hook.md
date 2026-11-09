---
tags:
  - type/study
  - theme/dev
---

# 05 상태와 Hook

## 상태(state)

- 화면이 기억하는 값
	- 입력 중인 글자, 열린 서랍, 선택한 탭 등
- 상태가 바뀌면 그 컴포넌트가 다시 그려짐
- Thymeleaf에는 없는 개념
	- 2.0은 값이 바뀌면 서버에 다시 요청하거나 JS로 DOM을 직접 고쳤음
	- React는 값만 바꾸면 화면은 알아서 따라감

## Hook

- `use` 로 시작하는 함수
	- 컴포넌트 안 맨 위에서만 호출
	- if·for 안에서 호출 금지 (순서가 바뀌면 안 됨)

## useState

- 예: `features/site/EmergencyContactDrawer.tsx`

```tsx
const [form, setForm] = useState<EmergencyContactForm>({
  typeCode: contact?.typeCode ?? '',
  organization: contact?.organization ?? '',
  contactName: contact?.contactName ?? '',
  phone: contact?.phone ?? '',
})
```

- `form`: 현재 값
- `setForm(새값)`: 값 바꾸기 → 다시 그림
- 직접 `form.phone = '…'` 하면 화면 안 바뀜
	- 항상 `setForm` 으로 새 객체를 넘김

## useRef

- 다시 그려도 유지되는 상자, 바꿔도 다시 그리지 않음
- 주로 실제 HTML 요소를 잡을 때
- 예: 같은 파일

```tsx
const phoneRef = useRef<HTMLInputElement>(null)
```

- 입력 오류 시 해당 칸으로 포커스 옮길 때 사용

## useEffect · useLayoutEffect

- 그린 뒤에 할 일 (화면 밖 작업)
	- 이벤트 등록, 크기 감시 등
- return 하는 함수 = 정리(해제) 작업
- 예: `features/admin-shell/AdminLayout.tsx`

```tsx
useLayoutEffect(() => {
  const scroller = scrollerRef.current
  const frame = frameRef.current
  if (!scroller || !frame) return
  const sync = () => frame.style.setProperty('--fh', scroller.clientHeight + 'px')
  sync()
  const observer = new ResizeObserver(sync)
  observer.observe(scroller)
  return () => observer.disconnect()
}, [])
```

- 마지막 `[]`: 처음 한 번만 실행
	- 값을 넣으면 그 값이 바뀔 때마다 실행

## 직접 만든 Hook

- 여러 Hook을 묶은 함수, 이름은 `use…`
- 예: `features/site-context/currentSite.ts` 의 `useCurrentSite()`
	- 현장 목록 조회 + 선택한 현장 id를 합쳐서 `site` 를 돌려줌
	- 여러 화면이 `const { site } = useCurrentSite()` 로 씀

## StrictMode 주의

- `main.tsx` 가 `<StrictMode>` 로 감쌈
- 개발 중에는 일부 함수가 두 번 실행될 수 있음
	- 실수 찾기용, 운영 빌드에서는 안 그럼
