<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ taglib prefix="c" 
		uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="country" value="${'korea'}"/>
<c:if test="${country != null}">
  ������: <c:out value="${country}"/>
</c:if>
<p>
<c:choose>
  <c:when test="${country == 'Korea'}">
     <c:out value="${country}"/>�� �ܿ��� ���.
  </c:when>
  <c:when test="${country == 'Canada'}">
     <c:out value="${country}"/>�� �ܿ��� �ʹ� ���.
  </c:when>
  <c:otherwise>
     �׿��� ������� �ܿ��� �� �� ����.
  </c:otherwise>
</c:choose>




