---
별칭:
  - "강의 - css_2"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/3c80a0de4228479da4c1356e7c1475b9
---

# 강의: css_2

## 강의 내용

---

---

## flexbox

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4d524269_Untitled.png]]

- 부모요소 flex-container
    - display : flex | inline-flex
    - flex-ditection : row(기본값) |  column
    - justfy-content : 메인축정렬
    - align-items : 크로스축정렬
    - flex-wrap : 줄바꿈여부 nowrap(기본값) | wrap
    - align-content : 여러줄 flex-container 설정
    - flex-flow
- 자식요소 flex-item
    - flex
    - flex-grow
    - flex-shrink

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/773bc656_Untitled.png]]

## transform

- transform 속성에서 사용하는 x, y, z좌표

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8cb9abb9_Untitled.png]]

- **요소이동** : `translate (x px, y px);`
- **확대**/**축소** : `sclae (x , y);`
- **회전** : `rotate ( ?deg);` ⇒ 양수:시계방향, 음수:반시계방향 (과정이 없음)
- **비틀기**

## 브라우저별 접두사 Vender Prefix

- css3 표준을 아직 지원하지 않는 브라우저의 해당기능 지원을 위한 문법
- 해당 브라우저에 해당하는 verdor prefix를 자동으로 실행
- **브라우저별 vendor prefix 문법 먼저 작성후, 표준 문법을 작성한다.**
    - webkit : 크롬/사파리/엣지
    - moz : 파이어폭스
    - o : 오페라
    - ms : IE

<aside>
📖 prefix 노가다 말고 [홈페이지에서 다운로드](https://projects.verou.me/prefixfree/)
1. 코드 나오면 우클릭 → 다른이름으로저장
2. js 폴더생성후 드래그앤드랍함(프로그램에서)
3.<head>에 prefix.js 연결

</aside>

```css
<head>
		<!-- prefix.js 연결-->
    <script src="./js/prefixfree.min.js"></script>
</head>
```

## Animation

- **`animation-name`** : 애니메이션의 중간 상태를 지정하기 위한 이름을 정의. 중간 상태는 `@keyframes` 규칙을 이용하여 기술
- **`animation-duration`** : 한 싸이클의 애니메이션이 얼마에 걸쳐 일어날지 지정
- **`animation-delay`** : 엘리먼트가 로드되고 나서 언제 애니메이션이 시잘될지 지정
- **`animation-direction`** : 애니메이션이 종료되고 다시 처음부터 시작할지 역방향으로 진행할지 지정 (animation-iteration-count 몇번할지 설정해야 됨.)
- **`animation-iteration-count`** : 애니메이션이 몇 번 반복될지 지정 `infinite로 지정하면 무한 반복`
- **`animation-play-state`** : 애니메이션을 멈추거나 다시 시작할 수 있음
- **`animation-timing-function`** : 중간 상태들의 전환을 어떤 시간간격으로 진행할지 지정
- **`animation-fill-mode`** : 애니메이션이 시작되기 전이나 끝나고 난 후 어떤 값이 적용될지 지정

```css
/* 단일 속성 */ 
.object { 
		animation-name: 1s; 
		animation-duration: 2s; 
		animation-delay: 1s; 
		animation-direction: alternate; 
		animation-iteration-count: 3; 
		animation-play-state: paused; 
		animation-timing-function: 1s; 
		animation-fill-mode: both; 
} 

/* 속기형 */ 
animation: name | duration | timing-function | delay | 
					 iteration-count | direction | fill-mode | play-state> [,...];

```

### tabindex

---

tab했을 때 문서상배치 순서대로 이동하던걸 지정해줄 수 있음.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
