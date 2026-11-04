---
별칭:
  - "학습 - Plugins"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81b1b8f0cfd0c45be4fe
---

# 학습: Plugins

## 세부 내용

### 플러그인

플러그인(Plugin)은 일반적으로 Vue에 전역 수준의 기능을 추가할 때 사용하는 기능을 말합니다. 플러그인에 대해 엄격하게 정의 된 범위는 없습니다. 일반적으로 플러그인이 유용한 시나리오는 다음과 같습니다.

- `app.component()` 메서드를 사용하여 전역 컴포넌트를 등록 하고자 할 때
- `app.directive()` 메서드를 사용하여 커스텀 디렉티브를 등록 하고자 할 때
- `app.provide()`를 사용하여 앱 전체에 리소스(메서드 또는 데이터)를 주입할 때
- 전역 애플리케이션 인스턴스에 속성 또는 메서드를 추가하고자 할 때 `app.config.globalProperties`에 연결하여 추가할 수 있습니다.
- 위의 몇 가지 조합을 수행하는 라이브러리를 설치하고자 할 때 (예: vue-router)

### 플러그인 작성하기

플러그인은 <u>**install() 메서드를 갖고 있는 객체**</u>나 <u>**단순히 설치 함수**</u>로 만들 수 있습니다.

```jsx
// install() 메서드를 갖고 있는 객체
const objPlugin = {
	install(app, options) {
		
	}
}

// 단순히 설치 함수
function funcPlugin(app, options) {

}
```

그리고 작성한 플러그인을 전역 수준의 기능으로 추가할 때는 `app.use()` 메서드를 사용할 수 있습니다.

```jsx
import { createApp } from 'vue';
import router from '@/router';
import { funcPlugin } from './plugins/func';
import { objPlugin } from './plugins/obj';

const app = createApp(App);
app.use(router);
app.use(funcPlugin, { // options });
app.use(objPlugin, { // options });
app.mount('#app');
```

`app.use()` 메소드로 플러그인을 설치하면 플러그인의 매개변수로 `app instance`와 `options` 이 전달됩니다.

```jsx
install: (app, options) => {
	// app.provide, app.component 등 사용할 수 있는 전역 인스턴스
	// app.use(plugin, { options }) 호출 시 전달한 두 번째 파라미터
}
```

### Vue 3 Global component type checking issue

#### components.d.ts 등록

- vite-plugin-components 옵션을 사용하여 한번에 체크 가능
    - `ViteComponents()` : 자동 import
    - `globalComponentsDeclaration: true` 옵션 componentd.d.ts 자동 등록

#### **Vue 3 Support - All In One**

- [**Vue 3 Support - All In One](https://marketplace.visualstudio.com/items?itemName=Wscats.vue) 플러그인 사용**

### 참고

- **Vue3 Plugins 공식문서**
    
    [Plugins | Vue.js](https://vuejs.org/guide/reusability/plugins.html#writing-a-plugin)
    
- **VSCode Volar Plugin**
    - **Vue Language Features (Volar)**
        
        [Vue Language Features (Volar) - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=Vue.volar)
        
    - **Vue Volar extension Pack**
        
        [Vue Volar extension Pack - Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=MisterJ.vue-volar-extention-pack)
        
- **vite-plugin-components**
    
    [📲 Vite 용 주문형 구성 요소 자동 가져 오기 - wenyanet](https://www.wenyanet.com/opensource/ko/60b92951a4f03f33442a9317.html)
    
    [unplugin-vue-components](https://www.npmjs.com/package/unplugin-vue-components)
    
- Vue3 global components not recognised
    
    [](https://youtrack.jetbrains.com/issue/WEB-48239/Vue-3-global-components-not-recognised)
    
- **global component type PR**
    
    https://github.com/vuejs/core/pull/3399

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
