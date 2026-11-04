---
별칭:
  - "강의 - java.io 입출력"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/b6b8106a9ecd42f397da103343b297ca
---

# 강의: java.io 입출력

## 강의 내용

#### 입출력이란?

- Input과 Output의 약자로 입력과 출력

<aside>
<img src="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" alt="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" width="40px" /> 입출력은 컴퓨터 내부 또는 외부 장치와 `프로그램간의 데이터를 주고 받는 것`을 말한다.

</aside>

![**OS**를 통해서 **하드웨어 장치**에 **직접 접근이 필요**하다. 
→접근하기 위해서는 **OS**에 **허가를 받고 접근**해야하는데 **그때 사용하는 것**이 바로 `스트림`이다.](../../../../attachments/f2d907f6-73ec-499d-b25a-5af546705d7e/Untitled.png)

**OS**를 통해서 **하드웨어 장치**에 **직접 접근이 필요**하다. 
→접근하기 위해서는 **OS**에 **허가를 받고 접근**해야하는데 **그때 사용하는 것**이 바로 `스트림`이다.

- 키보드로부터 데이터를 입력
- System.out.println()을 이용해 화면에 출력

---

#### 스트림 (Stream) : 연결통로 (단방향 통신)

- 입출력 장치에서 데이터를 읽고 쓰기 위해 자바에서 제공하는 class
- 스트림은 연속적인 데이터의 흐름을 물에 비유해서 붙여진 이름
- 하나의 스트림으로 입력과 출력을 동시에 처리할 수 없다.
- 동시에 처리하기 위해서는 입력을 위한 입력 스트림(InputStream)과 출력을 위한 출력 스트림(OutputStream) 모두 2개의 스트림 필요

<aside>
<img src="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" alt="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" width="40px" /> 자바에서 **어느 한 쪽에서 다른 쪽으로 데이터를 전달**하려면, 두 대상을 **연결하고 데이터를 전송할 수 있는 무언가**가 필요한데, 이것을 `스트림(Stream)`이라 정의한다.

</aside>

- 스트림은 TV와 DVD를 연결하는 입력선, 출력선과 같은 역할을 한다.
- 람다와 스트림에서 얘기하는 스트림과 같은 용어를 사용하지만, 다른 개념이다.

#### 스트림의 분류

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/9cb2b1a6_Untitled.png]]

**방향에 따른 분류** 

1. 데이터가 들어옴 → InputStream , Reader
2. 데이터가 나감 → OutputStream

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/ea186cfc_Untitled.png]]

- **abstract class 추상클래스**라서 객체로 만들어쓰지 않고, 기본 메소드들을 **자식클래스에 물려줘서 구현**해서 쓰도록한다.
- 문자기반 스트림은 text 파일 위주로 사용한다.
- 기반스트림은 text, image, video.... 등등 사용한다.
- 스트림객체는 자원을 사용 후에 반드시 반납해야 한다.
- 다만, 표준입출력은 반납하지 안된다. 
→ 표준입출력은 한번 반납하면 재사용 불가

---

#### 바이트 기반 스트림(1byte) - InputStream, OutputStream

**Node Stream (주스트림,기본스트림) 필수 : Node - 접속점,교점**

- FileInputStream : 파일 입력 스트림
    - System.in : 키보드를 대상으로 함 ( 접속점이 키보드)
- FileOutputStream : 파일 출력 스트림
    - System.out : 콘솔을 대상으로함 (접속점이 콘솔)

**Filter Stream : 보조스트림 : 성능향상 ↑, 특수목적**

- FileInputStream
    - DataInputstream
    - BufferedInputStream
    - ObjectInputStream
- FileInputStream
    - DataOutputStream
    - BufferedOutputStream
    - ObjectOutputStream

---

#### 문자기반 스트림(2byte) - Reader, Writer

**Node Stream (주스트림,기본스트림) 필수 : Node - 접속점,교점**

- FileReader
- FileWriter

**Filter Stream : 보조스트림 : 성능향상 ↑, 특수목적**

- FileReader
    - InputStreamReader : 다리 (Bridge)역할을 수행하는 스트림
        - BufferedReader
