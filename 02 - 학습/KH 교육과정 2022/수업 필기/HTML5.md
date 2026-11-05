---
별칭:
  - "강의 - HTML5"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/프론트엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/c2b4265b4af941d38fecb0c6930105fc
주제:
  - "[[00 - 대시보드/주제/HTML·CSS|HTML·CSS]]"
병합된 노트:
  - "HTML5 (2)"
---

# 강의: HTML5

## 강의 내용

---

---

### 웹 통신 기초

> 인터넷이란?
> 

전세계의컴퓨터들이네트워크를통해연결되어정보를공유하는데목적을두며, 프로토콜을이용하여통신한다.
초기에는군사용과민간용으로구분되었고, 민간용이지금의인터넷이다.

> 웹(WEB)이란?
> 

인터넷에 연결된 컴퓨터를 통해 사람들이 정보를 공유할 수 있는 공간으로 인터넷의 통신망 위에서작동하는 서비스

> 웹의 역사
> 
- 팀버너스리(원래는 과학자)가 **하이퍼링크**를 포함하는 문서의 개념을 제안
- 월드와 와이트 웹을 개발/ 배포(무료오픈소스)시키고 웹 표준 단체 W3C를 창설
    - world wide web → www 개발자들은 따따따라고 함

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a0a85db1_Untitled.png]]

#### 웹 특징

**`HTML5 2014년에 나옴`**

**HTTP**(**H**yper **T**ext **T**ransfer **P**rotocol)사용  

- http://
- https:// (암호된 처리를하면 s가 붙음)

**HTML**(**H**yper **T**ext **M**arkup **L**anguage)로 작성된 문서연결

- 텍스트, 그래픽, 오디오, 비디오, 프로그램파일등멀티미디어서비스제공

**반응형 웹**

웹 서버에서 제공되는 정보가 **다양한 기기에 맞춰** 제공되는 환경

#### HTML이란?

웹에서 정보를 표현할 목적으로 만든 마크 업 언어(Hyper Text Markup Language)
웹 페이지를 작성하기 위해 사용되는 언어로 웹브라우저에게 보일 문자열과 이를 감싸는 일종의 해석 기호인 태그들로 이루어진다.

- 마크업(태그) : 문서의 논리적인 구조를 정의하고, 출력장치에 어떠한 형태로 보여질 것인지를 지시하는역할
- 마크 업 언어 : 마크 업(태그)의 형식과 규칙을 정의한 언어

#### HTML5 특징

- 구조적 설계 지원(시멘틱)
- 그래픽 및 멀티미디어 기능 강화
- CSS3 / Javascript 지원
- 다양한 API제공
- 모바일 웹 지원 / 장치접근가능(배터리 정보, 카메라, GPS등)
- 웹 브라우저가 서버와 양방향 통신 가능
- 인터넷이 연결되지 않은 상태에서도 애플리케이션 동작

#### HTML 구성요소

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/e7d432f6_Untitled.png]]

```html
<태그명 속성명="속성값">내용</태크명>
```

- 요소(Element) : 시작태그와 종료태그로 이루어진 모든 명령어 하나의 HTML문서는 요소들의 집합이라고 한다.
    - HTML에서는 중요한 용어는 아니지만 CSS 나 Javascript에서는 요소라는 말이 중요한 용어
- 태그(Tag) :  ‘<’와 ‘>’로 묶인 명령어 시작태그`<태그>` 와 종료태그`</태그>`를 한쌍으로 이용
- 속성(Attribute) : 요소의 시작태그에만 사용 / 명령어 구체화 역할, 여러개의 속성을 사용할 수 있으며 속성의 구분은 공백
- 변수/속성값(Argument) : 속성이 가지는 값, 값 입력시 “ “ 혹은 ‘ ’를 이용
    
    

#### HTML 주의사항

- 태그는 대소문자를 구분하지 않음, 소문자 권장
- 시작 태그로 시작하면 반드시 종료태그로 종료
- 파일확장자는 반드시 html, htm으로 설정할 것
- 문자의 공백은 한개만 인식한다 공백을 추가하기 위해서는 특수기호를 이용해야함(&nbsp;)

#### HTML 구조

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/156cdd49_Untitled.png]]

**`<!DOCTYPE>`** : **현재 문서가 HTML 문서 타입을 명시**한다. 

- 가장 최신버전인 HTML5 문서 타입은 `<!DOCTYPE html>` 이다.

**`<html>`** : **HTML 문서의 시작과 끝**, 루트(root) 요소를 정의한다.

- lang 속성은 이 페이지가 어느 나라 언어로 되어있는지 표시를 의미
    - de : 독일어 / en : 영어 / fr : 프랑스어 / ja : 일본어 / ko : 한국어 / zh : 중국어
    - `<html lang=”ko”>` 한국어를 주력으로 하는 HTML문서

**`<head>`** : HTML 문서의 메타데이터(metadata)를 정의한다.

