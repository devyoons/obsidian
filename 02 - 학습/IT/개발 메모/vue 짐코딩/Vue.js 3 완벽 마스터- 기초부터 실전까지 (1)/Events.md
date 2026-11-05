---
별칭:
  - "학습 - Events"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b817a9e30c50b09ef7ebb
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
  - "[[00 - 대시보드/주제/Vue|Vue]]"
---

# 학습: Events

## 세부 내용

**컴포넌트간의 커뮤니케이션 (데이터 전달)**

### Events

자식 컴포넌트에서도 부모 컴포넌트로 데이터를 전달 또는 트리거의 목적으로 이벤트를 내보는것을 말합니다. 그리고 이벤트는 컴포넌트의 `emit` 메서드를 통하여 발생시킬 수 있습니다.

### 이벤트 발생 및 수신

컴포넌트의 `<template>` 블록 안에서 내장 함수 `$emit()`을 사용하여 직접 커스텀한 이벤트를 내보낼 수 있습니다.

```html
<template>
	<button @click="$emit('someEvent')">버튼</button>
</template>
```

그러면 부모 컴포넌트에서 `v-on`(또는 `@`)을 사용하여 이벤트를 수신할 수 있습니다.

```html
<MyComponent @some-event="callFunction" />
```

`.once` 수식어는 컴포넌트 커스텀 이벤트에서도 지원됩니다.

```html
<MyComponent @some-event.once="callFunction" />
```

### 이벤트 파라미터

이벤트와 함께 특정 값을 내보낼 수 있습니다. `$emit` 함수 이벤트명에 추가로 파라미터를 넘길 수 있습니다.

```html
<template>
	<button @click="$emit('someEvent', 'Hello', 'World', '!')">버튼</button>
</template>
```

그런다음 부모 컴포넌트에서 이벤트와 함께 파라미터를 받을 수 있습니다.

```jsx
<template>
	<MyComponent @some-event="callFunction" />
</template>

<script setup>
export default {
	setup() {
		const callFunction = (word1, word2, word3) => {
      alert(word1, word2, word3);
    };
		return {
			callFunction
		}
	}
}
</script>
```

### 이벤트 선언하기

Vue3에서는 `emits` 옵션을 사용하여 이벤트를 선언할 수 있습니다. 이때 이벤트 선언하는 방법은 두 가지 형식으로 선언할 수 있습니다. 

- 문자열 배열 선언
- 객체문법 선언

그리고 JavaScript 코드에서 이벤트를 내보낼 때는 `setup()` 함수의 파라미터로 넘어온 `context.emit()` 메서드를 사용할 수 있습니다.

#### 문자열 배열 선언

```jsx
export default {
  emits: ['someEvent'],
  setup(props, context) {
    context.emit('someEvent', 'Hello World!')
  }
}
```

```jsx
export default {
  emits: ['someEvent'],
  setup(props, { emit }) {
    emit('someEvent', 'Hello World!')
  }
}
```

#### 객체문법 선언

객체문법으로 선언할 경우 `validation` 로직을 추가할 수 있습니다. 만약 `validation`이 없다면 `null`로 설정하시면 됩니다.

```jsx
export default {
  emits: {
		// 유효성 검사가 없는 이벤트 선언
		someEvent: null,

		// 유효성 검사가 있는 이벤트 선언
		someSubmit: (result) => {
			if (email && password) {
	      return true
	    } else {
	      console.warn('result 값이 비어있습니다!')
	      return false
	    }
		}
	},
  setup(props, context) {
    context.emit('someEvent', 'Hello World!')
  }
}
```

