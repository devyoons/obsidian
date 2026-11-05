---
별칭:
  - "학습 - AES256Util"
tags:
  - type/study
  - context/studies
  - theme/dev
  - status/in-progress
  - domain/인프라
생성일: 
수정일: 2026-11-04
노션원본: https://www.notion.so/5b4af2f533d54c089138eeaf0a91f989
주제:
  - "[[00 - 대시보드/주제/보안|보안]]"
---

# 학습: AES256Util

## 세부 내용

```java
package com.awasoft.safety.fsms.config.web.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.awasoft.safety.fsms.config.web.ExtensionException;

/**
 * AES256Util Class
 * @author
 * @since
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일			수정자			수정내용
 *  -------			--------	---------------------------
 *
 *  </pre>
 */
public class AES256Util {
	private AES256Util() {
	}

	public static String encrypt(final String key, final String data) {
		try {
			byte[] keyData = key.getBytes(StandardCharsets.UTF_8);
			byte[] ivData = key.substring(0, 16).getBytes(StandardCharsets.UTF_8);
			SecretKey secretKey = new SecretKeySpec(keyData, "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(ivData));

			byte[] encrypted = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));
			return new String(Base64.getEncoder().encode(encrypted));
		}catch(NoSuchAlgorithmException nsae) {
			throw new ExtensionException("AES256Util encrypt NoSuchAlgorithmException");
		}catch(NoSuchPaddingException nspe) {
			throw new ExtensionException("AES256Util encrypt NoSuchPaddingException");
		}catch(InvalidAlgorithmParameterException iape) {
			throw new ExtensionException("AES256Util encrypt InvalidAlgorithmParameterException");
		}catch(InvalidKeyException ike){
			throw new ExtensionException("AES256Util encrypt InvalidKeyException");
		}catch(BadPaddingException bpe) {
			throw new ExtensionException("AES256Util encrypt BadPaddingException");
		}catch(IllegalBlockSizeException ibse) {
			throw new ExtensionException("AES256Util encrypt IllegalBlockSizeException");
		}
	}

	public static String decrypt(final String key, final String encryptedData) {
		byte[] keyData;
		try {
			keyData = key.getBytes(StandardCharsets.UTF_8);
			byte[] ivData = key.substring(0, 16).getBytes(StandardCharsets.UTF_8);
			SecretKey secretKey = new SecretKeySpec(keyData, "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, secretKey, new IvParameterSpec(ivData));

			byte[] decrypted = Base64.getDecoder().decode(encryptedData.getBytes(StandardCharsets.UTF_8));
			return new String(cipher.doFinal(decrypted), StandardCharsets.UTF_8);
		}catch(NoSuchAlgorithmException nsae) {
			throw new ExtensionException("AES256Util decrypt NoSuchAlgorithmException");
		}catch(NoSuchPaddingException nspe) {
			throw new ExtensionException("AES256Util decrypt NoSuchPaddingException");
		}catch(InvalidAlgorithmParameterException iape) {
			throw new ExtensionException("AES256Util decrypt InvalidAlgorithmParameterException");
		}catch(InvalidKeyException ike){
			throw new ExtensionException("AES256Util decrypt InvalidKeyException");
		}catch(BadPaddingException bpe) {
			throw new ExtensionException("AES256Util decrypt BadPaddingException");
		}catch(IllegalBlockSizeException ibse) {
			throw new ExtensionException("AES256Util decrypt IllegalBlockSizeException");
		}
	}

    /**
     * AES 256 복호화(URLDecode 포함)
	 * @param param: String pw
     * @return String pwEncrypt 암호화된 비밀번호
     */
	public static String urlDecrypt(final String key, final String encryptedData) {
		byte[] keyData;
		if(!StringUtil.isNullOrBlank(key) && !StringUtil.isNullOrBlank(encryptedData)) {
			String decodeKey;
			String decodePw;
			try {
				decodeKey = URLDecoder.decode(key, "UTF-8");
				decodePw = URLDecoder.decode(encryptedData, "UTF-8");

				keyData = decodeKey.getBytes(StandardCharsets.UTF_8);
				byte[] ivData = decodeKey.substring(0, 16).getBytes(StandardCharsets.UTF_8);
				SecretKey secretKey = new SecretKeySpec(keyData, "AES");
				Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
				cipher.init(Cipher.DECRYPT_MODE, secretKey, new IvParameterSpec(ivData));

				byte[] decrypted = Base64.getDecoder().decode(decodePw.getBytes(StandardCharsets.UTF_8));
				return new String(cipher.doFinal(decrypted), StandardCharsets.UTF_8);
			}catch(UnsupportedEncodingException uee) {
				throw new ExtensionException("AES256Util decrypt UnsupportedEncodingException");
			}catch(NoSuchAlgorithmException nsae) {
				throw new ExtensionException("AES256Util decrypt NoSuchAlgorithmException");
			}catch(NoSuchPaddingException nspe) {
				throw new ExtensionException("AES256Util decrypt NoSuchPaddingException");
			}catch(InvalidAlgorithmParameterException iape) {
				throw new ExtensionException("AES256Util decrypt InvalidAlgorithmParameterException");
			}catch(InvalidKeyException ike){
				throw new ExtensionException("AES256Util decrypt InvalidKeyException");
			}catch(BadPaddingException bpe) {
				throw new ExtensionException("AES256Util decrypt BadPaddingException");
			}catch(IllegalBlockSizeException ibse) {
				throw new ExtensionException("AES256Util decrypt IllegalBlockSizeException");
			}
		} else {
			return null;
		}
	}
}
```

