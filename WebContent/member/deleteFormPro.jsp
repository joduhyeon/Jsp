<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq true}">
<h2>ȸ��Ż�� ���� ó�� �Ǿ����ϴ�</h2>
<p>3���Ŀ� �α��� �������� �̵��մϴ�</p>
<meta http-equiv="Refresh" content="3;url=login.nhn" >
</c:if>

<c:if test="${result eq false }">
<script>
			alert("��й�ȣ�� ���� �ʽ��ϴ�");
			history.go(-1);
</script>
</c:if>