- FileWriter
    - OutputStreamWriter : 다리 (Bridge)역할을 수행하는 스트림
        - BufferedWriter
        - PrintWriter

#### Buffer 성능향상, 특수목적

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/be8b2319_Untitled.png]]

<aside>
<img src="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/mt-check.svg" alt="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/mt-check.svg" width="40px" /> `Buffer`를 사용하면 좋은 이유
차이점과 성능상의 장점이 있는지에 대한 이유가 중요

</aside>

`속도가 왜 빨라질까?`

- 모아서 보내면 왜 빨라질까?
- 한 바이트씩 바로바로 보내는 것이 아니라 버퍼에 담았다가 한번에 모아서 보내는 방법인데 왜 이렇게 하는 것이 좋은가?
- 단순히 모아서 보낸다고 이점이 있는것이 아니다 
→ 시스템 콜의 횟수가 줄어들었기 때문에 성능상 이점이 생기는 것
- `os 레벨에 있는 시스템 콜의 횟수 자체를 줄이기 때문에 성능이 빨라지는 것`

**물을 떠와라 → 물을 한 모금 씩 떠와라**

- 매번 한모금 먹고 주방 갔다오고 또 먹고 갔다오고 반복..

**물을 떠와라 → 물을 한 컵씩 떠와라**

- 한 컵이 다 마실 때 까지 물을 마실 수 있지,

*동일한 양의 물을 마신다고 했을 때 한모금 씩 떠와서 마시는 것과 한 컵씩 떠와서 마시는 것의 차이는??? 시간이 줄어들 것이다.*

#### 스트림의 종류

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/4c17ee40_Untitled.png]]

### InputStream, OutputStream 최상위 클래스로 추상클래스이다.

#### InputStream : 입력

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/21684000_Untitled.png]]

[https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=javainer&logNo=221479451489](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=javainer&logNo=221479451489)

#### read()

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/9805d749_Untitled.png]]

[https://scshim.tistory.com/283](https://scshim.tistory.com/283)

- 입력 스트림으로부터 1바이트를 읽고 4바이트 int 타입으로 리턴
- 리턴된 4바이트 중 끝의 1바이트에만 데이터가 들어 있음 ex) 스트림에서 5개의 바이트가 들어오면 read() 메소드로 1바이트씩 5번 읽을 수 있다.
- 더 이상 입력 스트림으로부터 바이트를 읽을 수 없다면 -1을 리턴
- 이것을 이용해서 읽을 수 있는 마지막 바이트까지 루프를 돌며 한 바이트씩 읽을 수 있음

#### read(byte[] b)

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/c51dad2e_Untitled.png]]

[https://blog.naver.com/plateauh/222085091595](https://blog.naver.com/plateauh/222085091595)

- 입력 스트림으로부터 매개값으로 주어진 바이트 배열의 길이만큼 바이트를 읽고 배열에 저장
- 실제로 읽은 바이트 수가 배열의 길이보다 작을 경우 읽은 수만큼 리턴

ex) 스트림에서 5개의 바이트가 들어오면, 크기가 3인 바이트 배열(byte[3])로 두 번 만에 읽을 수 있음

#### **read(byte[] b, int off, int len)**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/8f12ed03_Untitled.png]]

[https://blog.naver.com/plateauh/222085091595](https://blog.naver.com/plateauh/222085091595)

- 입력 스트림으로부터 len개의 바이트를 읽고, 매개값으로 주어진 바이트 배열 b[off]부터 len개까지 저장
- 메소드 종료 시에 읽은 바이트 수인 len 개를 리턴하고, 실제로 읽은 바이트 수가 len개보다 작을 경우 읽은 수 만큼 리턴
- ex) 입력 스트림에서 전체 5개의 바이트가 들어오고, byte[] b의 크기가 10, off의 값이 2, len의 값이 3이라고 가정하자. 입력 스트림에서 들어오는 5개의 바이트 중 3개만 읽어 b[2], b[3], b[4]에 각각 저장된다.

#### OutputStream : 출력

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/1f29ac60_Untitled.png]]

