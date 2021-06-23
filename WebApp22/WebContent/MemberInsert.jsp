<%@page import="java.util.List"%>
<%@page import="com.test.core.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>

<%

	// MemberInsert.jsp → 스크립트릿 영역만 사용.. 
	// MemberList.jsp 에서 사용할 수 있도록 처리

	String[] names = request.getParameterValues("name");
	String[] tels = request.getParameterValues("tel");
	String[] addrs = request.getParameterValues("addr");
	
	MemberDTO dto = null;
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	for(int i=0; i<names.length; i++)
	{	
		dto= new MemberDTO(names[i], tels[i], addrs[i]);
		lists.add(dto);
		
	}
	
	request.setAttribute("lists", lists);
	
	// 선생님 풀이
	/*
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	for(int i=1; i<=5; i++)
	{
		MemberDTO ob = new MemberDTO(
					request,getParameter("name"+i)
					, request,getParameter("tel"+i)
					, request,getParameter("addr"+i));
		lists.add(ob);
	}
	
	request.setAttribute("lists", lists);
	*/


%>


<jsp:forward page="MemberList.jsp"></jsp:forward>
