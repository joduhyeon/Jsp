<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${check==1}"> 
	<meta http-equiv="Refresh" content="0;url=/Jsp/ch19/content.do?num=${num}&pageNum=${pageNum}&id=${id}" >
</c:if>

<c:if test="${check ne 1}"> 
<!--   ex1)
<h2>��й�ȣ�� �ٸ��ϴ�.</h2>
<a href="javascript:history.go(-1)">[��й�ȣ Ȯ�� â���� ���ư���]</a>
�۹�ȣ :: ${num}<br/>
������ ��ȣ :: ${pageNum}<br/>
üũ �� :: ${check}

 		ex2)
-->   <script>
					alert("��й�ȣ�� Ȯ�����ּ���");
					history.go(-1);
		</script>
 		
</c:if>