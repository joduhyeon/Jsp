<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <title>JSTL core 예제 - forTokens</title>
</head>
<body>

<c:forTokens var="car" items="Sprinter Trueno AE86,RX-7 Savanna FC3S,Lancer Evolution III,RX-7 Efini FD3S" delims=",">
  자동차 이름: <c:out value="${car}"/><br>
</c:forTokens>
<!-- dellims이 구분을 지어주며 배열을 반복적으로 꺼내준다 -->

<c:forTokens var="car" items="a,b,c,d,e" delims=",">
  자동차 이름: <c:out value="${car}"/><br>
</c:forTokens>
</body>
</html>
