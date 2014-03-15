<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %> 
<title>회원탈퇴페이지</title>
<%
String id=(String)session.getAttribute("sessionId");
String pw=request.getParameter("pw");
DAO dao=DAO.getInstance();
boolean result=dao.deleteMember(id,pw);
if(result){
	session.invalidate();

%>
<form action="main.jsp" name="userinput" >
<table border="1">
  <tr> 
    <td align="center">
	  <font><b>회원정보가 삭제되었습니다.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>흑흑.... 서운합니다. 안녕히 가세요.</p>
      <meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="submit" value="확인">
    </td>
  </tr>
</table>
</form>
<%} else {%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%}%>