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
	  <font><b>ȸ�������� �����Ǿ����ϴ�.</b></font>
	</td>
  </tr>
  <tr>
    <td align="center"> 
      <p>�Է��Ͻ� ������ ������ �Ϸ�Ǿ����ϴ�.</p>
    </td>
  </tr>
  <tr>
    <td align="center"> 
      <form>
	    <input type="button" value="��������" onclick="window.location='main.jsp'">
      </form>
      5���Ŀ� �������� �̵��մϴ�.<meta http-equiv="Refresh" content="5;url=main.jsp" >
    </td>
  </tr>
</table>