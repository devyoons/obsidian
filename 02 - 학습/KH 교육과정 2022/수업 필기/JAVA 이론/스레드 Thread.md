---
별칭:
  - "강의 - 스레드 Thread"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/96dbb108dbd34782ac1184d5d16aa415
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 스레드 Thread

## 강의 내용

---

- 목차

---

### 🧐프로세스란?

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/3c6d8642_Untitled.png]]

**실행중인 하나의 프로그램을 말한다.** 하나의 프로그램이라도 실행시마다 개별 프로세스가 생성이 된다. 하나의 프로세스는 하나 이상의 스레드와 할당받은 자원(메모리 등)이 존재한다.

프로세스는 최소 1개의 메인 스레드를 갖고 있다.

- 예를 들어 이클립스를 두 개 실행하면, 두 개의 프로세스가 생성된다.

---

## 🧐스레드란?

스레드(thread)는 어떤 프로그램 내에서, 특히 **`프로세서 내에서 실행되는여러 흐름의 작업 단위`**를 말한다.

일반적으로 한 프로그램은 하나의 스레드를 가지고 있지만, 프로그램 환경에 따라 둘 이상의 스레드를 동시에 실행할 수 있다.

이러한 실행 방식을 멀티스레드(multi-thread)라고 한다.

- 프로세스가 할당받은 자원을 이용하는 실행의 단위
- 한 프로세스 내에서 동작되는 여러 실행 흐름으로 프로세스 내의 Heap, Data, Code 영역을 공유 ( 멀티 스레드의 경우, 이 프로세스의 영역들을 공유한다 )
- 하나의 프로세스를 안에서 다양한 작업을 담당하는 최소 실행 단위를 스레드라고 한다.ex) 크롬 브라우저(=프로세스)에서 벨로그 작성하기(=스레드1) & 유튜브로 음악 듣기(=스레드2)
- 멀티 스레딩의 경우, 스레드 간의 자원을 공유하고 자원의 생성과 관리의 중복성을 최소화하여 수행 능력을 향상시킨다.
- 각각의 스레드는 독립적인 작업을 수행해야 하기 때문에 고유한 스레드 ID, 프로그램 카운터, 레지스터 집합, 스택을 가지고 있다.

---

#### 프로세스와 스레드의 비교

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/52455e01_Untitled.png]]

멀티프로세스와 멀티스레드는 양쪽 모두 **여러 흐름이 동시에 진행된다는 공통점**을 가지고 있다.

하지만, **멀티프로세스**에서 각 프로세스는 **독립적으로 실행되며 각각 별개의 메모리를 차지**하고 있는 것과 달리 **멀티스레드는 프로세스 내의 메모리를 공유해 사용할 수 있다.**

또한, 프로세스 간의 전환 속도보다 스레드간의 전환속도가 빠르다.

**`멀티스레드의 장점`**은 CPU가 여러 개일 경우 각각의 CPU 스레드 하나씩을 담당하는 방법으로 속도를 높일 수 있다. 이러한 시스템에서는 여러 스레드가 실제 시간상으로 동시에 실행될 수 있다.

그러나 **`단점`**은 각각의 스레드 중 어떤 것이 먼저 실행될지 그 순서를 알 수 없다는 것이다.

<aside>
💡 쓰레드를 프로세스라는 작업공간(공장)에서 작업을 처리하는 일꾼(worker)로 생각하면 이해하기 쉽다.

</aside>

하나의 프로세스가 가질 수 있는 쓰레드의 개수는 제한되어 있지 않으나,

쓰레드가 작업을 수행하는데 개별적인 메모리 공간(호출스택)을 필요로 하기 때문에 프로세스의 메모리 한계에 따라 생성할 수 있는 쓰레드의 수가 결정된다.

---

#### 메인스레드와 프로세스 종료

**메인 스레드**

- 모든 자바 프로그램은 메인 스레드가 main() 메소드를 실행하며 시작한다
- main() 메소드의 첫 코드부터 아래로 순차적으로 실행되고, return을 만나면 실행을 종료한다.

**프로세스 종료**

- 싱클 스레드 : 메인스레드가 종료하면 프로세스도 종료된다.
- 멀티 스레드 : 실행죽인 스레드가 하나라도 있다면 프로세스가 종료되지 않는다.

