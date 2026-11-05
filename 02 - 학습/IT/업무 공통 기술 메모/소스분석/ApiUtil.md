---
별칭:
  - "학습 - ApiUtil"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/effc57c7ddc44fe098a344104f1fb0aa
---

# 학습: ApiUtil

## 세부 내용

```java
package com.awasoft.safety.fsms.config.web.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.ToString;
import okhttp3.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@ToString
@Component
public class ApiUtil {
    
    public static JSONObject get(String token, String url){
        JSONObject jsonObject = null;
        OkHttpClient client = new OkHttpClient();

        try {
            Request.Builder builder = new Request.Builder()
                    .addHeader("Authorization", token)
                    .url(url)
                    .get();
            // 요청 전송
            Request request = builder.build();
            Response response = client.newCall(request).execute();

            if (response.isSuccessful()) {
                // 응답 Body
                ResponseBody responseBody = response.body();
                // 응답 성공 여부에 따라 예외처리 진행
                if (responseBody != null) {
                    jsonObject = new JSONObject(responseBody.string());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    public static JSONObject post(String token, String url, HashMap<String, Object> jsonMap){
        JSONObject jsonObject = null;
        JSONObject json = new JSONObject(jsonMap);
        OkHttpClient client = new OkHttpClient();
        RequestBody requestBody = RequestBody.create(MediaType.parse("application/json;charset=UTF-8"), json.toString());

        try {
            Request.Builder builder = new Request.Builder()
                    .addHeader("Authorization", token)
                    .url(url)
                    .post(requestBody);
            // 요청 전송
            Request request = builder.build();
            Response response = client.newCall(request).execute();

            if (response.isSuccessful()) {
                // 응답 Body
                ResponseBody responseBody = response.body();

                // 응답 성공 여부에 따라 예외처리 진행
                if (responseBody != null) {
                    jsonObject = new JSONObject(responseBody.string());
                }
            }else {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonObject;
    }

    public static String delete(String token, String url, HashMap<String, Object> jsonMap){
        OkHttpClient client = new OkHttpClient();
        JSONObject json = new JSONObject(jsonMap);
        RequestBody requestBody = RequestBody.create(MediaType.parse("application/json;charset=UTF-8"), json.toString());
        String delResult = "";
        try {
            Request.Builder builder = new Request.Builder()
                    .addHeader("Authorization", token)
                    .url(url)
                    .delete(requestBody);
            // 요청 전송
            Request request = builder.build();
            Response response = client.newCall(request).execute();

            if (response.isSuccessful()) {
                // 응답 Body
                ResponseBody responseBody = response.body();

                // 응답 성공 여부에 따라 예외처리 진행
                if (responseBody != null) {
                    delResult = responseBody.string();
                }
            }else {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return delResult;
    }
}
```

- 이 클래스는 API 호출을 단순화하고 HTTP GET, POST, DELETE 요청을 수행하는 유틸리티 메서드를 제공
1. **`get`** 메서드
    - 주어진 **`token`**과 **`url`**을 이용하여 HTTP GET 요청을 보냅니다.
    - **`token`**은 인증을 위해 요청 헤더에 추가됩니다.
    - 응답이 성공적으로 도착하면, JSON 형식의 응답을 **`JSONObject`**로 파싱하여 반환합니다.
2. **`post`** 메서드
    - 주어진 **`token`**, **`url`**, 그리고 **`jsonMap`**을 이용하여 HTTP POST 요청을 보냅니다.
    - **`token`**은 인증을 위해 요청 헤더에 추가됩니다.
    - **`jsonMap`**은 **`HashMap`** 형태의 데이터를 받아 JSON으로 변환하여 요청의 Body에 담습니다.
    - 응답이 성공적으로 도착하면, JSON 형식의 응답을 **`JSONObject`**로 파싱하여 반환합니다.
3. **`delete`** 메서드
    - 주어진 **`token`**, **`url`**, 그리고 **`jsonMap`**을 이용하여 HTTP DELETE 요청을 보냅니다.
    - **`token`**은 인증을 위해 요청 헤더에 추가됩니다.
    - **`jsonMap`**은 **`HashMap`** 형태의 데이터를 받아 JSON으로 변환하여 요청의 Body에 담습니다.
    - 응답이 성공적으로 도착하면, 응답의 본문을 문자열로 반환합니다.
4. **`ApiUtil`** 클래스
    - OkHttpClient 라이브러리를 사용하여 HTTP 요청을 보내고, 서버로부터의 응답을 처리합니다.
    - HTTP 요청은 GET, POST, DELETE 메서드를 사용하여 처리되며, 요청에는 **`Authorization`** 헤더에 **`token`** 값을 넣어서 보내게 됩니다.
    - 이를 통해 인증된 사용자로써 API에 접근하게 됩니다.

1. **`OkHttpClient`**는 **`okhttp3`** 라이브러리를 사용하여 HTTP 요청을 처리하는 클라이언트 객체입니다.
2. **`MediaType.parse("application/json;charset=UTF-8")`**는 요청의 Content-Type을 JSON으로 설정하는 데 사용됩니다.
3. **`@Value`** 어노테이션은 스프링 프레임워크에서 값을 주입받는데 사용됩니다. 이 클래스에서는 해당 어노테이션이 사용되지는 않았습니다.
    1. **`JSONObject`** 클래스는 **`org.json`** 패키지에서 제공되는 JSON 객체로, JSON 데이터를 다루기 위해 사용됩니다.
4. **`@Component`** 어노테이션은 해당 클래스가 스프링의 컴포넌트로 등록됨을 나타냅니다.

```java
JSONObject response = ApiUtil.get((String)param.get("webToken"), apiUrl+"/field/biz");
```

- 코드는 **`ApiUtil`** 클래스의 **`get`** 메서드를 호출하고 있습니다:
- 이 코드는 **`webToken`**과 **`apiUrl`** 값을 매개변수로 전달하여 GET 요청을 보내고, 그에 대한 응답을 **`JSONObject`** 형태로 받아오고 있습니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
