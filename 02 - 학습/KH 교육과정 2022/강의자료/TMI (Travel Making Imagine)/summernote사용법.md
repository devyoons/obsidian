---
별칭:
  - "학습 - summernote사용법"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/f8ab8d2f8b654b95871a481ac3be1f6a
---

# 학습: summernote사용법

## 세부 내용

![[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/첨부/98f04522_Untitled.png]]

```jsx
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
```

header에 summernote css/js 추가(추가되어있으니 밑 div부터 진행)

```jsx
<div id="summernote"></div>
```

원하는 곳에 div 추가

```jsx
<script>
  $('#summernote').summernote({
    placeholder: '내용을 입력하세요.',
    tabsize: 1, // 줄바꿈 간격
    height: 700, // 노트 크기
    disableResizeEditor: true, // 노트 크기 고정
    lang: "ko-KR",
	focus : true, 
    toolbar: [ // 툴바 메뉴들 검색해서 추가 가능
      ['style', ['style']],
      ['font', ['bold', 'underline', 'clear']],
      ['color', ['color']],
      ['para', ['ul', 'ol', 'paragraph']],
      ['table', ['table']],
      ['insert', ['link', 'picture', 'video']],
      ['view', ['fullscreen', 'codeview', 'help']]
    ]
  });
</script>
```

그리고 스크립트에 이렇게 작성해주면 썸머노트 설정 끝

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/강의자료/TMI (Travel Making Imagine)/TMI (Travel Making Imagine)|TMI (Travel Making Imagine)]]
