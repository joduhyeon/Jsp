<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %> 
<title>ȸ��Ż��������</title>
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
	  <font><b>ȸ�������� �����Ǿ����ϴ�.</b></font></td>
  </tr>
  <tr>
    <td align="center"> 
      <p>����.... �����մϴ�. �ȳ��� ������.</p>
      <meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <input type="submit" value="Ȯ��">
    </td>
  </tr>
</table>
</form>
<%} else {%>
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
<%}%>