- 메타데이터(metadata)란 HTML **문서에 대한 정보(data)로 웹 브라우저에는 직접적으로 표현되지 않는 정보를 의미**한다.
- 이러한 메타데이터는 <title>, <style>, <meta>, <link>, <script>, <base>태그 등을 이용하여 표현할 수 있다.

**`<title>`** : **HTML 문서의 제목(title)을 정의**하며, 다음과 같은 용도로 사용된다.

- 웹 브라우저의 툴바(toolbar)에 표시된다.
- 웹 브라우저의 즐겨찾기(favorites)에 추가할 때 즐겨찾기의 제목이 된다.
- 검색 엔진의 결과 페이지에 제목으로 표시된다.

**`<body>`** : **웹 브라우저를 통해 보이는 내용(content) 부분**이다.

**`<h1>~<h6>`** : 제목(heading)을 나타낸다.

**`<p>`** : 단락(paragraph)을 나타낸다.

<aside>
📖 **주석 `<!-- 주석 -->`**

</aside>

<aside>
📖 **emmet기능** : [사이트](https://docs.emmet.io/cheat-sheet/)를 통해 다른 기능들도 확인해볼 수 있다.
**1. `! + tab`
2. 태그 자동완성 원하는 `h1 + tab`
3. 원하는 내용 자동완성 `h1{Hello World} + tab`
4. 여러개 동일한 내용 글씨크기만 변경 `h${Hello World}*6`
5. `li>a`**

</aside>

## Head태그

### <meta> 요소 : 메타데이터

- 헤더 내부에서 사용하는 태그로 메타 데이터로 html문서가 가지고 있는 유용한 정보를 담아 두는 곳, **문서 정보를 검색엔진에 전달**
- `name`은 메타 요소가 어떤 정보의 형태를 갖고 있는지 알려준다.
- `content`는 실제 메타데이터의 컨텐츠이다.

```html
<meta name/http-equiv:"속성명" content="속성내용">
```

#### 문서의 character 인코딩을 특정하기

- 이 요소는 문서의 character 문서에서 허용하는 문자 집합에 대해 표시
- `utf-8` 은 전세계적인 character 집합으로 많은 언어들의 문자들을 포함하고 있기 때문에 웹 페이지에서 어떤 문자라고 취급할 수 있다는 것을 의미

```html
<meta charset="utf-8">
```

#### http-equiv

- meta요소에 정의된 명령을 먼저 실행 후 페이지를 로딩 문서의 초기 정보를 나타냄
    - 검색 엔진에게 문서의 내용을 요약해 주고 정보를 전달해 주기도 하고, 웹 브라우저에게도 정보를 전달하는 역할을 함

| content-language | 기본언어 설정(페이지 작성 언어) |
| --- | --- |
| content-type | MIME설정 및 문서의 문자셋 설정 (encoding) |
| X-UA-compatiable | 호환성 설정 |
| refresh | 페이지 리로드하거나 다른 페이지로 이동 |
| content-Script-Type | 스크립트형식 지정(javascript/VBscript) |
| content-Style-Type | 스타일 시트 형싱지정(css) |

#### name : http-equiv와 같은 의미

| application-name | 웹어플리케이션 이름 |
| --- | --- |
| author | 페이지의 저자 |
| description | 페이지를 설명하는 내용 |
| generator | 페이지를 생성한 프로그램 표시 |
| keywords | 검색어로 사용, 콤마(,)로 구분하여 여러 단어 입력가능 |
| robots | 검색로봇의 검색제한 |
- robots는 index, follow로 나누어 설정

### Head태그

#### title

- **페이지의 제목을 나타내는 태그**

**`<title>페이지 이름</title>`** 

#### script

- **페이지에서 스크립트를 사용하기 위해 사용(head,body 사용가능)**

**`<script>스크립트 내용</script>`** 

| src | 외부 스크립트파일을 문서에 포함할 때 사용 |
| --- | --- |
| async(외부스크립트) | 스크립트 비동기적 실행 |
| defer(외부스크립트) | 페이지 파싱 이후 스크립트 실행 |
| type | 스크립트의 언어 데이터 포멧지정 |
| charset | 외부 스크립트 자원의 문자를 인코딩 |

```html
<작성>
<script src="경로" type="MIME타입"[async/defer charset="문자셋"]> 스크립트내용</script>
```

#### link

- **문서를 외부의 문서와 연결하기 위해 사용 → css파일이나 웹 폰트 사용할 때 주로 연결**

**`<link rel=”관련속성” type=”MIME” href=”문서위치”>`**

| href | 연결한 파일의 경로 지정 |
| --- | --- |
| rel | 링크가 형성하는 관계를 지정 |
| media | 연결문서가 표시될 장치 또는 미디어 유형 |
| type | MIME타입 지정 |

#### style

- **태그의 스타일을 지정해주는 태그, css속성들을 HTML내에 직접 쓸 때 사용**

**`<style>css구문</style>`**

#### base

- **페이지의 링크가 상대경로로 되었을 때 그 기준이 될 경로를 지정 → 링크를 어떻게 오픈 할 것인지 결정**

**`<base href=”경로”[target=”키워드”]`**

| _self | 그 위치에서 열기 |
| --- | --- |
| _parent | 링크의 바로 상위 페이지에서 열기 |
| _top | 최상위 페이지에서 열기  |
| _blank | 새 창으로 열기 |

---

## 링크 <a>태그

- 웹페이지에서 링크를 연결할 때 사용하는 태그
- **내부링크** : `<a>`태그를 이용해서 내부에 링크를 연결하는 방법
    - # 을 앞에 붙였을 때와 안붙였을 때 차이 확인
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/dd2324e2_Untitled.png]]
    
