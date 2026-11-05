---
별칭:
  - "강의 - 상세보기(XSS, 조회수, 첨부파일)"
tags:
  - type/lecture
  - context/studies
  - theme/dev
  - status/completed
  - domain/인프라
생성일: 
수정일: 2026-11-04
과목: "KH 교육과정 2022"
노션원본: https://www.notion.so/93c6da3896a14943baafaa1f8a18e267
주제:
  - "[[00 - 대시보드/주제/보안|보안]]"
  - "[[00 - 대시보드/주제/웹 기능 구현|웹 기능 구현]]"
  - "[[00 - 대시보드/주제/Java|Java]]"
---

# 강의: 상세보기(XSS, 조회수, 첨부파일)

## 강의 내용

---

---

### 1. HTML : boardList.jsp

---

1. 타이틀에 링크를 걸어준다.
2. `?no=`  사용자 입력값 작성될 곳 : 이 곳에 게시글 No번호를 넣어준다.
3. **** <% 자바공간 %> 안을 제외한 다른 코드에서 띄어쓰기를 하지 않아야 한다.**

```html
<a href="<%= request.getContextPath()%>/board/boardView?no=<%= board.getNo() %>"><%= board.getTitle() %></a>
```

<aside>
🔻 링크가 잘 걸렸는지 확인해준다 . 404오류 발생하지만 주소에 사용자 입력값 ?no=를 확인할 수 있다.

</aside>

- 게시판에서 저장된 파일이름을 노출시키지 않고 게시물등록할 때 저장된 이름을 노출시킨다.
- canEdit
    - `loginMember != null`  : 로그인한 회원이 null이 아니고
    - `&&`  : 그러면서
    - `(loginMember.getMemberId().equals(board.getMemberId())`  : 로그인한 회원의 Id와 현재 게시물의 Id와 같거나
    - `|| loginMember.getMemberRole() == MemberRole.A)` : 또는 로그인한 회원이 관리자인지

```java
<%@page import="board.model.dto.Attachment"%>
<%@page import="java.util.List"%>
<%@page import="board.model.dto.BoardExt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%여기에서 작성되어야 하위 폼에서 사용할 수 있다.
	BoardExt board = (BoardExt) request.getAttribute("board");
	boolean canEdit = loginMember != null 
			&& (loginMember.getMemberId().equals(board.getMemberId()) 
					|| loginMember.getMemberRole() == MemberRole.A);
%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/board.css" />
<section id="board-container">
	<h2>게시판</h2>
	<table id="tbl-board-view">
		<tr>
			<th>글번호</th>
			<td><%= board.getNo() %></td>
		</tr>
		<tr>
			<th>제 목</th>
			<td><%= board.getTitle() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%= board.getMemberId() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%= board.getReadCount() %></td>
		</tr>
		<% 
			List<Attachment> attachments = board.getAttachments();
			 // 파일이 없을 경우 예외발생할 수 있으므로 if조건식을 사용해준다.
				if(attachments != null && !attachments.isEmpty()){
				for(Attachment attach : attachments){ // 파일이 없을 경우 예외발생할 수 있으므로 
		%>
		<tr>
			<th>첨부파일</th>
			<td>
				<%-- 첨부파일이 있을경우만, 이미지와 함께 original파일명 표시 --%>
				<img alt="첨부파일" src="<%=request.getContextPath() %>/images/file.png" width=16px>
				<%-- 첨부파일 originalFilename (저장한 파일명은 노출하지 않는다)--%>
				<a href="<%= request.getContextPath() %>/board/fileDownload?no=<%= attach.getNo() %>"><%= attach.getOriginalFilename() %></a>
			</td>
		</tr>
		<%
				}
			}
		%>
		<tr>
			<th>내 용</th>
			<td><%= board.getContent() %></td>
		</tr>
		<% if(canEdit){ %>
		<tr>
			<%-- 작성자와 관리자만 마지막행 수정/삭제버튼이 보일수 있게 할 것 --%>
			<th colspan="2">
				<input type="button" value="수정하기" onclick="updateBoard()">
				<input type="button" value="삭제하기" onclick="deleteBoard()">
			</th>
		</tr>
		<% } %>
	</table>
</section>

<% if(canEdit){ %>
<form action="<%= request.getContextPath() %>/board/boardDelete" name="boardDeleteFrm" method="POST">
	<input type="hidden" name="no" value="<%= board.getNo() %>" />
</form>
<script>
/**
 * POST /board/boardDelete
 * - no전송
 * - 저장된 파일 삭제 : java.io.File 
 */
const deleteBoard = () => {
	if(confirm("정말 이 게시글을 삭제하시겠습니까?"))
		document.boardDeleteFrm.submit();
};	

const updateBoard = () => {
	location.href = "<%= request.getContextPath() %>/board/boardUpdate?no=<%= board.getNo() %>";
}
</script>
<% } %>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
```

