<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp

	// 이전페이지(MemberSelect.jsp) 에서 sid 값 가져오기
	String sid = request.getParameter("sid");
	
	// DAO 객체 생성
	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		//dao.remove(sid);
		
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블의 제고하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		
		if(checkCount == 0)
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else
		{
			strAddr = "Notice.jsp";
			//-- 제거하지 못하는 사유를 안내하는 페이지...
			//   + 리스트로 돌아가기~
			//-- TBL_MEMBERSCORE 테이블의 데이터가
			//   TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우
			//   → 삭제가 불가능한 경우 
		}
		
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
	
	// 클라이언트에게 해당되는 페이지로 재안내
	response.sendRedirect(strAddr);

%>