```html
<ul>
    <li><a href="01_text.html">텍스트관련</a></li>
    <li><a href="02_list.html">List관련태그</a></li>
</ul>

<li> : 목록태그
#"01_text.html" : 앞에 #을 붙이는건 목차에 사용
```

- 외부링크 : 다른 사이트의 도메인주소을 넣어 연결해주는 것
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/76a4dd0c_Untitled.png]]
    
```html
<li><a href="https://www.google.com">구글로 이동</a></li>
--> 이렇게하면 바로 구글사이트로 이동하므로 현재 페이지에서 벗어나게 됨

<li><a href="https://www.google.com" target="_blank">구글로 이동</a></li>
--> 새로운 페이지에서 구글사이트를 열어줌
```


---

## 글자 태그

#### `<h(n)>제목 내용</h(n)>` : 제목

- 제목을 입력할 때 사용하는 태그, 폰트의 크기가 태그에 따라 정해져있음 h태그 뒤 숫자로 구분
- <h1> 태그는 **한번만** 사용하기
- <h1> 태그부터 **순차적으로** 사용하기

```html
<h1>제목1 입니다.</h1>
<h2>제목2 입니다.</h2>
<h3>제목3 입니다.</h3>
<h4>제목4 입니다.</h4>
<h5>제목5 입니다.</h5>
<h6>제목6 입니다.</h6>
```

#### `<br>` : 문장을 줄 바꾸기(개행)할 때 사용

#### `&nbsp;` : 문장을 공백처리 (여러번사용가능)

#### `<hr>` : 페이지에 가로로 밑줄을 만들어 줄 때 사용

#### `<p>내용</p>` : 한 개의 단락을 만들 때 사용

- 자동으로 문자 개행후 한 줄 공백을 줌

#### `p>lorem` : Lorem Ipsum 채우기 텍스트

#### `<pre></pre>` : 입력한 그대로 출력할 때 사용(개행,공백,들여쓰기)

### 특수문자 표현 : &문자

- 이 [사이트](http://kor.pe.kr/util/4/charmap2.htm)에서 특수문자 리스트를 확인할 수 있다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3947d488_Untitled.png]]

```html
&lt;p&gt;&quot;특수문자는 &문자로 처리&quot;&lt;/p&gt;
```

### Semantic(의미있는) 시맨틱 태그

| <q></q> | 짧은 인용구(quatation)태그를 사용
자동으로 앞뒤에 큰따옴표가 붙는다 |
| --- | --- |
| <blockquote></blockquote> | 블록 인용문 |
| <strong></strong> 또는 <b></b> | 굵은 글씨체로 강조 |
| <em></em>또는 <i></i> | 기울여 강조하는 문구 |
| <mark></mark> | 형광펜 효과로 강조 |
| <ins></ins> | 밑줄 효과 |
| <code></code> | 실제 코드 |
| <u></u> | 밑줄/ <hr>은페이지전체에수평으로줄을표시하지만<u>는해당범위에만수평줄을표시 |
| <small></small> | 원문자보다작은글씨로표시
부가정보표현시자주사용 |
| <sub></sub> | 아래첨자 |
| <sup></sup> | 윗첨자 |
| <s></s> | 취소선 |
| <addr></addr> | 약자표시와함께마우스가문자에있으면출력 |
| <code></code> | 컴퓨터인식을위한소스코드
<pre>태그내부에작성 |
| <kbd></kbd> | 키보드입력이나음성명령같은사용자입력내용 |
| <cite></cite> | 웹문서나포스트에서참고할때사용
이텔릭으로표시(브라우저마다상이) |
| <del></del> | 텍스트 한가운데 라인을 추가하여 문서에서 삭제된 텍스트를 표현한다. |

#### `<strike> <abbr title=””>`

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/3ef5c55d_Untitled.png]]

HTML5에 마우스 커서를 두면 “Hyper Text Markup Language”이 나옴

```html
<p><strike>HTML4</strike> 대신 
<abbr title="Hyper Text Markup Language">HTML5</abbr>를 사용합시다.</p>
```

---

## 목록태그

#### `<ul></ul>`

- 순서가 필요하지 않은 목록 만들때 사용
- 리스트 앞에 특정모양이 출력
- 해당 모양은 CSS를 이용하여 수정할 수 있음

