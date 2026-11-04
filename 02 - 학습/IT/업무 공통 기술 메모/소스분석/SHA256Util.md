---
별칭:
  - "학습 - SHA256Util"
태그:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/35ba433daec248b2865d8aa8faa545d0
---

# 학습: SHA256Util

## 세부 내용

```java
package com.awasoft.safety.fsms.config.web.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SHA256Util {
    /**
     *
     * 로그설정
     *
     * @alias 로그설정
     */
    protected static Logger logger = LogManager.getLogger(SHA256Util.class);

    /**
     * SHA-256 암호화 함
     *
     * @param source String 원본
     * @param salt String SALT 값
     * @return
     */
    public static String getEncrypt(String source, String salt) {
        return getEncrypt(source, salt.getBytes());
    }

    /**
     * SHA-256 암호화 함
     *
     * @param source String 원본
     * @param salt byte[] SALT 값
     * @return result String
     */
    public static String getEncrypt(String source, byte[] salt) {
        String result = "";

        byte[] a = source.getBytes();
        byte[] bytes = new byte[a.length + salt.length];

        System.arraycopy(a, 0, bytes, 0, a.length);
        System.arraycopy(salt, 0, bytes, a.length, salt.length);

        try {
            // 암호화 방식 지정 메소드
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(bytes);

            byte[] byteData = md.digest();

            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < byteData.length; i++) {
                sb.append(Integer.toString((byteData[i] & 0xFF) + 256, 16).substring(1));
            }

            result = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            logger.debug("getSHA256Enc NoSuchAlgorithmException");
        }

        return result;
    }
}
```

이 클래스는 주어진 문자열을 SHA-256 알고리즘을 사용하여 해시값(암호화 값)으로 변환하는 기능을 제공합니다.

1. **`getEncrypt`** 메서드: 이 메서드는 주어진 문자열 **`source`**와 바이트 배열 **`salt`**를 사용하여 SHA-256 알고리즘으로 문자열을 해시값으로 변환합니다.
2. **`getEncrypt(String source, String salt)`**
    - 이 메서드는 문자열 **`source`**와 문자열 **`salt`**를 받아서 **`salt`**를 바이트 배열로 변환하여 **`getEncrypt(String source, byte[] salt)`** 메서드를 호출합니다.
3. **`getEncrypt(String source, byte[] salt)`**
    - 이 메서드는 문자열 **`source`**와 바이트 배열 **`salt`**를 받아서 이를 합친 후 SHA-256 알고리즘으로 해시값을 생성합니다.

해시값은 단방향 암호화로, 원본 문자열을 해시값으로 변환하는 것은 가능하지만 해시값을 다시 원본 문자열로 복원하는 것은 불가능합니다. 이러한 특성으로 주로 사용자 비밀번호와 같은 민감한 정보를 안전하게 저장하기 위해 활용됩니다.

SHA-256은 안전하고 보안성이 높은 암호화 알고리즘으로, 비밀번호와 같은 중요한 정보를 안전하게 다룰 때 사용됩니다. 이 클래스를 사용하면 Java 애플리케이션에서 간단하게 SHA-256 해시값을 생성할 수 있습니다.

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/소스분석/소스분석|소스분석]]
