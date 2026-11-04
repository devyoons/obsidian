---
별칭:
  - "강의 - hello-spring : 2일차"
태그:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/9fdf24a6d1b344c4922ae05572376745
---

# 강의: hello-spring : 2일차

## 강의 내용

---

---

#### [[02 - 학습/KH 교육과정 2022/수업 필기/DTO 관련 (lombok설치)|(설정#5)Lombok 연동하기]]

### `@Controller` 클래스의 handler메소드가 가질수 있는 매개변수 타입

---

- HttpServletRequest
- HttpServletResponse
- HttpSession

- java.util.Locale : 요청에 대한 Locale
- InputStream/Reader : 요청에 대한 입력스트림
- OutputStream/Writer : 응답에 대한 출력스트림. ServletOutputStream, PrintWriter

#### 사용자입력값처리

- Command객체 : http요청 파라미터를 커맨드객체에 저장한 VO(DTO)객체
- CommandMap : HandlerMethodArgumentResolver에 의해 처리된 사용자입력값을 가진 Map객체
- `@Valid` : 커맨드객체 유효성 검사객체
- Error, BindingResult : Command객체에 저장결과(Command객체 바로 다음위치시킬것.)
- `@PathVariable` : 요청url중 일부를 매개변수로 취할 수 있다.
- `@RequestParam` : 사용자입력값을 자바변수에 대입처리(필수여부 설정)
- `@RequestHeader` : 헤더값
- `@CookieValue` : 쿠키값
- `@RequestBody` : http message body에 작성된 json을 vo객체로 변환처리

#### 뷰에 전달할 모델 데이터 설정

- ModelAndView 클래스
- ModelMap 클래스
- Model 인터페이스
- `@ModelAttribute` : model속성에 대한 getter
- `@SessionAttribute` : session속성에 대한 getter(required여부 선택가능)
- `@SessionAttributes` : session에서 관리될 속성명을 class-level에 작성
- SessionStatus: `@SessionAttributes`로 등록된 속성에 대하여 사용완료(complete)처리. 세션을 폐기하지 않고 재사용한다.

#### 기타

- MultipartFile : 업로드파일 처리 인터페이스. CommonsMultipartFile
- RedirectAttributes : DML처리후 요청주소 변경을 위한 redirect시 속성처리 지원

### Controller에서 사용자 입력값 처리 방법 (lombok설치필수)

---

