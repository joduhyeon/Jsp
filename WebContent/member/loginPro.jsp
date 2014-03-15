<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- 아디 비번이 맞을때 -->
<c:if test="${requestScope.check eq 1}">
 				<c:redirect url="login.nhn">
 					<c:param name="auto" value="check" />
 				</c:redirect>
</c:if>  
 
 <!-- 비번이 다를때 -->
 <c:if test="${requestScope.check eq 0}">
				 <script>
				 		alert("비밀번호를 확인해주세요");
				 		history.go(-1);
				 </script>
</c:if>

 <!-- 아디가 다를때 -->
 <c:if test="${requestScope.check eq -1}">
				 <script>
				 		alert("아이디를 확인해주세요");
				 		history.go(-1);
				 </script>
</c:if>
