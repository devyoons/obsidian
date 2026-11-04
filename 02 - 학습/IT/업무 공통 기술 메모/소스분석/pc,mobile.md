---
별칭:
  - "학습 - pc,mobile"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/bf6600850db94778ba3750414ba6624d
---

# 학습: pc,mobile

## 세부 내용

- JAVA

```java
String userAgent = request.getHeader("user-agent");
boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian
                          |Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");
boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*"); 

if (mobile1 || mobile2) {
    System.out.println("MOBILE");
} else {
    System.out.println("PC");
}
```

1. **`String userAgent = request.getHeader("user-agent");`**: 이 코드는 HTTP 요청의 User-Agent 헤더 값을 가져와서 **`userAgent`**라는 문자열 변수에 저장합니다. User-Agent 헤더는 클라이언트의 브라우저나 앱에 대한 정보를 담고 있으며, 사용자가 어떤 기기나 브라우저로 접속했는지를 식별하는 데 사용됩니다.
2. **`boolean mobile1 = userAgent.matches( ".*(iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson).*");`**: 이 코드는 정규 표현식을 사용하여 **`userAgent`** 변수에 저장된 값에서 모바일 기기인지를 판별합니다. 정규 표현식은 다양한 모바일 기기들의 User-Agent 문자열 패턴을 포함하고 있습니다.
3. **`boolean mobile2 = userAgent.matches(".*(LG|SAMSUNG|Samsung).*");`**: 이 코드는 또 다른 정규 표현식을 사용하여 **`userAgent`** 변수에 저장된 값에서 LG나 SAMSUNG과 같은 브랜드의 기기인지를 판별합니다.
4. **`if (mobile1 || mobile2) { System.out.println("MOBILE"); } else { System.out.println("PC"); }`**: 이 코드는 앞서 판별한 **`mobile1`** 또는 **`mobile2`** 변수의 값에 따라 기기가 모바일인지를 확인하고, 그에 따라 "MOBILE" 또는 "PC"라는 문자열을 출력합니다.

결과적으로, 이 코드는 HTTP 요청의 User-Agent 헤더를 이용하여 사용자가 접속한 기기가 모바일인지를 판별하고, 그 결과를 콘솔에 출력하는 기능을 수행합니다.

- javascript

```jsx
var userDevice = "";
var device = "win16|win32|win64|mac|macintel";

if ( navigator.platform ) {
    if ( device.indexOf(navigator.platform.toLowerCase()) < 0 ) {
        userDevice = "MOBILE";
    } else {
        userDevice = "PC";
    }
}
```

1. **`var userDevice = "";`**: 이 코드는 **`userDevice`**라는 변수를 선언하고, 초기값으로 빈 문자열을 할당합니다.
2. **`var device = "win16|win32|win64|mac|macintel";`**: 이 코드는 **`device`**라는 변수를 선언하고, 여러 플랫폼 정보를 **`|`**를 사용하여 문자열로 묶어 할당합니다. 이 문자열에는 "win16", "win32", "win64", "mac", "macintel"과 같은 데스크톱 PC 플랫폼 정보가 포함됩니다.
3. **`if ( navigator.platform ) {`**: 이 코드는 **`navigator.platform`**이 존재하는지 검사하는 조건문입니다. **`navigator.platform`**은 사용자의 브라우저에서 현재 사용 중인 플랫폼 정보를 나타냅니다.
4. **`if ( device.indexOf(navigator.platform.toLowerCase()) < 0 ) {`**: 이 코드는 **`device`** 문자열에 **`navigator.platform`**의 소문자 형태가 포함되어 있는지 검사합니다. **`indexOf`** 함수는 문자열 내에서 특정 문자열이 처음으로 등장하는 위치를 반환합니다. 여기서 **`< 0`**은 해당 플랫폼 정보가 **`device`** 문자열에 없음을 의미합니다.
5. **`userDevice = "MOBILE";`**: 이 코드는 **`userDevice`** 변수에 "MOBILE"이라는 문자열을 할당합니다. 이는 사용자의 브라우저 플랫폼이 모바일 기기인 경우에 해당합니다.
6. **`} else { userDevice = "PC"; }`**: 이 코드는 앞서 언급한 조건문의 else 부분으로, 사용자의 브라우저 플랫폼이 데스크톱 PC인 경우에 **`userDevice`** 변수에 "PC"라는 문자열을 할당합니다.

결과적으로, 이 JavaScript 코드는 사용자의 브라우저 플랫폼 정보를 이용하여 사용자가 모바일 기기인지 데스크톱 PC인지를 판별하고, 그 결과를 **`userDevice`** 변수에 할당하는 기능을 수행합니다.

**🎈 크롬에서 자신의 useragent확인 방법**

1. F12를 눌러 개발자 모드 
2. 콘솔 창에서 `navigator.userAgent`를 쓰면 자신의 userAgent 정보가 나온다.
    
    ```jsx
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
    ```
    
3. google_user_agent_`client_hint` 
    
    ```jsx
    '["Windows","15.0.0","x86","","114.0.5735.199",[],0,null,"64",[["Not.A/Brand","8.0.0.0"],["Chromium","114.0.5735.199"],["Google Chrome","114.0.5735.199"]],0]'
    ```

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/소스분석/소스분석|소스분석]]
