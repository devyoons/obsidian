---
별칭:
  - "학습 - Teleport"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/11524612498b81e7934df3e166641dce
---

# 학습: Teleport

## 세부 내용

`<Teleport>`는 컴포넌트는 템플릿의 일부분을 외부에 존재하는 다른 DOM 노드로 **'텔레포트(이동)'**할 수 있게 해주는 내장 컴포넌트 입니다.

### `<Teleport>` 사용하기

이동을 원하는 DOM에 다음과 같이 id를 지정할 수 있습니다.

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Vite App</title>
  </head>
  <body>
    <div id="app"></div>
    <div id="modal"></div>
    <script type="module" src="/src/main.js"></script>
  </body>
</html>
```

`<Teleport>` 컴포넌트를 활용하여 특정 요소 또는 컴포넌트를 다른 장소(DOM)로 이동할 수 있습니다.

```html
<Teleport to="#modal">
  <PostModal v-model="modal" :item="modalItem"></PostModal>
</Teleport>
```

이렇게 되면 아래와 같은 결과로 렌더링 됩니다.

```html
...
<div id="modal">
  <PostModal v-model="modal" :item="modalItem"></PostModal>
</div>
...
```

### 참고

[Teleport | Vue.js](https://vuejs.org/guide/built-ins/teleport.html)

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/vue 짐코딩/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)/Vue.js 3 완벽 마스터- 기초부터 실전까지 (1)|Vue.js 3 완벽 마스터: 기초부터 실전까지 (1)]]