---

### 멀티 프로세스 vs 멀티 스레드

- 독립적으로 프로그램을 실행하는 것을 멀티 프로세스라고 하고, 한개의 프로그램을 실행하고 내부적으로 여러가지 작업을 처리 하는 것을 멀티스레드라고한다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/dbff6bff_Untitled.png]]

---

## 🧐멀티 스레드 (Multi Thread)

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/multi.gif]]

#### 멀티 스레드의 장점

1. **자원 소모 감소** : 자원을 보다 효율적으로 사용할 수 있다. 
    - 프로세스를 생성하여 자원을 할당하는 시스템 콜이 줄어들어 효율적으로 관리
    - 스레드 사이의 작업량이 작아 Context Switching이 빠르다.
    
2. **응답성** : 사용자에 대한 응답성이 향상된다. 
    - 스레드는 프로세스 내의 stack영역을 제외한 모든 메모리를 공유하기 때문에 통신부담이 적다
    
3. **코드의 간결함** : 작업이 분리되어 코드가 간결해진다.

#### 멀티 스레드의 단점

1. **동기화에 주의 :** 동기화(Synchronization)에 주의해야 한다.
    - 스레드 자원을 공유하기 때문에 동시에 여러 스레드가 실행되면 공유 자원에 대해 동시화가 발생할 수 있다.
    - 실행 흐름은 순차적으로 진행되지만, 자원은 한정적인데 여러 스레드가 동시 접근해서 사용하려고 하면 문제가 생기게 된다.
    - 공유 메모리에 대해서 한 번에 한 스레드만 공유자원에 접근할 수 있도록 만들어 동기화 문제를 해결할 수 있다.
    
2. **교착상태(dead-lock) :** 교착상태가 발생하지 않도록 주의해야 한다.
    - 두 개 이상의 작업이 하나씩 자원을 소지 (hold)하고 있으면서 상대방이 가진 자원을 서로 원하고 (need)있는 상태
    - 어떤 작업도 실행되지 못하고 계속 서로 상대방의 작업이 끝나기만 바라는 무한정 대기상태
    
3. **프로그래밍시 고려해야 할 사항들이 많다.**

---

## 🧐싱글 스레드 (Single Thread)

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/single.gif]]

#### 싱글 스레드의 장점

1. **문맥 교환(context switch) 작업을 요구하지 않는다.**
    - 문맥 교환은 여러 개의 프로세스가 하나의 프로세스를 공유할 때 발생하는 작업
    
2. **공유자원을 접근하는 동기화 문제를 신경쓰지 않아도 된다.**
    - 스레드들이 동시에 같은 자원에 접근하지 못하도록 제어해줘야만 한다. 
    이 작업은 프로그래머에게 많은 노력을 요구하고 비용을 발생시킨다.
    
3. **프로그래밍 난이도가 쉽고, CPU, 메모리를 적게 사용한다. (코스트가 적게든다)**
    - 반면에, 멀티 스레드 모델은 프로그래밍 난이도가 높다. 또한, 스레드 수만큼 자원을 많이 사용한다.

#### 싱글 스레드의 단점

1. **여러 개의 CPU를 활용하지 못한다.**
2. **연산량이 많은 작업을 하는 경우, 그 작업이 완료되어야 다른 작업을 수행할 수 있다.**
3. **싱글 스레드는 에러 처리를 못하는 경우 멈춘다.**
    - 멀티 스레드 모델은 에러 발생 시 새로운 스레드를 생성하여 극복한다. 다만, 새로운 스레드 생성이나 놀고 있는 스레드 처리에 비용이 발생한다.
    

---

## 🧐Thread 클래스

**Thread의 생성자**

- Thread() : 기본생성자
- Thread(String s) : 스레드의 이름을 설정할 수 있는 생성자
    - 이름 설정 조회
        
```java
이름설정 생성자 -> Thread thread = new Thread("스레드김");
					설정 -> thread.setName("스레드임");
					조회 -> thread.getName();
```

- Thread(Runnable r ) : Runnable 인터페이스 객체로 생성하는 생성자
- Thread(Runnable r, String s) : Runnable 인터페이스 객체로 생성하며 이름을 가지는 생성자

