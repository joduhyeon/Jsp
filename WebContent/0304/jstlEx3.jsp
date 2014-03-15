<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>JSTL core 예제 - forEach</title>
</head>
<body>
<h3>Header 정보:</h3>

<c:forEach var="head" items="${headerValues}">      <!-- 업그레이드 for 문 -->
  param: <c:out value="${head.key}"/><br>
  values:
    		<c:forEach var="val" items="${head.value}">
     					<c:out value="${val}"/>
   			</c:forEach>
   			<p>
</c:forEach>

<c:forEach var="a" begin="1" end="10" step="1" >
 	${a} <br/>
 </c:forEach>


</body>
</html>
