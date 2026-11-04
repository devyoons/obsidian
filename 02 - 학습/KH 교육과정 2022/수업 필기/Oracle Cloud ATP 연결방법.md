---
별칭:
  - "강의 - Oracle Cloud ATP 연결방법"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/b3934d977b774beb859f859368ea3238
---

# 강의: Oracle Cloud ATP 연결방법

## 강의 내용

1. `ojdbc10-full.tar.gz` download후 프로젝트 lib폴더하위에 압축해제한 jar 위치시키기
    
    [JDBC and UCP Downloads page](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
    
2. `oraclepki.jar, osdt_core.jar, and osdt_cert.jar` 3가지 jar를 프로젝트에 등록
    - `프로젝트속성 - Java Build Path - Library탭 - Class Path선택 - Add Jars...`
    - Package Explorer 하위에 Referenced LIbraries에서 등록 확인
    
    [Java connectivity to ATP](https://www.oracle.com/database/technologies/java-connectivity-to-atp.html)
    
    > **19c or 18c JDBC driver from the following download page.**
    [ojdbc10-full.tar.gz or ojdbc8-full.tar.gz and ucp.jar](https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
    `ojdbc8-full.tar.gz` and `ojdbc10-full.tar.gz` contains `oraclepki.jar, osdt_core.jar, and osdt_cert.jar` required for connecting to Autonomous database.
    > 
    > - @DatasourceSample.java
    >     
    >     ```bash
    >     /* Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.*/
    >     /*
    >        DESCRIPTION    
    >        The code sample shows how to use the DataSource API to establish a connection
    >        to the Database. You can specify properties with "setConnectionProperties".
    >        This is the recommended way to create connections to the Database.
    >        Note that an instance of oracle.jdbc.pool.OracleDataSource doesn't provide
    >        any connection pooling. It's just a connection factory. A connection pool,
    >        such as Universal Connection Pool (UCP), can be configured to use an
    >        instance of oracle.jdbc.pool.OracleDataSource to create connections and 
    >        then cache them.
    >         
    >         Step 1: Enter the Database details in this file. 
    >                 DB_USER, DB_PASSWORD and DB_URL are required
    >         Step 2: Run the sample with "ant DataSourceSample"
    >       
    >        NOTES
    >         Use JDK 1.7 and above
    >        MODIFIED    (MM/DD/YY)
    >         nbsundar    02/17/15 - Creation 
    >      */
    >     
    >     import java.io.IOException;
    >     import java.io.InputStream;
    >     import java.sql.Connection;
    >     import java.sql.ResultSet;
    >     import java.sql.SQLException;
    >     import java.sql.Statement;
    >     import java.util.Properties;
    >     
    >     import oracle.jdbc.pool.OracleDataSource;
    >     import oracle.jdbc.OracleConnection;
    >     import java.sql.DatabaseMetaData;
    >     
    >     public class DataSourceSample {  
    >       // The recommended format of a connection URL is the long format with the
    >       // connection descriptor.
    >       final static String DB_URL= "jdbc:oracle:thin:@myhost:1521/myorcldbservicename";
    >       // For ATP and ADW - use the TNS Alias name along with the TNS_ADMIN when using 18.3 JDBC driver
    >       // final static String DB_URL="jdbc:oracle:thin:@wallet_dbname?TNS_ADMIN=/Users/test/wallet_dbname";
    >       // In case of windows, use the following URL 
    >       // final static String DB_URL="jdbc:oracle:thin:@wallet_dbname?TNS_ADMIN=C:/Users/test/wallet_dbname";
    >       final static String DB_USER = "hr";
    >       final static String DB_PASSWORD = "hr";
    >     
    >      /*
    >       * The method gets a database connection using 
    >       * oracle.jdbc.pool.OracleDataSource. It also sets some connection 
    >       * level properties, such as,
    >       * OracleConnection.CONNECTION_PROPERTY_DEFAULT_ROW_PREFETCH,
    >       * OracleConnection.CONNECTION_PROPERTY_THIN_NET_CHECKSUM_TYPES, etc.,
    >       * There are many other connection related properties. Refer to 
    >       * the OracleConnection interface to find more. 
    >       */
    >       public static void main(String args[]) throws SQLException {
    >         Properties info = new Properties();     
    >         info.put(OracleConnection.CONNECTION_PROPERTY_USER_NAME, DB_USER);
    >         info.put(OracleConnection.CONNECTION_PROPERTY_PASSWORD, DB_PASSWORD);          
    >         info.put(OracleConnection.CONNECTION_PROPERTY_DEFAULT_ROW_PREFETCH, "20");    
    >       
    >     
    >         OracleDataSource ods = new OracleDataSource();
    >         ods.setURL(DB_URL);    
    >         ods.setConnectionProperties(info);
    >     
    >         // With AutoCloseable, the connection is closed automatically.
    >         try (OracleConnection connection = (OracleConnection) ods.getConnection()) {
    >           // Get the JDBC driver name and version 
    >           DatabaseMetaData dbmd = connection.getMetaData();       
    >           System.out.println("Driver Name: " + dbmd.getDriverName());
    >           System.out.println("Driver Version: " + dbmd.getDriverVersion());
    >           // Print some connection properties
    >           System.out.println("Default Row Prefetch Value is: " + 
    >              connection.getDefaultRowPrefetch());
    >           System.out.println("Database Username is: " + connection.getUserName());
    >           System.out.println();
    >           // Perform a database operation 
    >           printEmployees(connection);
    >         }   
    >       }
    >      /*
    >       * Displays first_name and last_name from the employees table.
    >       */
    >       public static void printEmployees(Connection connection) throws SQLException {
    >         // Statement and ResultSet are AutoCloseable and closed automatically. 
    >         try (Statement statement = connection.createStatement()) {      
    >           try (ResultSet resultSet = statement
    >               .executeQuery("select first_name, last_name from employees")) {
    >             System.out.println("FIRST_NAME" + "  " + "LAST_NAME");
    >             System.out.println("---------------------");
    >             while (resultSet.next())
    >               System.out.println(resultSet.getString(1) + " "
    >                   + resultSet.getString(2) + " ");       
    >           }
    >         }   
    >       } 
    >     }
    >     ```
    >     
    > - @UCPSample.java
    >     
    >     ```bash
    >     /* Copyright (c) 2015, Oracle and/or its affiliates. All rights reserved.*/
    >     
    >     /*
    >      DESCRIPTION
    >      The code sample demonstrates Universal Connection Pool (UCP) as a client
    >      side connection pool and does the following.    
    >      (a)Set the connection factory class name to 
    >      oracle.jdbc.pool.OracleDataSource before getting a connection.   
    >      (b)Set the driver connection properties(e.g.,defaultNChar,includeSynonyms).
    >      (c)Set the connection pool properties(e.g.,minPoolSize, maxPoolSize). 
    >      (d)Get the connection and perform some database operations.     
    >      Step 1: Enter the Database details in DBConfig.properties file. 
    >      USER, PASSWORD, UCP_CONNFACTORY and URL are required.                   
    >      Step 2: Run the sample with "ant UCPSample"
    >      NOTES
    >      Use JDK 1.7 and above  
    >      MODIFIED    (MM/DD/YY)
    >      nbsundar    02/13/15 - Creation (Contributor - tzhou)
    >      */
    >     import java.sql.Connection;
    >     import java.sql.ResultSet;
    >     import java.sql.SQLException;
    >     import java.sql.Statement;
    >     import java.util.Properties;
    >     
    >     import oracle.ucp.jdbc.PoolDataSourceFactory;
    >     import oracle.ucp.jdbc.PoolDataSource;
    >     
    >     public class UCPSample {
    >       final static String DB_URL="jdbc:oracle:thin:@myhost:1521/orclservicename";
    >       // Use the TNS Alias name along with the TNS_ADMIN - For ATP and ADW
    >       // final static String DB_URL="jdbc:oracle:thin:@dbname_alias?TNS_ADMIN=/Users/test/wallet_dbname";
    >       final static String DB_USER = "hr";
    >       final static String DB_PASSWORD = "hr";
    >       final static String CONN_FACTORY_CLASS_NAME="oracle.jdbc.pool.OracleDataSource";
    >     
    >       /*
    >        * The sample demonstrates UCP as client side connection pool.
    >        */
    >       public static void main(String args[]) throws Exception {
    >         // Get the PoolDataSource for UCP
    >         PoolDataSource pds = PoolDataSourceFactory.getPoolDataSource();
    >     
    >         // Set the connection factory first before all other properties
    >         pds.setConnectionFactoryClassName(CONN_FACTORY_CLASS_NAME);
    >         pds.setURL(DB_URL);
    >         pds.setUser(DB_USER);
    >         pds.setPassword(DB_PASSWORD);
    >         pds.setConnectionPoolName("JDBC_UCP_POOL");
    >     
    >         // Default is 0. Set the initial number of connections to be created
    >         // when UCP is started.
    >         pds.setInitialPoolSize(5);
    >     
    >         // Default is 0. Set the minimum number of connections
    >         // that is maintained by UCP at runtime.
    >         pds.setMinPoolSize(5);
    >     
    >         // Default is Integer.MAX_VALUE (2147483647). Set the maximum number of
    >         // connections allowed on the connection pool.
    >         pds.setMaxPoolSize(20);
    >     
    >         // Default is 30secs. Set the frequency in seconds to enforce the timeout
    >         // properties. Applies to inactiveConnectionTimeout(int secs),
    >         // AbandonedConnectionTimeout(secs)& TimeToLiveConnectionTimeout(int secs).
    >         // Range of valid values is 0 to Integer.MAX_VALUE. .
    >         pds.setTimeoutCheckInterval(5);
    >     
    >         // Default is 0. Set the maximum time, in seconds, that a
    >         // connection remains available in the connection pool.
    >         pds.setInactiveConnectionTimeout(10);
    >     
    >         // Get the database connection from UCP.
    >         try (Connection conn = pds.getConnection()) {
    >           System.out.println("Available connections after checkout: "
    >               + pds.getAvailableConnectionsCount());
    >           System.out.println("Borrowed connections after checkout: "
    >               + pds.getBorrowedConnectionsCount());
    >           // Perform a database operation
    >           doSQLWork(conn);
    >         }
    >         catch (SQLException e) {
    >           System.out.println("UCPSample - " + "SQLException occurred : "
    >               + e.getMessage());
    >         }
    >         System.out.println("Available connections after checkin: "
    >             + pds.getAvailableConnectionsCount());
    >         System.out.println("Borrowed connections after checkin: "
    >             + pds.getBorrowedConnectionsCount());
    >       }
    >     
    >       /*
    >        * Creates an EMP table and does an insert, update and select operations on
    >        * the new table created.
    >        */
    >       public static void doSQLWork(Connection conn) {
    >         try {
    >           conn.setAutoCommit(false);
    >           // Prepare a statement to execute the SQL Queries.
    >           Statement statement = conn.createStatement();
    >           // Create table EMP
    >           statement.executeUpdate("create table EMP(EMPLOYEEID NUMBER,"
    >               + "EMPLOYEENAME VARCHAR2 (20))");
    >           System.out.println("New table EMP is created");
    >           // Insert some records into the table EMP
    >           statement.executeUpdate("insert into EMP values(1, 'Jennifer Jones')");
    >           statement.executeUpdate("insert into EMP values(2, 'Alex Debouir')");
    >           System.out.println("Two records are inserted.");
    >     
    >           // Update a record on EMP table.
    >           statement.executeUpdate("update EMP set EMPLOYEENAME='Alex Deborie'"
    >               + " where EMPLOYEEID=2");
    >           System.out.println("One record is updated.");
    >     
    >           // Verify the table EMP
    >           ResultSet resultSet = statement.executeQuery("select * from EMP");
    >           System.out.println("\nNew table EMP contains:");
    >           System.out.println("EMPLOYEEID" + " " + "EMPLOYEENAME");
    >           System.out.println("--------------------------");
    >           while (resultSet.next()) {
    >             System.out.println(resultSet.getInt(1) + " " + resultSet.getString(2));
    >           }
    >           System.out.println("\nSuccessfully tested a connection from UCP");
    >         }
    >         catch (SQLException e) {
    >           System.out.println("UCPSample - "
    >               + "doSQLWork()- SQLException occurred : " + e.getMessage());
    >         }
    >         finally {
    >           // Clean-up after everything
    >           try (Statement statement = conn.createStatement()) {
    >             statement.execute("drop table EMP");
    >           }
    >           catch (SQLException e) {
    >             System.out.println("UCPSample - "
    >                 + "doSQLWork()- SQLException occurred : " + e.getMessage());
    >           }
    >         }
    >       }
    >     }
    >     ```
    >     
3. ATP 지갑폴더를 압축해제후 프로젝트폴더 바로 하위에 위치시킬것.
4. db접속 주소 url 변수는 다음과 같이 작성

```java
// 접속 url
String url = "jdbc:oracle:thin:@db이름_medium?TNS_ADMIN=지갑폴더명"
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
