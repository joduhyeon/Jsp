<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>ȸ��Ż��</title>
<script>
function main(){
	location.href="main.jsp";
}
function begin(){
	document.form.pw.focus();
}
function checkIt(){
	  if(!document.form.pw.value){
     alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
     document.form.pw.focus();
     return false;
   }
}
</script>
<body onload="begin()">
<form name="form" action="deletePro.jsp" onSubmit="return checkIt()" >
<table border=1>
<tr><td colspan=2 align="center">ȸ��Ż��</td></tr>
<tr>
<td>��й�ȣ</td>
<td><input type="password" name="pw"/></td>
</tr>
<tr><td colspan=2 align="center"><input type="submit" value="ȸ��Ż��"/>
<input type="button" value="���" onClick="main()"/></td></tr>
</table>
</form>
</body>