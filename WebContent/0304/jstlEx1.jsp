<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <!-- ����Ϸ��� �ϱ� �ʼ�  -->

id ������ ����

<%--  request.setAttribute("id" , "admin");     7,8 ������ �����ϴ� --%>
		<c:set var="id" value="admin"/> <br>
		
		
		<c:out value="${id}" /><br/>     <%-- out ����� ��� --%>
							${id}<p>           <%-- ���� ǥ���� --%>
							
id ������ ������
<c:remove var="id"/>
<c:out value="${id}" /> 