```html
<ul>
	<li>내용1</li>
	<li>내용2</li>
	<li>내용3</li>
</ul>
```

#### `<ol></ol>`

- 순서가 있는 목록 만들때 사용
- 속성으로 문자(abc… / ABC), 숫자(123…), 로마자(ⅠⅡⅢ..ⅰⅱⅲ..) 설정
- CSS로 순서를 설정 가능
- 속성
    - type : 순서형식을 정하는 것(a,A,1,i,l)
    - start : 시작순서

```html
<ol type=“설명문자” start=“시작순서”>
	<li>내용1</li>
	<li>내용2</li>
	<li>내용3</li>
</ol>
```

#### `<dl></dl>`

- 용어나 문장에 대한 정의(definition)리스트
    - dl description list
    - dt define terms
    - dd define description
- 설정 자동으로 들여쓰기가 됨.
- 태그
    - <dt></dt>정의의 제목
    - <dd></dd>정의내용

```html
<dl>
	<dt>정의제목</dt>
	<dd>정의내용</dd>
	<dd>정의내용</dd>
</dl>
```

---

## 테이블관련

- 표를 만들어주는 HTML태그
- <tfoot> 요소는 테이블의 각 영역(header, body, footer)을 명시하기 위해 <thead>, <tbody> 요소와 함께 사용됩니다.

```html
<table>
	<thead> 제목행
		<tr>
			th/td
		</tr>
	<tbody> 본문행
		<tr>
			th/td
		</tr>
	<tfoot> 정리행
		<tr>
			th/td
		</tr>
</table>
---------------------------------------
<table>
    <thead>
        <tr>
            <th>출장비 내역</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>교통비</td>
            <td>45000</td>
        </tr>
        <tr>
            <td>식비</td>
            <td>18000</td>
        </tr>
        <tr>
            <td>숙박비</td>
            <td>40000</td>
        </tr>
    </tbody>
    <tfoot>
        <tr>
            <td>총 합계</td>
            <td>103000</td>
        </tr>
    </tfoot>
	</table>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4b0d84c9_Untitled.png]]

| <table> | 테이블을 만든다. |
| --- | --- |
| <tr> | 테이블의 행을 만든다. |
| <td> | 테이블의 열을 만든다. |
| <th> | 테이블의 헤드 부분(자동으로 가운데 정렬, 굵게 적용) |
| <caption> | 테이블 이름 표시 |
| <thead> | 테이블의 헤어 영역 지정 |
| <tbody> | 테이블의 바디 영역 지정 |

#### 테이블 디자인 변경

| align | 정렬 지정 (left, center, right) |
| --- | --- |
| border | 테두리 선의 두께 지정 |
| bgcolor | 배경색 지정(색은 "red", "black" 처럼 기존의 정의되어있는 색을 사용할 수도 있으며 rgb형식의 #000000 으로도 색을 지정할 수 있다.) |
| bordercolor | 테두시 선의 색을 지정 (bgcolor와 지정하는 법 동일) |
| cellspacing | 셀간의 간격을 지정한다. |
| width | 가로길이 지정(상수값을 입력할 수도, % 단위로 입력할 수도 있다. %를 사용하였을 때는 웹브라우저 크기의 대한 %이다.) |
| height | 세로길이 지정 |
| rawspan | 세로 행 합치기 (위아래로) |
| colspan | 가로 열 합치기(좌우로) |

---

## 태그별 DISPLAY 속성

- 태그별 CSS의 display속성
    - **`block요소`** : 한 줄을 다차지해서 다음요소는 다음줄에 표시됨.
        - <p>, <div>, <h>, <ul>, <ol>, <form>, <table>...
    - **`inline요소`** : 태그내용만큼만 자리 차지하므로 다음요소는 옆에 표시됨.
        - width, height 적용불가
        - <span>, <a>, <img>, <em>, <mark>, <del>...
    - **`inline-block`** : inline처럼 전 후 줄바꿈 없이 한 줄에 다른 엘리먼트와 나란히 배치되고
    inline에서 불가능하던 width 와 height속성 지정 및 margin과 padding속성의 상하 간격 지정이 가능해짐.

## img 태그

```html
<img src="이미지주소" alt="대체문자열">
```

- src : 이미지 파일 경로
- 상대경로 : 현재페이지 기준으로 파일검색
    - ./ : 현재 디렉토리(생략가능)
    - ../ : 부모 디렉토리
- 절대경로 : 루트디렉토리 기준으로 파일검색
    - / , c:\ , http:// 로 시작
    - 서버이용시 / → [http://192.168.45.208:5500/](http://192.168.45.208:5500/)
    - 서버환경에서는 c:\ 사용불가
- style 너비/높이 조절
    - 너비/높이 하나만 지정시 이미지의 원래 비율을 유지한채로 변경
- alt 대체텍스트속성
    - 이미지를 못찾은 경우 화면에 표시할 텍스트
    - 시각장애인의 화면낭독기(스크린리더)에 해석될 텍스트
- 절대크기, 상대크기 단위
    - 절대크기 단위 : px
    - 상캐그기 단위 : % , em (부모요소기준으로 길이를 측정)
    

```html
<h1>이미지관련</h1>
<img src="images/flower1.PNG" style="width: 200px;">
<img src="../sample/image/flower2.PNG" style="width: 200px;">
<img src="/sample/image/flower3.PNG" style="width: 200px;">
<img src="http://192.168.45.208:5500/sample/image/flower3.PNG" style="width: 200px;">
<img src="data:image/jpeg;base64,/.." style="width: 200px;">
<img src="C:\Workspaces\webclient_workspace\sample\image\hyunta.jpg" style="width: 200px;" alt="현타 온 개사진">

