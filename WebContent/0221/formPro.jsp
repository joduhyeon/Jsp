<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<jsp:useBean class="db.DTO" id="dto"/>
<jsp:setProperty property="*" name="dto"/>
<%
 DAO dao=DAO.getInstance();
dao.insert(dto);
out.println("ȸ�������� ����ó���Ǿ����ϴ�.");
%>
<form>
<a href="login.jsp">�α�����������</a>
</form>
