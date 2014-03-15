<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	try{
	  String id=request.getParameter("id");
	  String pw=request.getParameter("pw");
	  String autoLogin= request.getParameter("autoLogin");

	   // id, pw 확인 코드
		DAO dao=DAO.getInstance();
		int check=dao.userCheck(id,pw);
		if (check==1){
			if (autoLogin !=null ) {  //자동로그인 체크 할경우
				//쿠키생성
				Cookie coo1= new Cookie("cooId" , id);
				Cookie coo2= new Cookie("cooPw" , pw);
				//쿠키 유효기간
				coo1.setMaxAge(6000);
				coo2.setMaxAge(6000);
				
				//응답: 만든 쿠키를 클라이언트에게 준다.
				response.addCookie(coo1);
				response.addCookie(coo2);
				}
			
			//세션생성
			session.setAttribute("sessionId",id);
			session.setAttribute("sessionPw", pw);
			// 페이지 이동
			response.sendRedirect("login.jsp");
		}
		   else if (check==0) { 
%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다..");
	  history.go(-1);
	</script>
<%} } catch (Exception e){}	%>	
