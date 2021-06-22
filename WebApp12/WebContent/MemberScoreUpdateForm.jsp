<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 데이터 수신 (MemberScoreSelect.jsp 로부터... sid 수신)
	String sid = request.getParameter("sid");
	String name = "";
	int kor, eng, mat;
	kor=eng=mat=0;
	
	// name 을 조회하기 위해 dao 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		// 수신한 sid 를 활용하여 name 얻어내기
		MemberScoreDTO score = dao.search(sid);
		name = score.getName();
		kor = score.getKor();
		eng = score.getEng();
		mat = score.getMat();
		
		
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 종료
			dao.close();	
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberScoreUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<script type="text/javascript">
	
	
	function memberScoreSubmit()
	{
		// 테스트
		//alert("함수 호출 확인");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		if(kor.value=="" || isNaN(kor.value) || Number(kor.value)<0 || Number(kor.value)>100)
		{
			korMsg.style.display = "inline";
			kor.focus();
			return;
		}
		if(eng.value=="" || isNaN(eng.value) || Number(eng.value)<0 || Number(eng.value)>100)
		{
			engMsg.style.display = "inline";
			eng.focus();
			return;
		}
		if(mat.value=="" || isNaN(mat.value) || Number(mat.value)<0 || Number(mat.value)>100)
		{
			matMsg.style.display = "inline";
			mat.focus();
			return;
		}
		
		// 폼 객체 직접 지정하여 submit
		memberScoreForm.submit();
	}
	
	function memberScoreReset()
	{
		// 테스트
		//alert("취소 버튼 클릭");
		
		var memberScoreForm = document.getElementById("memberScoreForm");
		var kor = document.getElementById("kor");
		var korMsg = document.getElementById("korMsg");
		var engMsg = document.getElementById("engMsg");
		var matMsg = document.getElementById("matMsg");
		
		// 에러메세지 초기화
		korMsg.style.display = "none";
		engMsg.style.display = "none";
		matMsg.style.display = "none";
		
		// 폼 객체 직접 지정하여 reset
		memberScoreForm.reset();
		kor.focus();
		
		
	}


</script>

</head>
<body>

	<!-- 회원 성적 수정 폼 구성 -->
	<!-- get 방식으로 URL 구성하여 sid 값 넘겨주기 -->
	<form action="MemberScoreUpdate.jsp?sid=<%=sid %>" method="post" id="memberScoreForm">
	<!-- 또는 hidden Element 로 구성하여 sid 값 넘겨주기 -->
	<%-- <input type="hidden" name="sid" value="<%=sid %>"> --%>
		<table class="table">
			<tr>
				<th>번호</th>
				<td>
					<%=sid %>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<%=name %>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txtScore" value="<%=kor%>">
				</td>
				<td>
					<span class="errMsg" id="korMsg">
						0 ~ 100 사이의 국어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txtScore" value="<%=eng%>">
				</td>
				<td>
					<span class="errMsg" id="engMsg">
						0 ~ 100 사이의 영어 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txtScore" value="<%=mat%>">
				</td>
				<td>
					<span class="errMsg" id="matMsg">
						0 ~ 100 사이의 수학 점수를 입력해야 합니다.
					</span>
				</td>
			</tr>
		</table>
		<br>
		<a href="javascript:memberScoreSubmit()"><button type="button">수정하기</button></a>
		<a href="javascript:memberScoreReset()"><button type="button">취소하기</button></a>
		<a href="MemberScoreSelect.jsp"><button type="button">목록으로</button></a>
	</form>

</body>
</html>