---
별칭:
  - "강의 - 네트워크 & URL"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/e40cc303e9754e66afd1d0ee1a5feaa1
---

# 강의: 네트워크 & URL

## 강의 내용

---

- 목차

---

## 🧐`java.net 패키지에 네트워크 관련 클래스가 있다.`

#### InetAddress :IP (Internet Protocol)Address에 관련한 클래스

- 자바에서 인터넷 주소에 관한 정보를 다루는 클래스
- InetAddress 클래스는 IP주소를 표현하고 제어하는 기능을 제공하는 클래스
- 자바에서 모든 IP주소를 InetAddress클래스를 사용하여 표현할 수 있음
- InetAddress클래스는 내부적으로 컴퓨터에 설정된 Host Name서버 자체를 가지고 주소를 표현해 그에 관련된 기능을 제공함

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/27cbdecb_Untitled.png]]

#### InetAddress클래스의 생성자

- InetAddress클래스의 생성자는 하나만 존재하지만, 특이하게 기본 생성자의 **`접근 제한자 default`**이기 때문에 **new 연산자로 객체를 생성할 수 없다.**

```java
InetAddress naver = InetAddress.getByName("naver.com");

- UnknownHostException 도메인이 없을 경우에 대한 예외처리 해줘야함
```

- 도메인이름을 가지고 DNS (Domain Name Server)에 질의해서 ip를 가져옴
→ InetAddress가 해주는 작업
- 포트에서 사용하는 저장공간은 2바이트

#### IP 조회하기

```java
public static void main(String[] args) {
		InetAddressStudy study = new InetAddressStudy();
		study.test1();
	}

	private void test1() {
		try {
			InetAddress naver = InetAddress.getByName("naver.com");
			
			//ip조회
			System.out.println(naver.getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
}
//결과
223.130.200.104
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/53bb4fa1_Untitled.png]]

![1. 클라이언트가 naver.com 찾고 싶다고 요청
2. domain name server에 먼저 질의
3. 해당하는 ip를 돌려줌
4. ip주소로 server에 요청](../../../../attachments/5b955a9e-e5c3-4295-b790-68907f663246/Untitled.png)

1. 클라이언트가 naver.com 찾고 싶다고 요청
2. domain name server에 먼저 질의
3. 해당하는 ip를 돌려줌
4. ip주소로 server에 요청

#### 내 컴퓨터 IP조회하기

```java
public class InetAddressStudy {

