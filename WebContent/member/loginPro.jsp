<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <!-- �Ƶ� ����� ������ -->
<c:if test="${requestScope.check eq 1}">
 				<c:redirect url="login.nhn">
 					<c:param name="auto" value="check" />
 				</c:redirect>
</c:if>  
 
 <!-- ����� �ٸ��� -->
 <c:if test="${requestScope.check eq 0}">
				 <script>
				 		alert("��й�ȣ�� Ȯ�����ּ���");
				 		history.go(-1);
				 </script>
</c:if>

 <!-- �Ƶ� �ٸ��� -->
 <c:if test="${requestScope.check eq -1}">
				 <script>
				 		alert("���̵� Ȯ�����ּ���");
				 		history.go(-1);
				 </script>
</c:if>