<!-- div>img[src=../sample/images/folwer$.PNG]*5 -->
<!-- emmit에서 속성은 대괄호[]를 사용한다. -->
  <div>
      <img src="../sample/image/flower1.PNG" alt="꽃이미지" style="width: 18%">
      <img src="../sample/image/flower2.PNG" alt="꽃이미지" style="width: 18%">
      <img src="../sample/image/flower3.PNG" alt="꽃이미지" style="width: 18%">
      <img src="../sample/image/flower4.PNG" alt="꽃이미지" style="width: 18%">
      <img src="../sample/image/flower5.PNG" alt="꽃이미지" style="width: 18%">
  </div>
```

---

## link 관련

#### href

- <a>태그의 href 속성은 링크를 클릭하면 연결할 페이지나 사이트의 URL 주소를 명시한다.
- <a>태그는 텍스트나 단락, 이미지 등 다양한 HTML 요소에 사용할 수 있다.

```html
<a href="링크주소">HTML 링크</a>
--------------------------------
사이트 링크 연결하기

<a href="http://naver.com">네이버로 가기</a><br>
<a href="./index.html">인덱스로 돌아가기</a><br>
```

#### taget

- 이동할 페이지를 어느 target에서 연결할지 여부
- _self (현재탭) - 기본값
- _blank (새탭)

```html
<!-- a>img -->
<a href="index.html" title="인덱스로 돌아가기" target="_blank">
    <img src="../sample/image/forest1.PNG" alt="" style="width: 200px;">
</a>
```

#### 페이지내에 특정 영역으로 이동(북마크)

```html
<!-- ul>li>a -->
<ul>
    <li><a href="#header1">#header1</a></li>
    <li><a href="#header2">#header2</a></li>
    <li><a href="#header3">#header3</a></li>
    <li><a href="#header4">#header4</a></li>
    <li><a href="#header5">#header5</a></li>
    <!-- #:~:text= 하이라이트 복사(드래그한 영역 링크복사)-->
    <li><a href="#:~:text=Molestias%20doloremque%20animi%20voluptatem%20minima%20optio%20veniam">하이라이트링크</a></li>
