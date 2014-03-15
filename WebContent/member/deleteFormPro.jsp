<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${result eq true}">
<h2>회원탈퇴가 정상 처리 되었습니다</h2>
<p>3초후에 로그인 페이지로 이동합니다</p>
<meta http-equiv="Refresh" content="3;url=login.nhn" >
</c:if>

<c:if test="${result eq false }">
<script>
			alert("비밀번호가 맞지 않습니다");
			history.go(-1);
</script>
</c:if>
