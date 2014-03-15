<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<jsp:useBean class="db.DTO" id="dto"/>
<jsp:setProperty property="*" name="dto"/>
<%
 DAO dao=DAO.getInstance();
dao.insert(dto);
out.println("회원가입이 정상처리되었습니다.");
%>
<form>
<a href="login.jsp">로그인페이지로</a>
</form>
