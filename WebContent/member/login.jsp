<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>�α���ȭ��</title>
<!-- jstl ��� -->
<script src="script.js"></script>
<!--  ��ũ��Ʈ ����Ʈ -->

<c:if test="${sessionScope.id eq null}">
<center>
<body onLoad="begin()">
<form name="form" method="post" action="/Jsp/member/loginPro.nhn" onSubmit="return checkIt()">
<table border="1">
		<tr>
			<td>���̵� :</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>��й�ȣ :</td>
			<td><input type="password" name="pw"/></td>
	   </tr>  
		<tr>
			<td colspan="2" align="center">
									<input type="checkbox" name="auto" value="1"/>�ڵ��α���
									<input type="submit"  value="�α���" />
			 						<input type="button" value="ȸ������" onclick="mem()"/>
			</td>
		</tr>
</table>
</form>
</center>
</c:if>
<c:if test="${sessionScope.id ne null}">
<center>
<form action="/Jsp/member/logout.nhn" method="post">
<table border="1">
		<tr>
			<td colspan="2" align="center">${id} ����<br/>�α��� �Ǿ����ϴ�
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"  value="�α׾ƿ�" />
			 						<input type="button" value="ȸ����������" onclick="modify()"/>
			 						<input type="button" value="ȸ��Ż��" onclick="deleteForm()" />
			</td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="�Խ���" onclick="list()" /></td>
		</tr>
</table>
</form>
</body>
</center>
</c:if>



