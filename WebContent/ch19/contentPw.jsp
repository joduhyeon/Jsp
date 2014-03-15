<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/view/color.jspf"%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="JavaScript">      
<!--      
  function checkIt(){	
	if(document.contentPw.passwd.value==''){
	alert("비밀번호를 입력하십시요.");
	document.delForm.passwd.focus();
	return false;
 }
}    
// -->      
</script>
</head>

<body bgcolor="${bodyback_c}">
<center><b>비밀번호 확인</b>
<br>
<form method="POST" name="contentPw"  action="/Jsp/ch19/contentPwPro.do"
   onsubmit="return checkIt()"> 
 <table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
  <tr height="30">
     <td align=center  bgcolor="${value_c}">
       <b>비밀번호를 입력해 주세요.</b></td>
  </tr>
  <tr height="30">
     <td align=center >비밀번호 :   
       <input type="password" name="passwd" size="8" maxlength="12">
	   <input type="hidden" name="num" value="${num}">
	   <input type="hidden" name="pageNum" value="${pageNum}">
	   <input type="hidden" name="id" value="${id}">
	   </td>
 </tr>
 <tr height="30">
    <td align=center bgcolor="${value_c}">
      <input type="submit" value="확인" >
      <input type="button" value="취소" 
       onclick="document.location.href='/Jsp/ch19/list.do?pageNum=${pageNum}'">     
   </td>
 </tr>  
</table> 
</form>
</body>
</html> 



