<%@ page contentType="text/html;charset=euc-kr" %>
<%@ include file="/view/color.jsp"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");

%>
<html>
<head>
<title>�� ��й�ȣ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">      
<!--      
  function checkpw(){	
	if(document.delForm.passwd.value==''){
	alert("��й�ȣ�� �Է��Ͻʽÿ�.");
	document.delForm.passwd.focus();
	return false;
 }
}    
// -->      
</script>
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>��й�ȣ Ȯ��</b>
<br>
<form method="POST" action="writePasswdPro.jsp?pageNum=<%=pageNum%>" 
   onsubmit="return checkpw()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="<%=value_c%>">
       <b>��й�ȣ�� �Է��� �ּ���.</b></td>
  </tr>
  <tr height="30">
     <td align=center >��й�ȣ :   
       <input type="password" name="passwd" size="8" maxlength="12">
	   <input type="hidden" name="num" value="<%=num%>"></td>
 </tr>
 <tr height="30">
    <td align=center bgcolor="<%=value_c%>">
      <input type="submit" value="Ȯ��" >
      <input type="button" value="���" 
       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 