**Thread 생성방법**

- 직접 Thread 클래스를 extends하여 생성
- Runnable 인터페이스를 구현하여 생성

#### 1. Thread 클래스를 상속받아 직접 생성

```java
class클래스명 extends Thread { }
	//상속 처리 후 , run() 메소드 오버라이딩함

	@Override
	public void run() {
		//실행에 필요한 소스 작성
	}
```

```java
public class Run { }
	public static void main(String[] args){
		클래스명 레퍼런스 = new 생성자
		레퍼런스.start();
		}

```

#### 2. Runnable 인터페이스 상속받아 생성

```java
class 클래스명 implements Runnable { }
	//상속 처리 후, run() 메소드 오버라이딩함

	@Override
	public void run(){
		//실행에 필요한 소스 작성
	}
```

```java
public class Run { }
	public static void main(String[] args) {
		클래스명 레퍼런스 = new 생성자();
		Thread thread - new Thread(레퍼런스);
		Thread.start();
}
```

---

### run() 과 start()

- 새로운 호출 스택을 만드는지 여부

**run( ) 메소드**

- run()메소드를 직접 호출하는 것은 클래스에 선언된 메소드를 호출하는 것과 동일하다.
- public 접근지시자를 가지고 void의 반환타입을 가지며 run() 파라미터가 없다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/09d98904_Untitled.png]]

```java
@Override
public void run() {
	// .. do something
}
```

→ 반환타입이 void라는 것은 Thread내에서 어떠한 작업에 대한 결과를 return받지 못하는 것

**start( ) 메소드**

- 쓰레드를 생성했다고 자동으로 실행되는것이 아니라 start( ) 메소드를 호출해야만 스레드가 실행
- start( ) 메소드가 호출되었다고 바로 실행되는 것도 아니다. 실행대기 상태에 있다가 자기 자신의 차례가 되어야 실행된다.

<aside>
🔻 쓰레드의 실행순서는 OS의 스케쥴러가 작성한 스케쥴에 의해 결정된다.

</aside>

한번 실행이 종료된 쓰레드는 다시 실행할 수 없다.

즉, 하나의 쓰레드에 대해 start() 메소드는 단 한번만 호출될 수 있다는 뜻이다.

**start()는 새로운 쓰레드가 작업을 실행하는데 필요한 호출 스택(call stack)을 생성한 다음에 run()을 호출해서, 생성된 호출스택에 run()이 첫번째로 올라가게 된다.**

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/c82f47d5_Untitled.png]]

- main 메소드에서 쓰레드의 start()를 호출한다.
- start()는 새로운 쓰레드를 생성하고, 쓰레드가 작업하는데 사용될 새로운 호출스택을 생성한다.
- 새로 생성된 호출스택에 run()이 호출되어, 쓰레드가 독립된 공간에서 작업을 수행한다.
- 이제 호출스택이 2개이므로 스케줄러가 정한 순서에 의해 번갈아 가며 실행된다.

---

## 🧐스레드 스케줄링

- 스레드 개수가 코어의 수보다 많을 경우 스레드를 어떤 순서로 동시성으로 실행할 것인가를 결정하는 것
- 스케줄링에 의해 스레드들은 번갈아가며 run( )메소드를 조금씩 실행한다.

#### **자바의 스레드 스케줄링**

- **우선순위 (Priority) 방식**
    - **우선순위가 높은 스레드가 실행상태를 더 많이 가지도록 스케줄링 하는 방법**
    - 1 ~ 10까지 값을 가질 수 있다.
        - 1 우선순위 가장 낮음
        - 5 기본 값
        - 10 우선순위 가장 높음
        - 표현식
            
```java
-Thread.MAX_PRIOROTY
-Thread.NORM_PRIORITY
-Thread.MIN_PRIORITY

thread.setPriority(우선순위);
```

