---
별칭:
  - "강의 - hello-spring:첨부파일 트랜젝션"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/백엔드
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/37324ee568414c8dbb71ecb75aa3b12b
주제:
  - "[[00 - 대시보드/주제/Spring|Spring]]"
  - "[[00 - 대시보드/주제/Database·SQL|Database·SQL]]"
  - "[[00 - 대시보드/주제/웹 기능 구현|웹 기능 구현]]"
---

# 강의: hello-spring:첨부파일 트랜젝션

## 강의 내용

---

---

[[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/트랜젝션.txt|트랜젝션.txt]]

## 1. 트랜잭션 처리

![[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/첨부/9e215321_Untitled.png]]

- 원래 진행하던 방식대로는 DML 요청시 try - catch
- 이제는 필요없지만, 있는것과 동일함 AOP 때문임.
- `@Transaction`은 **Runtime 예외가 발생시에만 rollback처리**
- Board 성공, Attachment 성공 : 둘 다 성공시에만 commit처리되어야함.
    - 둘 중 하나라도 실패하면 rollback !! 이게 트랜잭션
- (rollbackFor = Exception.class) : 전체 예외에 대해서 rollback해주세요.

```java
// BoardServiceImpl

@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Board board) {
		// 1. board insert
		int result = boardDao.insertBoard(board);
		log.debug("board#no = {}", board.getNo());
		// 2. attachments insert
		List<Attachment> attachments = board.getAttachments();
		if(!attachments.isEmpty()) {
			for(Attachment attach : attachments) {
				attach.setBoardNo(board.getNo());
				result = boardDao.insertAttachment(attach);
			}
		}
		return result;
	}

```

<aside>
📌 Attachment에서 현재 fk 인 boardNo가 없다. 
발급된 시퀀스 조회 쿼리가 중간에 들어가야함.
”`select seq_no.currval from dual`"  —> 자주일어나는 일이기 때문에 mybatis에 있음
`selectKey`

</aside>

```java
// board-mapper

<insert id="insertBoard">
	insert into 
		board (no, title, member_id, content) 
	values (
		seq_board_no.nextval, 
		#{title}, 
		#{memberId}, 
		#{content})
	<selectKey keyProperty="no" resultType="_int" order="AFTER">
		select 
			seq_board_no.currval
		from
			dual
	</selectKey>
</insert>
```

- <u>***속성 값들 대소문자 명확히 구분하니 주의!!***</u>

`keyProperty` : board의 param을 가리킴. setNo를 호출에서 처리해준다는 의미

- 전달된 board객체에 no를 담아라~

`resultType` : _int 기본 int형이라는 것.

`order` :  BEFORE, AFTER : 메인쿼리 전에 처리할지 후에 처리할지에 대한 설정임. 

- board#no가 들어오는 코드
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/첨부/3d675844_Untitled.png]]
    

#### #13. STS 트랜잭션 처리 pom.xml | root-context.xml | servlet.context.xml

---

- aop : around advice
    - 시작하기전에 트랜잭션 스타트
    - 끝나기전 트랜잭션 종료하면서 `commit` or `rollback`
- aop 를 안쓴다고해도 트랜잭션 처리를 위해 필수임. (DB관련 설정)
    - DB 관련설정은 root-context에서 관리돼고 있음.

```xml
// pom.xml
<!-- #11. aop처리를 위한 의존  -->
<!-- #13. 트랜잭션처리를 위한 aop의존 -->
<!-- AspectJ -->
<dependency>
	<groupId>org.aspectj</groupId>
	<artifactId>aspectjrt</artifactId>
	<version>${org.aspectj-version}</version>
</dependency>	
<dependency>
    <groupId>org.aspectj</groupId>
    <artifactId>aspectjweaver</artifactId>
    <version>${org.aspectj-version}</version>
</dependency>
```

- 추상화를 이용
    - DB 관련 기능 어떤걸 사용할지 모르니까 추상화
- 트랜잭션 매니저빈 id를 tx에서 사용함.
- tx 네임스페이스 선언하기!
    
    ![[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/첨부/b7d73142_Untitled.png]]
    

```xml
// root-context.xml
<!-- #13.1. 트랜잭션 매니져 빈 설정 -->
	<bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
		<property name="dataSource" ref="dataSource"/>
	</bean>
	
	<!-- #13.2. @Transactional 어노테이션이 붙은 메소드대상으로 Transaction Advice 적용 -->
	<tx:annotation-driven transaction-manager="transactionManager"/>
```

![[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/첨부/4c307acd_Untitled.png]]

transaction-manager 기본값이 transactionManager라서 생략 가능 하지만 명시해둠!

<aside>
📌 위 내용대로 적용한 후에는 사용할 **MVC흐름중에 적용해야 하기 때문에** (service에서 사용) MVC의 Bean은 **servlet-context에서 관리되어야함.** 
aop관련 어노테이션 등록한 태그가 이 역할도 해줌!

</aside>

- servlet-context.xml
    - #11.2. aop관련 어노테이션 등록처리
    - #13.3. root-context의 transaction aop설정을 servlet-context에 적용
    
```xml
<aop:aspectj-autoproxy />
```


### ✔ 알아야할 내용

#### 1. `@NonNull` = `if(abcd ≠ null)` : 유용한 Lombok 어노테이션

---

**Nullness Annotations**

`@NonNull` : null을 허용하지 않을 경우

`@Nullable` : null을 허용할 경우

#### 2. `@Transactional` 어노테이션 설정

---

`rollbackFor = Exception.class`

위 설정하나만 필요한 이유

- 기본 설정으로 Runtime 예외 발생시에만 rollback처리

[Data Access](https://docs.spring.io/spring-framework/docs/current/reference/html/data-access.html#spring-data-tier)

[[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/첨부/transaction.txt|transaction.txt]]

#### 3. `@Service` 와 `@Transactional` 같이 사용가능!!

---

```java
package com.kh.spring.board.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.dto.Attachment;
import com.kh.spring.board.model.dto.Board;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class BoardServiceImpl implements BoardService {
	....
}
```

## 하위 노트

- [[02 - 학습/KH 교육과정 2022/수업 필기/hello-spring-첨부파일 트랜젝션/트랜젝션.txt|트랜젝션.txt]]

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
