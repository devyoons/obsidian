---
별칭:
  - "강의 - JDBC"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/3b7f8e6117854d50b942f26044b6d606
주제:
  - "[[00 - 대시보드/주제/Java|Java]]"
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
병합된 노트:
  - "JDBC (2)"
---

# 강의: JDBC

## 강의 내용

**Java Database Connectivity : java ↔ Database 연결하기위한 기술**

---

---

### 01. JDBC란?

자바 언어로 다양한 종류의 관계형 데이터베이스에 접속하고 sql문을 수행하여 처리하고자 할 때 사용되는 표준 sql 인터페이스 API이다. 

JDBC는 자바의 표준 에디션에서 지원하는 기술로서, 접속하려는 DBMS 서버에 따라서 JDBC 드라이버가 필요하다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/1c9e15d2_Untitled.png]]

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/11b6daf5_Untitled.png]]

#### **JDBC 의 필요성**

DB에 따라 sql문이 달라지는 불편함 등으로 인해 JDBC를 통해 각 DB드라이버와 연계되며 이를 통해 편리하게 DB에 접근하도록 할 수 있 다.

#### **JDBC 사용 순서**

1. 드라이버 로드하기
2. 연결 생성하기
3. 문장 실행하기
4. 결과집합 사용하기

### 02. Oracle JDBC Driver

1. 구글에 ojdbc download 검색 
2. Oracle 사이트 검색결과에 [접속](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
3. Oracle JDBC Driver → ojdbc8.jar 다운로드 (JDK11버전 사용하고 있기 때문)
    
    ![오라클을 다운받았으면 이 드라이버는 이미 가지고 있음
    c → app → 사용자이름폴더 → product → 버전폴더 →dbhomeXE → jdbc → lib → ojdbc8.jar](../../../../attachments/2ac47e1d-144e-40d5-85a6-d9b4a006efb2/Untitled.png)
    
    오라클을 다운받았으면 이 드라이버는 이미 가지고 있음
    c → app → 사용자이름폴더 → product → 버전폴더 →dbhomeXE → jdbc → lib → ojdbc8.jar
    

#### **JDBC Driver 포함시키기**

1. 프로젝트 생성후 드라이버를 넣을 폴더 생성 후 드래그앤드랍으로 넣어준다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/78e5f347_Untitled.png]]

1. 프로젝트 우측 클릭 > Build Path > Configure Build Path 를 선택하면 아래와 같은 창이 뜨며 Add JARs를 선택해 다운로드 받은 JDBC Driver 파일(ojdbc8.jar)을 추가해준다.

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/009b13f7_Untitled.png]]

Add External JARs → 외부에 있는 드라이버파일을 가져오는 것

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/e6b096f8_Untitled.png]]

---

### 03. JDBC 기본코드

1. **Class.forName("oracle.jdbc.driver.OracleDriver");** 를 통해 객체화 
    1. ojdbc.jar 연결이 잘되어있으면 이것만 실행했을 때 오류 안나야 정상
2. **Connection conn = DriverManager.getConnection(...);** 를 통해 연결 객체 획득
3. **Statement stmt = con.createStatement();** 실행문(쿼리실행 객체 생성)
4. **ResultSet rset = st.executeQuery(sql);** 결과 반환(ResultSet객체 반환)
    1. 클라이언트에게 돌려줘야하는 레코드를 담는 공간이 ResultSet
5. **rset.next** (사용자에게 돌려줘야할 위치를 가르키고있는 커서가 있고 돌려줘야할 레코드의 앞머리에 위치하고있는 커서가  첫번째 행을 가리키게된다. ResultSet이 next를 통해 패치해올수있음)
6. String member = rset.getString(”member”);

- **위 코드 그림으로 이해하기**
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/7c589ed4_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/f7a13f7c_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/4fa0f0c6_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/edc2f8bb_Untitled.png]]
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/104d093f_Untitled.png]]
    

