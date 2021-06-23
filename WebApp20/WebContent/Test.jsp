<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
</head>
<body>

<%-- 테스트
<h1>pageNum : <%=pageNum %></h1>
<h1>num : <%=num %></h1> 
--%>

<div id="bbs">
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>


	<div id="bbsArticle">
	
		<div id="bbsArticle_header">
			<!-- 게시물 제목 -->
			제목
		</div>	

		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>한라봉</dd>
				<dt>라인수</dt>				
				<!-- <dd>2</dd> -->
				<dd></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
	
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd></dd>
				<dt>조회수</dt>
				<dd></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height:150">
					글내용
					</td>
				</tr>
			</table>
		</div><!-- #bbsArticle_content -->
		

			
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 -->
			
			
		</div><!-- .bbsArticle_bottomLine -->
		
		
		<div class="bbsArticle_noLine">
			<!-- 다음글 -->
			
					
		</div><!-- .bbsArticle_noLine -->
		
	</div><!-- #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		
	</div><!-- .bbsArticle_noLine -->
	
	

</div><!-- #bbs -->


























</body>
</html>