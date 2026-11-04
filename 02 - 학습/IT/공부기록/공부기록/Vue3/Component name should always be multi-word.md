---
별칭:
  - "학습 - Component name should always be multi-word."
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/16324612498b80518a32ee43b3e60f7d
---

# 학습: Component name should always be multi-word.

## 세부 내용

---

---

#### 🤮 컴포넌트의 이름이 단일인 경우에 발생하는 에러

- 단일 단어로 구성된 HTML 엘리먼트와의 충돌을 방지하기 위함이다.

![[02 - 학습/IT/공부기록/공부기록/Vue3/첨부/b8a6e4a2_image.png]]

![[02 - 학습/IT/공부기록/공부기록/Vue3/첨부/09641b88_image.png]]

#### ✅해결방법

1. package.json에 아래 룰을 추가해준다.

```json
"vue/multi-word-component-names": 0
```

![[02 - 학습/IT/공부기록/공부기록/Vue3/첨부/c2e592f5_image.png]]

1. 컴포넌트 명을 두단어 이상 사용한다.

```jsx
export default {
  name: 'VueHeader',
  // `vue-header`, 'vue_header', 'vueHeader' 전부 다 가능!
};
```

<aside>
💡

참고

[vue/multi-word-component-names | eslint-plugin-vue](https://eslint.vuejs.org/rules/multi-word-component-names.html#vue-multi-word-component-names)

[[에러 일지] Component name should always be multi-word.](https://velog.io/@uxolrv/%EC%97%90%EB%9F%AC-%EC%9D%BC%EC%A7%80-Component-name-should-always-be-multi-word)

</aside>

## 관련 노트

- 상위: [[02 - 학습/IT/공부기록/공부기록/Vue3/Vue3|Vue3]]