- handler : **Controller와 RequestMapping은 짝꿍!**
    
    사용자 요청이 왔을 때 그 요청을 처리해주는 메소드
    
    ```java
    //DemoController.java
    package com.kh.spring.demo.controller;
    
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    
    import com.kh.spring.demo.model.service.DemoService;
    
    @Controller
    public class DemoController {
    	
    	@Autowired
    	private DemoService demoService;
    	
    	/**
    	 * 전송방식 GET(기본값)
    	 * @return
    	 */
    	@RequestMapping("/demo/devForm.do")
    	public String devForm() {
    		System.out.println("GET /demo/devForm.do 요청");
    		System.out.println(1234567890);
    		return "demo/devForm";
    	}
    	
    }
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/94e1ae70_Untitled.png]]
    
    MVC 관련해서 붙은 어노테이션에 대한 작업을 servlet-context.xml `<annotation-driven />`태그가 해줌.
    
- `controller에서의 사용자 입력값 처리` handler 원래 하던 방식과 새로운 방식
    
    > **원래하던방식 servlet**
    > 
    
    ```java
    @Controller
    public class DemoController {
    	@Autowired
    	private DemoService demoService;
    	@RequestMapping("/demo/dev1.do")
    	public String dev1(HttpServletRequest request, HttpServletResponse response) {
    		String name = request.getParameter("name");
    		int career = Integer.parseInt(request.getParameter("career"));
    		String email = request.getParameter("email");
    		String _gender = request.getParameter("gender");
    		Gender gender = _gender != null ? Gender.valueOf(_gender) : null;
    		String[] langs = request.getParameterValues("lang");
    		
    		Dev dev = new Dev(0, name, career, email, null, langs, LocalDateTime.now());
    		System.out.println(dev);
    		
    		request.setAttribute("dev", dev);
    		
    		return "demo/devResult";
    	}
    }
    ```
    
    > **새로운 방식 1 : 필수값에 대한 처리는 이게 좋음**
    > 
    - RequestMapping에 `method = RequestMethod.GET` 작성하면 이것만 처리함.
        - **아무것도 안적으면 다 처리할 수 있음!!!!**
    - 사용자가 RequestParam에 필요한 내용을 다 입력하지 않으면 에러!
        - 만약 입력을 안받아도 되는 값은 `required = false` 설정을 해주면 입력하지 않아도 오류나지 않음
    - 사용가 보낸 name값과 매개변수 이름이 동일해야함 다르면 에러!
        - `name="lang"` name 속성을 설정을 해주면 됀다.
    - 아무것도 입력하지 않을 시 기본 값으로 지정해주는 방법!
        - `defaultValue = "M”`
    
    ```java
    @Controller
    @RequestMapping("/demo")
    public class DemoController {
    	
    	static Logger log = LoggerFactory.getLogger(DemoController.class); 
    	
    	@Autowired
    	private DemoService demoService;
    	
    	/**
    	 * 전송방식 GET(기본값)
    	 * @return
    	 */
    	@RequestMapping("/devForm.do")
    	public String devForm() {
    		log.info("GET /demo/devForm.do 요청");
    		log.info("{}", 1234567890);
    		return "demo/devForm";
    	}
    	
    @RequestMapping(value = "/dev2.do", method = RequestMethod.GET)
    	public String dev2(
    			@RequestParam String name, 
    			@RequestParam int career, 
    			@RequestParam String email, 
    			@RequestParam(required = false, defaultValue = "M") Gender gender, 
    			@RequestParam(name="lang" ,required = false) String[] langs,
    			Model model) {
    		
    		Dev dev = new Dev(0, name, career, email, gender, langs, LocalDateTime.now());
    		log.info("dev = {}", dev);
    		
    		model.addAttribute("dev", dev); // view단에 전달한 데이터를 모델에 속성으로 등록
    		
    		return "demo/devResult";
    	}
    }
    ```
    
    > **새로운 방식 2 : [커맨드 객체](https://velog.io/@dnflrhkddyd/Spring-%EC%BB%A4%EB%A7%A8%EB%93%9C-%EA%B0%9D%EC%B2%B4)**
    > 
    - 전송된 사용자입력값과 대응하는 필드에 자동으로 값대입
    - 커맨드객체는 자동으로 model에 속성으로 등록
    
    ```java
    @Controller
    @RequestMapping("/demo")
    public class DemoController {
    	
    	static Logger log = LoggerFactory.getLogger(DemoController.class); 
    	
    	@Autowired
    	private DemoService demoService;
    	
    	/**
    	 * 전송방식 GET(기본값)
    	 * @return
    	 */
    	@RequestMapping("/devForm.do")
    	public String devForm() {
    		log.info("GET /demo/devForm.do 요청");
    		log.info("{}", 1234567890);
    		return "demo/devForm";
    	}
    @RequestMapping("/dev3.do")
    	public String dev3(Dev dev) {
    		log.info("dev = {}", dev);
    		return "demo/devResult";
    	}
    	
    }
    ```
    
- Logger : `Sysout.out.println` 잘가🤗
    
    `import org.slf4j.Logger` 
    
    ```java
    static Logger log = LoggerFactory.getLogger(DemoController.class);
    log.info("dev = {}", dev);
    ```
    
- url 처리방법
    
    클래스 RequestMapping + 핸들러 RequestMapping = 해당 url 처리
    
    ```java
    @Controller
    @RequestMapping("/demo")
    public class DemoController {
    
    	@RequestMapping("/devForm.do") // /demo/devForm.do
    		public String devForm() {
    			log.info("GET /demo/devForm.do 요청");
    			log.info("{}", 1234567890);
    			return "demo/devForm";
    		}
    }
    ```
    
- pom.xml db연동관련설치 + mybatis
    
    > **필요한 빈**
    > 
    1. datasource : 어느 db에 어떤 user , pw → properties로 관리
        - properties
            - 한글사용 X
            - key namespace : 키값충돌을 원천적으로 방지
                - datasource.url = dd
                - datasource.username = dd
            
            ```java
            # datasource.properties
            datasource.driverClassName = oracle.jdbc.OracleDriver
            datasource.url = jdbc:oracle:thin:@localhost:1521:xe
            datasource.username = spring
            datasource.password = spring
            ```
            
    2. sqlSessionFactory
    3. SqlSession
    
    ```xml
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-jdbc</artifactId>
        <version>${org.springframework-version}</version>
    </dependency>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.4.6</version>
    </dependency>
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis-spring</artifactId>
        <version>1.3.2</version>
    </dependency>
    <!-- Database Connection Pool -->
    <dependency>
        <groupId>commons-dbcp</groupId>
        <artifactId>commons-dbcp</artifactId>
        <version>1.4</version>
    </dependency>
    <dependency>
        <groupId>com.oracle.database.jdbc</groupId>
        <artifactId>ojdbc8</artifactId>
        <version>21.1.0.0</version>
    </dependency>
    ```
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/d1349d81_Untitled.png]]
    
    - root-context
        - context namespace 속성을 사용하기 위한 설정
            
            ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/fc133ebc_Untitled.png]]
            
            context 체크
            
            ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/db49cd8a_Untitled.png]]
            
        
        ```java
        <?xml version="1.0" encoding="UTF-8"?>
        <beans xmlns="http://www.springframework.org/schema/beans"
        	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        	xmlns:context="http://www.springframework.org/schema/context"
        	xsi:schemaLocation="http://www.springframework.org/schema/beans 
        		https://www.springframework.org/schema/beans/spring-beans.xsd
        		http://www.springframework.org/schema/context 
        		http://www.springframework.org/schema/context/spring-context-4.3.xsd">
        	
        	<!-- Root Context: defines shared resources visible to all other web components -->
        	
        	<!-- #7.1. 영속성관련 빈등록 -->
        	<context:property-placeholder location="classpath:datasource.properties"/>
        </beans>
        ```
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/ec1cd3f8_Untitled.png]]
        
        target 하위에 datasource.properties를 읽게하려는 설정
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/f89c9e47_Untitled.png]]
        
    - 타입변환할 수 없는 배열
        
        ```java
        7월 08, 2022 12:19:32 오후 org.apache.catalina.core.StandardWrapperValve invoke
        심각: 경로 [/spring]의 컨텍스트 내의 서블릿 [appServlet]을(를) 위한 Servlet.service() 호출이, 근본 원인(root cause)과 함께, 
        예외 [Request processing failed; nested exception is org.mybatis.
        spring.MyBatisSystemException: nested exception is org.apache.ibatis.
        type.TypeException: Could not set parameters for mapping: ParameterMap
        ping{property='lang', mode=IN, javaType=class java.lang.Object, jdbcT
        
        ype=null, numericScale=null, resultMapId='null', jdbcTypeName='null', 
        expression='null'}. Cause: org.apache.ibatis.type.TypeException: Error 
        setting non null for parameter #5 with JdbcType null . Try setting a 
        different JdbcType for this parameter or a different configuration
         property. Cause: org.apache.ibatis.type.TypeException: Error setting 
        non null for parameter #5 with JdbcType null . Try setting a different
        
         JdbcType for this parameter or a different configuration property. 
        Cause: java.sql.SQLException: 부적합한 열 유형]을(를) 발생시켰습니다.
        ```
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/80e486dd_Untitled.png]]
        
        ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/336dc349_Untitled.png]]
        
        ```java
        @MappedTypes(String[].class)
        @MappedJdbcTypes(JdbcType.VARCHAR)
        ```
        
        ```java
        	/**
        	 * String[] -> VARCHAR2
        	 * null값이 아닌 값을 setting
        	 */
        	@Override
        	public void setNonNullParameter(PreparedStatement ps, int i, String[] parameter, JdbcType jdbcType)
        			throws SQLException {
        		String value = String.join(",", parameter);
        		ps.setString(i, value);
        	}
        // 인덱스 그대로 넘어와서 i 사용하면 됌.
        ```
        
        ```java
        /**
         * VARCHAR -> String[]
         * nullavle한 값을 String[]로 변환
         */
        @Override
        public String[] getNullableResult(ResultSet rs, String columnName) throws SQLException {
        	String value = rs.getString(columnName);
        	// null값이 넘어오면 그대로 null로 
        	// null이 아니면 구분자 ,콤마로 구분
        	return value != null ? value.split(",") : null;
        }
        
        @Override
        	public String[] getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        		String value = rs.getString(columnIndex);
        		return value != null ? value.split(",") : null;
        	}
        
        	@Override
        	public String[] getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        		String value = cs.getString(columnIndex);
        		return value != null ? value.split(",") : null;
        	}
        ```
        
        - mybatis-config typeHandler 설정
            
            ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/96fe0a37_Untitled.png]]
            
            ```java
            <typeHandlers>
            	<typeHandler handler="com.kh.spring.common.typehandler.StringArrayTypeHandler"/>
            </typeHandlers>
            ```
            
        - db에 저장됐는지 확인
            
            ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/9bb19d8c_Untitled.png]]
            
        
        - 메세지 출력하기
            
            RedirectAttributes 객체 사용 
            
            - 내부적으로 session을 사용하는거임
            
            ```java
            // value가 path
            	@RequestMapping(path = "/insertDev.do", method = RequestMethod.POST)
            	public String insertDev(Dev dev, RedirectAttributes redirectAttr) {
            		log.info("dev = {}", dev);
            		
            		int result = demoService.insertDev(dev);
            		log.info("result = {}", result);
            		
            		// resirect후에 사용자가 확인할수있는 정보 저장
            		redirectAttr.addFlashAttribute("msg", "Dev 등록이 정상적으로 처리되었습니다.");
            		return "redirect:/demo/devForm.do";
            	}
            ```
            
            - header.jsp
                
                : 자동으로 삭제해줘서 삭제할 필요가 없음 1회용msg
                
                ```java
                스크립트 추가
                <script>
                	<c:if test="${not empty msg}">
                		alert('${msg}');
                	</c:if>
                </script>
                ```
                

