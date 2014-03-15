<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>전체회원목록</title>

<h2>전체회원목록</h2>
<form>
 <table border="1">
<c:forEach var="dto"  items="${list}" >
	      
				<tr>
					<td>
							&nbsp;아이디 :: ${dto.id}&nbsp;   <!-- getId()라고 하면 안됨 -->
					</td>
				</tr>
			
	</c:forEach>
	</table>
</form>

