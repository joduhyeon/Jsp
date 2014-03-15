<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>로그인화면</title>
<!-- jstl 사용 -->
<script src="script.js"></script>
<!--  스크립트 임포트 -->

<c:if test="${sessionScope.id eq null}">
<center>
<body onLoad="begin()">
<form name="form" method="post" action="/Jsp/member/loginPro.nhn" onSubmit="return checkIt()">
<table border="1">
		<tr>
			<td>아이디 :</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>
			<td><input type="password" name="pw"/></td>
	   </tr>  
		<tr>
			<td colspan="2" align="center">
									<input type="checkbox" name="auto" value="1"/>자동로그인
									<input type="submit"  value="로그인" />
			 						<input type="button" value="회원가입" onclick="mem()"/>
			</td>
		</tr>
</table>
</form>
</center>
</c:if>
<c:if test="${sessionScope.id ne null}">
<center>
<form action="/Jsp/member/logout.nhn" method="post">
<table border="1">
		<tr>
			<td colspan="2" align="center">${id} 님이<br/>로그인 되었습니다
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"  value="로그아웃" />
			 						<input type="button" value="회원정보수정" onclick="modify()"/>
			 						<input type="button" value="회원탈퇴" onclick="deleteForm()" />
			</td>
		</tr>
		<tr>
			<td align="center"><input type="button" value="게시판" onclick="list()" /></td>
		</tr>
</table>
</form>
</body>
</center>
</c:if>