1. **`encrypt`** 메서드
    - 이 메서드는 주어진 **`key`**와 **`data`**를 사용하여 AES256 암호화를 수행합니다.
    - 입력된 **`key`**를 바탕으로 **`SecretKey`** 객체를 생성하고, **`Cipher`** 객체를 사용하여 AES/CBC/PKCS5Padding 방식으로 초기화합니다.
    - 그 후, 주어진 **`data`**를 바이트로 변환하여 암호화한 뒤, Base64 인코딩하여 암호화된 결과를 문자열로 반환합니다.
2. **`decrypt`** 메서드
    - 이 메서드는 주어진 **`key`**와 암호화된 데이터인 **`encryptedData`**를 사용하여 AES256 복호화를 수행합니다.
    - 입력된 **`key`**를 바탕으로 **`SecretKey`** 객체를 생성하고, **`Cipher`** 객체를 사용하여 AES/CBC/PKCS5Padding 방식으로 초기화합니다.
    - 그 후, Base64 디코딩하여 얻은 바이트 배열을 복호화한 뒤, 원본 데이터로 복원하여 문자열로 반환합니다.
3. **`urlDecrypt`** 메서드
    - 이 메서드는 **`decrypt`** 메서드를 확장하여 URL 디코딩을 수행합니다.
    - 주어진 **`key`**와 암호화된 데이터인 **`encryptedData`**를 URL 디코딩한 뒤, AES256 복호화를 수행하여 원본 데이터를 반환합니다.

이 클래스는 **`Cipher`** 클래스를 사용하여 AES 알고리즘으로 데이터를 암호화하고 복호화하는 기능을 제공합니다. 또한, 각각의 암호화/복호화 메서드에서 발생할 수 있는 예외들을 **`ExtensionException`**으로 래핑하여 처리하고 있습니다.

AES256은 현대적인 암호화 알고리즘으로, 안전한 데이터 보호를 위해 널리 사용되는 암호화 방식 중 하나입니다. 이 클래스를 사용하면 Java 애플리케이션에서 간단하게 AES256 암호화와 복호화를 수행할 수 있습니다.

[[Java] Cipher, 자바의 암호화&복호화를 담당하는 클래스](https://scshim.tistory.com/305)

## 관련 노트

- 상위: [[02 - 학습/IT/업무 공통 기술 메모/공통 기술 메모 (Spring·타임리프·DB·SSL 등)|공통 기술 메모 (Spring·타임리프·DB·SSL 등)]]
