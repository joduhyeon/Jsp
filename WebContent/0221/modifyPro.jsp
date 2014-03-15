<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*"%>
<jsp:useBean class="db.DTO" id="dto"/>
<jsp:setProperty name="dto" property="*" />
<%
    String id = (String)session.getAttribute("sessionId");
	dto.setId(id);

	DAO dao= DAO.getInstance();
    dao.updateMember(dto);
 %>
<table width="270" align="center">
  <tr> 
    <td height="39"  align="center">
	  <font><b>회원정보가 수정되었습니다.</b></font>
	</td>
  </tr>
  <tr>
    <td align="center"> 
      <p>입력하신 내용대로 수정이 완료되었습니다.</p>
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <form>
	    <input type="button" value="메인으로" onclick="window.location='main.jsp'">
      </form>
      5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
</table>