- **순환할당(Round - Robin)**
    - 시간할당량 (Time Slice)를 정해서 하나의 스레드를 정해진 시간만큼 실행시키는 방식이다
    - **JVM에 의해 정해지기 때문에 개발자가 코드로 제어가 불가능하다**
        - **Thread가 관리되는 JVM의 스케쥴링 규칙**
        - 라운드 로빈
        - 철저한 우선순위 기반
        - 가장 높은 우선순위의 스레드가 우선적으로 스케쥴링 됨.
        - 동일한 우선순위의 스레드는 돌아가면서 스케쥴링
    
    ## 🧐Thread 스케줄링 관련 메서드
    
    Thread의 스케줄링을 하기 위해서는 쓰레드의 상태와 관련 메서드를 잘 알아야 한다.
    
    - 실행중인 스레드의 상태를 변경하는 것을 말한다.
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/a61dcbbb_Untitled.png]]
    
    **NEW**
    
    - 쓰레드가 생성된 상태, 아직 start() 되지 않음.
    
    **RUNNABLE**
    
    - start()가 호출되어 실행 대기
    - run()이 호출되면 RUNNING(CPU점유) 상태가 된다.
    - Runnable Pool에 모여 있다.
    
    **WAITING**
    
    - 일시정지 상태이며, 다른 쓰레드의 통지를 기다린다.
    
    **TIME_WAITING**
    
    - 일시정지 상태이며, 주어진 시간동안 기다린다.
    
    **BLOCK**
    
    - 일시정지 상태이며, 사용하려는 객체의 LOCK이 풀릴 때 까지 대기 한다.
    
    **TERMINATED**
    
    - 실행을 마치고 종료한다.
    - run()이 끝나면 소멸된다.
    
    | 메소드 | 설명 |
    | --- | --- |
    | void interrupt() | sleep()이나 join()에 의해 일시정지상태인 쓰레드를 깨워서 실행대기 상태로 만든다.
    해당 쓰레드에서는 InterruptedException이 발생함으로써 일시정지상태를 벗어나게 된다. |
    | void join()
    void join(long millis)
    void join(ling millis, int nanos) | 특정 스레드 종료시/지정한 시간동안 기다린다.
    지정된 시간이 지나거나 작업이 종료되면 join()을 호출한 쓰레드로 다시 돌아와 실행을 계속한다. |
    | static void sleep(long millis)
    static void sleep(long millis, int nanos) | 지정된 시간동안 쓰레드를 일시정지시킨다.
    지정한 시간이 지나고 나면 자동적으로 다시 실행대기상태가 된다. (몇초동안 잠들어있어) |
    | static void yield() | 실행 중에 자신에게 주어진 실행시간을 다른 쓰레드에게 양보하고 자신은 실행대기상태가 된다. |
    
    <aside>
    🔻 `Thread.currentThread().getName()` 메소드를 통해 스레드 이름이 출력
    
    </aside>
    
    ### join : 다른 스레드의 종료를 기다림
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/741e7d1c_Untitled.png]]
    
    ThreadA가 ThreadB의 join() 메소드를 호출하면 ThreadA는 ThreadB가 종료할 때까지 일시 정지 상태가 된다. ThreadB의 run() 메소드가 종료되면 비로소 ThreadA는 일시 정지에서 풀려 다음 코드를 실행한다.
    
    - join 수업시간 예제
        - 특정 스레드 종료시/지정한 시간동안 기다린다.
        
```java
private void test4() {
		Thread th = new Thread(new CountDownThread(), "카운트다운");
		th.start();
		
		// 메인쓰레드가 카운트다운스레드에 조인
		try {
			// 현재쓰레드(main)가 th스레드에 join 
		//th.join();
			th.join(3000);  //join (long millis) 
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
```



#### sleep (long millis) : 일정시간동안 스레드 일시 정지

Thread.sleep() 메소드를 호출한 스레드는 주어진 시간 동안 일시 정지 상태가 되고, 다시 실행 대기 상태로 돌아간다.

#### interrupt : 스레드의 안전한 종료

진행중인 쓰레드의 작업이 끝나기 전에 취소시켜야 할 때가 있다. 

**interrupt()** 는 쓰레드에게 **작업을 멈추라고 요청**한다.

- 단지 멈추라고 요청만 하는 것일 뿐 강제종료 시키진 못한다.
- 쓰레드가 sleep(), wait(), join() 에 의해 **'일시정지 상태(WAITING)'** 에 있을 때, 해당 쓰레드에 대해 interrupt()를 호출하면, sleep(), wait(), join() 에서 Interrupted Exception이 발생하고 쓰레드는 
**'실행대기 상태(RUNNABLE)'**로 바뀐다.
- 즉, 멈춰있던 쓰레드를 깨워서 실행가능한 상태로 만드는 것이다.

