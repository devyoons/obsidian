---
별칭:
  - "학습 - Vue란 무엇인가?"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81eeb5f9c8ba9f96cdb7
---

# 학습: Vue란 무엇인가?

## 세부 내용

### Vue 란?

---

Vue는 User Interface 개발을 위한 자바스크립트 프레임워크 입니다. HTML, CSS, JavaScript를 기반으로 단순 하거나 복잡한 사용자 인터페이스(UI)를 효율적으로 개발하는 데 도움을 줍니다.

우선 빠르게 CDN으로 설치해서 Vue를 경험해보도록 하겠습니다.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Hello Vue3</title>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <div id="counter">
    <button type="button" v-on:click="counter++">
      Counter: {{ counter }}
    </button>
  </div>
  <script>
    const Counter = {
      data() {
        return {
          counter: 0
        }
      }
    }
    Vue.createApp(Counter).mount('#counter')
  </script>
</body>
</html>
```

위의 예는 Vue의 두 가지 핵심 기능을 보여줍니다.

- **선언적 렌더링**(**Declarative Rendering)** : Vue는 템플릿 구문(`{{ 데이터 }}`)을 활용하여 데이터를 선언적으로 출력(렌더링) 할 수 있도록 합니다.
- **반응성(Reactivity)** : Vue는 JavaScript 상태 변경을 자동으로 추적하고 변경이 발생하면 DOM을 효율적으로 업데이트합니다.

위 예제처럼 Vue를 사용하면 자바스크립트를 사용하는 것보다 빠르게 애플리케이션을 제작할 수 있습니다. 다음은 본격적으로 Vue를 배우기 전에 Vue의 핵심 기능을 빠르게 훓어 보도록 하겠습니다.

### 바인딩(v-bind)

---

템플릿 구문 이외에도 다음과 같은 방법으로 엘리먼트 속성에 <u>**데이터를 바인딩(연결)**</u>할 수 있습니다.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quickly</title>
  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
</head>
<body>
  <div id="app">
    <input type="text" v-bind:placeholder="message">
  </div>
  <script>
    const Counter = {
      data() {
        return {
          message: '텍스트를 입력해주세요'
        }
      }
    }
    Vue.createApp(Counter).mount('#app')
  </script>
</body>
</html>
```

위 예제에서 `v-bind` 속성은 데이터(상태) 속성에 바인딩할 때 사용하는 특수 속성 입니다. 바인딩 된 DOM은 `placeholder` 속성을 Vue 인스턴스의 `message` 속성으로 최신 상태를 유지합니다. (반응형 동작)

그리고 이렇게 `v-` 접두어가 붙은 특수 속성을 **디렉티브(directive)**라고 합니다.

### 이벤트 핸들링(v-on)

---

사용자가 앱과 상호 작용할 수 있게 하기 위해 `v-on` 디렉티브를 사용하여 Vue 인스턴스의 메소드(methods)를 호출하는 이벤트 리스너를 추가 할 수 있습니다.

```html
<p>{{ message }}</p>
<button type="button" v-on:click="reverseMessage">reverseMessage</button>
```

```jsx
methods: {
  reverseMessage() {
    this.message = this.message
      .split('')
      .reverse()
      .join('')
  }
}
```

이 방법은 직접적으로 DOM(p 엘리먼트)을 건드리지 않고 앱의 상태만 업데이트 합니다. 즉, 모든 DOM의 조작은 Vue에 의해 처리되고 있습니다.

### 양방향 바인딩(v-model)

---

Vue는 양식(`input`, `select` 등)의 입력과 앱의 상태(`data`)를 양방향으로 바인딩하는 `v-model` 디렉티브를 제공합니다.

```html
<p>{{ bindingMessage }}</p>
<input type="text" v-model="bindingMessage" />
```

```jsx
data() {
  return {
    bindingMessage: '파랑색',
  };
},
```

### 조건문

---

엘리먼트 표시여부는 `v-if` 특수 속성(디렉티브)으로 제어할 수 있습니다. 

```html
<p v-if="visible">보이나요?</p>
<button type="button" v-on:click="visible = true">visible</button>
```

```jsx
data() {
  return {
    visible: false,
  };
},
```

### 반복문

---

`v-for`는 배열에서 데이터를 가져와 아이템 목록을 표시하는데 사용할 수 있습니다.

```html
<ul>
  <li v-for="todo in todos">{{ todo }}</li>
</ul>
```

```jsx
data() {
  return {
    todos: ['사과', '딸기', '포도'],
  };
},
```

### 참고

---

- Vue3
    
    [Vue.js - The Progressive JavaScript Framework | Vue.js](https://vuejs.org/)
    
- Vue3 설치 (한글)
    
    [설치방법 | Vue.js](https://v3.ko.vuejs.org/guide/installation.html)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
