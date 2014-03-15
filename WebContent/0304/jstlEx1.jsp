<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- 사용하려면 암기 필수  -->

id 변수값 설정

<%--  request.setAttribute("id" , "admin");     7,8 번줄이 동일하다 --%>
		<c:set var="id" value="admin"/> <br>
		
		
		<c:out value="${id}" /><br/>     <%-- out 출력을 담당 --%>
							${id}<p>           <%-- 같은 표현법 --%>
							
id 변수값 제거후
<c:remove var="id"/>
<c:out value="${id}" /> 