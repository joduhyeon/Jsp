<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<%@ page import="java.util.ArrayList" %>

<%
   DAO dao = DAO.getInstance();
   ArrayList<DTO> list = dao.select();
   for(DTO dto: list){
%>
	   ���̵�:<%=dto.getId() %><br/>
	   ��й�ȣ:<%=dto.getPw() %><br/> 
	   ��й�ȣ Ȯ��:<%=dto.getPw2() %><br/>
	   �ֹι�ȣ:<%=dto.getNum1() %> <%=dto.getNum2() %><br/>
	   �ּ�:<%=dto.getAdr1() %> <br/>
	   ���ּ�:<%=dto.getAdr2() %><br/>
	   ��ȭ��ȣ:<%=dto.getSel1() %><%=dto.getPnum1() %><%=dto.getPnum2() %><br/> 
	   �̸���:<%=dto.getEm1() %><%=dto.getEm2() %><%=dto.getSel2() %><br/>
	   �̸��ϼ���:<%=dto.getEmr() %><br/>
	   <hr/>
<%}%> 

   