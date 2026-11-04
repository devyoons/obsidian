---
별칭:
  - "학습 - Window"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/00fa9bc55d264e98b1410f7f1dca289b
---

# 학습: Window

## 세부 내용

웹페이지의 모든 자원을 관리하는 최상위객체

- `window`, `this`, `globalThis` 키워드를 통해 접근이 가능하다.
- `BOM` Browser Object Model(navigator, location, history, screen, XMLHttpRequest, frames...)
- `DOM` Document Object Model(document)
- javascript (Object, Array, String, ...)
- open
    
    새로운 탭 또는 팝업창을 여는 메소드
    
    - `open(path, name(target), spec)` : <u>새 윈도우객체를 리턴</u>
        - 윈도우명 : 각 브라우져의 탭들을 관리하는 윈도우객체 이름.  `window.name`속성값 지정
            - 기존에 열린 탭중에 해당이름이 존재하면 그 탭에 open, 존재하지 않으면 새로 생성.
            - "_self" 현재탭에 해당 페이지를 open
    
    ```jsx
    /**
     * open
     * - 새로운 탭 또는 팝업창을 여는 메소드
     * - open(url, target, specs) : 새윈도우객체
     *   - target: 각 브라우져의 탭들을 관리하는 윈도우객체 이름.  window.name속성값 지정
     *     - 기존에 열린 탭중에 해당이름이 존재하면 그 탭에 open, 존재하지 않으면 새로 생성.
     *     - "_self" 현재탭에 해당 페이지를 open
     */
    let newWindow;
    const test1 = () => {
      // open("index.html");
      // open("https://naver.com", "_self");
      newWindow = open("index.html", "javascript-index"); // 새 window객체의 name
      // newWindow = open("", "popup", "width=300px, height=300px, left=200px, top=200px");
      console.log(newWindow);
    };
    
    const test2 = () => {
      newWindow.alert('부모창(opener)에서 보낸 메세지~ '); // non-block처리 (단, 개발모드(newWindow콘솔 open시)에는 block처리)
      newWindow.close();
    }
    ```
    
- Timer API
    - setTimeout | clearTimeout
        
        ```jsx
        /**
         * setTimeout(callbackFunction, millis):timeoutId
         * clearTimeout(timeoutId)
         */
        let timeoutId;
        const test3 = () => {
          timeoutId = setTimeout(() => {
            alert("Foooooooooooooooooooooooooo!!!");
          }, 3000);
          console.log("timeoutId : ", timeoutId);
        }
        const test4 = () => {
          clearTimeout(timeoutId);
          console.log(`${timeoutId}번 타이머 취소`);
        };
        </script>
        ```
        
        - @실습문제 : 사용자 타이머 생성하기
            
            ```html
            <fieldset>
              <legend>타이머 폼</legend>
              <input type="text" id="message" placeholder="타이머 메세지를 작성하세요...">
              <br>
              <input type="number" id="sec" min="0" step="10" placeholder="타이머 초를 작성하세요...">
              <br>
              <input type="button" value="타이머 생성" onclick="test5();">
              <input type="button" value="타이머 취소" onclick="test6();">
            </fieldset>
            ```
            
            ```jsx
            /**
             * @실습문제 : 타이머 생성폼
             */
            let userTimeoutId;
            const test5 = () => {
              if(!message.value || !sec.value) 
                return;
            
              const _message = message.value;
              userTimeoutId = setTimeout(() => {
                alert(_message);
              }, sec.value * 1000);
            
              alert(`${sec.value}초후 타이머가 생성되었습니다.`);
              message.value = '';
              sec.value = '';
            };
            const test6 = () => {
              clearTimeout(userTimeoutId);
              alert('타이머가 취소 되었습니다.');
            };
            ```
            
    - setInterval | clearInterval
        
        카운터 만들기
        
        - 카운터 시작 `setInterval`
        - 0이 되면 interval 종료 `clearInterval`
        - 사용자가 취소하면 interval 종료 `clearInterval`
        
        ```jsx
        /**
         * setInterval(callbackFunction, millis) 
         * - millis초 이후부터 millis초간격으로 callbackFunction을 호출
         */
        let intervalId;
        const test7 = () => {
          let num = 10;
        
          intervalId = setInterval(() => {
            counter.innerHTML = --num;
        
            if(num === 0){
              clearInterval(intervalId);
            }
          }, 1000);
          console.log('intervalId : ', intervalId);
        };
        
        const test8 = () => {
          clearInterval(intervalId);
          console.log(`${intervalId} 인터벌 중지`);
        };
        ```
        
        - @실습문제 - clock
            
            `h2#clock`에 `yyyy/MM/dd HH:mm:ss` 형식으로 현재시각을 1초 간격으로 출력하세요.
            
            ```jsx
            <h2 id="clock"></h2>
            <script>
            const clockString = () => {
              const f = (n) => n.toString().padStart(2, "0");
              const now = new Date();
              const yyyy = now.getFullYear();
              const MM = f(now.getMonth() + 1);
              const dd = f(now.getDate());
              const hh = f(now.getHours());
              const mm = f(now.getMinutes());
              const ss = f(now.getSeconds());
              return `${yyyy}/${MM}/${dd} ${hh}:${mm}:${ss}`;
            };
            const displayClock = () => clock.innerHTML = clockString();
            console.log(setInterval(displayClock, 1000)); // intervalId 출력
            </script>
            ```

## 관련 노트

- 상위: [[02 - 학습/IT/개발 메모/개발 메모|개발 메모]]