	public static void main(String[] args) {
		InetAddressStudy study = new InetAddressStudy();
		study.test1();
	
private void test1() {
		try {
			//내 컴퓨터
			InetAddress localhost = InetAddress.getLocalHost();

			System.out.println(localhost.getHostAddress());

		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
}
//결과
192.168.45.208
```

#### ip가 여러개인 경우 : 다 다른 ip이지만 네이버에 접속하는건 문제없다.

- getAllByName() 호스트명과 IP주소를 알아낼 수 있다.

```java
private void test1() {
		try {
			InetAddress naver = InetAddress.getByName("naver.com");

			//ip가 여러개인 경우
			InetAddress[] navers = InetAddress.getAllByName("naver.com");
			
			for(InetAddress n : navers) {
				System.out.println(n);
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
	}
}
naver.com/223.130.200.107
naver.com/223.130.195.200
naver.com/223.130.200.104
naver.com/223.130.195.95
```

---

## 🧐URL

인터넷에 존재하는 여러 서버들이 제공하는 자원에 접근할 수 있는 주소를 표현하기 위한 것

**`‘프로토콜//호스트명:포트번호/경로명/파일명?쿼리스트링#참조’`**

```java
**https**://<u>docs.oracle.com</u>:**443**/<u>javase</u>/**8/docs/api/java/lang/String.html**?<u>name=abcde&lang=kr</u>#**String--**

**프로토콜**     자원에 접근하기 위해 서버와 통신하느넫 사용되는 통신규약(https)
**호스트명**     <u>자원을 제공하는 서버의 이름(docs.oracle.com)</u>
**포트번호**     통신에 사용되는 서버의 포트번호(443) //생략 하단 설명
**경로명**       <u>접근하려는 자원이 저장된 서버상의 위치(/javase/)</u>
**파일명**       접근하려는 자원의 이름(8/docs/api/java/lang/String.html)
**쿼리(query,사용자입력값)**  <u>URL에서 '?'이후의 부분</u>
**참조(anchor)**              URL에서 '#'이후의 부분
```

<aside>
🔻 HTTP프로토콜에서는 443번 포트를 사용하기 때문에 URL에서 포트번호를 생략하는 경우 443으로 간주한다. 각 **프로토콜에 따라 통신에 사용하는 포트번호가 다르며 생략되면 각 프로토콜의 기본 포트가 사용**된다.

</aside>

- ? 뒤에는 전체를 query String이라고 한다.

#### URL 생성자

| URL(String spec) | 지정된 문자열 정보의 URL객체를 생성한다. |
| --- | --- |
| URL(String protocol, String host, String file) | 지정된 값으로 구성된 URL객체를 생성한다. |
| URL(String protocol, String host, int port, String file) | 지정된 값으로 구성된 URL객체를 생성한다. |

#### URL 연결 메소드

| URLConnection  openConnection | URL과 연결된 URLConnection을 얻는다 |
| --- | --- |

#### URL parsing 메소드

| String getProtocol() | 프로토콜 반환 |
| --- | --- |
| String getHost() | 호스트명 반환 |
| int getPort() | 포트반환 |
| String getPath() | 경로명 반환 |
| String getQuery() | 쿼리 반환 |
| String gerRef | 참조 반환 |
- **URL에 대한 parsing 처리 실습예제**
    
    ```java
    private void test1() {
    		String str = "https://docs.oracle.com:443/javase/8/docs/api/java/lang/String.html#String--";
    		
    		try {
    			URL url = new URL(str);
    		} catch (MalformedURLException e) {
    			e.printStackTrace();
    		}
    	}
    }
    ```
    
    ```java
    private void test1() {
    		String str = "https://docs.oracle.com:443/javase/8/docs/api/java/lang/String.html#String--";
    		
    		try {
    			URL url = new URL(str);
    			
    			System.out.println(url.getProtocol()); //https 프로토콜(통신규약)
    			System.out.println(url.getHost());//docs.oracle.com (host-docs,domain-oracle.com)
    			System.out.println(url.getPort());//443 포트(특정서비스) 80(http), 443(https) 웹서버 기본포트
    			System.out.println(url.getPath());//특정파일경로(실제 디렉토리구조일수도 아닐수도 있다)
    			System.out.println(url.getRef());//String-- bookmark(anchor) 닷
    			System.out.println(url.getQuery());//name=abcde&lang=kr 사용자입력값
    	} catch (MalformedURLException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    //결과
    https
    docs.oracle.com
    443
    /javase/8/docs/api/java/lang/String.html
    String--
    ```
    
    ```java
    ?name=abcde&lang=kr 추가 -> 사용자 입력 값
    
    private void test1() {
    		String str = "https://docs.oracle.com:443/javase/8/docs/api/java/lang/String.html?name=abcde&lang=kr#String--";
    		
    		try {
    			URL url = new URL(str);
    			
    			System.out.println(url.getQuery());
    		} catch (MalformedURLException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    //결과
    name=abcde&lang=kr
    ```
    
- **URLConnection 실습예제**
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/42d92801_Untitled.png]]
    
    ```java
    public class URLStudy {
    	String str = "https://docs.oracle.com:443/javase/8/docs/api/java/lang/String.html?name=abcde&lang=kr#String--";
    
    	public static void main(String[] args) {
    		URLStudy study = new URLStudy();
    		study.test2();
    	}
    
    private void test2() {
    		try {
    			URL url = new URL(str);
    			URLConnection conn = url.openConnection();
    			InputStream is = conn.getInputStream();// 바이트기반 입력스트림
    			
    			try(BufferedReader br = new BufferedReader(new InputStreamReader(is));
    				BufferedWriter bw = new BufferedWriter(new FileWriter("String.html"))){
    				String data = null;
    				while((data = br.readLine()) != null) {
    					System.out.println(data);
    					bw.write(data);
    					bw.write("\n");
    				}
    			}
    			
    			System.out.println("응답완료!");
    		} catch (MalformedURLException e) {
    			e.printStackTrace();
    		} catch (IOException e) {
    			e.printStackTrace();
    		}
    	}
    // 패키지안에 html파일이 생김
    인터넷 검색창에 파일 드래그앤드랍하면 열림
    
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/15c5afc2_Untitled.png]]
    

---

### 소켓 프로그래밍

소켓 프로그래밍은 소켓을 이용한 통신 프로그래밍을 뜻함.

서로 멀리 떨어진 두 사람이 통신하기 위해서 전화기가 필요한 것처럼, 프로세스간의 통신을 위해서는 그 무언가가 필요하고 그것이 바로 소켓이다.

#### TCP/UDP : OSI 7 계층의 전송계층에 해당되는 프로토콜임

컴퓨터가 받은 데이터를 애플리케이션까지 전달하는 것입니다.

또한, 데이터를 전송하기에 적합한 크기로 쪼갠 후, 목적지의 **프로그램을 식별할 수 있는 정보**(포트번호)를 덧붙입니다. 데이터가 제대로 전달되지 않았을 때 재전송하는 것도 이 계층이 합니다.

#### TCP와 UDP의 차이

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/e31d77fd_Untitled.png]]

|  | TCP | UDP |
| --- | --- | --- |
| 연결방식 | 연결기반(connection-oriented)
 - 연결 후 통신(전화기)
 - 1:1 통신방식 | 비연결기반(connectionless - oriented)
 - 연결업싱 통신(소포)
 - 1:1 , 1:n , n:n통신방식 |
| 특징 | 데이터의 경계를 구분안함(바이트기반)
신뢰성 있는 데이터 전송
  - 데이터의 전송순서가 보장됨
  - 데이터의 수신여부를 확인함 
    (데이터가 손실되면 재전송됨)
  - 패킷을 관리할 필요가 없음
UDP보다 전송속도가 느림 | 데이터의 경계를 구분함(datagram)
신회성 없는 데이터 전송
  - 데이터의 전송순서가 바뀔 수 있음
  - 데이터의 수신여부를 확인안함
  (데이터가 손실되어도 알 수 없음)
  - 패킷을 관리해주어야 함
TCP보다 전송속도가 빠름 |
| 관련클래스 | Socket
ServerSocket | DatagramSocket
DatagramPacket
MulticastSocket |

#### TCP소켓 프로그래밍

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/08dc5b64_Untitled.png]]

1. 서버 프로그램에서는 **서버소켓을 사용**해서 서버 컴퓨터의 특정 포트에서 **클라이언트의 연결요청을 처리할 준비**를 한다.
2. 클라이언트 프로그램은 **접속할 서버의 IP주소**와 **포트 정보**를 가지고 **소켓을 생성**해서 서버에 **연결을 요청**한다. 
3. 서버소켓은 클라이언트의 **연결요청을 받으면 서버에 새로운 소켓을 생성**해서 클라이언트의 소켓과 **연결**되도록한다.
4. 이제 클라이언트의 소켓과 새로 생성된 서버의 소켓은 서버소켓과 관계없이 **일대일 통신**을 한다.

<aside>
🔻 **서버소켓은 포트와 결합**되어 포트를 통해 원격 사용자의 연결요청을 기다리다가 **연결요청이 올 때 마다 새로운 소켓을 생성**하여 상대편 소켓과 통신할 수 있도록 연결하는것

→ 전화교환기(서버소켓)는 외부전화기(원격소켓)로부터 걸려온 전화를 내부의 전화기(소켓)로 연결해주고 실제 통화는 전화기(소켓)대 전화기(원격 소켓)로 이루어지게된다.

</aside>

- 포트(2바이트)의 번호는 0 ~ 65535의 범위에 속하는 값인데 보통 1023번 이하의 포트는 사용하지 않음
이미 사용중일 경우가 있기 때문

<aside>
🔻 결국 서버소켓은 클라이언트소켓과 연결만 해주는 기능임
연결된 후 서버소켓에 생성되는 소켓과 클라이언트 소켓이 소통하는것

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/3883c337_Untitled.png]]

- 소켓들이 데이터를 주고받는 연결통로는 입출력스트림이다
- 소켓은 두 개의 스트림, 입력스트림과 출력스트림을 가지고 있다. 이 스트림들은 연결된 상대편 소켓의 스트림들과 교차연결된다.
- 실전화기를 생각해보자
- 서버소켓 클라이언트소켓 객체는 따로 존재

**Socket** 

**프로세스간의 통신을 담당**하며, InputStream과 OutputStream을 가지고 있다. 

이 두 스트림을 통해 **프로세스간의 통신(입출력)**이 이루어진다.

**ServerSocket**

포트와 연결되어 외부의 연결요청을 기다리다 **연결요청이 들어오면, socket을 생성해서 소켓과 소켓간의 통신이 이루어지도록한다.** 한 포트에 하나의 ServerSocket만 연결할 수 있다. 

```java
while(true){
	try{
		...
		Socket socket = serverSocket.accept();
	}
}
```

---

#### 1:1 채팅

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/667d20b0_Untitled.png]]

- 네트워크에 대해 더 공부하고 싶다면 ‘NAT’ 검색

```java
public class ChatServer {
	
	final int SERVER_PORT = 7777;

	public static void main(String[] args) {
		new ChatServer().start();
		new ChatServer().tset1();
	}

	private void tset1() {
		
	}

	private void start() {
		try {
			// 현재컴퓨터 SERVER_PORT에 ServerSocket 생성
			ServerSocket serverSocket = new ServerSocket(SERVER_PORT);
			while(true) {
				System.out.println("[" + InetAddress.getLocalHost().getHostAddress() + ":" + SERVER_PORT + "] 에서 연결대기중...");
				// 클라이언트 요청이 들어오면 별도의 소켓을 생성한다.
				Socket socket = serverSocket.accept();
				System.out.println("[" + socket.getInetAddress().getHostAddress() + "]에서 연결요청!");
				
				// 입출력스트림 준비
				try(BufferedReader br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
					PrintWriter pw = new PrintWriter(socket.getOutputStream())){
					pw.println("환영합니다🎉");
					pw.flush(); //버퍼가 차지 않았어도 강제출력!
					
					// 클라이언트와 채팅시작
					// 서버측 키보드입력을 처리할 Scanner 생성
					Scanner sc = new Scanner(System.in);
					String inMsg = null;
					while((inMsg = br.readLine()) != null) {
						
						// 클라이언트 exit입력시 채팅 종료
						if("exit".equals(inMsg)) {
							System.out.println("클라이언트가 채팅방을 나갔습니다.");
							break;
						}
						
						System.out.println("클라이언트 : " + inMsg);
						System.out.print("서버 : ");
						String outMsg = sc.nextLine();
						pw.println(outMsg);
						pw.flush();
					} 
				}
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
```

```java
public class ChatClient {

	final String SERVER_HOST = "localhost"; // 내 컴퓨터를 가리키는 호스트명
	final int SERVER_PORT = 7777;
	
	public static void main(String[] args) {
		new ChatClient().start();
	}

	private void start() {
		// 클라이언트에서 서버소켓 연결요청
		try {
			Socket clienSocket = new Socket(SERVER_HOST, SERVER_PORT);
			System.out.println("[" + SERVER_HOST + ":" + SERVER_PORT + "] 연결되었습니다.");
			
			// 입출력스트림 준비
			try(BufferedReader br = new BufferedReader(new InputStreamReader(clienSocket.getInputStream()));
				PrintWriter pw = new PrintWriter(clienSocket.getOutputStream())) {
				
				// 클라이언트의 키보드입력
				Scanner sc = new Scanner(System.in);
				String inMsg = null;
				while((inMsg = br.readLine()) != null){
					System.out.println("서버 : " + inMsg );
					System.out.print("클라이언트 : ");
					String outMsg = sc.nextLine();
					pw.println(outMsg);
					pw.flush(); // 강제출력
					
					if("exit".equals(outMsg)) {
						System.out.println("접속을 종료합니다.");
						break;
					}
				}
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
