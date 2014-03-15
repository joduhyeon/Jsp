<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}"> 
	<meta http-equiv="Refresh" content="0;url=/Jsp/ch19/content.do?num=${num}&pageNum=${pageNum}&id=${id}" >
</c:if>

<c:if test="${check ne 1}"> 
<!--   ex1)
<h2>비밀번호가 다릅니다.</h2>
<a href="javascript:history.go(-1)">[비밀번호 확인 창으로 돌아가기]</a>
글번호 :: ${num}<br/>
페이지 번호 :: ${pageNum}<br/>
체크 값 :: ${check}

 		ex2)
-->   <script>
					alert("비밀번호를 확인해주세요");
					history.go(-1);
		</script>
 		
</c:if>