</ul>
		<!-- (p#p$>lorem*10)*5 -> #은 id를 말함.(식별자역할을함)-->
    <!-- (div>h3#header${header$}+p>lorem*10)*5 -->
		<!--  #header$ => id속성  {header$} =>노출될 내용
<div>
    <h3 id="header1">header1</h3>
    <p><span>Lorem</span></p>
</div>
<div>
    <h3 id="header2">header2</h3>
    <p><span>Lorem</span></p>
</div>
<div>
    <h3 id="header3">header3</h3>
    <p><span>Lorem</span></p>
</div>
<div>
    <h3 id="header4">header4</h3>
    <p><span>Lorem</span></p>
</div>
<div>
    <h3 id="header5">header5</h3>
    <p><span>Lorem</span></p>
</div>
<a href="#top">맨위로</a>
```

---

## media 관련

### 음악재생

- controls 속성이 없으면 재생할 수 없음
- 브라우저마다 나오는 모양이 다를 수 있음
- autoplay는 브라우저 정책상 지원되지 않을 수 있다.

```html
<!-- controls="controls" 속성명과 속성값이 동일하면 생략가능 -->
<audio src="경로.mp3" controls muted autoplay></audio>
```

#### 오디오 요소

| audio | 오디오와 음악 등 오디오 파일을 명시함 |
| --- | --- |
| source | audio 요소의 원본 파일에 대한 파일 형식 및 파일 주소를 여러 개 명시함.
웹 브라우저는 위쪽에서부터 순서대로 가장 먼저 인식되는 파일 형식과 파일 주소를 사용함. |

#### 오디오 속성

| src | 오디오 파일 경로 |
| --- | --- |
| controls  | 오디오 기본동작 조절할 수 있는 패널 |
| autoplay | 오디오의 자동 재생 여부 |
| loop | 오디오의 반복 재생 여부 |
| preload | 오디오를 재생하기 전에 파일의 내용을 모두 불러올지 여부 |

### 비디오재생

```html
<!-- fallback 지원하지않는 브라우저에서 문구보여주는거-->
<video src="경로.mp4" controls style="width: 300px"></video>
```

#### 비디오 요소

| video | 비디오와 영화 등 비디오 파일  |
| --- | --- |
| source | video 요소의 원본 파일에 대한 파일 형식 및 파일 주소를 여러 개 명시함.
웹 브라우저는 위쪽에서부터 순서대로 가장 먼저 인식되는 파일 형식과 파일 주소를 사용함. |
| track | 비디오 플레이어에 대한 텍스트 자막을 명시 |

#### 비디오 속성

| src | 비디오 파일의 경로 |
| --- | --- |
| height | 비디오 파일의 높이 |
| width | 비디오 파일의 너비 |
| controls | 비디오의 기본적인 동작을 조절할 수 있는 패널 |
| autoplay | 비디오의 자동 재생 여부를 명시 |
| loop | 비디오의 반복 재생 여부 |
| poster | 비디오가 아직 준비 중일 때 불러올 이미지 파일의 경로를 명시 |
| preload | 비디오를 재생하기 전에 파일의 내용을 모두 불러올지를 명시 |

#### 유튜브 동영상

```html
<!-- youtube -> 공유 -> 퍼가기주소복사-->
<iframe 
    width="560" 
    height="315" 
    src="https://www.youtube.com/embed/VuDY1PBAuWU" 
    title="YouTube video player" 
    frameborder="0" 
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
    allowfullscreen>
</iframe>
```

## 폼관련태그

- 웹 페이지에서는 form 요소를 사용하여 사용자로부터 입력을 받을 수 있다.
- 사용자가 입력한 데이터를 서버로 보낼 때에도 form 요소를 사용한다.

```html
<form action="처리할페이지주소" method="get | post"></form>
```

- action : 서버주소 아무것도 작성하지 않았다면, 현재페이지주소로 제출
- method : 전송방식. GET(기본값)/POST
    - **`GET`** : 사용자입력값이 요청url에 붙여 전송
        - GET 방식은 주소에 데이터(data)를 추가하여 전달하는 방식.
        - 데이터가 주소 입력창에 그대로 나타나며, 전송할 수 있는 데이터의 크기 또한 제한적이다.
        - 검색 엔진의 쿼리(query)와 같이 크기가 작고 중요도가 낮은 정보를 보낼 때 주로 사용.
    - **`POST`** : 사용자 입력 값을 숨김처리(전송메세지 body에 작성)
        - POST 방식은 데이터(data)를 별도로 첨부하여 전달하는 방식.
        - 데이터가 외부에 드러나지 않으며, 전송할 수 있는 데이터의 크기 또한 제한이 없다.
        - 보안성 및 활용성이 GET 방식보다 좋습니다.

### input 요소

- HTML에서는 다양한 타입의 input요소를 사용하여 사용자로부터 입력을 받을 수 있다.

| 텍스트 입력 | text |
| --- | --- |
| 비밀번호 입력 | password |
| 이메일 입력 | email |
| 홈페이지 입력 | url |
| 전화번호 입력 | phone |
| 메모 입력 | memo |
| 라디오 버튼 | radio |
| 체크박스 | checkbox |
| 파일 선택 | file |
| 선택 입력 | select |
| 문장 입력 | textarea |
| 버튼 입력 | button |
| 전송 버튼 | submit |
| 필드셋 | fieldset |
| 숫자 입력 | number |
| 숫자범위 입력 | numRange |
| 날짜입력 | date |
| 시간입력 | time |
| 날짜/시간 입력 | datetime-local |

---

### text관련 input태그

#### 텍스트입력

- id속성은 페이지내 태그의 고유 식별값
- 페이지내 id는 중복될 수 없다.
- name속성이 있어야 서버로 전송된다.
    - 값이 입력되지 않아도 빈문자열 전송.
- 공백도 있는걸로 처리됨 ⇒ 추후 자바스크립트로 보완해야함.

```html
<form action="" method="POST">
<label for="userId">아이디 : </label> <!-- for속성이 input태그의 id속성과 연결되어야 한다. -->
<input type="text" id="userId" name="userId" value="honggd" placeholder="아이디를 입력하세요"/>
```

#### 비밀번호입력

- input 태그의 type 속성값을 “password”로 설정하면, 사용자로부터 비밀번호를 입력받음
- 문자나 숫자 대신 별표나 작은 원 모양이 표시됨
- 입력값이 없으면 빈문자열 전송

```html
<!-- label+input[type=password] -->
<!-- label+input:password -->
<label for="userPassword">비밀번호 : </label>
<input type="password" name="userPassword" id="userPassword" maxlength="16">
<br>
```

#### 이메일입력

- 사용자로부터 이메일을 입력받음
- 이메일 형식에 맞게 작성해야함. ‘@’없이 작성하면 다시 입력하게함.
- 하지만 ‘@’만 붙이고 뒤에 주소는 아무렇게나해도 제출이 가능함 ⇒ 추후 자바스크립트로 보완

```html
<!-- label+input:email -->
<label for="userEmail">이메일 : </label>
<input type="email" name="userEmail" id="userEmail">
```

#### 홈페이지입력

- value 에 `https://` 를 미리 입력해줄 수 있음

```html
<label for="homepage">홈페이지 : </label>
<input type="url" name="homepage" id="homepage" value="https://">
```

#### 전화번호입력

- 실제 핸드폰으로 확인해보면 숫자패드가 나와서 숫자만 입력받게함.

```html
<label for="phone">전화번호 : </label>
<input type="tel" name="phone" id="phone">
```

---

### 메모입력 textarea 태그

- textarea 안에서는 띄어쓰기, 들여쓰기 등 전부 입력됨.

```html
<label for="memo">메모 : </label>
<textarea name="memo" id="memo" cols="30" rows="10" style="resize:none">abc
def
ghi</textarea>
```

---

### 숫자관련 input태그

#### 점수입력

- 위아래로 점수를 설정할 수 있는 스피너박스나옴.
- 화살표 한번 클릭에 숫자를 몇씩 올리냐는 step으로 설정
- min / max 값을 설정할 수 있음.

```html
<label for="number">점수 : </label>
<input type="number" name="score" id="score" min="0" max="100" step="5">
```

#### 숫자범위입력

- 설정한 범위가 안보임  ⇒ 추 후 자스로 보완

```html
<label for="numRange">범위 : </label>
<input type="range" name="numRange" id="numRange" min="-100" max="100" step="5">
```

---

### 선택관련 optgroup태그

```html
<fieldset>
    <legend>선택관련 태그</legend>
    <label for="nation">국적 : </label>
    <select name="nation" id="nation">
        <option value="">선택</option>
        <optgroup label="Asia">
            <option value="ko" selected>한국</option>
            <option value="ch">중국</option>
            <option value="jp">일본</option>
        </optgroup>
        <optgroup label="Europe">
            <option value="fr">프랑스</option>
            <option value="gm">독일</option>
            <option value="en">영국</option>
        </optgroup>
    </select>
</fieldset>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9d3c35ed_Untitled.png]]

#### dataList 태그 : 선택하지 않고 사용자가 입력할 수도 있게 하는 태그

- `list=”carList”`와 `id=”carList”` 연결
- 목록에 없으면 사용자가 직접 입력할 수 있다.

```html
<label for="car">차 : </label>
<input type="text" name="car" id="car" list="carList">
<datalist id="carList">
    <option value="소나타">소나타</option>
    <option value="그랜져">그랜져</option>
    <option value="제네시스">제네시스</option>
</datalist>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/37fa946a_Untitled.png]]

