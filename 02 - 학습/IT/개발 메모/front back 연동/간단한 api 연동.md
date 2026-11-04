---
별칭:
  - "학습 - 간단한 api 연동"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/1efa2745e63641e5863c88fd33faf67e
---

# 학습: 간단한 api 연동

## 세부 내용

1. 백엔드 프로젝트에 controller를 생성하여 아래 코드를 추가한다.

```java
@RestController
public class ItemController {

    @GetMapping("/api/items")
    public List<String> getItems() {
        List<String> items = new ArrayList<>();
        items.add("alpha");
        items.add("bata");
        items.add("gamma");

        return items;
    }
}
```

1. 프론트엔드에서 package.json 파일에 serve 에 `--port 3000`를 추가한다. 
    
    ```json
    // package.json
    
      "scripts": {
        "serve": "vue-cli-service serve --port 3000",
        "build": "vue-cli-service build",
        "lint": "vue-cli-service lint"
      },
    ```
    
2. vue.config.js 에서 우회 스크립트를 추가해준다.

```jsx
// 경로가 "/"인 경우 target으로 우회해서 요청을 하겠다는 의
module.exports = {
  devServer: {
    proxy: {
      '/': {
        target: 'http://localhost:8080'
      }
    }
  }
}

```

1. Home.vue 에 axios로 data 를 받는다.

```jsx
axios.get("/api/items").then(({data}) => {
  state.items = data;
})
```

- 3번 설정을 안하게된 경우에는
    
    ```jsx
    axios.get("http://localhost:8080/api/items").then(({data}) => {
      state.items = data;
    })
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/front back 연동/front back 연동|front back 연동]]
