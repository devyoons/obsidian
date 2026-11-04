---
별칭:
  - "강의 - hello-spring : 게시물 상세보기"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/74f2648f8f384f3ca075821ba7454124
---

# 강의: hello-spring : 게시물 상세보기

## 강의 내용

---

---

### 1. 게시물 상세보기 .jsp

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c50f55c3_Untitled.png]]

- tr태그 : 핸들러 적용
- `matches` : 특정 선택자와 일치여부 boolean형 반환

```jsx
window.addEventListener('load', (e) => {
	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			// console.log(e.target);	
			const tr = e.target.parentElement; //e.target은 td 
			// console.log(tr);
			// 특정 선택자와 일치여부 boolean형 반환
			if(tr.matches('tr[data-no]')){
				const no = tr.dataset.no; // data속성이라 dataset으로 가져와야함.
				location.href = '${pageContext.request.contextPath}/board/boardDetail.do?no=' + no;
			}
		});
	});
	
});
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
