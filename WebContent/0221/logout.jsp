<%@ page contentType="text/html; charset=euc-kr"%>
<% 
	session.invalidate();
    //세션 지우기
%>
<%
 		Cookie[] cookies = request.getCookies();  //쿠키 0초 리셋 = 삭제
		
		if ( cookies != null ){
			for (int i= 0 ; i < cookies.length ; i++ ){
				if(cookies[i].getName().equals("cooId")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				} else if(cookies[i].getName().equals("cooPw")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		} 
%>
<script>
    	alert("로그아웃 되었습니다.");
    	location.href="login.jsp";
</script>