[https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=javainer&logNo=221479451489](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=javainer&logNo=221479451489)

#### write(int b)메소드

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/7435f264_Untitled.png]]

- 매개 변수로 주어진 int 값에서 끝에 있는 1바이트만 출력 스트림으로 보내는 메소드
- **주의!** int 타입이지만, 4바이트 모두를 보내는 것으로 오해하지 말자

#### write(byte[] b)메소드

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/b1692b4a_Untitled.png]]

[https://blog.naver.com/plateauh/222085091595](https://blog.naver.com/plateauh/222085091595)

- 매개값으로 주어진 바이트 배열의 모든 바이트를 출력 스트림으로 보내는 메소드

**write(byte[] b, int off, int len)메소드**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/40ae80a6_Untitled.png]]

[https://blog.naver.com/plateauh/222085091595](https://blog.naver.com/plateauh/222085091595)

- b[off]부터 len개의 바이트를 출력 스트림으로 보내는 메소드

#### flush()와 close() 메소드

· 출력 스트림은 내부에 작은 버퍼(buffer)가 있어서 데이터가 출력되기 전에 버퍼에 쌓여있다가 순서대로 출력

·  flush() 메소드는 버퍼에 잔류하고 있는 데이터를 모두 출력시키고 버퍼를 비우는 역할

- 프로그램에서 더 이상 출력할 데이터가 없다면 호출하여 버퍼에 잔류하는 모든 데이터가 출력되도록 해야 함

· OutputStream을 더 이상 사용하지 않을 경우 close() 메소드를 호출해서 OutputStream에서 사용했던 시스템 자원을 풀어줌

---

## File 클래스

- 파일 크기, 파일 속성, 파일 이름 등의 정보를 얻어내는 기능과 파일 생성 및 삭제 기능을 제공
- 디렉토리 생성 및 디렉토리에 존재하는 파일 리스트를 얻는 것도 가능
- java.io에서 제공

```java
<File 객체 생성>
File file = new File("c:/temp/file.txt”);
File file = new File("c:\\temp\\file.txt”);
```

- **File.separator 상수**를 출력하면 해당 운영체제에서 사용하는 디렉토리 구분자 확인 가능
- 디렉토리 구분자는 운영체제 마다 다르며 윈도우는 \ 또는 /, 리눅스는 /를 사용
- exists() 메서드: 경로에 실제로 파일이나 디렉토리가 있는지 확인

**파일 또는 디렉토리를 생성, 삭제하는 메소드**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/ca1c187f_Untitled.png]]

**존재하는 파일, 디렉토리의 정보를 얻는 메소드**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/089314a8_Untitled.png]]

- 파일의 데이터를 읽고 쓰는 기능은 제공하지 않아, 이를 위해 스트림을 사용

---

#### FileInputStream 과 FileOutputStream : 파일에 입출력을 하기 위한 스트림

#### FileInputStream

- 파일을 바이트 단위로 읽어들일 때 사용하는 바이트 기반 입력 스트림
- 바이트 단위로 읽기 때문에 그림, 오디오, 비디오, 텍스트 파일 등 모든 종류의 파일을 읽을 수 있음

```java
//첫번째 방법
FileInputStream fis = new FileInputStream("C:/Temp/image.gif");

//두번째 방법
File file = new File("C:/Temp/image.gif");
FileInputStream fis = new FileInputStream(file);
```

- 위 방법은 파일이 존재하지 않으면 FileNotFoundException을 발생시키므로 try - catch문으로 예외처리 필수
- `FileInputStream`은 `InputStream`의 하위 클래스 이기 때문에 `InputStream`과 사용 방법이 동일하므로 **read() 등의 메소드를 사용**할 수 있다.

#### FileOutputStream

- 바이트 단위로 데이터를 파일에 저장할 때 사용하는 바이트 기반 출력 스트림
- 바이트 단위로 저장하기 때문에 그림, 오디오, 비디오, 텍스트 등 모든 종류의 데이터를 파일로 저장 가능