---

### 날짜/시간 관련 input태그

- 지역대 datetime-local 에서는 날짜와 시간 사이에 ‘T’를 구분자로 넣어준다.
    - ex) 2022-04-07T21:33

```html
<fieldset>
    <legend>날짜/시간관련 input태그</legend>
    <label for="today">날짜 : </label>
    <input type="date" name="today" id="today" value="2002-02-02">
    <br>
    <label for="when">시간 : </label>
    <input type="time" name="when" id="when" value="21:33">
    <br>
    <label for="meeting">날짜/시간 : </label>
    <input type="datetime-local" name="meeting" id="meeting" value="2002-02-02">
</fieldset>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f222dc84_Untitled.png]]

---

### radio/checkbox 관련 input태그 : 값이 없으면 전송X

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/46138deb_Untitled.png]]

- radio 택일 ⇒ 기본 value (default) ⇒ on
    - name속성으로 그룹핑해서 목록중 하나만 선택할 수 있게 한다. name속성이 다르면 그룹핑X
    - value 값을 꼭 지정해준다.
    - 체크하지않으면 값 전송X.

```html
<div>
    성별 : 
    <input type="radio" name="gender" id="gender-male" value="male">
    <label for="gender-male">남</label>
    <input type="radio" name="gender" id="gender-male" value="female">
    <label for="gender-male">여</label>
</div>
value값 지정안하면 --> gender=on 이라고 제출됨. 여자인지 남자인지 알 수 없음
```

- checkbox 여러개 선택 가능 ⇒ 기본 value (default) ⇒ on
    - 체크하지않으면 값 전송X
    - 동일한 속성명 속성값으로 날라감 ⇒ 나중에 배열로 처리함

```html
취미 :
<input type="checkbox" name="hobby" id="hobby-game" value="게임">
<label for="hobby-game">게임</label>
<input type="checkbox" name="hobby" id="hobby-music" value="음악">
<label for="hobby-music">음악</label>
<input type="checkbox" name="hobby" id="hobby-movie" value="영화">
<label for="hobby-movie">영화</label>
--> 음악, 영화 체크시 --> 'hobby=음악&hobby=영화' 전송
```

- 체크박스 하나인 경우, value를 생략해도 서버측에서 구분이 가능하다

```html
<label for="forEmail">이메일수신여부 : </label>
<input type="checkbox" name="forEmail" id="forEmail">
--> 이럴때에는 value값을 지정하지 않아도 된다.
--> forEmail=on 으로 전송
```

---

### 컬러/파일 input 태그

- disabled 속성은 서버측으로 전송되지 않음

#### 컬러관련태그

- fieldset>legend{기타}
- RGB (256,256,256) 개의 색상 ⇒ 컬러색상 16진수로 값 전송
- # ⇒ %23

```html
<fieldset>
    <legend>기타</legend>
    <label for="myColor">컬러 : </label>
    <input type="color" name="myColor" id="myColor" value="#ff0000" disabled>
