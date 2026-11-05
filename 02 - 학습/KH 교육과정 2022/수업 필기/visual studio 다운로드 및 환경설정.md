---
별칭:
  - "강의 - visual studio 다운로드 및 환경설정"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/도구-기타
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/0428625ab2794748be9edcdfb165e2c5
주제:
  - "[[00 - 대시보드/주제/개발 도구|개발 도구]]"
---

# 강의: visual studio 다운로드 및 환경설정

## 강의 내용

---

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f1aad54f_Untitled.png]]

#### 프론트 백

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/efbea45d_Untitled.png]]

### 비주얼스튜디오

visual studio code [다운로드](https://code.visualstudio.com/download)

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/376ca907_Untitled.png]]

1. 원하는 경로로 다운받기
2. 압축해제
3. 무설치버전 (포터블)이기 때문에 실행하면 됨.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/0c828893_Untitled.png]]

이 폴더를 신뢰할 수 있는지 여부

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/18f398af_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9dd71ffe_Untitled.png]]

동일 폴도하위에 저장 → 작업하던걸 껐다 켜도 저장해줌.

#### 원하는 컬러 테마변경하기

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f826cfaf_Untitled.png]]

#### 단축키

[단축키 정리](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

| ctrl + k + s | 단축키 모음 |
| --- | --- |
| F1, ctrl + shift + p | pallette 모든 메뉴 검색으로 접근가능 |
| ctrl + p | 파일 검색 후 이동 |
| alt + shift + 아래방향키 | 줄복사 단축키 |
| ctrl + /  | 주석 |
| ctrl + shift + c | css 요소검사 |
| alt+ctrl +방향키 / alt + 클릭 | 멀티커서? |
| ctrl + k +ctrl + w | 전체 닫기 |
| ctrl + , | 세팅창 열기 |
| ctrl + B | 사이드바 닫고 열기 |
| ctrl + ` | 토글 터미널 열고 닫기 |
| ctrl+home / ctrl+end | 파일 제일 위, 아래로 이동 |
| home , end | 라인 맨 앞, 맨 끝으로 이동 (shift이용해서 드래그 가능) |
| ctrl + ←/ → | 단어마다 이동 (shift이용해서 드래그 가능) |
| ctrl + c/ v | 해당 라인 복사, 붙여넣기 |
| alt + ↑/↓ | 라인 이동 |
| shift + alt + ↑/↓ | 라인 복사 |
| ctrl + enter | 중간에 코드 넣고 다음줄로 이동하고 싶을 때 |
| ctrl + D | 반복되는 단어 수정할 때 |
| ctrl + U | 이전의 커서 위치로 이동하기 |
| alt + 클릭/shift+alt+드래그마우스 | 원하는 커서위치 다중선택후 수정 |
| shift + alt + i | 블록을 잡은 뒤 옵션키 누르면 라인의 맨끝마다 커서가 생김 |

### 설정

1. live server 변경사항을 자동으로 저장해주는 기능
    1. 수정 → save → chrome → reload

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a81d1a18_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/18c16ffa_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f66e507f_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/74ebe2c0_Untitled.png]]

검색에 local ip 입력 → use local ip 체크 → 그래도 안되면 host에 내 ip 주소 넣기

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/98c6248a_Untitled.png]]

cmd 에서 ip 확인 후 

## html

**태그사용법** 

- 태그는 <> 과 </> 기호를 사용해 콘텐츠의 시작과 끝을 표시한다.
- 각 태그는 콘텐츠를 감싸며, 태그명은 콘텐츠의 성격과 의미를 나타낸다.
- <태그명> 여기에 콘텐츠를 기입함 </태그명>
- 태그에는 속성을 통해 부가적인 기능을 정의할 수 있다.

```html
<!doctype html> 문서의 형식을 알려주는 태그
<html> html문서 시작
    <head> 머리시작
        <meta charset = "utf-8"/>    
        <title>ㅎㅎㅎㅎ</title>
    </head> 머리 끝
    <body> 몸체 시작
        <h1>Hello HTML</h1>
    </body> 몸체 끝
</html> html문서 끝
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/03431296_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1711fb5d_Untitled.png]]

브라우저에 드래그앤드랍하면 페이지에서 작성한 문구가 보임

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e724ea48_Untitled.png]]

페이지 소스보기하면 작성한 코드가 나온다. → render 라고함

#### material icon theme : 아이콘 깔끔한걸로 보여줌

#### auto rename tag : 시작 종료태그 같이 변경해줌

#### prettier - code formatter : 코드 정렬해줌

#### settings sync : 다른 pc에서도 연동해서 모든 설정 동일하게 사용하기

- 깃헙계정으로 공유해서 사용함. 사용법 구글링

- vscode best extensions [구글링](https://www.tabnine.com/blog/top-vscode-extensions/)을 통해 사용할만한거 찾을 수 있음

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