선택 사항이지만 컴포넌트가 작동하는 방식을 더 잘 문서화하기 위해 모든 이벤트를 정의하는 것이 좋습니다. 또한 Vue가 [**Non-Prop 속성**](https://vuejs.org/guide/components/attrs.html#v-on-listener-inheritance) 에서 알려진 리스너를 제외할 수 있습니다 .

### `v-model` 만들기

컴포넌트를 만든 후 해당 컴포넌트에 `v-model`을 적용하려면 `@update:modelValue` 이벤트를 사용하여 `v-model`을 만들 수 있습니다.

일반적으로 기본 HTML 요소인 `<input>` 태그에 `v-model` 은 아래와 같이 사용합니다.

```html
<input v-model="username" />
```

위에 선언된 `v-model`은 아래와 같이 동작합니다.

```html
<input
  :value="username"
  @input="username = $event.target.value"
/>
```

위에 기본 동작 대신 우리가 만든 컴포넌트는 아래와 같이 수행합니다.

```html
<LabelInput
	:modelValue="username"
	@update:modelValue="newValue => username = newValue"
/>
```

이 `<LabelInput>`을 실제로 동작하게 하려면 아래와 같이 컴포넌트를 정의해야 합니다.

- `modelValue` `props`를 `:value` 속성에 바인딩
- `@input` 이벤트에서 새 `@update:modelValue` 이벤트로 내보냅니다.

```html
<template>
  <label>
    {{ label }}
    <input
      type="text"
      :value="modelValue"
      @input="$emit('update:modelValue', $event.target.value)"
    />
  </label>
</template>
<script>
export default {
  props: ['modelValue', 'label'],
  emits: ['update:modelValue'],
};
</script>
```

그리고 아래와 같이 우리가 만든 컴포넌트에 `v-model`을 적용할 수 있습니다.

```html
<LabelInput label="이름" v-model="username" />
```

#### Computed 이용하기

컴포넌트 안에서 computed를 사용하여 v-model을 구현할 수 있습니다.

```jsx
<template>
  <label>
    {{ label }}
    <input type="text" v-model="value" />
  </label>
</template>
<script>
import { computed } from 'vue';

export default {
  props: ['modelValue', 'label'],
  emits: ['update:modelValue'],
  setup(props, context) {
    const value = computed({
      get() {
        return props.modelValue;
      },
      set(value) {
        context.emit('update:modelValue', value);
      },
    });
    return {
      value,
    };
  },
};
</script>
```

전달할 수 있습니다. 이럴때  `Emit`을 사용할 수 있습니다.

`<BlogPost>` 컴포넌트를 개발할 때 부모에게 다시 무엇을 전달해야 할 때가 있습니다. 예를 들어 블로그 게시글 폰트 크기를 확대하는 기능이 있다고 가정해 보겠습니다.

```jsx
const postFontSize = ref(1);
```

```html
<div :style="{ fontSize: postFontSize + 'em' }">
	<BlogPost
		v-for="post in posts"
		:key="post.id"
		:title="post.title"
	/>
</div>
```

이제 `<BlogPost>`컴포넌트에서 폰트 크기를 확대할 수 있는 버튼을 추가해 보겠습니다.

```jsx
<template>
  <article>
    <h4>{{ title }}</h4>
    <button @click="$emit('enlarge-text')">크게</button>
  </article>
</template>

<script>
import { toRefs } from 'vue';

export default {
  props: ['title'],
  emits: ['enlarge-text'],
  setup(props) {
    const { title } = toRefs(props);
    return {
      title,
    };
  },
};
</script>

<style></style>
```

자식 컴포넌트에서는 `emits`옵션을 사용하여 이벤트를 선언할 수 있습니다. 그리고 `$emit` 내장 메서드를 호출하여 이벤트를 발생시킬 수 있습니다. 

```html
<div :style="{ fontSize: postFontSize + 'em' }">
  <BlogPost
    v-for="post in posts"
    :key="post.id"
    :title="post.title"
    @enlarge-text="postFontSize += 0.1"
  />
</div>
```

부모 컴포넌트에서는 `v-on`(`@`) 디렉티브를 사용하여 자식 컴포넌트로부터 전달받은 이벤트를 수신할 수 있습니다. `@enlarge-text`로 이벤트를 받아 `postFontSize` 값을 업데이트 했습니다.

#### `v-model` 전달인자

기본적으로 `v-model`은 컴포넌트에서 `modelValue` `props`와 `update:modelValue` 이벤트로 사용합니다. 하지만 `전달인자(Arguments)`를 사용하여 이러한 이름을 수정할 수 있습니다.

```html
<BookComponent v-model:title="bookTitle" />
```

이 경우 자식 컴포넌트에서는 `:title`을 속성으로 정의하고 `update:title`로 이벤트를 내보내야 합니다.

```html
<template>
  <article>
    <strong>책 이름</strong> :
    <input
      type="text"
      :value="title"
      @input="$emit('update:title', $event.target.value)"
    />
  </article>
</template>
<script>
export default {
  props: ['title'],
  emits: ['update:title'],
};
</script>
```

#### 다중 `v-model` 바인딩

`v-model` `전달인자`를 사용하여 컴포넌트에 여러 `v-model`을 바인딩할 수 있습니다.

```html
<BookComponent
	v-model:title="bookTitle"
	v-model:author="bookAuthor"
/>
```

```html
<template>
  <article>
    <strong>도서명</strong> :
    <input
      type="text"
      :value="title"
      @input="$emit('update:title', $event.target.value)"
    />
    <br />
    <strong>저자</strong> :
    <input
      type="text"
      :value="author"
      @input="$emit('update:author', $event.target.value)"
    />
  </article>
</template>
<script>
export default {
  props: ['title', 'author'],
  emits: ['update:title', 'update:author'],
};
</script>
```

#### `v-model` 수식어(Modifiers) 핸들링

필요에 따라 `v-model` `수식어`를 추가할 수 있습니다. 예를 들어 첫 글자를 대문자로 표시하는 `capitalize` 라는 `수식어`를 만들어 보도록 하겠습니다.

```jsx
<CustomInput v-model.capitalize="username"></CustomInput>
```

컴포넌트에 추가된 `수식어`는 `modelModifiers` prop을 통해 컴포넌트에 전달됩니다. 아래 예제에서는 기본값을 빈 객체를 갖는 `modelModifiers` props를 갖는 컴포넌트 입니다.

```jsx
<template>
  <input
    type="text"
    :value="modelValue"
    @input="$emit('update:modelValue', $event.target.value)"
  />
</template>
<script>
export default {
  props: {
    modelValue: String,
    modelModifiers: { default: () => ({}) },
  },
  emits: ['update:modelValue'],
	setup(props, context) {
		// {capitalize: true} 출력
    console.log(props.modelModifiers);
  },
};
</script>
```

컴포넌트의 `modelModifiers` prop에 `capitalize`가 포함되어 있고 이 값은 `true`로 출력되는 것을 확인할 수 있습니다. 왜냐하면 부포 컴포넌트에서 `v-model.capitalize`를 사용했기 때문입니다.

이제 이벤트를 내보내기 전에 문자열 첫 글자를 대문자로 만들면됩니다.

```jsx
<template>
  <input type="text" :value="modelValue" @input="emitValue" />
</template>
<script>
export default {
  props: {
    modelValue: String,
    modelModifiers: { default: () => ({}) },
  },
  emits: ['update:modelValue'],
  setup(props, { emit }) {
    const emitValue = (e) => {
      let value = e.target.value;
      if (props.modelModifiers.capitalize) {
        value = value.charAt(0).toUpperCase() + value.slice(1);
      }
      emit('update:modelValue', value);
    };
    return {
      emitValue,
    };
  },
};
</script>
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
