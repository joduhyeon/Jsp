// 테스트 주석

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
      <td align="center"  width="50"  >번 호</td> 
      <td align="center"  width="250" >제   목</td> 
      <td align="center"  width="100" >작성자</td>
      <td align="center"  width="150" >작성일</td> 
      <td align="center"  width="50" >조 회</td> 
      <td align="center"  width="100" >IP</td>    
    </tr>
<%
     for(int i=0; i<list.size(); i++) {
	   BoardDataBean article = (BoardDataBean)list.get(i);
	   
	   
%>
    <tr height="30">
    <td align="center"  width="50" ><%=num %></td>           <!--  글의 number는 현재 1이다  -->
    <td  width="250" >
<a href="content.jsp?num=<%=article.getNum()%>"  value="<%=article.getPasswd()%>" > <!-- 번호1의 현재페이지의 경로 -->
            <%=article.getSubject()%>  
 </a>                    
          <% if(article.getReadcount()>=20){%>              <!--  글을 20번이상 읽으면  hot.gif 가 생성-->
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
         

