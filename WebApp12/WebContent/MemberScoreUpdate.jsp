<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//MemberScoreUpdate.jsp
	
	// MemberScoreDTO 구성
	
	
	// 이전페이지(MemberScoreUpdateForm.jsp)에서 데이터 수신(sid, kor, eng, mat)
	String sid = request.getParameter("sid");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성 (생성자로 DB연결하지않았기때문에 try~catch문 바깥에서 생성해도 ok)
	MemberScoreDAO dao = new MemberScoreDAO();
	try
	{
		dao.connection();
		
		//MemberScoreDTO 인스턴스 생성 및 프로퍼티 구성
		MemberScoreDTO score = new MemberScoreDTO();		
		score.setSid(sid);
		score.setKor(Integer.parseInt(korStr));
		score.setEng(Integer.parseInt(engStr));
		score.setMat(Integer.parseInt(matStr));
		
		// update 쿼리문 수행 → MemberScoreDAO의 메소드 호출 → MemberScoreDTO 매개변수로 전달
		dao.modify(score);
		
		
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
	
	// 사용자에게 새로운 페이지 안내(MemberScoreSelect.jsp)
	response.sendRedirect("MemberScoreSelect.jsp");

%>
