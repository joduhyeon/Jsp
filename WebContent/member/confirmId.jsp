<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	���̵� : ${requestScope.id}<br/>${id}<br/>
	üũ��� : ${result}<br/>
 -->
 <script src="script.js"></script>
<center> 
<form action="member/confirmId.nhn" method="post">
<%-- ���̵� �ִٸ�--%> 
<c:if test="${result eq true}">
<table border="1">
		<tr>
		<td colspan="2" align="center">${id}<br/>�� �̹� �����ϴ� ID�Դϴ�.</td>
		</tr>
		<tr><td align="center"><input type="button" value="�ݱ�" onClick="setId()"/></tr>
</table>
</c:if>

<%--���̵� ���ٸ� --%>
<c:if test="${result ne true}">
<table border="1">
		<tr>
		<td colspan="2" align="center">${id}<br/> �� ��� �����մϴ�.<br/></td>
		</tr>
		<tr>
		<td align="center"><input type="button" value="�ݱ�" onclick="setId()" /></td>
		</tr>
</table>
</c:if>
</form>
</center>
