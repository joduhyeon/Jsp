<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<%
String id=request.getParameter("id");
DAO dao=DAO.getInstance();
boolean result=dao.confirmId(id);
%>
<%
    if(result) {
%>       
<table border=1>
  <tr> 
    <td><%=id%>�̹� ������� ���̵��Դϴ�.</td>
  </tr>
</table>
<form name="checkForm" action="confirmId.jsp">
<table border=1>
  <tr>
    <td> 
       �ٸ� ���̵� �����ϼ���.<p>
       <input type="text" size="10" maxlength="12" name="id"> 
       <input type="submit" value="ID�ߺ�Ȯ��">
    </td>
  </tr>
</table>
</form>
<%
    } else {
%>
<table border=1>
  <tr> 
    <td align="center"> 
      <p>�Է��Ͻ� <%=id%> �� ����Ͻ� �� �ִ� ID�Դϴ�. </p>
      <input type="button" value="�ݱ�" onclick="setid()">
    </td>
  </tr>
</table>
<%
    }
%>
</body>
</html>
<script>
  function setid(){		
    	opener.document.userinput.id.value="<%=id%>";
    	self.close();
	}
</script>