```java
//첫번째 방법
FileOutputStream fis = new FileOutputStream("C:/Temp/image.gif");

//두번째 방법
File file = new File("C:/Temp/image.gif");
FileOutputStream fis = new FileOutputStream(file);
```

- **파일이 이미 존재할 경우**, 데이터를 출력하면 파일을 덮어쓰게 되므로, 기존의 파일 내용은 사라짐
- **기존의 파일** 내용 끝에 **데이터를 추가할 경우** `FileOutputStream`생성자의 두 번째 매개값을 true로 설정

---

### 직렬화란?

**`직렬화(serialization)`**란 객체를 데이터 스트림으로 만드는 것을 뜻한다.

객체에 저장된 데이터를 스트림에 **쓰기(write)**위해 **`연속적인(serial)`** 데이터로 변환하는 것을 의미한다.

반대로 스트림으로부터 데이터를 **`읽어서 객체를 만드는 것을 역직렬화(deserialization)`**이라 한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/dca0d3b7_Untitled.png]]

***객체에 대해 다시 짚고 넘어가보자.***

객체는 클래스에 정의된 인스턴스변수의 집합이다.

객체에는 클래스변수나 메서드가 포함되지 않는다. 객체는 오직 인스턴스 변수들로만 구성되어 있다.

표현시에 인스턴스변수와 메서드를 함께 그리곤 했지만, 사실 객체에는 메서드가 포함되지 않는다.

인스턴스변수는 인스턴스마다 다른 값을 가질 수 있어야 하기 때문에 별도의 메모리 공간이 필요하지만

메서드는 변하는 것이 아니라서 메모리를 낭비해 가면서 인스턴스마다 같은 내용의 코드(메서드)를 포함시킬 이유가 없다.

***객체를 저장한다는 것은 바로 객체의 모든 인스턴스변수의 값을 저장한다는 것과 같은 의미이다.***

어떤 객체를 저장하고자 한다면, 현재 객체의 모든 인스턴스변수의 값을 저장하기만 하면된다. 그리고 저장했던 객체를 다시 생성하려면, 객체를 생성한 후에 저장했던 값을 읽어서 생성한 객체의 인스턴스변수에 저장하면 되는 것이다.

### ObjectInputStream, ObjectOutputStream

직렬화(스트림에 객체를 출력)에는 `ObjectOutputStream`을 사용

역직렬화(스트림으로부터 객체를 입력)에는 `ObjectInputStream`을 사용 

- 객체단위로 읽고 쓰기 가능한 보조스트림
- FileInputStream | FileOutputStream 주스트림과 함께 사용해야 한다.
- 읽고 쓰기할 객체의 클래스는 Serializable 인터페이스를 반드시 구현해야한다.
- 직렬화 기능이 반드시 필요하다.

ObjectInputStream, ObjectOutputStream 은 각각 InputStream과 OutputStream을 직접 상속받지만 기반스트림을 필요로 하는 보조스트림이다.

→ 객체를 생성할 때 입출력(직렬화/역직렬화) 할 스트림을 지정해주어야 한다.

```java
ObjectInputStream(InputStream in)
ObjectOutputStream(OutputStream out)
```

파일에 객체를 저장(직렬화)하고 싶다면?

```java
ObjectInputStream(InputStream in)
ObjectOutputStream(OutputStream out)
```

반대로 파일에 있는 객체를 역직렬화하고 싶다면?

```java
FileInputStream fis = new FileInputStream("objectfile.ser");
ObjectInputStream in = new ObjectInputStream(fis);

UserInfo userInfo = (UserInfo)in.readObject();
```

- *ObjectInputStream, ObjectOutputStream의 각 메서드와 의미는 별도 정리하지 않는다*

#### 직렬화가 가능한 클래스 만들기 - `Serializable`, `transient`

모든 객체가 직렬화/역직렬화가 가능한가?

그렇지 않다, 직렬화/역직렬화가 가능한 클래스를 만들어줘야 한다.

직렬화가 가능한 클래스를 만드는 방법은 직렬화하고자 하는 클래스가 

"java.io.Serializable" 인터페이스를 구현하도록 하면 된다.