### 😀SQL 연동(#7설정)

#### 1. 프로젝트에 SQL 파일 생성

---

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/81d08748_Untitled.png]]

1. New File
2. 폴더 생성 
3. 하위에 관리할 DB 파일 생성
4. sql developer에 spring.sql생성한 파일은 드래그앤 드랍해서 열어준다.
5. 아래에서부터는 sql developer에서 작업하는 내용임.

#### 2. oracle developer

---

1. system 계정으로 spring 계정 생성
    
    ```sql
    // c## 접두어 없이 계정을 만들기 위한 설정
    alter session set "_oracle_script" = true;
    
    // 생성할 계정 id, pw,
    // 디폴트 테이블스페이스를 지정
    // 오라클을 설치하면 기본적인 디폴트 테이블스페이스는 USERS
    create user spring
    identified by spring
    default tablespace users;
    
    // 용량 마음껏 쓸 수 있도록 하는 설정
    alter user spring quota unlimited on users;
    
    // connect : 접속권한 
    // resource : 생성권한(create 트리거, 시퀀스, 타입, 프로시저, 테이블 등 8가지 권한이 부여)
    grant connect, resource to spring;
    ```
    
2. 접속 정보 생성하기 
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/62039332_Untitled.png]]
    
3. 생성한 계정으로 접속 후 table 생성 → **커밋필수!!**
4. 다음부터는 STS 작업이다.

