<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	// MemberScoreInsert.jsp
	
	// 이전페이지(MemberScoreInsertForm.jsp)에서 데이터 받아오기
	// sid, kor, eng, mat
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");

	// MemberScoreDTO 구성(SID, KOR, ENG, MAT)


	// MemberScoreDAO, MemberScoreDTO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setSid(sid);
		score.setKor(Integer.parseInt(korStr));
		score.setEng(Integer.parseInt(engStr));
		score.setMat(Integer.parseInt(matStr));
		
		// add() 메소드 호출 
		dao.add(score);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());		
	}
	finally
	{
		try
		{
			dao.close();	
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	// MemberScoreSelect.jsp 로 재안내
	response.sendRedirect("MemberScoreSelect.jsp");

%>
