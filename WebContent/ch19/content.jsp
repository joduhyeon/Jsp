<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf"%>
<c:if test="${id==null}">
<c:redirect url="/member/login.nhn"/>
</c:if>
<html>
<head>
<title>�۳���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type='text/css'>
<!--
a:link { color:black; text-decoration:none; }
a:visited {  }
a:active { text-decoration:underline; }
a:hover { text-decoration:underline; background-image:url('text_dottdeline.gif'); background-repeat:repeat-x; background-position:50% 100%; }
-->
</style>
<style>
<!--
@font-face {font-family:����; src:url();}
body,td,a,div,p,pre,input,textarea {font-family:����;font-size:9pt;}
-->
</style>
</head>

<body bgcolor="${bodyback_c}">  
<center><b>�۳���</b>
<br>

<form>
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">�۹�ȣ</td>
    <td align="center" width="125" align="center">${article.num}</td>
    <td align="center" width="125" bgcolor="${value_c}">��ȸ��</td>
    <td align="center" width="125" align="center">${article.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">�ۼ���</td>
    <td align="center" width="125" align="center">${article.writer}</td>
    <td align="center" width="125" bgcolor="${value_c}" >�ۼ���</td>
    <td align="center" width="125" align="center">${article.reg_date}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">������</td>
    <td align="center" width="375" align="center" colspan="3">${article.subject}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="${value_c}">�۳���</td>
    <td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="4" bgcolor="${value_c}" align="right" > 
	  <input type="button" value="�ۼ���" 
       onclick="document.location.href='/Jsp/ch19/updateForm.do?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="�ۻ���" 
       onclick="document.location.href='/Jsp/ch19/deleteForm.do?num=${article.num}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	   
			   <c:if test="${id eq 'admin'}" >
		      <input type="button" value="��۾���" 
		       onclick="document.location.href='/Jsp/ch19/writeForm.do?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
			   &nbsp;&nbsp;&nbsp;&nbsp;
			   </c:if>
			   
       <input type="button" value="�۸��" 
       onclick="document.location.href='/Jsp/ch19/list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>
</form>
</body>
</html>     
								<%-- ��� ����Ʈ  --%>
								<p><b>���</b></p> 
<form name="form" method="post" action="/Jsp/ch19/commentDelete.do" >								
<c:forEach var="list" items="${list}" >
<table border="1" width="400" cellspacing="0" cellpadding="0" align="center">
	<tr height="30">
		<td align="center">${list.writer}</td><td align="center">${list.reg_date} </td><td align="center">${list.ip}</td>
		<td align="center">
		<c:if test="${id eq 'admin'}" >
		<input type="submit" value="����"  />
		<input type="hidden" name="comment_num" value="${list.comment_num}"  />
		<input type="hidden" name="num" value="${num}"/>
		<input type="hidden" name="pageNum" value="${pageNum}"/>
		</c:if>
	    </td>
	</tr>
	<tr height="30">
			<td colspan="4" align="center">${list.content}</td>
	</tr>
</table>
</c:forEach>
</form>
								<%-- ��� �� --%>
<form name="form" action="/Jsp/ch19/commentWrite.do" method="post">
	<table border="1">
	<tr>
		<td>
	<%--	
		<input type="text" name="writer" value="${article.writer}" />
		<input type="text" name="passwd" value="��й�ȣ" onclick = "javascript:document.form.passwd.value='';" />
	--%>
		</td>
	</tr>
	<tr>
	<td ><textarea rows="2" cols="50" name="content" ></textarea>
			&nbsp;<input type="submit" value="����ۼ�" /></td>
	</tr>
	</table>       
						<input type="hidden" name="writer" value="${id}" />
						<input type="hidden" name="num" value="${num}"/>
						<input type="hidden" name="pageNum" value="${pageNum}"/>
						<input type="hidden" name="comment_num" value="${num}" />
					
				
</form>     
	
							
							
							
							
							
							
							
							
							
							
							
							
							

