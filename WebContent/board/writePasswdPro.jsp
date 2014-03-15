<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.*"%>

<% request.setCharacterEncoding("euc-kr");%>

<%
try{
	int num=Integer.parseInt(request.getParameter("num")); // num을 불러왓음
	String pageNum = request.getParameter("pageNum");  
	String passwd=request.getParameter("passwd");

	BoardDBBean dao = BoardDBBean.getInstance();
	int check = dao.writePasswd(num,passwd);
	
	if(check == 1) {
	%> 
<meta http-equiv="Refresh" content="0;url=content.jsp?num=<%=num%>&pageNum=<%=pageNum%>">

<%} else { %>
<script>
alert("비밀번호가 맞지 않습니다");
history.go(-1);
</script>
<%}
} catch(Exception e)
{   e.printStackTrace();
    out.println("프로예외");    }
%>











