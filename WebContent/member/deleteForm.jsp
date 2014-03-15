<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<title>È¸¿øÅ»Åð</title>
<script src="script.js"></script>
<center>
<body onload="begin3()">
<form name="userinput" action="/Jsp/member/deleteFormPro.nhn" onSubmit="return checkIt()" >
<table border=1>
		<tr>
				<td colspan=2 align="center">È¸¿øÅ»Åð</td>
		</tr>
		<tr>
				<td>ºñ¹Ð¹øÈ£</td>
				<td><input type="password" name="pw"/></td>
		</tr>
		<tr>
				<td colspan=2 align="center"><input type="submit" value="Å»Åð"/>
															<input type="button" value="Ãë¼Ò" onClick="login()"/></td>
		</tr>
</table>
</form>
</body>
</center>