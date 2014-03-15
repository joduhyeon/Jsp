<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" %>

<%
	// getAttribute 는 Object를 리턴함 -> String으로 형변환 필요.
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionPw = (String)session.getAttribute("sessionPw");
	String cooId = "";
	String cooPw = "";
	
	try{
		Cookie[] cookies = request.getCookies(); // 요청에서 쿠키를 가져온다.
		
		if(cookies!=null){ // ID,PW 쿠키가 있을때
			for(int i=0; i<cookies.length; i++){                        
				if(cookies[i].getName().equals("cooId")){  //cooId를 받아온뒤 id에 저장.
					cooId=cookies[i].getValue();
				}
				if(cookies[i].getName().equals("cooPw")){  //cooPw를 받아온뒤 pw에 저장.
					cooPw=cookies[i].getValue();
				}
			}
		
			if(cooId.equals("")){  // 쿠키에서 id를 찾지 못했을때
				%>
				쿠키에서 id를 찾지 못했을때
				<%
				response.sendRedirect("form.jsp"); // 리다이렉트
			}
			if(cooPw.equals("")){  // 쿠키에서 id를 찾지 못했을때
				%>
				쿠키에서 id를 찾지 못했을때
				<%
				response.sendRedirect("form.jsp"); // 리다이렉트
			}
		}else{ // ID,PW 쿠키가 없을때
			response.sendRedirect("form.jsp"); // 리다이렉트
		}
	}catch(Exception e){}
%>


<form method="post" action="logoutForm.jsp">
	<h1 align="center">현재 로그인 정보 </h1> 
		<font align="center">
	
	
	<table border=1 align="center" width=61%>
		<!--1번줄-->
		<tr>
			<td align="center">
				아이디
			</td>
			
			<td align="center">
				세션 : <%=sessionId%> // 쿠키 : <%=cooId%> <br/>
			</td>
		</tr>
		
		<!--2번줄-->
		<tr>
			<td align="center">
				비밀번호
			</td>
			
			<td align="center">
				세션 : <%=sessionPw%> // 쿠키 : <%=cooPw%> <br/>
			</td>
		</tr>
	</table>
	
	
	<table  align="center" >
			<tr>
				<td>
					<input type="submit" value="로그아웃" />
				</td>
			</tr>
	</table>

</form>