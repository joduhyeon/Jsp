<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>����������</title>
<script>
function begin(){
    document.form.id.focus();
}
function mf(){
	location.href="modify.jsp";
}
function mem(){
	location.href="membershipForm.jsp";
}
</script>
<%
  if(session.getAttribute("sessionId")==null){%>
<body onLoad="begin()">
<form name="form" action="loginPro.jsp" onSubmit="return checkIt()">
<table border=1>
<tr>
<td>���̵�</td><td><input type="text"  name="id"/></td>
</tr>
<tr >
<td>��й�ȣ</td><td><input type="text" name="pw"/></td>
</tr>
<tr><td colspan="2"><input type="submit" value="�α���"/>
<input type="reset" value="�ٽ��ۼ�"/>
<input type="button" value="ȸ������" onClick="mem()"/></td>
</table>
<table border= 1>
</form>
<% }  else {%>
<form action="logout.jsp">
<table border=1>
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> ���� <br/>
�α��� �ϼ̽��ϴ�.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="�α׾ƿ�"/>
<input type="button" value="ȸ����������" onClick="mf()"/></td>
</table>
<table border= 1>
<tr><td>
<a href="../board/list.jsp">�Խ���</a></td></tr>
</table>
</form>
<%} %>
</body>