</fieldset>

<!-- disabled 서버측으로 전송되지 않음 -->
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/8031eec9_Untitled.png]]

#### 파일관련태그

- value속성이 없다.
- 이진데이터로 넘어가서 별도의 처리가 필요하다.

```html
<label for="upFile">파일 : </label>
<input type="file" name="upFile" id="upFile">
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4822d5c0_Untitled.png]]

#### hidden 눈에 안보이는 정보 전송

- 사용자에게 노출되지 않아도 되는 정보를 전송할 때 사용함
- input:hidden ⇒ 안보이지만 전송 / disabled ⇒ 보이지만 전송하지 않음

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/50d1dd78_Untitled.png]]

```html
<label for="hidden">안보이지만 전송 : </label>
<input type="hidden" name="hidden" id="hidden" value="helloworld">
```

---

### 버튼관련 input태그

- submit : 폼을 제출하는 용도
- reset : 폼안의 input태그 value속성을 초기값으로 변경
- button : 자바스크립트를 통해 원하는 설정가능.
- 

```html
<input type="submit" value="제출">
<input type="reset" value="초기화">
<input type="button" value="그냥버튼">
-----------------------------------------
<!-- button태그의 기본type은 submit이다.-->
<button type="submit">제출</button>
<button>그냥버튼 아니고 제출</button>
<button type="reset">초기화</button>
<button type="button">그냥버튼</button>
<!-- 그냥버튼 사용시 type에 button 꼭 지정-->
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/c56617c5_Untitled.png]]


---

### 합친 노트: HTML5 (2) (수업 필기)

cookie : 브라우저에 저장했다가 서버에 전송하는 용도

web storage : 브라우저안에서만 사용할 목적이라면, 전송하지 않는다면 (보안적으로 강점)

local storage

session storage

index db

#### Web Storage API

**서버에 전송하지 않고 브라우저 안에서만 사용함. (보안적으로 강점)**

WEB STORAGE이란 웹의 데이터를 클라이언트에 저장할 수 있는 자료구조다. **키/값 쌍으로 데이터를 저장**하고 **키를 기반으로 데이타를 조회**하는 패턴이다.

**내부적으로는 영구저장소(LocalStorage)와 임시저장소(SessionStorage)가 분리되어 데이터 지속성에 따라 선택적으로 사용이 가능하다.**

Web Storage는 웹 환경에 Cookie와 유사한 개념이다.

##### session strage

- 각각의 출처에 대해 독립적인 저장 공간을 페이지 세션이 유지되는 동안(브라우저가 열려있는 동안) 제공합니다.
- 세션에 한정해, 즉 브라우저 또는 탭이 닫힐 때까지만 데이터를 저장합니다.
- **데이터를 절대 서버로 전송하지 않습니다**.
- 저장 공간이 쿠키보다 큽니다. (최대 5MB)

##### localStorage

- session strage와 동일하지만, **브라우저를 닫았다 열어도 데이터가 남아있다.**
- **유효기간 없이 데이터를 저장**하고, JavaScript를 사용하거나 브라우저 캐시 또는 로컬 저장 **데이터를 지워야만 사라집니다.**
    - ex) 자동 로그인 저장
- **저장 공간이 셋 중 제일 큽니다.**

문서에서 `localStorage`를 호출하면 `Storage`객체를 반환합니다. 문서에서 `sessionStorag`를 호출하면 다른 `Storage`객체를 반환합니다. **둘 다 같은 방법으로 조작할 수 있지만, 서로 다릅니다.**

##### Web Storage vs cookie

**서버전송**

- web storage는 데이터를 클라이언트에만 저장할 뿐 서버로 전송은 이루어지지 않는다.**cookie는 매번 서버로 전송된다.**

**객체저장**

- **Web Storage는 문자열 이외에도 구조화된 객체를 저장할 수 있다**는 개발 편의성을 제공해준다.단, 브라우저의 지원 여부를 확인해 봐야한다.

**용량제한**

- 하나의 사이트에서 저장할 수 있는 최대 쿠키 수는 20개, 최대 데이터 크기는 4KB.**web Storage는 용량제한이 없다. 쿠키는 개수와 용량에 있어 제한이 있다.**

**만료일자**

- **web storage는 한번 저장한 데이터는 영구적으로 존재**한다.**쿠키는 만료일자를 지정**하게 되어 있어 언젠가 사라진다.

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/7c1c8769_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
