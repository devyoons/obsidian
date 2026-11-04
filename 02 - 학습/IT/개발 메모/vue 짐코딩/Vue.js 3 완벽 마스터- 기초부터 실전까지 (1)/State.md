---
별칭:
  - "학습 - State"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81a9a9b0c9272edfc9c3
---

# 학습: State

## 세부 내용

### State

`state`는 대부분의 경우 상점의 중심 부분입니다. 그리고 개발자들은 대부분 앱을 나타내는 `state`를 정의하는 것으로 시작합니다. Pinis에서 `state`는 초기 값을 리턴하는 함수로 정의됩니다. 그리고 이러한 `state`는 서버, 클라이언트 모두에서 작동할 수 있습니다.

```jsx
import { defineStore } from 'pinia'

const useStore = defineStore('storeId', {
  // 전체 타입 추론에 권장되는 화살표 함수
  state: () => {
    return {
			// 이 모든 속성은 자동으로 유형이 유추됩니다.
      counter: 0,
      name: 'Eduardo',
      isAdmin: true,
    }
  },
})
```

### `state` 접근하기

기본적으로 `store` 인스턴스를 통해 `state`에 접근하여 직접 읽고 쓸 수 있습니다.

```jsx
const store = useStore()

store.counter++
```

### Options API와 사용

#### setup() 함수와 함께

```jsx
import { useCounterStore } from '../stores/counterStore'

export default {
  setup() {
    const counterStore = useCounterStore()

    return { counterStore }
  },
  computed: {
    tripleCounter() {
      return this.counterStore.counter * 3
    },
  },
}
```

#### setup() 함수 없이

컴포지션 API를 사용하지 않고 `computed`만 사용하는 경우, `mapState()` helper 함수를 사용하여 `state` 속성을 읽기 전용 `computed` 속성으로 매핑할 수 있습니다.

```jsx
import { mapState } from 'pinia'
import { useCounterStore } from '../stores/counterStore'

export default {
  computed: {
    // 구성 요소 내부의 this.counter에 대한 액세스 권한을 부여합니다.
		// store.counter에서 읽는 것과 동일
    ...mapState(useCounterStore, ['counter'])
    // 위와 같지만 this.myOwnName으로 등록
    ...mapState(useCounterStore, {
      myOwnName: 'counter',
      // 스토어에 액세스하는 함수를 작성할 수도 있습니다.
      double: store => store.counter * 2,
      // `this`에 액세스할 수 있지만 올바르게 입력되지 않습니다...
      magicValue(store) {
        return store.someGetter + this.counter + this.double
      },
    }),
  },
}
```

### `state` 초기화

`store`에서 `$reset()` 메서드를 호출하여 상태를 초기 값으로 재설정 할 수 있습니다.

```jsx
const store = useStore()

store.$reset()
```

### `state` 변경하기

`store.counter++`로 `store`를 직접 변경하는 것 외에도 `$patch` 메소드를 호출할 수도 있습니다. `state` 객체의 부분을 매개변수로 전달하여 여러개의 값을 변경할 수 있습니다.

```jsx
store.$patch({
  counter: store.counter + 1,
  name: 'Abalam',
})
```

하지만 객체의 일부 변경으로 배열의 변경을 수행(푸시, 제거, 연결)하려면 적용이 힘들거나 비용이 발생할 수 있습니다. 이때 `$patch` 메서드에 콜백 함수를 전달하여 해결할 수 있습니다.

```jsx
cartStore.$patch((state) => {
  state.items.push({ name: 'shoes', quantity: 1 })
  state.hasChanged = true
})
```

여기서 주요 차이점은 `$patch()`를 사용하면 여러 변경 사항을 devtools의 단일 항목으로 그룹화할 수 있다는 것입니다. `state`와 `$patch()`에 대한 직접적인 변경은 devtools에 나타나며 시간 여행이 가능합니다.(아직 Vue 3에는 없음).

### `state` 교체

`$state`속성을 새 객체로 설정하여 저장소의 전체 상태를 바꿀 수 있습니다 .

```jsx
store.$state = { counter: 666, name: 'Paimon' }
```

pinia 인스턴스의 상태를 변경하여 애플리케이션의 전체 상태를 바꿀 수도 있습니다.

```jsx
pinia.state.value = {}
```

### `state` 구독

Vuex의 `subscribe` 메소드와 유사하게 스토어의 `$subscribe()` 메소드를 통해 상태와 변경 사항을 볼 수 있습니다. 일반 `watch()`보다 `$subscribe()`를 사용하는 이점은 구독이 패치 후에 한 번만 트리거된다는 것입니다(예: 위의 함수 버전을 사용할 때).

```jsx
cartStore.$subscribe((mutation, state) => {
  // 'pinia'에서 { MutationType } 가져오기
  mutation.type // 'direct' | 'patch object' | 'patch function'
  //cartStore.$id와 동일
  mutation.storeId // 'cart'
  // mutation.type === 'patch object'에서만 사용 가능
  mutation.payload // cartStore.$patch()에 전달된 패치 객체

  // 변경될 때마다 전체 상태를 로컬 스토리지에 유지
  localStorage.setItem('cart', JSON.stringify(state))
})
```

기본적으로 `상태구독`은 추가된 컴포넌트에 바인딩됩니다(저장소가 컴포넌트의 `setup()` 내부에 있는 경우). 즉, 컴포넌트가 마운트 해제되면 자동으로 제거됩니다. 컴포넌트가 마운트 해제된 후에도 이를 유지하려면 `{ detached: true }`를 두 번째 인수로 전달하여 현재 컴포넌트에서 상태 구독을 분리합니다.

```jsx
export default {
  setup() {
    const someStore = useSomeStore()

    // this subscription will be kept after the component is unmounted
    someStore.$subscribe(callback, { detached: true })

    // ...
  },
}
```

> **Tip**
`pinia`인스턴스 의 전체 상태를 볼 수 있습니다 .
> 

```jsx
watch(
  pinia.state,
  (state) => {
    // persist the whole state to the local storage whenever it changes
    localStorage.setItem('piniaState', JSON.stringify(state))
  },
  { deep: true }
)
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
