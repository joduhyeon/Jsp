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
    <td><%=id%>이미 사용중인 아이디입니다.</td>
  </tr>
</table>
<form name="checkForm" action="confirmId.jsp">
<table border=1>
  <tr>
    <td> 
       다른 아이디를 선택하세요.<p>
       <input type="text" size="10" maxlength="12" name="id"> 
       <input type="submit" value="ID중복확인">
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
      <p>입력하신 <%=id%> 는 사용하실 수 있는 ID입니다. </p>
      <input type="button" value="닫기" onclick="setid()">
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
