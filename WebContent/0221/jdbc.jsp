<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<%@ page import="java.util.ArrayList" %>

<%
   DAO dao = DAO.getInstance();
   ArrayList<DTO> list = dao.select();
   for(DTO dto: list){
%>
	   아이디:<%=dto.getId() %><br/>
	   비밀번호:<%=dto.getPw() %><br/> 
	   비밀번호 확인:<%=dto.getPw2() %><br/>
	   주민번호:<%=dto.getNum1() %> <%=dto.getNum2() %><br/>
	   주소:<%=dto.getAdr1() %> <br/>
	   상세주소:<%=dto.getAdr2() %><br/>
	   전화번호:<%=dto.getSel1() %><%=dto.getPnum1() %><%=dto.getPnum2() %><br/> 
	   이메일:<%=dto.getEm1() %><%=dto.getEm2() %><%=dto.getSel2() %><br/>
	   이메일수신:<%=dto.getEmr() %><br/>
	   <hr/>
<%}%> 

   