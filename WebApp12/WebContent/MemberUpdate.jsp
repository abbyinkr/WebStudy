<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberUpdate.jsp

	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	// MemberDAO 인스턴스 생성
	MemberDAO dao = new MemberDAO();
	
	// 이전 페이지(MemberUpdateForm에서 데이터 넘겨받기)
	String sid = request.getParameter("sid");
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	MemberDTO member = null;
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성
		member = new MemberDTO();
		
		// member 프로퍼티 담기
		member.setSid(sid);
		member.setName(uName);
		member.setTel(uTel);
		
		// update 구문 실행 dao의 updateMember() 메소드
		dao.modify(member);
		
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
	
	// 클라이언트에게 MemberSelect 페이지로 재안내
	response.sendRedirect("MemberSelect.jsp");

%>
