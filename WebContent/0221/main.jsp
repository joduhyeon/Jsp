<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>메인페이지</title>
<script>
function begin(){
    document.form.id.focus();
}
function mf(){
	location.href="modify.jsp";
}
function mem(){
	location.href="membershipForm.jsp";
}
</script>
<%
  if(session.getAttribute("sessionId")==null){%>
<body onLoad="begin()">
<form name="form" action="loginPro.jsp" onSubmit="return checkIt()">
<table border=1>
<tr>
<td>아이디</td><td><input type="text"  name="id"/></td>
</tr>
<tr >
<td>비밀번호</td><td><input type="text" name="pw"/></td>
</tr>
<tr><td colspan="2"><input type="submit" value="로그인"/>
<input type="reset" value="다시작성"/>
<input type="button" value="회원가입" onClick="mem()"/></td>
</table>
<table border= 1>
</form>
<% }  else {%>
<form action="logout.jsp">
<table border=1>
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> 님이 <br/>
로그인 하셨습니다.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="로그아웃"/>
<input type="button" value="회원정보수정" onClick="mf()"/></td>
</table>
<table border= 1>
<tr><td>
<a href="../board/list.jsp">게시판</a></td></tr>
</table>
</form>
<%} %>
</body>