```java
<오라클db>
		insert into member values( 'honngd', '홍길동', '1990-09-09');
		insert into member values( 'sinsa', '신사임당', '1954-10-19');
		insert into member values( 'qwerty', '꾸어띠', '2005-01-09');
		commit;		
<자바>
		String driverClass = "oracle.jdbc.OracleDriver"; 
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "student";
		String password = "student";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
	
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			String sql = "select * from member";
			rset = stmt.executeQuery(sql);
	
			// 다음행이 존재하면 true 리턴
			while(rset.next()) {
				String id = rset.getString("id");
				String name = rset.getString("name");
				Date birthday = rset.getDate("birthday");
				System.out.printf("%s\t%s\t%s%n", id, name, birthday);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 6. 자원반납
			// 객체생성 역순
			try {
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
//결과
honngd	홍길동	1990-09-09
sinsa	신사임당	1954-10-19
qwerty	꾸어띠	2005-01-09
```

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/7f1173f4_Untitled.png]]

#### 역할

자바는 UI 레이아웃과 데이터 전달에만, 데이터 연산/가공처리는 데이터베이스가 담당하도록 설계

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/0b3c617c_Untitled.png]]

### 04. DQL , DML 자바코드

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/f2e49550_Untitled.png]]

#### DQL

1. jdbc driver class 등록
2. connection 객체 생성(url, user, password)
3. Statement 객체 (쿼리실행객체) 생성
4. Statement 실행(executeQuery) = ResultSet 객체 반환
5. ResultSet을 1행씩 열람 → while 문 다음행이 존재하면 true 리턴 
6. 자원반납 → 객체생성 역순으로 close

```sql
public class jdbcConnectionTest {
	
	String driverClass = "oracle.jdbc.OracleDriver"; // 드라이버클래스명
	String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 접속할 db서버주소 (db접속프로토콜@ip:port:sid)
	String user = "student";
	String password = "student"; 
			

	public static void main(String[] args) {
		jdbcConnectionTest instance = new jdbcConnectionTest();
		instance.test1();
	}

	/**
	 * DQL
	 */
	private void test1() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			// 1. jdbc driver class 등록
			Class.forName(driverClass);
			System.out.println("> driver class 등록 완료!");
			
			// 2. connection 객체 생성(url, user, password)
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("> Connection객체 생성 성공!");
			
			// 3. Statement 객체 (쿼리실행객체) 생성
			stmt = conn.createStatement();
			System.out.println("> Statement 객체 생성 성공!");
			
			// 4. Statement 실행 = ResultSet객체 반환
			String sql = "select * from member";
			rset = stmt.executeQuery(sql);
			System.out.println("> Statement실행 및 ResultSet반환 성공!");
			// 5. ResultSet을 1행씩 열람
			// 다음행이 존재하면 true 리턴
			while(rset.next()) {
				String id = rset.getString("id");
				String name = rset.getString("name");
				Date birthday = rset.getDate("birthday");
				System.out.printf("%s\t%s\t%s%n", id, name, birthday);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 6. 자원반납
			// 객체생성 역순
			try {
				rset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			System.out.println("> 자원반납 성공!");
		}
	}
```

#### DML

1. jdbc driver class 등록
2. connection 객체 생성(url, user, password)
    1. autoCommit(false) : 코드로써 트랜잭션을 직접 관리하기 위한 설정(기본값은 true)
3. Statement 객체 (쿼리실행객체) 생성
4. Statement 실행(executeUpdate) = int리턴 (처리된 행수)
5. 트랜잭션처리 (try - catch)
6. 자원반납

```sql
/**
	 * DML
	 */
	private void test2() {
		Connection conn = null;
		Statement stmt = null;
		try {
			// 1. jdbc driver class 등록
			Class.forName(driverClass);
			
			// 2. connection 객체 생성(url, user, password)
			// autoCommit(false) : 코드로써 트랜잭션을 직접 관리하기 위한 설정(기본값은 true)
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
			
			// 3. Statement 객체 (쿼리실행객체) 생성 - sql
			stmt = conn.createStatement();
			
			// 4. Statement 실행 = int리턴 (처리된 행수)
			String sql = "update member set name = '고길동' where id = 'honggd'";
			int result = stmt.executeUpdate(sql);
			System.out.println("> " + result + "행이 수정되었습니다.");
			// 5.1 트랜잭션처리
			if(result > 0)
				conn.commit();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// 5.2 트랜잭션처리
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			// 6. 자원반납
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
					
	}

}
```


---

### 합친 노트: JDBC (2) (이론)

![[02 - 학습/KH 교육과정 2022/수업 필기/이론/첨부/1c68d178_Untitled.png]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
