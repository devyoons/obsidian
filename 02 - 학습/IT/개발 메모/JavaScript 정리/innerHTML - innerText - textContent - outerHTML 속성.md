---
별칭:
  - "학습 - innerHTML | innerText | textContent | outerHTML 속성"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/5f31321bdf0c45bba4b39b2e4e8f9355
---

# 학습: innerHTML | innerText | textContent | outerHTML 속성

## 세부 내용

```jsx
<p id="foo">I am a <mark>paragraph</mark>.</p>
<p id="demo">This p element contains <span style="display:none">a hidden span element</span> and a <span>visible span element</span>.</p>
<div id="area" class="area"></div>
```

- innerHTML
    
    ```jsx
    /**
     * innerHTML
     * - getter : 모든 자식요소를 html태그 포함해서 리턴.
     * - setter : 주어진 문자열을 html로 parsing해서 처리.
     */
    function test1(){
    	console.log(foo.innerHTML); // I am a <mark>paragraph</mark>.
    	area.innerHTML = foo.innerHTML;
    
    }
    ```
    
- innerText
    
    ```jsx
    /**
     * innerText
     * - getter : 모든 자식요소에서 html태그를 제외하고 text만 가져온다.
     * - setter : 주어진 문자열을 html parsing 없이 text로 추가.
     */ 
    function test2(){
    	console.log(foo.innerText); // I am a <mark>paragraph</mark>.
    	area2.innerText = "I am a <mark>paragraph</mark>.";
    
    }
    ```
    
- textContent
    
    ```jsx
    /**
     * textContent | innerText
     * - textContent : css로 숨긴처리된 자식요소도 처리.
     * - innerText : css로 숨긴처리된 자식요소는 처리하지 않는다.
     */ 
    function test3(){
    	console.log(demo.textContent); // This p element contains a hidden span element and a visible span element.
    	console.log(demo.innerText); // This p element contains  and a visible span element.
    }
    ```
    
- outerHTML
    
    ```jsx
    /**
     * outerHTML 
     * - getter : 태그 자신을 포함해서 리턴
     * - setter : 태그 자신을 교체. 새태그는 DOM에 등록된다.
     */ 
    function test4(){
    	console.log(foo.outerHTML);
    	foo.outerHTML = '<p id="bar">I am a <mark>paragraph</mark>.</p>`; // 이제 #foo는 DOM에서 제거되고, #bar가 새로 등록된다.
    }
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