일반적인 클래스

```java
public class UserInfo{
	String name;
	String password;
	int age;
}
```

직렬화가 가능한 클래스로 구현

```java
public class UserInfo **implements java.io.Serializable**{
	String name;
	String password;
	int age;
}
```

- Serializable 인터페이스를 아무런 내용이 없는 빈 인터페이스지만, 직렬화를 고려하여 작성한 클래스인지를 판단하는 기준이 된다.

**v. 상속구조 - 1**

만약 구현하고 있는 클래스가 특정 클래스를 상속받는데,

*그 상속받고 있는 특정 클래스가 직렬화를 구현하였다면?* 현재 내가 구현하고 있는 자식 클래스는 별도로 직렬화를 구현하지 않아도 자연스럽게 직렬화가 가능하다.

```java
public class SuperUserInfo implements java.io.Serializable{
	String name;
	String password;
}

public class UserInfo extends SuperUserInfo{
	Integer age;
}
```

- UserInfo 의 부모 SuperUserInfo가 직렬화를 구현하였음으로, UserInfo 또한 직렬화 가능하다.

**v. 상속구조 - 2**

위 상속구조 - 1 과는 반대로

조상클래스가 Serializable을 구현하지 않고 자식 클래스에서 구현했다면?

- ***조상클래스에 정의된 인스턴스 변수는 직렬화 대상에서 제외된다.***

```java
public class SuperUserInfo{
	String name;
	String password;
}

public class UserInfo extends SuperUserInfo implements java.io.Serializable{
	Integer age;
}
```

- UserInfo 클래스가 직렬화되며 인스턴스 변수 age 만 직렬화된다.
- 부모클래스 SuperUserInfo의 name, password 인스턴스 변수는 직렬화에서 제외된다.

**v. 타 객체가 포함된 경우**

Serializable을 구현하고 있지만, 이 클래스 내부 인스턴스 변수가 Serializable 할 수 없는 객체를 참조하고 있는 경우 **NotSerializableException**이 발생한다.

```java
public class UserInfo **implements java.io.Serializable**{
	String name;
	String password;
	int age;

	Object obj = new Object();
}
```

- Object obj 는 직렬화 할 수 없는 객체임으로, UserInfo 클래스를 직렬화 하게 되면 NotSerializableException이 발생한다.
- Object는 모든 객체의 최고 조상이며, 이 Object는 Serializable을 구현하지 않았다.

#### **직렬화를 제외할 수 있다.**

transient 제어자를 붙여서 직렬화 대상에서 제외할 수 있다.

- 제외시킨 후 역직렬화하면 값은 null이 된다.

```java
public class UserInfo **implements java.io.Serializable**{
	String name;
	transient	String password;
	int age;

	transient	Object obj = new Object();
}
```

<aside>
💡 짐을 차곡차곡 쌓는 것을 직렬화

→ 이사해서 짐을 하나하나 푸는 것을 역직렬화

</aside>

#### 직렬화 가능한 클래스의 버전관리

- 직렬화된 객체를 역직렬화할 때는 **직렬화 했을 때와 같은 클래스를 사용해야한다.**
- 클래스 이름이 같아도 **클래스의 내용이 변경됐다면 역직렬화는 실패**하고 에러가 발생한다.

위에서 만든 UserInfo 클래스에 인스턴스 변수를 하나 추가해보자.

```
public class UserInfo implements Serializable {
    double weight;
    ...
}

```

몸무게 weight 변수를 추가하였다.

위의 SerialEx2 예제인 역직렬화를 다시 실행시켜보자.

```
java.io.InvalidClassException: com.jihan.javastudycode.week13.UserInfo; 
local class incompatible: stream classdesc serialVersionUID = 6546280052364076434, local class serialVersionUID = -3670788073303903862
...

```

직렬화 할 때와 역직렬화 할 때의 클래스의 버전이 다르다는 에러가 발생한다!

객체가 직렬화될 때 클래스에 정의된 멤버들의 정보를 이용해서 `serialVersionUID`라는 클래스의 버전을
자동생성해서 직렬화 내용에 포함된다.

