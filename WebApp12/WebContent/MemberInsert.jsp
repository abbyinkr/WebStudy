<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// MemberInsert.jsp
	//-- 데이터베이스의 테이블(TBL_MEMBER)에
	//   회원 데이터 추가 액션 처리 수행
	//   이후... 다시 리스트 페이지를 요청할 수 있도록 안내

	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	// 이전페이지(MemberInsertForm.jsp)에서 이름, 전화번호 넘겨받기
	String uName = request.getParameter("uName");
	String uTel = request.getParameter("uTel");
	int result=0;
	
	// MemberDAO
	MemberDAO dao = new MemberDAO();


	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// MemberDTO 객체 생성 및 속성 구성(→add() 메소드 호출 위해 필요)
		MemberDTO member = new MemberDTO();
		member.setName(uName);
		member.setTel(uTel);
		
		// insert 쿼리문을 수행하는 dao의 add()메소드 호출
		dao.add(member);
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	// 데이터베이스 종료
	dao.close();
	
	// 데이터가 입력되었으면 MemberSelect 페이지로 리다이렉트
	response.sendRedirect("MemberSelect.jsp");
	

%>