#### 3. STS 에서 sql관련 설정(#7. 영속성 관련)

---

1. pom.xml에서 dependency 추가
    - 영속성관련 의존추가
        
        `spring-jdbc` 
        
        `mybatis`
        
        `mybatis-spring` : mybatis 와 spring을 연결해주는 기능
        
        `commons-dbcp` : connection 재사용할 수 있게 하는 기능
        
        - connection을 매번 생성해서 제공하고 폐기하고 생성하고 폐기하는 반복을 하지 않아도 됌. `성능 향상을 시켜주는 기능`
        
        `ojdbc8`
        

```sql
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-jdbc</artifactId>
	<version>${org.springframework-version}</version>
</dependency>
<dependency>
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis</artifactId>
	<version>3.4.6</version>
</dependency>
<dependency>
	<groupId>org.mybatis</groupId>
	<artifactId>mybatis-spring</artifactId>
	<version>1.3.2</version>
</dependency>
<!-- Database Connection Pool -->
<dependency>
	<groupId>commons-dbcp</groupId>
	<artifactId>commons-dbcp</artifactId>
	<version>1.4</version>
</dependency>
<dependency>
	<groupId>com.oracle.database.jdbc</groupId>
	<artifactId>ojdbc8</artifactId>
	<version>21.1.0.0</version>
</dependency>
```

1. datasource.properties 파일 생성하기 
    
    `src/main/resources/datasource.properties`
    
- 한글 주석 X
- 아래 방식처럼 **최소 2단으로 namespace를 지정**해줘야함. 
이유는 원천적으로 key값 충동을 막기 위함

- url = sss
username = sss

- datasource.url = sss
datasource.username = sss

```xml
# datasource.properties
datasource.driverClassName = oracle.jdbc.OracleDriver
datasource.url = jdbc:oracle:thin:@localhost:1521:xe
datasource.username = spring
datasource.password = spring
```

1. sql session을 만들기 위한 관련된 빈은 root-conext에서 관리

`src/main/webapp/WEB-INF/spring/root-context.xml`