***그래서 역직렬화 할 때 클래스의 버전을 비교하고 직렬화할 때의 클래스의 버전과 일치하는지 비교할 수 있었고 에러가 발생한 것이다.*** 

```
public UserInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    ...
}

```

***이렇게 클래스 내에 serialVersionUID를 정의해주면, 클래스의 내용이 바뀌어도 클래스의 버전이 자동생성된 값으로 변경되지 않는다.***

컴파일 후 다시 직렬화 -> 인스턴스변수 추가 -> 역직렬화를 진행하여도 에러없이 정상적으로 동작한다.

---

### 코드예습

- 표준입력 - 키보드입력 System.in
    - `Scanner`(jdk1.5)를 사용해 예외처리 없이 사용가능
    - 그 이전에는 `BufferedReader`를 이용해 처리함
- 표준출력 - 콘솔출력 `System.out`
- `InputStream` 추상클래스에 상수인 `System.in`
- public static final InputStream in = null(InputStream의 자식객체가 대입됨);
- `read()` 리턴타입이 int이다 그래서 int타입 변수에 대입함
- `read()`의 반환값의 범위가 0 ~255와 -1이기 때문이다.
- `read()`가 IOExcetion을 던진다. → 강제화예외 : checked

```java
public void test1(){
	int input = 0; //
	try{
		System.out.println(:"키보드로 값을 입력하세요 : ");
		while((input = System.in.read()) != -1); //이때 read가 IOExcetion을 던진다.
			System.out.println(input);
		} catch(IOException e ){
				e.printStackTrace(); //예외기록(로그)-예의를 기록을 하는것
			}
	}
//결과
키보드로 값을 입력하세요 :
abc
97 
98 
99 
13 // \r -> carrige return (타자기방식 : window에서만그럼)
10 // \n -> line feed : os별로 해당되는 아스키코드
-> 1byte씩 돌아서 while문이 3번 돌았다.
한
237 // UTF-8 방식이 한글은 3byte로 처리하기때문
149 // java에서 char는 무조건 2byte로 처리된다는 사실 헷갈리지말것
156 // 만약 인코딩하는 방식이 ms949라면 2byte로 처리
13
10
```

---

#### InputStream, InputStreamReader, BufferedReader

- `System.in` 주스트림(표준입력)
- `BufferedReader` 보조스트림(줄단위를 읽어오는 `readLin()`메소드)
- `BufferedReader`를 쓰기 위해서는 Bridge스트림을 사용해야한다.
→ `InputStreamReader`
- 대상과 연결된 주스트림객체를 보조스트림객체에 전달하고,
- 보조스트림을 통해 제어한다.
- 사용자 입력값을 개행문자 단위로 읽어온다. 
→읽어온 개행문자를 버리고 리턴

```java
public void test2(){
	InputStream systemIn = **System.in**;
	InputStreamReader **isr** = new InputStreamReader(**system.in**);
	BufferedReader br = new BufferedReader(**isr**);

	String input = null; // 실제 읽어오는 값이 String이다.

	try{
		System.out.println("아무말 입력 : ");
		while((input = br.readLine()) != null){ //IOException예외던짐
			if("exit".equals(input))
				break;
			System.out.println(input);
		}
	}catch(IOException e){
		e.printStackTrace();
	}
}
//결과
아무말 입력 :
키보드입력 : 안녕
콘솔 출력 : 안녕
키보드입력 : abcde
콘솔 출력 : abcde
키보드입력 : exit
프로그램종료

```

<aside>
<img src="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-question.svg" alt="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-question.svg" width="40px" /> `Scanner` 는 예외처리 (try ~ catch) ,형변환(casting)을 미리 해줬기 때문에 편리하게 사용할 수 있었다

</aside>

---

#### InputStreamReader, BufferedReader

- 사용자로 부터 정수를 여러개 입력 받고, 입력받은 정수의 합을 출력하세요
- `System.in`과 `BufferedReader`사용

