<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>ȸ��Ż��</title>
<script src="script.js"></script>
<center>
<body onload="begin3()">
<form name="userinput" action="/Jsp/member/deleteFormPro.nhn" onSubmit="return checkIt()" >
<table border=1>
		<tr>
				<td colspan=2 align="center">ȸ��Ż��</td>
		</tr>
		<tr>
				<td>��й�ȣ</td>
				<td><input type="password" name="pw"/></td>
		</tr>
		<tr>
				<td colspan=2 align="center"><input type="submit" value="Ż��"/>
															<input type="button" value="���" onClick="login()"/></td>
		</tr>
</table>
</form>
</body>
</center>