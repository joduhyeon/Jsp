<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*;" %>
<h2>&nbsp;ȸ����������</h2>
<%
String id=(String)session.getAttribute("sessionId");
DAO dao=DAO.getInstance();
DTO dto = dao.getMember(id);
%>
<form action="modifyPro.jsp">
<table border=1>
             
            <tr>
               <td width="120"> &nbsp;*���̵�</td>
               <td width="500"><%=dto.getId() %></td>
            </tr>
            <tr>
            <td> &nbsp;*��й�ȣ</td>
            <td><input type="password" name="pw" value="<%=dto.getPw() %>"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�ֹι�ȣ</td>
            <td><input type="text" name="num1" size="10" value="<%=dto.getNum1() %>"/>-
            <input type="text" name="num2" size="11" value="<%=dto.getNum2() %>" /></td>
            </tr>
            <tr>
            <td> &nbsp;*�ּ�</td>
            <td><input type="text" name="adr1" value="<%=dto.getAdr1() %>"/><input type="button" value="�ּҰ˻�"/></td>
            </tr>
            <tr>
            <td> &nbsp;*���ּ�</td>
            <td><input type="text" name="adr2" size="35" value="<%=dto.getAdr2() %>"/></td>
            </tr>
            <tr>
            <td>&nbsp;*�޴���</td>
            <td><select name="sel1"><option>010</option><option>011</option><option>017</option></select>
                <input type="text" name="pnum1" size="8" value="<%=dto.getPnum1() %>"/>-
                <input type="text" name="pnum2" size="8" value="<%=dto.getPnum2() %>"/></td>
            </tr>
            <tr>
            <td> &nbsp;*�̸���</td>
            <td><input type="text" name="em1" value="<%=dto.getEm1() %>"/>@
                <input type="text" name="em2" value="<%=dto.getEm2() %>"/>
                <select name="sel2">
                <option>�����Է�</option>
                <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>hanmail.com</option>
                         
                 </select>
            </td>
            </tr>
            <tr>
            <td> &nbsp;*�̸��ϼ���</td>
            <td><input type=radio name="emr" value="����"/>����
                  <input type=radio name="emr" value="��������"/>��������
                  </td>
            </tr>
           
            
</table>

 <input type="submit" value="���������Ϸ�"/>
 <input type="reset" value="�ٽ��ۼ�"/>


</form>