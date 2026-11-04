---
별칭:
  - "학습 - CKEditor5"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/6879976bd3994920b4678dd58f41ba91
---

# 학습: CKEditor5

## 세부 내용

---

---

[‣](https://app.notion.com/p/e9ecd3cd2fc64396a5ab740776d31bc5) 

### 1. 에디터 다운로드

#### 1. CDN으로 사용하기

[CKEditor 5 - Download Latest Version](https://ckeditor.com/ckeditor-5/download/)

- 위 링크에 CDN copy 후 <head>태그 안에 ckeditor.js를 연결한다.

```jsx
<HTML>
 <HEAD>
  <TITLE> CKEditor5 Sample </TITLE>
  
  <!-- 1-1. CDN -->
  <script src="https://cdn.ckeditor.com/ckeditor5/39.0.1/classic/ckeditor.js"></script>
  <!-- 1-2. 한글설정 -->
  <script src="https://cdn.ckeditor.com/ckeditor5/39.0.0/classic/translations/ko.js"></script>
 </HEAD>
 <BODY>
    <!-- 2. TEXT 편집 툴을 사용할 textarea -->
    <textarea name="content" id="editor"></textarea>
    <script>
    // 3-1. CKEditor5를 생성할 textarea 지정, 한글설정
    ClassicEditor
        .create( document.querySelector( '#editor' ),{
                    language: 'ko' //언어설정
               })
        .catch( error => {
            console.error( error );
        } );
    </script>
 </BODY>
</HTML>
```

- textarea에 적용한다. document.querySelector;의 ID는 textarea의 ID이다.
- 한글로 사용하기 위해서 ko.js를 연결하고 옵션에 언어를 설정해준다.
- 그 외 원하는 툴바를 추가할 때 laguage 처럼 필요한 툴바를 추가작성해주면된다.

```jsx
<style>
  .ck-editor__editable { height: 400px; }
  .ck-content { font-size: 12px; }
</style>
```

- 기본 에디터 입력란 높이 키우고 글씨사이즈 설정
- 에디터에 적용되는 css 확인
    
    [Content styles - CKEditor 5 Documentation](https://ckeditor.com/docs/ckeditor5/latest/installation/advanced/content-styles.html)
    

#### 2. 다운로드해서 사용하기

[CKEditor 5 Online Builder | Create your own editor in 5 steps](https://ckeditor.com/ckeditor-5/online-builder/)

- CKEditor 5 inline builder에 접속

1. 원하는 에디터 타입을 선택한다. 
    
    ![[02 - 학습/IT/업무 공통 기술 메모/첨부/05baeae6_Untitled.png]]
    

1. 플러그인을 선택하여 build하여 다운로드한다.
    
    ![[02 - 학습/IT/업무 공통 기술 메모/첨부/bb9d59d6_Untitled.png]]
    
    ![[02 - 학습/IT/업무 공통 기술 메모/첨부/d3f1a101_Untitled.png]]
    
    최종으로 추가한 플러그인 (서버로 이미지 업로드)
    
    ![[02 - 학습/IT/업무 공통 기술 메모/첨부/0e974fba_Untitled.png]]
    
     base64 이미지 업로드
    
2. Next step
    
    ![[02 - 학습/IT/업무 공통 기술 메모/첨부/ca810c19_Untitled.png]]
    

### 2. 프로젝트에 에디터 적용하기

#### 1. 글쓰기,수정 form

- editor.html

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>editor</title>
    <link rel="stylesheet" type="text/css" href="/css/ckeditor.css">
    <script src="/js/ckeditor/build/ckeditor.js"></script>
</head>
<body>
<div id="editor">
    editor
    <!--새글 작성 폼-->
    <form th:if="${isNew}" action="/save" method="POST">
        <input name="title" type="text" placeholder="제목"/><br>
        <textarea name="content" class="content"></textarea><br>
        <input type="submit" value="등록">
    </form>
    <!--글 수정 폼-->
    <form th:if="${not isNew}" th:action="@{/save/{id}(id=${data.id})}" method="POST">
        <input name="title" type="text" th:value="${data.title}" placeholder="제목"/><br>
        <textarea name="content" class="content" th:text="${data.content}"></textarea><br>
        <input type="submit" value="등록">
    </form>
</div>
<script>
    let content = [[${content}]]; // 아래 커스텀한 js에 content 내용을 넣기 위한 변수
</script>
<script src="/js/ckeditor/ckeditorContent.js"></script>
</body>
</html>
```

- ckeditorContent.js
    - textarea에 id나 class값으로 에디터를 적용한다.
    - 이미지업로드 설정코드를 넣어준다.
    - 툴바옵션은 작성된 순서로 구성되며, 추가 플러그인이 필요시엔 위에 다운로드를 다시 진행한 후 ckeditor 폴더 안에 build폴더만 바꿔주면된다.
    - 한글 사용을 위해 옵션을 추가한다.

```jsx
/* 글 작성 및 수정 폼 구분 변수 */
var isNew = true;

/* CKEditor 초기화 */
var editors = document.querySelectorAll('.content'); // 에디터 설정해 줄 class 설정 (작성,수정 같은 폼으로 사용하기위해 id가 아닌 class로 지정)
editors.forEach(function (editorElement) {
    ClassicEditor
        .create(editorElement, {
            //툴바 옵션
            toolbar: {
                items: ['heading'     // 제목
                    , 'fontFamily'    // 글꼴
                    , 'fontColor'     // 글씨색깔
                    , 'alignment'     // 텍스트정렬
                    , '|'
                    , 'bold'          // 굵게
                    , 'italic'        // 이탤릭체
                    , 'underLine'     // 밑줄
                    , '|'
                    , 'bulletedList'  // 불릿목록
                    , 'numberedList'  // 번호목록
                    , 'blockQuote'    // 인용단락
                    , 'horizontalLine'// 수평선
                    , '|'
                    , 'imageInsert'   // 사진 삽입(URL포함)
                    , 'mediaEmbed'    // 미디어삽입
                    , 'link']         // 링크
            },
            language: "ko", // 언어설정
            ckfinder: {     // 이미지업로드설정
                uploadUrl: "/image/upload",
                withCredentials: true
            }
        })
        .then(editor => {
            console.log(editor);
            editor.setData(content); //content 내용
        })
        .catch(error => {
            console.error(error);
        });

})
```

#### 2. 읽기전용 form

- content.html

```jsx
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/ckeditor.css">
    <script src="/js/ckeditor/build/ckeditor.js"></script>
    <title>Content</title>
</head>
<body>
<h1>content</h1>
<div id="editor">
    <h3 th:text="${Content.title}"></h3>
    <hr>
    <a th:href="@{/editor/{id}(id=${Content.id})}">게시글 수정</a>
    <a>&nbsp;</a>
    <a th:href="@{/delete/{id}(id=${Content.id})}">게시글 삭제</a>
    <hr>
    <textarea name="content" id="content" th:utext="${Content.content}"></textarea>
</div>
<script src="/js/ckeditor/ckeditorReadonly.js"></script>
</body>
</html>
```

- ckeditorReadonly.js
    - 툴바를 안보이게 display none 처리해준다.
    - 읽기 전용 모드 코드를 추가해준다.

```jsx
ClassicEditor
    .create(document.querySelector('#content'))
    .then(editor => {
        const toolbarElement = editor.ui.view.toolbar.element;
        const myFeatureLockId = Symbol('my-feature');
        // 툴바 none 처리
        toolbarElement.style.display = 'none';
        // 읽기 전용 모드
        editor.enableReadOnlyMode(myFeatureLockId);
    })
    .catch(error => {
        console.error(error);
    });
```

base64 

[Javascript: CKEditor 5 Base64로 이미지 업로드](https://vip00112.tistory.com/75)

simple lmageupload

[ckeditor5 및 이미지 업로더 설치](https://dantes.kr/576)

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