<aside>
💡 Interrupted Exception이 발생하는 위치를 명확히 알고 
sleep(), wait(), join() 메소드의 interrupted Exception 부분을 잘 catch 하자

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/ee28793d_Untitled.png]]

[https://m.blog.naver.com/qbxlvnf11/221106055566](https://m.blog.naver.com/qbxlvnf11/221106055566)

TestThread의 interrupt() 메소드를 실행하게 되면 TestThread가 sleep() 메소드로 일시 정지 상태가 될 때 TestThread에서 `InterruptedException이 발생`하여 예외 처리(catch) 블록으로 이동됨.

결국 TestThread는 while 문을 빠져나와 run() 메소드를 정상 종료함

- interrupt 수업 예제
    
```java
public class ThreadStatusControlStudy {
 
	public static void main(String[] args) {
		ThreadStatusControlStudy study = new ThreadStatusControlStudy();
		study.test5();
		System.out.println("[" + Thread.currentThread().getName() + " 종료!]");
	}

private void test5() {
		Thread th = new Thread(new CountDownThread(), "카운트다운");
		th.start();
		
		System.out.println("엔터 입력시 카운트다운 종료!");
		new Scanner(System.in).nextLine();
		th.interrupt(); // 특정스레드 종료(InterruptedException유발)
	}
```

```java
public class CountDownThread implements Runnable {

	@Override
	public void run() {
		for(int i = 10; i >= 0; i--) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
//				e.printStackTrace();
				break; // 반복문 탈출!
			}
		}
		System.out.println("[" + Thread.currentThread().getName() + " 종료!]");
	}
}
```


---

## 🧐스레드 동기화

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/b6a0ed0e_Untitled.png]]

**게임 캐릭터는 나만 건들 수 있어야 하는데, 내가 화장실을 간 사이에 누군가가 와서 템을 바꿔 놓는다면 얼마나 짜증이 나겠는가?**

여러개의 스레드가 객체를 건들 수 있는 상황이 생길 수 있다. 스레드 A를 사용하던 객체가 스레드B에 의해 객체의 값이 변경 될 수 있다는 뜻이다.

한번에 한 개의 쓰레드만 객체에 접근할 수 있도록 객체에 락(lock)을 걸어서 데이터의 일관성을 유지하는 것

- 멀티스레드에서는 동기화 필수

#### 동기화처리 방법 2가지 : 동기화대상은 늘 특정객체가 된다.

1. 동기화 메소드 처리 
2. ★동기화블럭 메소드 안에 생성
    - 국지적으로 지정가능
    - 성능이 좋을 수 있다 ( 동기화 객체의 범위가 적을수록 성능은 좋을 수 있다)

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/a46a2a5f_Untitled.png]]

#### 동기화 메소드와 동기화 블럭

```java
1.
동기화 메소드
public synchronized void method(){
	//한 개의 스레드만 실행할 수 있음
}
2.
동기화 블록
public void method(){
	//여러 스레드가 실행할 수 있음
…
	synchronized
	공유객체
	//한 개의 스레드만 실행할 수 있음
	}
//
여러 스레드가 실행할 수 있음
…
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/837e392c_Untitled.png]]

- 동기화 ATM 수업예제
    - 동기화를 하지 않았을 때 ATM1과 ATM2에서 동시 중간에 출금을 하는 바람에 잘못된 명세서가 출력되고 있다
    - 동기화 대상은 특정 객체 → 현재 코드에서는 **acc.withdraw() acc가 동기화 대상**이 된다.
    
```java
public class Account {
	private int balance = 1000; // 잔액
	public int getBalance() {
		return balance;
	}

public /***synchronized*/** void withdraw(int money) { // 동기화 메소드 처리
		// this 현재객체를 동기화처리
		**synchronized(this)**{			
			String threadName = Thread.currentThread().getName();
			System.out.printf("[%s]출금시도 %d원, 현재잔액 %d원 %n", threadName, money, balance);
			if(money <= balance) {
				balance -= money;
				System.out.printf("[%s]출금성공 -> 현재잔액 %d원 %n", threadName, balance);
			}
			else {
				System.out.printf("[%s]출금실패 -> 잔액부족 %n", threadName);			
			}
		}
	}
}
```

```java
public class ATMMain {

