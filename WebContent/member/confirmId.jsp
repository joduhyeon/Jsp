<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
	아이디 : ${requestScope.id}<br/>${id}<br/>
	체크결과 : ${result}<br/>
 -->
 <script src="script.js"></script>
<center> 
<form action="member/confirmId.nhn" method="post">
<%-- 아이디가 있다면--%> 
<c:if test="${result eq true}">
<table border="1">
		<tr>
		<td colspan="2" align="center">${id}<br/>는 이미 존재하는 ID입니다.</td>
		</tr>
		<tr><td align="center"><input type="button" value="닫기" onClick="setId()"/></tr>
</table>
</c:if>

<%--아이디가 없다면 --%>
<c:if test="${result ne true}">
<table border="1">
		<tr>
		<td colspan="2" align="center">${id}<br/> 는 사용 가능합니다.<br/></td>
		</tr>
		<tr>
		<td align="center"><input type="button" value="닫기" onclick="setId()" /></td>
		</tr>
</table>
</c:if>
</form>
</center>
