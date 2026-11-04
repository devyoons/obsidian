---
별칭:
  - "학습 - Slots"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81ce926efb0a04af9eed
---

# 학습: Slots

## 세부 내용

### Slot 이란?

HTML 요소와 마찬가지로 우리가 만든 컴포넌트에 콘텐츠를 전달할 수 있으면 유용합니다. `<FancyButton>` 컴포넌트를 만든 후 콘텐츠를 전달해 보도록 하겠습니다.

```html
<!-- FancyButton.vue -->
<template>
	<button class="fancy-btn">
		<slot></slot>
	</button>
</template>
```

- Style
    
    ```css
    .fancy-btn {
    	color: #fff;
    	background: linear-gradient(315deg, #42d392 25%, #647eff);
    	border: none;
    	padding: 5px 12px;
    	margin: 5px;
    	border-radius: 8px;
    	cursor: pointer;
    }
    ```
    

위에 정의한 컴포넌트를 부모 컴포넌트에서 사용해보겠습니다.

```html
<FancyButton>
	<!-- 슬롯 콘텐츠 -->
	Click!!
</FancyButton>
```

**`<slot>` 요소는 부모 컴포넌트에서 제공하는 콘텐츠를 나타내는 슬롯 콘텐츠 입니다.** 그리고 슬롯은 텍스트 뿐만아니라 HTML요소, 컴포넌트 등 다양한 모든 콘텐츠가 될 수 있습니다.

```html
<FancyButton>
	<!-- 슬롯 콘텐츠 -->
  <span style="color: red">Click me</span>
  <i>!</i>
</FancyButton>
```

![[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/첨부/slots dbdaf1e8.png]]

### **Fallback Content**

상위 컴포넌트에서 슬롯 콘텐츠가 제공되지 않을때 슬롯에 대한 폴백(기본 콘텐츠)을 지정할 수 있습니다.

```html
<!-- FancyButton.vue -->
<template>
  <button class="btn">
    <slot>Default Click!!</slot>
  </button>
</template>
```

### Named Slots

`<slot>` 요소에 이름을 부여하여 여러개의 `<slot>`을 정의할 수 있습니다.

```html
<!-- BaseCard.vue -->
<template>
  <article>
    <div>
      <slot name="header"></slot>
    </div>
    <div>
      <slot></slot>
    </div>
    <div">
      <slot name="footer"></slot>
    </div>
  </article>
</template>
```

- `<slot>`에 `name`속성을 부여하여 특정 슬롯 콘텐츠가 렌더링 되어야 할 위치를 설정할 수 있습니다.
- `name`이 없는 `<slot>`의 이름은 암시적으로 `default`입니다.

```html
<!-- 부모 컴포넌트 사용 예시 -->
<template>
  <BaseCard>
    <template v-slot:header>제목</template>
    <template v-slot:default>안녕하세요</template>
		<template v-slot:footer>푸터</template>
  </BaseCard>
</template>
```

위 예시처럼 `name`이 부여된 `<slot>`에 콘텐츠를 전달하려면 `v-slot` 디렉티브를 사용하여 전달할 수 있습니다. 그리고 `v-slot:전달인자`를 사용하여 지정한 슬롯 콘텐츠에 전달할 수 있습니다.

`v-slot`은 `#`으로 단축 표현할 수 있습니다.

```html
<!-- 부모 컴포넌트 사용 예시 -->
<template>
  <BaseCard>
    <template #header>제목</template>
    <template #default>안녕하세요</template>
		<template #footer>푸터</template>
  </BaseCard>
</template>
```

그리고 default 슬롯은 암시적으로 처리할 수 있습니다.

```html
<!-- 부모 컴포넌트 사용 예시 -->
<template>
  <BaseCard>
    <template #header>제목</template>
		<!-- 암시적으로 default slot -->
		안녕하세요
		<template #footer>푸터</template>
  </BaseCard>
</template>
```

### Dynamic Slot Named

`v-slot` 디렉티브 전달인자에 데이터를 바인딩하여 동적으로 변경할 수도 있습니다.

```html
<BaseCard>
  <template v-slot:[dynamicSlotName]>
    ...
  </template>

  <!-- with shorthand -->
  <template #[dynamicSlotName]>
    ...
  </template>
</BaseCard>
```

### Render Scope

슬롯 콘텐츠는 상위 컴포넌트에 정의되어 있으므로 상위 컴포넌트의 데이터 영역에 접근은 가능하지만 <u>**하위 컴포넌트의 영역에는 접근할 수 없습니다.**</u>

### Scoped Slots

[[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Slots|Render Scope]]에서 언급했던 것처럼  슬롯 콘텐츠는 자식 컴포넌트의 데이터에 접근할 수 없습니다.

하지만 **슬롯 콘텐츠**에서 **상위 컴포넌트와 하위 컴포넌트 데이터를 모두 사용**할 수 있다면 우리는 개발할 때 매우 유용합니다.

이러한 방법으로 우리는 자식 컴포넌트에서 `<slot>` 요소를 사용할 때 props를 전달하는 것처럼 속성을 슬롯 콘텐츠에 전달할 수 있습니다.

```html
<!-- MyComponent.vue -->
<template>
  <div>
    <slot :text="greetingMessage" :count="count"></slot>
  </div>
</template>
<script>
import { ref } from 'vue';

export default {
  setup() {
    const greetingMessage = ref('Hello World!');
    const count = ref(1);
    return {
      greetingMessage,
      count,
    };
  },
};
</script>
```

`default` `<slot>`이 <u>**하나 밖에 없는 경우**</u>에는 `v-slot` 디렉티브를 사용하여 `props`를 전달 받을 수 있습니다.

```html
<MyComponent v-slot="slotProps">
  {{ slotProps.text }} {{ slotProps.count }}
</MyComponent>
```

구조분해할당 문법으로 더 사용하기 편리하게 받을 수 있습니다.

```html
<MyComponent v-slot="{ text, count }">
  {{ text }} {{ count }}
</MyComponent>
```

### Named Scoped Slots

이름이 부여된 슬롯도 유사하게 작동합니다. `v-slot:name="slotProps”`

```html
<MyComponent>
  <template #header="headerProps">
    {{ headerProps }}
  </template>

  <template #default="defaultProps">
    {{ defaultProps }}
  </template>

  <template #footer="footerProps">
    {{ footerProps }}
  </template>
</MyComponent>
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
