---
별칭:
  - "학습 - BOM"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/3967799523f941e790633d4aa72e00e8
주제:
  - "[[00 - 대시보드/주제/JavaScript|JavaScript]]"
---

# 학습: BOM

## 세부 내용

- navigator
    
```jsx
<button onclick="test1();">navigator</button>
<script>
/**
 * navigator
 * - browser에 대한 정보를 가진 객체
 * - userAgent
 */
const test1 = () => {
  console.log(navigator);
  console.log(navigator.userAgent);
  // chrome Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36
  // firefox Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101 Firefox/100.0
};
</script>
```

- location
    
```jsx
<button onclick="test2();">location</button>
<button onclick="test3();">location.href</button>
<button onclick="test4();">location.reload()</button>
<script>
/**
 * location
 * - 브라우져 주소표시줄 관련정보를 가진 객체
 */
const test2 = () => {
  console.log(location);
  const {href, protocol, hostname, port, origin, pathname, search, hash} = location;
  console.log(href, protocol, hostname, port, origin, pathname, search, hash);
  // http://192.168.10.6:5500/03_javascript/17_BOM.html?type=abc&query=%EC%95%88%EB%85%95#qwerty 
  // http: 
  // 192.168.10.6 
  // 5500 
  // http://192.168.10.6:5500 
  // /03_javascript/17_BOM.html 
  // ?type=abc&query=%EC%95%88%EB%85%95 
  // #qwerty
};

// 페이지이동
const test3 = () => location.href = "https://naver.com";
// 새로고침
const test4 = () => location.reload();
</script>
```

- history
    
```jsx
<button onclick="test5();">history</button>
<button onclick="test6();">history.forward()</button>
<button onclick="test7();">history.back()</button>
<button onclick="test8();">history.go()</button>
<script>
/**
 * history
 * - 브라우져 방문기록 관리객체
 */
const test5 = () => {
  console.log(history);
};
const test6 = () => history.forward();
const test7 = () => history.back();

/**
 * go(n)
 * - 양수 제공된 숫자만큼 앞으로 가기
 * - 0 새로고침
 * - 음수 제공된 숫자만큼 뒤로 가기
 */
const test8 = () => {
  const n = prompt("이동한 페이지에 대해 정수로 입력하세요.")
  history.go(n);
}
</script>
```

- screen
    - `screen.height` 화면높이
    - `screen.width` 화면너비
    - `screen.availWidth` 실제 화면에서 사용 가능한 너비
    - `screen.availHeight` 실제 화면에서 사용 가능한 높이
    - `screen.colorDepth` 사용 가능한 색상수
    - `screen.pixelDepth` 한픽셀당 비트수
    
    <aside>
    💡 browser의 viewport는  `window.innerWidth`, `window.innerHeight` 로 조회한다.
    
    </aside>
    
```jsx
<button onclick="test9();">screen</button>
<script>
/**
 * screen
 * - os에 연결된 모니터(hw) 관련 정보 가진 객체
 */
const test9 = () => {
  console.log(screen);
  const {width, height, availWidth, availHeight, availLeft, availTop} = screen;
  console.log(width, height, availWidth, availHeight, availLeft, availTop);
  // 1440 
  // 900 
  // 1440 
  // 860 
  // -1440 
  // 0

  // 300px * 300px 팝업창을 화면 정가운데에 위치시키기
  const left = availLeft + (width - 300) / 2;
  const top = availTop + (height - 300) / 2;
  open("", "popup", `width=${300}px, height=${300}px, left=${left}px, top=${top}px`);
};
</script>

```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