```java
public void test3(){
	System.out.prinln("정수를 입력하세요...");
	String input = null;
	
	BufferedReader br = new BufferdReader(new InputStreamReader(System.in));
	// 보조스트림만 가지고 메소드 호출, 반납하면 주스트림도 반납됨
	// 주스트림은 직접접근할 일이 없다.
	try{
		int sum = 0;
		while((input = br.readLine()) != null){ //IOExption던짐
			if("exit".equals(input)) break;
			tru{
				sum += Integer.parseInt(input); // 받는 값이 String이기 때문에 형변환
			} catch(NumberFormatException e){
					System.out.println("정수만 입력할 수 있습니다.");
				}
		}
		System.out.println("총합은 " + sum + "입니다");
	} catch(IOException e){
			e.prinStackTrace(); //다른 예외는 
	} 
}

//출력
정수를 입력하세요...
1
2
3
4
5
exit
총합은 15입니다.
ㅇㅇㅇ
정수만 입력할 수 있습니다.

```

---

#### FileInputStream,FileOutputStream

- 대상이 file인 입출력스트림
- 기본스트림 `FileInputStream` | `FileOutputStream`
- 보조스트림 `BufferedInputStream` | `BufferedOutputStream`

```java
private void test1() {
		// 파일경로는 프로젝트 루트기준으로 조회한다.
		FileInputStream fis = null;
		FileOutputStream fos = null;
		
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		
		try {
			// 절대주소 : 파일시스템 디렉토리의 최상위구조 window(C:/~), mac,리눅스 (/) 
			// 상대주소 : 프로젝트디렉토리기준 시작하는 C:/, /로 시작하지 않는 경우
			bis = new BufferedInputStream(new FileInputStream("C:/Users/user1/Desktop/qrcode.pdf"));
			bos = new BufferedOutputStream(new FileOutputStream("qrcode.pdf"));
			
			// 이 파일이 존재하지 않으면 새로 생성
			// 해당경로가 디렉토리 또는 권한 부족시 FileNotFoundException을 던진다.
					
			int len = 0; // 읽어온 byte수
			byte[] bytes = new byte[8192]; // buffered reader 내부적으로 사용하는 버퍼크기
			// 파일을 모두 읽었으면 값없음(-1)을 리턴
			while((len = bis.read(bytes)) != -1) {
				System.out.println(len);
				bos.write(bytes, 0, len); // sampleCopy.txt에 출력 
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		} finally {
			// 사용한 자원은 반드시 반납해야 한다.
			// 보조스트림만 반납하면 주스트림도 내부적으로 함께 반납된다.
			try {
				bis.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
			
			try {
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
```

- `FileNotFoundException` 은 `IOException`의 후손클래스예외이기 때문에 상위 클래스인 `IOException`을 사용한다.

---

#### FileReader, FileWriter, BufferedReader, BufferedWriter

- 텍스트파일을 읽는 데 특화된 문자기반스트림
- 주스트림 FileReader | FileWriter
- 보조스트림 BufferedReader | BuffererWriter

```java
private void test1() {
		FileReader fr = null;
		FileWriter fw = null;
		
		try {
			File inFile = new File("sample.txt"); // 존재하는,존재하지 않는 파일의 디렉토리을 가리키는 자바객체
			File outFile = new File("sampleCopyCopy.txt");
			
			fr = new FileReader(inFile);
			fw = new FileWriter(outFile);
			
			int data = 0;
			while((data = fr.read()) != -1) {
				System.out.println((char) data);
				fw.write(data);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
```

- File객체는 존재하지 않으면 파일을 생성시켜준다.

```java
private void test2() {
		BufferedReader br = null;
		BufferedWriter bw = null;
		
		try {
			File inFile = new File("sample.txt");
			File outFile = new File("sampleCopyCopy.txt");
			br = new BufferedReader(new FileReader(inFile)); 
			bw = new BufferedWriter(new FileWriter(outFile));
			
			String data = null;
			while((data = br.readLine()) != null) { //readLine은 한줄씩 실행
				System.out.println(data);
				bw.write(data); // 개행문자가 제거되어 있음.
				bw.write("\n"); // 개행문자를 안넣어주면 실제 파일에가보면 한줄로 적혀있다.
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
//			bw.close(); -> 이런 코드는 위험하다. 위에 br이 실행하다가 오류가나면 bw는 close를 못함.
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			try {
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
```

