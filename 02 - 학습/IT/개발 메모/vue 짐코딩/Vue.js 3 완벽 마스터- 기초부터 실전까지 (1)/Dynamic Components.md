---
별칭:
  - "학습 - Dynamic Components"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b818cb75ac1e45f5c4a3d
---

# 학습: Dynamic Components

## 세부 내용

### 동적 컴포넌트 (Dynamic Component)

컴포넌트를 동적으로 변경하고 싶을 때 `v-bind:is` 속성을 사용해서 변경할 수 있습니다. 동적 컴포넌트는 탭 인터페이스와 같이 컴포넌트간에 동적으로 전환해야 할 때 유용합니다.

```html
<component :is="currentTabComponent"></component>
```

위 예시에서 `:is` 속성에 전달된 값은 다음 중 하나를 포함할 수 있습니다.

- 등록된 컴포넌트의 문자열 이름 `string`
- 실제 가져온 컴포넌트 객체 `object`

<aside>
💡 `<component :is=”...” />`를 사용하여 여러 컴포넌트간 전환하면 컴포넌트의 마운트가 매번 해제됩니다. 이때 `<KeepAlive> 내장 컴포넌트`를 사용하여 “비활성 컴포넌트"들의 “활성” 상태를 유지할 수 있도록 강제할 수 있습니다.

</aside>

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
