<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>

<jsp:useBean id="dto" class="com.test.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%-- getParameter로 넘겨받은 모든 데이터 중 dto 빈의 파리미터와 이름이 같으면 set파라미터 해준다
즉, 넘겨받은데이터=수정된 데이터로 dto를 구성해준다 --%>


<%
	String pageNum = request.getParameter("pageNum");

	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.updateData(dto);
	
	// result 값에 따른 분기 처리 가능

	DBConn.close();
	

	response.sendRedirect(cp + "/Article.jsp?pageNum=" + pageNum + "&num=" + dto.getNum());
%>
