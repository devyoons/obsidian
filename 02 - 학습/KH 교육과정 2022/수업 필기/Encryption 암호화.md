---
별칭:
  - "강의 - Encryption 암호화"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/764a5a7c84e1426ba38d83981f22a71f
주제:
  - "[[00 - 대시보드/주제/보안|보안]]"
---

# 강의: Encryption 암호화

## 강의 내용

---

---

### 1. 단방향

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d70de65d_Untitled.png]]

> 단방향 암호화는 평문을 암호화하는 것은 가능하지만 암호화된 비밀번호를 다시 평문으로 복호화하는 것이 어렵습니다. 그렇기 때문에 비밀번호를 관리할 때 유용하게 사용됩니다.
> 
> 
> 비밀번호가 한 번 암호화되면 복호화가 되지 않기 때문에 해당 개발자라 할지라도 다시 비밀번호를 알아내기가 힘듭니다. 유저가 입력한 비밀번호와 일치하는지만 확인이 가능합니다.
> 

그래서 특정 사이트에서 비밀번호를 분실했을 때 비밀번호 찾기를 하면 기존 비밀번호를 알려주지 않고 새로운 비밀번호를 설정하라는 것이 단방향 암호화를 사용했기 때문입니다.

해시 함수를 이용한 단방향 암호화도 해킹이 절대 불가능하지는 않습니다.그래서 좀 더 보완을 강력하게 하기 위해 salting , key stretching을 이용합니다.

#### salting

- 임의의 문자열을 추가해서 암호화
- 실제 비밀번호에 랜덤 값을 더해서 해시 값을 계산합니다.

#### key stretching

- 해쉬 값을 여러번 반복해서 해시 하는 행위입니다.
- 여러 번 반복하면 그만큼 해킹하는데 걸리는 시간이 길어집니다.

이러한 단방향 암호화를 사용하게 해주는 파이썬 라이브러리가 바로 `bcrypt`입니다.

```java
/**
	 * SHA256 | SHA512 (SHA1 또는 MD5는 사용하지 말 것)
	 * @param salt 
	 * 
	 */
	public static String encrypt(String password, String salt) {
		// 1. 암호화 Hashing
		MessageDigest md = null;
		byte[] encrypted = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
			byte[] input = password.getBytes("utf-8");
			byte[] saltBytes = salt.getBytes("utf-8");
			md.update(saltBytes); // salt값으로 MessageDigest 객체 갱신 
			encrypted = md.digest(input); // MessageDigest 객체에 raw password 전달
		} catch(NoSuchAlgorithmException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		// 2. 인코딩 (단순문자변환)
		Encoder encoder = Base64.getEncoder();
		return encoder.encodeToString(encrypted);
	}

}

로그인 클래스
id = salt
String password = HelloMvcUtils.encrypt(request.getParameter("password"), memberId);
```

### 2. 양방향

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/4e13d201_Untitled.png]]

대칭키(비공개키)와 비대칭키(공개키) 방식이 존재 하지만 각각 장단점이 존재합니다.

- 대칭키 (비공개키)
    - 장점 : 속도가 빠르다.
    - 단점 : 키 배송 위험성이 존재하여 송신 측에서 수신 측에 암호 키를 전달하는 과정에서 노출우려 존재
- 비대칭키 (공개키)
    - 장점 : 키 배송의 문제를 근본적으로 차단하여 안전성이 높다.
    - 단점 : 대칭키 방식에 비해서 느리다.
    

#### **양방향 암호화(RSA) 단방향 암호화(SHA 256) 차이**

MD5 : 사용 X

SHA1 : 사용 X

MD5 : 사용X

SHA256 : 안전

SHA512 : 안전

| RSA | SHA256 |
| --- | --- |
| 양방향 암호화 = 복호화가 가능하다. | 단방향 암호화 = 복호화가 불가능하다. |
| 사용자는 공개된 키와 자신만 아는 개인키를 가진다. | hash 함수의 일종 |
| 공개키, 개인키로 암호화/복호화를 하는 시스템 | SHA 알고리즘의 한 종류로 256비트로 구성64자리 문자열을 반환 |
| 키생성 - 키분배 - 암호화 - 복호화 순으로 이루어짐. | 복호화를 하지 않아도 되 속도가 빠르다. |

web(JSP) -> server(controller)로 파라미터를 보낼 때 중간에서 정보를 가로챌 수 있다.

이러한 보안 문제를 막기 위해 JSP에서 RSA를 사용하여 비밀번호를 암호화해준다..

RSA로 암호화된 파라미터를 controller에서 복호화시키고,

복호화시킨 파라미터 값을 단방향 암호화인 SHA256으로 암호화시킨다.

#### hashing

1. digest : byte []
2. encoding : String
    1. base64 (52 + 10 + +/ =(채우기문자로 채워짐))
    

MessageDigest 객체

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
