---
별칭:
  - "학습 - Plugins"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81439fa7e9814c34a514
주제:
  - "[[00 - 대시보드/주제/Vue|Vue]]"
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
병합된 노트:
  - "Plugins (2)"
---

# 학습: Plugins

## 세부 내용

낮은 수준의 API 덕분에 Pinia Store를 완전히 확장할 수 있습니다.

- Store에 새 속성 추가
- Store을 정의할 때 새로운 옵션 추가
- Store에 새로운 방법 추가
- 기존 메서드 래핑
- actions 변경 또는 취소
- [로컬 스토리지](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage) 와 같은 부작용 구현
- 특정 Store**에만** 적용

플러그인은 `pinia.use()`를 사용하여 pinia 인스턴스에 추가됩니다. 가장 간단한 예는 객체를 반환하여 모든 저장소에 정적 속성을 추가하는 것입니다.

```jsx
import { createPinia } from 'pinia'

// 이 플러그인이 설치된 후 생성되는 모든 저장소에 `secret`이라는 속성을 추가합니다.
// 이것은 다른 파일에 있을 수 있습니다.
function SecretPiniaPlugin() {
  return { secret: 'the cake is a lie' }
}

const pinia = createPinia()
// 플러그인을 pinia에 제공
pinia.use(SecretPiniaPlugin)

// 다른 파일에서
const store = useStore()
store.secret // 'the cake is a lie' 출력
```

이것은 router, modal, toast manager와 같은 전역 객체를 추가하는 데 유용합니다.

### 소개

Pinia 플러그인은 Store 추가할 속성을 선택적으로 반환하는 기능입니다. 그리고 context 매개변수를 받습니다.

```jsx
export function myPiniaPlugin(context) {
	context.pinia // `createPinia()`로 생성된 pinia
	context.app // `createApp()`으로 생성된 현재 앱(Vue 3만 해당)
	context.store // 플러그인이 확장 중인 저장소
	context.options // `defineStore()`에 전달된 저장소를 정의하는 옵션 객체
}
```

이 함수를 `pinia.use()` 를 사용하여 파라미터로 전달합니다.

```jsx
pinia.use(myPiniaPlugin)
```

플러그인은 `pinia`가 `app`에 전달된 후에 생성된 Store에만 적용됩니다.

### Store 확장

플러그인에서 객체를 반환하기만 하면 모든 Store에 속성을 추가할 수 있습니다.

```jsx
pinia.use(() => ({ hello: 'world' }))
```

`store`에서 직접 속성을 설정할 수도 있지만, 가능한 경우 객체를 리턴하여 devtools에서 자동으로 추적할 수 있도록 합니다.

```jsx
pinia.use(({ store }) => {
  store.hello = 'world'
})
```

플러그인에 의해 반환된 모든 속성은 devtools에 의해 자동으로 추적되므로 devtools에서 `hello`를 표시하려면 devtools에서 디버그하려는 경우에만 dev 모드의 `store._customProperties`에 추가해야 합니다.

```jsx
// 위의 예에서
pinia.use(({ store }) => {
  store.hello = 'world'
	// 번들러가 이것을 처리하는지 확인하십시오. webpack 및 vite는 기본적으로 수행해야 합니다.
  if (process.env.NODE_ENV === 'development') {
		// 스토어에서 설정한 키를 추가합니다.
    store._customProperties.add('hello')
  }
})
```

### 새로운 `state` 추가

Store에 새로운 `state` 속성을 추가하거나 hydration 중에 사용할 속성을 추가하려면 두 위치에 추가해야 합니다.

- Store에서 `store.myState`로 액세스할 수 있습니다.
- `store.$state`에서 devtools에서 사용할 수 있고 SSR 동안 직렬화할 수 있습니다.

이렇게 하면 ref 또는 계산된 속성을 공유할 수 있습니다.


---

### 합친 노트: Plugins (2) (Vue.js 3 완벽 마스터- 기초부터 실전까지 (1))

#### 플러그인

플러그인(Plugin)은 일반적으로 Vue에 전역 수준의 기능을 추가할 때 사용하는 기능을 말합니다. 플러그인에 대해 엄격하게 정의 된 범위는 없습니다. 일반적으로 플러그인이 유용한 시나리오는 다음과 같습니다.

- `app.component()` 메서드를 사용하여 전역 컴포넌트를 등록 하고자 할 때
- `app.directive()` 메서드를 사용하여 커스텀 디렉티브를 등록 하고자 할 때
- `app.provide()`를 사용하여 앱 전체에 리소스(메서드 또는 데이터)를 주입할 때
- 전역 애플리케이션 인스턴스에 속성 또는 메서드를 추가하고자 할 때 `app.config.globalProperties`에 연결하여 추가할 수 있습니다.
- 위의 몇 가지 조합을 수행하는 라이브러리를 설치하고자 할 때 (예: vue-router)

#### 플러그인 작성하기

플러그인은 <u>**install() 메서드를 갖고 있는 객체**</u>나 <u>**단순히 설치 함수**</u>로 만들 수 있습니다.

```jsx
// install() 메서드를 갖고 있는 객체
const objPlugin = {
	install(app, options) {

// 단순히 설치 함수
function funcPlugin(app, options) {

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
