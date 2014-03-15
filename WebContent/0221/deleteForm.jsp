<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>회원탈퇴</title>
<script>
function main(){
	location.href="main.jsp";
}
function begin(){
	document.form.pw.focus();
}
function checkIt(){
	  if(!document.form.pw.value){
     alert("비밀번호를 입력하지 않으셨습니다.");
     document.form.pw.focus();
     return false;
   }
}
</script>
<body onload="begin()">
<form name="form" action="deletePro.jsp" onSubmit="return checkIt()" >
<table border=1>
<tr><td colspan=2 align="center">회원탈퇴</td></tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pw"/></td>
</tr>
<tr><td colspan=2 align="center"><input type="submit" value="회원탈퇴"/>
<input type="button" value="취소" onClick="main()"/></td></tr>
</table>
</form>
</body>