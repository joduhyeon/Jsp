<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>��üȸ�����</title>

<h2>��üȸ�����</h2>
<form>
 <table border="1">
<c:forEach var="dto"  items="${list}" >
	      
				<tr>
					<td>
							&nbsp;���̵� :: ${dto.id}&nbsp;   <!-- getId()��� �ϸ� �ȵ� -->
					</td>
				</tr>
			
	</c:forEach>
	</table>
</form>

