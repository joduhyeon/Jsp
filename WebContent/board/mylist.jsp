// �׽�Ʈ �ּ�

<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "board.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/view/color.jsp"%>

<% 
     SimpleDateFormat sdf = 
     new SimpleDateFormat("yyyy-MM-dd HH:mm");
	 BoardDBBean dbPro = BoardDBBean.getInstance();
     String writer=(String)session.getAttribute("sessionId");
     ArrayList <BoardDataBean> list = dbPro.myList(writer);
     int num=1;
%>
<form>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center" name="pw"> 
    <tr height="30" bgcolor="<%=value_c%>"> 
      <td align="center"  width="50"  >�� ȣ</td> 
      <td align="center"  width="250" >��   ��</td> 
      <td align="center"  width="100" >�ۼ���</td>
      <td align="center"  width="150" >�ۼ���</td> 
      <td align="center"  width="50" >�� ȸ</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%
     for(int i=0; i<list.size(); i++) {
	   BoardDataBean article = (BoardDataBean)list.get(i);
	   
	   
%>
    <tr height="30">
    <td align="center"  width="50" ><%=num %></td>           <!--  ���� number�� ���� 1�̴�  -->
    <td  width="250" >
<a href="content.jsp?num=<%=article.getNum()%>"  value="<%=article.getPasswd()%>" > <!-- ��ȣ1�� ������������ ��� -->
            <%=article.getSubject()%>  
 </a>                    
          <% if(article.getReadcount()>=20){%>              <!--  ���� 20���̻� ������  hot.gif �� ����-->
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100" ><%=article.getIp()%></td>
  </tr>
<% num++; } %>
 </table>
 </form>
         

