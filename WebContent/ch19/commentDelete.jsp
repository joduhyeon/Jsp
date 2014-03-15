<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<center><h2>댓글이 삭제되었습니다.</h2></center>

<meta http-equiv="Refresh" content="1;url=content.do?num=${num}&pageNum=${pageNum}" />
<%-- 왜 페이지 값이 안넘어 가냐? 
<c:redirect url="content.do?num=${num}&pageNum=${pageNum}" /> --%>