	public static void main(String[] args) {
		Account acc = new Account(); // 공유자원
		
		Thread th1 = new Thread(new ATMThread(acc), "ATM1");
		Thread th2 = new Thread(new ATMThread(acc), "ATM2");
		th1.start();
		th2.start();
	}
}
```

```java
public class ATMThread implements Runnable {

	private Account acc;
	public ATMThread (Account acc) {
		this.acc = acc;
	}
	
	@Override
	public void run() {
		// 잔액이 없을때 까지 출금시도
		while(acc.getBalance() > 0) {
			int money = (int)(Math.random() * 3 + 1) * 100; // 100 200 300
			acc.withdraw(money); // 출금
		}
		System.out.println("[" + Thread.currentThread().getName() + "종료]");
	}
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/56ba55dc_Untitled.png]]

잘못된 명세서

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/1ed95a4d_Untitled.png]]

올바른 명세서


---

## 🧐Main Thread

main 스레드는 main메서드의 작업을 수행하는 것도 스레드이며, 이를 main스레드라 한다.

스레드를 일꾼에 비유하였는데, 프로그램을 실행하기 위해서는 작업을 수행하는 일꾼이 최소한 하나는 필요하지 않나??????

즉, 프로그램을 실행하면 기본적으로 하나의 스레드(일꾼)을 생성하고, 그 스레드가 main메서드를 호출해서 작업이 수행되도록 하는것임

<aside>
🔻 싱글 스레드 : main스레드가 종료되면 프로세스도 종료됨
멀티 스레드 : 메인 스레드가 종료되더라도 실행 중인 스레드가 하나라도 있다면 프로세스는 종료되지 않음

</aside>

---

## 🧐데몬스레드 (Daemon Thread)

다른 일반 Thread의 작업을 돕는 **보조적인 역할을 수행하는 Thread (백그라운드 스레드)** 이다.

![[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/첨부/19b445c7_Untitled.png]]

**일반 Thread가 모두 종료되면 Daemon Thread는 강제종료** 됨

이러한 이유는 데몬 쓰레드는 일반 쓰레드를 돕는 역할을 하는 것이며,
**일반 스레드가 종료되면 의미가 없어지기 때문**이다.

#### 데몬스레드 작성과 실행법 : 일반 스레드와 동일

```java
...
thread.setDaemon(true);
thread.start();
...
```

<aside>
🔻 스레드를 생성한 다음 실행 전(strat()메소드 호출 전)
 `setDaemon(true)`로 자신이 데몬스레드임을 설정해야함
데몬스레드가 생성한 스레드는 자동적으로 데몬스레드가 됨

</aside>

- 자신을 파생시킨 부모 스레드가 끝나면 바로 끝남

- 데몬스레드 수업시간 예제
    
```java
<ThreadStatusControlStudy클래스>
public class ThreadStatusControlStudy {
 
	public static void main(String[] args) {
		ThreadStatusControlStudy study = new ThreadStatusControlStudy()
		study.test3();
		System.out.println("[" + Thread.currentThread().getName() + " 종료!]");
	}

private void test3() {
		Thread th = new Thread(new CountDownThread(), "카운트다운");
		th.setDaemon(true); // 이 코드를 주석하면 일반스레드가됨
		th.start();
		
		System.out.println("엔터입력시 카운트다운 종료!!");
		new Scanner(System.in).nextLine();
	}
}
```

```java
<CountDownThread클래스>

public class CountDownThread implements Runnable {

	@Override
	public void run() {
		for(int i = 10; i >= 0; i--) {
			System.out.println(i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
//				e.printStackTrace();
				break; // 반복문 탈출!
			}
		}
		System.out.println("[" + Thread.currentThread().getName() + " 종료!]");
	}

}
//결과
엔터 입력시 카운트다운 종료!
10
9
8
7
6
5
4
3
2
1
[카운트다운종료!]
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/JAVA 이론/JAVA 이론|JAVA 이론]]
