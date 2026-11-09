---
tags:
  - type/study
  - theme/dev
---

# 04 컴포넌트와 JSX

## 컴포넌트

- 화면 조각 하나 = 함수 하나
	- 함수가 "그릴 모양"을 return
	- 이름은 대문자로 시작 (`Button`, `CompaniesPage`)
- Thymeleaf의 `th:fragment` 와 비슷
	- 차이: 조각 안에 상태·동작까지 같이 가짐

## JSX

- JS 안에 HTML처럼 쓰는 문법
	- `.tsx` 파일에서 씀
- HTML과 다른 점
	- `class` → `className`
	- `onclick="..."` → `onClick={함수}`
	- `{ }` 안에 JS 값·식

## Thymeleaf와 1:1 비교

| 하고 싶은 것 | Thymeleaf | JSX |
|---|---|---|
| 값 출력 | `th:text="${c.name}"` | `{company.name}` |
| 조건 | `th:if="${c.waiting}"` | `{company.isWaiting && <Badge>…</Badge>}` |
| 반복 | `th:each="c : ${list}"` | `{list.map((c) => <Node key={c.id} … />)}` |
| 조각 불러오기 | `th:replace="~{…}"` | `<CompanyNode … />` |
| 조각에 값 넘기기 | fragment 파라미터 | props |

## props: 부모가 넘기는 값

- 함수의 인자
- 예: `design-system/components/Button.tsx`

```tsx
export function Button({
  variant = 'secondary',
  size = 'md',
  busy = false,
  disabled,
  className,
  ...rest
}: ButtonProps) {
  return (
    <button
      className={
        'btn' +
        VARIANT_CLASS[variant] +
        SIZE_CLASS[size] +
        (busy ? ' btn--busy' : '') +
        (className ? ' ' + className : '')
      }
      disabled={disabled || busy}
      aria-busy={busy || undefined}
      {...rest}
    />
  )
}
```

- 읽는 법
	- `variant = 'secondary'`: 안 넘기면 기본값
	- `...rest`: 나머지 값(onClick 등)을 `<button>` 에 그대로 전달
- 쓰는 쪽 (`features/site/CompaniesPage.tsx`)

```tsx
<Button variant="primary" onClick={() => openDrawer(() => <CompanyInviteDrawer />)}>
  + 회사 초대
</Button>
```

## key: 반복할 때 필수

- `map` 으로 여러 개 그릴 때 각 항목에 고유 `key`
	- React가 어떤 항목이 바뀌었는지 구분하는 용도
- 예: `<CompanyNode key={company.id} … />`

## 화면이 다시 그려지는 때

- props가 바뀌거나
- 상태가 바뀌면 → [[05 상태와 Hook]]
- 함수가 다시 실행되고, 바뀐 부분만 실제 화면에 반영

## 프로젝트 규칙

- 화면은 `src/design-system/index.ts` 에서 가져온 컴포넌트를 씀
	- `Button`, `Card`, `Badge`, `Notice`, `EmptyState`, `LoadingState` 등
	- `AGENTS.md` 코드 규칙
- 디자인 규칙은 `src/design-system/README.md`
