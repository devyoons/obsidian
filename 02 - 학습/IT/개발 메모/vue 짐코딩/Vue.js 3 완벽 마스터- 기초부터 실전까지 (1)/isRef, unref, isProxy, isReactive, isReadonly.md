---
별칭:
  - "학습 - isRef, unref, isProxy, isReactive, isReadonly"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b815a9624d5e4fed4bf28
---

# 학습: isRef, unref, isProxy, isReactive, isReadonly

## 세부 내용

### isRef()

값이 ref 객체인지 확인합니다.

```jsx
if (isRef(foo)) {
	foo.value
}
```

### unref()

매개변수가 ref이면 내부 값(`.value`)을 반환하고 아니면 매개변수 자체를 반환합니다. 이것은 다음 표현식에 대한 syntactic sugar 입니다. `val = isRef(val) ? val.value : val`

```jsx
function useFoo(x) {
	const unwrapped = unref(x)
}
```

### isReactive()

객체가 `reactive()` 또는 `shallowReactive()`에 의해 생성된 프록시인지 확인합니다.

```jsx
const person = reactive({...})
isReactive(person)
```

### isReadonly()

객체가 `readonly()` 또는 `shallowReadonly()`에 의해 생성된 프록시인지 확인합니다.

```jsx
const option = readonly({...});
isReadonly(option)
```

### isProxy()

객체가 `reactive()`, `shallowReactive()`, `readonly()`, `shallowReadonly()`에 의해 생성된 프록시인지 확인합니다.

```jsx
isProxy(person)
isProxy(option)
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
