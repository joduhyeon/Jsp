<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "board.*" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="/view/color.jsp"%>
<script>
function mf(){
	location.href="../0221/modifyForm.jsp";
}
function pw(){
	alert("��й�ȣ�� �Է����ּ���");
}
</script>
<%!
    int pageSize = 10;         //������ ������ 10
    SimpleDateFormat sdf = 
    new SimpleDateFormat("yyyy-MM-dd HH:mm");
    //1�������� ��ϰ��� , �Խñ� �ð�
%>
      
<%
    String pageNum = request.getParameter("pageNum");   
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);     //���� �������� String �̴ϱ� ���ڷ� ����ȯ
    int startRow = (currentPage - 1) * pageSize + 1;  //ù°�� = ����������(1-1*10)+1  = 1 
    int endRow = currentPage * pageSize;              //���� = 1* 10 = 10
    int count = 0;                                            
    int number=0;                   //�۹�ȣ

    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();                              
    if (count > 0) {                                                  // ���� ������ 1����
        articleList = dbPro.getArticles(startRow, endRow);     //list�� �������� articleList��  getAticles(1,10) �ִ´�.
    }

	   number=count-(currentPage-1)*pageSize;            //number = 1-(1-1)*10 =  1
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>�۸��(��ü ��:<%=count%>)</b>           <!--  �۸�� = 1 -->
<form action="../0221/logout.jsp">
       
<% if (session.getAttribute("sessionId") ==null ) { %>
<table width="700">
	<tr>
	<td align="right" bgcolor="<%=value_c%>"> <a href="../0221/login.jsp">�α���</a> 
	</td>
	<tr>
</table>	

<% } else if((session.getAttribute("sessionId").equals("������")) )  { %>
<table border=1 align="center">
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> ���� <br/>
�α��� �ϼ̽��ϴ�.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="�α׾ƿ�"/>
<input type="button" value="ȸ����������" onClick="mf()"/></td>
</table>
<table width="700">
<tr>
<td align="right" bgcolor="<%=value_c%>">  
                              <a href="writeForm.jsp">�۾���</a>
    &nbsp;&nbsp;&nbsp;<a href="mylist.jsp">���Ǳ۸��</a>
    &nbsp;&nbsp;&nbsp;<a href="allmember.jsp">���ȸ�����</a>
</td>
</tr>
</table>
<% } else { %>
<table border=1 align="center">
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> ���� <br/>
�α��� �ϼ̽��ϴ�.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="�α׾ƿ�"/>
<input type="button" value="ȸ����������" onClick="mf()"/></td>
</table>

<table width="700">
<tr>
<td align="right" bgcolor="<%=value_c%>">  
 
    <a href="writeForm.jsp">�۾���</a>
    &nbsp;&nbsp;&nbsp;<a href="mylist.jsp">���Ǳ۸��</a>
</td>
</tr>
</table>
<% }  

    if (count == 0) {                            //ī��Ʈ�� 0�̶�� �Խ��ǿ� ����ȱ��� ���ٶ�� ���,  1�̶��~ else��~
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    �Խ��ǿ� ����� ���� �����ϴ�.
    </td>
</table>

<%  } else {    %>                                 <!-- �۰��� = 1�̶�� -->
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
        for (int i = 0 ; i < articleList.size() ; i++) {                             //List�� 1���� �������
          BoardDataBean article = (BoardDataBean)articleList.get(i);       //1���� ���
%>
   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>           <!--  ���� number�� ���� 1�̴�  -->
    <td  width="250" >
	<%
	      int wid=0; 
	      if(article.getRe_level()>0){                                              //1���ۿ� ����� 1���ִٸ� wid = 5;
	        wid=5*(article.getRe_level());
	%>
	  <img src="images/level.gif" width="<%=wid%>" height="16">         <!--  �̹����� ���ο����� 5 -->
	  <img src="images/re.gif">                                                   
			<%}else{%>
	  <img src="images/level.gif" width="<%=wid%>" height="16">           <!-- ����� ���ٸ� ���ο��� 0
	                                                                                               �����ص� ����            -->
	<%}
           
	      if (session.getAttribute("sessionId")==null) {%>
<a href="writePasswd.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  value="<%=article.getPasswd()%>" onClick="pw()"> <!-- ��ȣ1�� ������������ ��� -->
            <%=article.getSubject()%>  
</a>                 
	<%  } else if ((session.getAttribute("sessionId").equals("������")) ){ %>  
<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  value="<%=article.getPasswd()%>" > <!-- ��ȣ1�� ������������ ��� -->
            <%=article.getSubject()%>  
 </a>                 
          <%} else { %> 
<a href="writePasswd.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  onClick="pw()"/> <!-- ��ȣ1�� ������������ ��� -->
              <%=article.getSubject()%>
 </a>                 
          
          <%}  if(article.getReadcount()>=20){%>              <!--  ���� 20���̻� ������  hot.gif �� ����-->
         <img src="images/hot.gif" border="0"  height="16"><%}%> </td>
    <td align="center"  width="100"> 
       <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td align="center"  width="150"><%= sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getReadcount()%></td>
    <td align="center" width="100" ><%=article.getIp()%></td>
  </tr>
     <%}%>
</table>
<%}%>

<%
    if (count > 0) {        //ī��Ʈ�� 1
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);       //int pageCount = 1/10+(1%10 ==0 ? 0 : 1) = ������  1 
		int startPage= (int)(currentPage/10)*10+1;                                          //startPage = (int)(1/10)*10+1 =   ������ 1
		int pageBlock=10;     
        int endPage = startPage + pageBlock-1;                                           //endPage = 1+ 10-1 = 10
        
        if (endPage > pageCount) {                              //10 >1 ��
        	endPage = pageCount;                                //endPage�� ������1�̴�
        	}
        
   		if (startPage > 10) {    %>                                                
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[����]</a>    <!--  startPage = 1 ->> false  -->
<%    }
   				   
         for (int i = startPage ; i <= endPage ; i++) {  %>                   <!-- startPage=1 endPage=1 �̹Ƿ� 1�� ��� -->
     	 <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>           <!--  1 -->
<%     }
    	    
      	 if (endPage < pageCount) {  %>                                         
      	 <a href="list.jsp?pageNum=<%= startPage + 10 %>">[����]</a>    <!--  10 < 1  false -->
<%	 }
    }
%>
</form>
</center>
</body>
</html>