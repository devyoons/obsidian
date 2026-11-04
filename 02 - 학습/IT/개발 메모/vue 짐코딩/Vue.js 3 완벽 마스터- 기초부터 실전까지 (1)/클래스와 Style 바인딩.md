---
별칭:
  - "학습 - 클래스와 Style 바인딩"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b814e8c3df99c66aaa96a
---

# 학습: 클래스와 Style 바인딩

## 세부 내용

### HTML 클래스 바인딩

---

#### 객체 바인딩

클래스를 동적으로 바인딩 하기위해선는 `:class`(`v-bind:class`)를 사용할 수 있습니다.

```html
<div
  class="text"
  :class="{ active: isActive, 'text-danger': hasError }"
></div
```

위 예시처럼 `v-bind:class` 디렉티브는 일반 `class`속성과 공존할 수 있습니다. 그리고 객체를 반환하는 `computed`에 바인딩할 수도 있습니다.

```html
<div class="text" :class="classObject"></div>
```

```jsx
const classObject = computed(() => {
    return {
      active: isActive.value && !hasError.value,
      'text-danger': !isActive.value && hasError.value,
    };
});
```

#### 배열에 바인딩

배열에 `:class`를 바인딩하여 클래스 목록을 적용할 수 있습니다.

```jsx
const activeClass = ref('active')
const errorClass = ref('text-danger')
```

```jsx
<div :class="[activeClass, errorClass]"></div>
```

### 인라인 스타일 바인딩

---

HTML style 속성에 객체값을 바인딩할 수 있습니다.

```jsx
const activeColor = ref('red')
const fontSize = ref(30)
```

```html
<div :style="{ color: activeColor, fontSize: fontSize + 'px' }"></div>
```

템플릿이 더 깔끔해지도록 스타일 객체에 직접 바인딩하는 것이 좋습니다.

```jsx
const styleObject = reactive({
  color: 'red',
  fontSize: '13px'
})
```

```html
<div :style="styleObject"></div>
```

#### 배열에 바인딩

`:style`은 여러 객체 배열에 바인딩할 수 있습니다.

```jsx
<div :style="[baseStyles, overridingStyles]"></div>
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
