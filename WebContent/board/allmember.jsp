<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<%@ page import="java.util.ArrayList" %>
<%
   DAO dao = DAO.getInstance();
   ArrayList<DTO> list = dao.select();
   for(DTO dto: list){
%>
	   ¾ÆÀÌµנ:<%=dto.getId() %><br/>
<%}%> 