- 보조스트림 안에 주스트림이 들어간다. 보조스트림이 직접접근을 하기 때문에 주스트림이 밖에 있을 필요가 없다.

<aside>
<img src="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" alt="https://raw.githubusercontent.com/eirikmadland/notion-icons/master/v5/icon3/ul-comment-alt-verify.svg" width="40px" /> `InOutputStream`을 사용하고나서 메모리는 `꼭 자원반납`해줘야한다.

</aside>

#### try 개선 : try with resource절

- try() 안에 선언한 스트림객체는 자동으로 반남
- jdk 1.7부터 지원
- 반납코드`close()`는 작성하지 않아도 된다.

```java
private void test3() {
		File inFile = new File("sample.txt");
		File outFile = new File("sampleCopyCopy.txt");
		
		try (BufferedReader br = new BufferedReader(new FileReader(inFile));
			 BufferedWriter bw = new BufferedWriter(new FileWriter(outFile));) {
			
			String data = null;
			while((data = br.readLine()) != null) {
				System.out.println(data);
				bw.write(data); // 개행문자가 제거되어 있음.
				bw.write("\n");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
```

- 위 코드로 실행하게 된다면 자동으로 알아서 자원반납을 해준다.
- 주스트림을 보조스트림에 끼워서 사용하도록하자

---

#### 객체 입출력하기 : Serializable

- 객체입출력할 클래스는 Serializable인터페이스를 구현해야 한다.
- 참조형 필드인 경우 해당 클래스 또한 Serializable을 구현해야한다.
- 사용자 클래스인 경우 주의할 것.
- long타입의 serializableUID를 선언해줘야한다. (고유번호)
→ 안만들면 랜덤하게 만들어진다. : 직렬화된 정보과 일치하는 클래스인지 비교하는 고유값

```java
package kh.java.io._byte.object;

import java.io.Serializable;

/**
 * 객체입출력할 클래스는 반드시 Serializable인터페이스를 구현해야 한다.
 * 
 * - 참조형 필드인 경우 해당 클래스 또한 Serializable을 구현해야한다.
 * - 사용자 클래스인 경우 주의할 것.
 */
public class User implements Serializable {

	/**
	 * 직렬화된 정보와 일치하는 클래스인지 비교하는 고유값
	 */
	private static final long serialVersionUID = 1L;
	
	private String id;
	private transient String password; //transient jvm이 관리하되 직렬화시에는 제외한다.
	private int point;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String id, String password, int point) {
		super();
		this.id = id;
		this.password = password;
		this.point = point;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", point=" + point + "]";
	}
	
}
```

```java
private void test1() {
		
		User[] users = new User[3]; //user배열만들기
		users[0] = new User("honggd", "1234", 1000);
		users[1] = new User("sinsa", "1234", 2000);
		users[2] = new User("sejong", "1234", 3000);
		
//		FileOutputStream fos = new FileOutputStream("users.ser");
//		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		try(ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("users.ser"));){
			for(int i = 0; i < users.length; i++) {
				System.out.println(i);
				oos.writeObject(users[i]); // User 객체 단위로 출력!
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}

//결과 
텍스트파일로 안읽혀진다 2진데이터이기 때문에 , 객체로 불러오는데는 아무런 지장이 없다.
```

#### 저장된 객체의 수를 모를 때 처리방법 - 모자라지 않을 크기로 선언

```java
public void test3() {
		User[] users = new User[100]; // 모자라지 않을 크기로 선언
		int index = 0; // 인덱스관리 변수, 입력된 객체수
		try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream("users.ser"));){
			while(true) {
				User user = (User) ois.readObject(); // 더이상 읽을 객체가 없을때 EOFException (End Of File) 
				users[index++] = user;
			}
		} catch (EOFException e) {
			// 모든 객체를 다 읽었을때
			for(int i = 0; i < index; i++) {
				System.out.println(users[i]);
			}
			
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
	}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