### 2. controller : boardViewServlet#findByNo

---

- GET방식 : 상세보기 페이지 요청 (내용변경이 없기 때문에 GET방식을 사용한다.)
- 필드에 BoardService 객체생성

```java
@WebServlet("/board/boardView") : 어노테이션 설정
public class BoardViewServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
private BoardService boardService = new BoardService();

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	try {
		// 1.사용자입력값처리
		int no = Integer.parseInt(request.getParameter("no"));
		
		// 쿠키처리 : 조회수 증가 
		boolean hasRead = false;
		String boardCookieVal = "";
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				String name = cookie.getName();
				String value = cookie.getValue();
				if("boardCookie".equals(name)) {	
					boardCookieVal = value; // 기존쿠키값
					// 구분자가 있어야 8번과 88번글 읽을 때 오류가 없다.
					if(value.contains("|" + no + "|")) { 
						hasRead = true; // true면 아래 조회수 증가코드가 실행되지 않음.
					}
					break;
				}
			}
		}
		
		// 2.업무로직
		// 2-2 조회수 증가 : 디바이스별로 조회수를 인정한다.
		if(!hasRead) { // 게시글을 읽지 않았을때만 조회수 증가
			int result = boardService.updateReadCount(no);
			// 쿠키 새로 전송 (boardCookie 없는 경우 | 요청된 boardCookie에 현재 no가 없는 경우)
			Cookie cookie = new Cookie("boardCookie", boardCookieVal + "|" + no + "|");
			cookie.setPath(request.getContextPath() + "/board/boardView");//쿠키를 사용할 경로
			cookie.setMaxAge(365 * 24 * 60 * 60); // 1년
			response.addCookie(cookie);// 응답헤더에 Set-Cookie로 전송
			System.out.println("> boardCookie가 새로 생성되었음.");
		}
		
		// 2-1 게시글 조회
		// Board + Attachment 다 가지고 오기위해 BoardExt 객체를 생성함.
		BoardExt board = boardService.findByNo(no);
		
		//XSS 공격대비 (Cross-site Scripting공격) 변환
		board.setTitle(board.getTitle().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		board.setContent(board.getContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;"));
		
		// board#content 개행처리 - XSS < 문자열 변환작업이 완료된 후 br태그 추가
		변환된 문자열을 반환한걸 board에 저장해줘야함
		board.setContent(board.getContent().replaceAll("\n", "<br/>"));
		System.out.println(board);

		// 3.view단 위임
		request.setAttribute("board", board);
		request.getRequestDispatcher("/WEB-INF/views/board/boardView.jsp")
			.forward(request, response);
		
	} catch(Exception e) {
		e.printStackTrace();
		throw e;
	}
}
}
```

1. 사용자 입력값 처리
    1. 게시글 번호가 넘어옴 (** 사용자 입력값은 무조건 String)
2. 업무로직
    1. Board + Attachment 다 가지고 오기위해 BoardExt 객체를 생성함.
3. view단 위임
    1. 속성으로 찾아온 board를 request에 set해준다
    2. 지정경로로 포워딩처리 (jsp에서 request에 담겨온 board를 활용할 예정)
4. secure-cofing : 보안관련 해킹사례 문서들도 있고 그 중 하나인 xss 공격처리를 해봄.
    1. 실제 사용자 입력값이 들어갈 수 있는 부분은 전부 처리해주는게 좋다. (ex 제목)

<aside>
🔻 1. text area 처리 : HTML상의 개행문자 br태그로 변경하기 ( XSS처리 코드 아래에 작성)
2. XSS 공격 처리 : cross site / scripting

