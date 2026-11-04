---
별칭:
  - "학습 - Computed"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b810a8bd6e2dec093132e
---

# 학습: Computed

## 세부 내용

### Computed

---

템플릿 문법(`{{ }}`)은 간단히 사용 하면 매우 편리합니다. 하지만 템플릿 표현식 내 코드가 길어질 경우 가독성이 떨어지고 유지보수가 어려워질 수 있습니다. 예를 들어 아래와 같이 객체가 있는경우:

```jsx
const teacher = reactive({
  name: '짐코딩',
  lectures: [
    'HTML/CSS',
    'JavaScript',
    'Vue3'
  ]
})
```

그리고 `<template>` 에 `author`가 책을 갖고 있는지 없는지 여부를 표시하고 싶습니다.

```html
<p>강의가 존재 합니까?:</p>
<span>{{ teacher.lectures.length > 0 ? 'Yes' : 'No' }}</span>
```

이 시점에서 템플릿 표현식은 복잡해지며 선언적이지 않습니다. 또 이러한 코드를 여러곳에서 반복적으로 사용해야 한다면 더더욱 비효율 적일 것입니다.

이럴때 사용하는 것이 `계산된 속성(computed property)`입니다. 

```jsx
const hasLecture = computed(() => {
  return teacher.lectures.length > 0 ? 'Yes' : 'No'
})
```

```html
<p>강의가 존재 합니까?:</p>
<span>{{ hasLecture }}</span>
```

### Computed vs Method

---

아래와 같이 `메서드`를 활용하면 `computed`와 동일한 효과를 얻을 수 있습니다.

```html
<p>{{ existLecture() }}</p>
```

```jsx
// in component
function existLecture() {
  return teacher.lectures.length > 0 ? 'Yes' : 'No'
}
```

이렇게 `computed`와 메서드는 동일한 결과를 얻을 수 있습니다. 하지만 차이점은 `computed`는 **결과가 캐시된다**는 것입니다. 그리고 `computed` **내 반응형 데이터가 변경된 경우에만 다시 계산**됩니다.

- Computed는 캐쉬됨
- Method는 파라미터가 올 수 있음
- 컴포넌트 랜더링시 computed는 비용이 적게듬
    - [관련](https://kr.vuejs.org/v2/guide/comparison.html)

### Writable Computed

---

Computed는 기본적으로 getter전용입니다. 계산된 속성에 새 값을 할당하려고 하면 런타임 경고가 표시됩니다.  새로운 계산된 속성이 필요한 경우에 getter와 setter를 모두 제공하여 속성을 만들 수 있습니다.

```jsx
import { computed, ref } from 'vue';
export default {
  setup() {
    const firstName = ref('홍');
    const lastName = ref('길동');

    const fullName = computed({
      get() {
        return firstName.value + ' ' + lastName.value;
      },
      set(newValue) {
        [firstName.value, lastName.value] = newValue.split(' ');
      },
    });

    fullName.value = '안녕 하세요';
    return {
      firstName,
      lastName,
      fullName,
    };
  },
};
```

```jsx
<template>
	<div>
		<h2>Author가 책을 갖고 있나요?</h2>
		<!-- <p>{{ teacher.lectures.length > 0 ? '예' : '아니오' }}</p> -->
		<p>{{ hasLecture }}</p>
		<p>{{ hasLecture }}</p>
		<p>{{ existLecture() }}</p>
		<p>{{ existLecture() }}</p>
		<button v-on:click="counter++">counter: {{ counter }}</button>
		<p>{{ fullName }}</p>
	</div>
</template>

<script>
import { computed, reactive, ref } from 'vue';
export default {
	setup() {
		const teacher = reactive({
			name: '짐코딩',
			lectures: ['HTML/CSS', 'JavaScript', 'Vue3'],
		});

		const hasLecture = computed(() => {
			console.log('computed');
			return teacher.lectures.length ? '있음 🙂' : '없음 🥲';
		});

		const existLecture = () => {
			console.log('method');
			return teacher.lectures.length ? '있음 🙂' : '없음 🥲';
		};

		const counter = ref(0);

		console.log('Console 출력: ', hasLecture.value);
		// hasLecture.value = '값';

		const firstName = ref('홍');
		const lastName = ref('길동');

		const fullName = computed({
			get() {
				return firstName.value + ' ' + lastName.value;
			},
			set(value) {
				console.log('value: ', value);
				[firstName.value, lastName.value] = value.split(' ');
			},
		});

		fullName.value = '짐 코딩';

		return { teacher, hasLecture, existLecture, counter, fullName };
	},
};
</script>

<style lang="scss" scoped></style>
```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
