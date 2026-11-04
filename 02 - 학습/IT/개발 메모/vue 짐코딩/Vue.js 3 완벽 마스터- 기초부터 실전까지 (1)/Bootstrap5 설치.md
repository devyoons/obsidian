---
별칭:
  - "학습 - Bootstrap5 설치"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b814389cde2c123571c58
---

# 학습: Bootstrap5 설치

## 세부 내용

### Bootstrap5

Bootstrap는 인기있는 UI Framework입니다. Vue가 JavaScript의 쉽고 빠른 개발을 도와준다면 Bootstrap은 사전에 정의된 CSS를 사용하여 최소한의 노력으로 쉽게 예쁜 HTML Markup을 도와줍니다.

BootstrapVue는 Vue용 Bootstrap이라고 보시면 될 것 같습니다. Vue를 위한 사전에 정의된 다양한 커스텀컴포넌트를 제공합니다. 하지만 이번 시간에는 다음과 같은 이유로 BootstrapVue이 아닌 Bootstrap5를 사용하도록 하겠습니다.

- Vue3를 위한 BootstrapVue는 현재 알파 버전입니다.
- 이번 강좌는 Vue3 문법을 배우는데 목적이 있기 때문에 최소한의 UI만 활용하는 일반 Bootstrap이 더 괜찮을것 같습니다.

### Boostrap5 설치

```bash
npm install bootstrap
```

```jsx
import 'bootstrap/dist/css/bootstrap.min.css';
import { createApp } from 'vue';
import App from './App.vue';

createApp(App).mount('#app');

import 'bootstrap/dist/js/bootstrap.js';
```

### Layout

Bootstrap를 활용하여 Layout을 만들어 보도록 하겠습니다.

#### TheNav.vue

```jsx
// src/components/TheNav.vue
<script setup></script>
<template>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</template>
```

#### TheView.vue

```jsx
// src/components/TheView.vue
<template>
  <main class="container py-4">Hello World!</main>
</template>
```

#### App.vue

```jsx
// src/App.vue
<script setup>
import TheNav from './components/TheNav.vue';
import TheView from './components/TheView.vue';
</script>

<template>
  <TheNav></TheNav>

  <TheView></TheView>
</template>
```

### Bootstrap Icons 설치

1. bootstrap-icons 모듈 설치
    
    ```bash
    npm i bootstrap-icons
    ```
    
2. main.js 에 bootstrap-icons.css 추가
    
    ```jsx
    // main.js
    import 'bootstrap-icons/font/bootstrap-icons.css';
    ```
    
3. `i 태그` 를 활용한 아이콘 적용
    
    ```html
    <template>
    	<i class="bi bi-youtube"></i>
    </template>
    ```
    
    [Bootstrap Icons 바로가기](https://icons.getbootstrap.com/)
    

### 참고

- Vue Style Guide
    
    [Style Guide - Vue.js](https://kr.vuejs.org/v2/style-guide/index.html#%EC%8B%B1%EA%B8%80-%EC%9D%B8%EC%8A%A4%ED%84%B4%EC%8A%A4-%EC%BB%B4%ED%8F%AC%EB%84%8C%ED%8A%B8-%EC%9D%B4%EB%A6%84-%EB%A7%A4%EC%9A%B0-%EC%B6%94%EC%B2%9C%ED%95%A8)
    
- Vue3 프로젝트에 Bootstrap5 설치
    
    [How to install Bootstrap 5 in Vue 3](https://larainfo.com/blogs/how-to-install-bootstrap-5-in-vue-3)
    
- Bootstrap Vue3 (현재 alpha version)
    
    [Introduction | BootstrapVue 3](https://cdmoro.github.io/bootstrap-vue-3/getting-started/#why-bootstrapvue3)
    
- Vuetify3 (Titan Beta)
    
    [The Vuetify roadmap - Vuetify](https://next.vuetifyjs.com/en/introduction/roadmap/)
    
- NPM Package Trands
    
    [bootstrap-vue vs quasar vs vuetify | npm trends](https://www.npmtrends.com/vuetify-vs-bootstrap-vue-vs-quasar)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