- html 태그로 사용되지 않도록 처리해준다
</aside>

### 3. Service : BoardService#findByNo

---

- 두 테이블을 조회하는 방법
    - join 해서 처리할 수 있지만 복잡
    - 두 테이블을 따로 따로 조회할 수 있도록 요청을 보냄.

```java
public BoardExt findByNo(int no) {
	Connection conn = getConnection();
	BoardExt board = boardDao.findByNo(conn, no); // board테이블 조회
	List<Attachment> attachments = boardDao.findAttachmentByBoardNo(conn, no); // attachment 테이블 조회
	board.setAttachments(attachments);
	close(conn);
	return board;
}

public Attachment findAttachmentByNo(int no) {
		Connection conn = getConnection();
		Attachment attach = boardDao.findAttachmentByNo(conn, no);
		close(conn);
		return attach;
	}

public int updateReadCount(int no) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.updateReadCount(conn, no); // 게시글 번호를 넘긴다.
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
```

### 4. Dao : BoardDao#findByNo

---

- findByNo : DQL
    - ResultSet을 board에 담아서 전달

```java
public BoardExt findByNo(Connection conn, int no) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	BoardExt board = null;
	String sql = prop.getProperty("findByNo");
	
	try {
		// select * from board where no = ?
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			board = handleBoardResultSet(rset);
		}
	} catch (SQLException e) {
		throw new BoardException("게시글 한건 조회 오류", e);
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return board;
}

public List<Attachment> findAttachmentByBoardNo(Connection conn, int no) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	List<Attachment> attachments = new ArrayList<>(); // 여러건은 미리 List를 만들어준다.
	String sql = prop.getProperty("findAttachmentByBoardNo");
	
	try {
		//findAttachmentByBoardNo = select * from attachment where board_no = ?
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, no);
		rset = pstmt.executeQuery();
		while(rset.next()) { // 첨부파일이 2개 있을 수 있기 때문에 while문으로 확인
			Attachment attach = handleAttachmentResultSet(rset);
			attachments.add(attach);
		}
	} catch (SQLException e) {
		throw new BoardException("게시글번호에 의한 첨부파일조회 오류", e);
	} finally {
		close(rset);
		close(pstmt);
	}
	
	return attachments;
}

public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateReadCount");
		try {
			// update board set read_count = read_count + 1 where no = ?
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			throw new BoardException("조회수 증가처리 오류", e);
		} finally {
			close(pstmt);
		}
		return result;
	}

private BoardExt handleBoardResultSet(ResultSet rset) throws SQLException {
	BoardExt board = new BoardExt();
	board.setNo(rset.getInt("no"));
	board.setTitle(rset.getString("title"));
	board.setMemberId(rset.getString("member_id"));
	board.setContent(rset.getString("content"));
	board.setReadCount(rset.getInt("read_count"));				
	board.setRegDate(rset.getDate("reg_date"));				
	return board;
}
private Attachment handleAttachmentResultSet(ResultSet rset) throws SQLException {
	Attachment attach = new Attachment();
	attach.setNo(rset.getInt("no"));
	attach.setBoardNo(rset.getInt("board_no"));
	attach.setOriginalFilename(rset.getString("original_filename"));
	attach.setRenameFilename(rset.getString("renamed_filename"));
	attach.setRegDate(rset.getDate("reg_date"));
	return attach;
}
```

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/a93aa6f0_Untitled.png]]

### 조회수

- 사이트 정책으로 결정해야하는 부분 ( ex : 인스타, 유튜브 둘 다 조회수 정책이 다름)
- 정하기 나름

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/6a30c852_Untitled.png]]

<aside>
🔻 상세보기 기능을 끝내고나면 게시글 등록후 목록보기한 경로를 작성한 글 상세보기로 경로 변경해주기

</aside>

![[02 - 학습/KH 교육과정 2022/수업 필기/첨부/64c9e645_Untitled.png]]

- board객체의 주소값을 controller와 service에서 알고 있어서 사용할 수 있다.

## 관련 노트

- 상위: [[02 - 학습/KH 교육과정 2022/수업 필기/KH 수업 필기|KH 수업 필기]]