- Datasouce | SqlSessionFactory | SqlSession 설명
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/efc9a2c7_Untitled.png]]
    
    `Datasource` : 어떤db에 접속할건지에 대한 정보
    
    `SqlSessionFactory` : sql과 Mybatis를 연결해주는 객체 
    
    - sqlSessionFactory는 내부적으로 DataSource를 포함(ref)하고 있기에 메소드로 작성 시 매개변수로 DataSource를 받아야 한다. 그리고 가장 중요한 mapper파일이 있는 경로(classpath)를 설정함.
    
    `SqlSession` : 핵심적인 역할을 하는 클래스로서 SQL 실행이다 트랙잭션 관리를 실행
    
- root-context에서 관리하고 싶을 때 경로 확인하는 방법
    
    ```xml
    // web.xml 파일에서 확인할 수 있다.
    <!-- #2. 전역 context 설정 -->
    <!-- The definition of the Root Spring Container shared by all Servlets and Filters -->
    <!-- #9.1. root-context에 security-context.xml 설정파일 추가 -->
    <context-param>
    	<param-name>contextConfigLocation</param-name>
    	<param-value>
    		/WEB-INF/spring/root-context.xml
    		/WEB-INF/spring/security-context.xml 
    	</param-value>
    	<!-- <param-value>/WEB-INF/spring/*-context.xml</param-value> -->
    </context-param>
    ```
    
- context namespace 등록 설정 방법
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1c24241e_Untitled.png]]
    

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/5c785ea1_Untitled.png]]

- `classpath` : 슬래시로하면 의미하는게 헷갈리니 spring에서는 classpath 접두사 사용
- dataSource : `destroy-method="close` 반납하는 메소드
- `<property name="mapperLocations" value="classpath*:mapper/**/*-mapper.xml"/>`: * 복수일 때 사용하고 이렇게 해놓으면 형식에 맞춰 mapper파일을 만들어주면 따로 관리하지 않아도 됀다.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:mybatis-spring="http://mybatis.org/schema/mybatis-spring"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://mybatis.org/schema/mybatis-spring http://mybatis.org/schema/mybatis-spring-1.2.xsd
		http://www.springframework.org/schema/beans https://www.springframework.org/schema/beans/spring-beans.xsd
		http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-4.3.xsd
		http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-4.3.xsd">

<!-- #7.1. 영속성관련 빈등록 -->
<context:property-placeholder location="classpath:datasource.properties"/>
<!-- dataSource빈 -->
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
	<property name="driverClassName" value="${datasource.driverClassName}"/>
	<property name="url" value="${datasource.url}"/>
	<property name="username" value="${datasource.username}"/>
	<property name="password" value="${datasource.password}"/>
</bean>
<!-- sqlSessionFactory빈 -->
<bean id="sqlSessionFactoryBean" class="org.mybatis.spring.SqlSessionFactoryBean">
	<property name="dataSource" ref="dataSource"/>
	<property name="configLocation" value="classpath:mybatis-config.xml"/>
	<property name="mapperLocations" value="classpath*:mapper/**/*-mapper.xml"/>
</bean>
<!-- sqlSessionTemplate빈 : SqlSession인터페이스 구현 클래스 -->
<bean id="sqlSessionTemplate" class="org.mybatis.spring.SqlSessionTemplate">
	<constructor-arg ref="sqlSessionFactoryBean"/>
</bean>
```

1. mybatis-config.xml | smaple-mapper.xml copy →  src/main/resources

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/1485cb42_Untitled.png]]

붙여넣기 할 경로

sample-mapper는 말그대로 샘플용이라 새로 생성하는 mapper로 복사해서 사용

> **mybatis-config.xml**
> 

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/595ab410_Untitled.png]]

mapper 폴더 생성 후 하위에 대분류로 폴더 생성

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">
<configuration>
  <!-- 
  	Content Model 순서를 지켜서 작성할 것!
  	Content Model : (properties?, settings?, typeAliases?, typeHandlers?, objectFactory?, objectWrapperFactory?, 
 reflectorFactory?, plugins?, environments?, databaseIdProvider?, mappers?) 
 
   -->
  <settings>
  	<setting name="jdbcTypeForNull" value="NULL"/>
  	<setting name="mapUnderscoreToCamelCase" value="true"/>
  </settings>
  
// 베이스 패키지 설정
  <typeAliases>
  	<package name="com.kh.spring"/>
  </typeAliases>
  
  <typeHandlers>
  	<!-- <typeHandler handler="com.kh.spring.common.typehandler.StringArrayTypeHandler"/> -->
  	<package name="com.kh.spring.common.typehandler"/>
  </typeHandlers>
  
</configuration>
```

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
