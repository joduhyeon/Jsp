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
	alert("비밀번호를 입력해주세요");
}
</script>
<%!
    int pageSize = 10;         //페이지 사이즈 10
    SimpleDateFormat sdf = 
    new SimpleDateFormat("yyyy-MM-dd HH:mm");
    //1페이지의 목록갯수 , 게시글 시간
%>
      
<%
    String pageNum = request.getParameter("pageNum");   
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);     //현재 페이지가 String 이니까 숫자로 형변환
    int startRow = (currentPage - 1) * pageSize + 1;  //첫째열 = 현재페이지(1-1*10)+1  = 1 
    int endRow = currentPage * pageSize;              //끝열 = 1* 10 = 10
    int count = 0;                                            
    int number=0;                   //글번호

    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();                              
    if (count > 0) {                                                  // 글의 갯수가 1개면
        articleList = dbPro.getArticles(startRow, endRow);     //list의 참조변수 articleList에  getAticles(1,10) 넣는다.
    }

	   number=count-(currentPage-1)*pageSize;            //number = 1-(1-1)*10 =  1
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>           <!--  글목록 = 1 -->
<form action="../0221/logout.jsp">
       
<% if (session.getAttribute("sessionId") ==null ) { %>
<table width="700">
	<tr>
	<td align="right" bgcolor="<%=value_c%>"> <a href="../0221/login.jsp">로그인</a> 
	</td>
	<tr>
</table>	

<% } else if((session.getAttribute("sessionId").equals("관리자")) )  { %>
<table border=1 align="center">
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> 님이 <br/>
로그인 하셨습니다.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="로그아웃"/>
<input type="button" value="회원정보수정" onClick="mf()"/></td>
</table>
<table width="700">
<tr>
<td align="right" bgcolor="<%=value_c%>">  
                              <a href="writeForm.jsp">글쓰기</a>
    &nbsp;&nbsp;&nbsp;<a href="mylist.jsp">나의글목록</a>
    &nbsp;&nbsp;&nbsp;<a href="allmember.jsp">모든회원목록</a>
</td>
</tr>
</table>
<% } else { %>
<table border=1 align="center">
<tr>
<td colspan=2 align="center"><%=session.getAttribute("sessionId") %> 님이 <br/>
로그인 하셨습니다.</td>
</tr>
<tr><td colspan="2"><input type="submit" value="로그아웃"/>
<input type="button" value="회원정보수정" onClick="mf()"/></td>
</table>

<table width="700">
<tr>
<td align="right" bgcolor="<%=value_c%>">  
 
    <a href="writeForm.jsp">글쓰기</a>
    &nbsp;&nbsp;&nbsp;<a href="mylist.jsp">나의글목록</a>
</td>
</tr>
</table>
<% }  

    if (count == 0) {                            //카운트가 0이라면 게시판에 저장된글이 없다라고 출력,  1이라면~ else로~
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    게시판에 저장된 글이 없습니다.
    </td>
</table>

<%  } else {    %>                                 <!-- 글갯수 = 1이라면 -->
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
        for (int i = 0 ; i < articleList.size() ; i++) {                             //List의 1개가 담겨있음
          BoardDataBean article = (BoardDataBean)articleList.get(i);       //1개만 출력
%>
   <tr height="30">
    <td align="center"  width="50" > <%=number--%></td>           <!--  글의 number는 현재 1이다  -->
    <td  width="250" >
	<%
	      int wid=0; 
	      if(article.getRe_level()>0){                                              //1번글에 답글이 1개있다면 wid = 5;
	        wid=5*(article.getRe_level());
	%>
	  <img src="images/level.gif" width="<%=wid%>" height="16">         <!--  이미지의 가로영역이 5 -->
	  <img src="images/re.gif">                                                   
			<%}else{%>
	  <img src="images/level.gif" width="<%=wid%>" height="16">           <!-- 답글이 없다면 가로영역 0
	                                                                                               삭제해도 무관            -->
	<%}
           
	      if (session.getAttribute("sessionId")==null) {%>
<a href="writePasswd.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  value="<%=article.getPasswd()%>" onClick="pw()"> <!-- 번호1의 현재페이지의 경로 -->
            <%=article.getSubject()%>  
</a>                 
	<%  } else if ((session.getAttribute("sessionId").equals("관리자")) ){ %>  
<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  value="<%=article.getPasswd()%>" > <!-- 번호1의 현재페이지의 경로 -->
            <%=article.getSubject()%>  
 </a>                 
          <%} else { %> 
<a href="writePasswd.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"  onClick="pw()"/> <!-- 번호1의 현재페이지의 경로 -->
              <%=article.getSubject()%>
 </a>                 
          
          <%}  if(article.getReadcount()>=20){%>              <!--  글을 20번이상 읽으면  hot.gif 가 생성-->
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
    if (count > 0) {        //카운트가 1
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);       //int pageCount = 1/10+(1%10 ==0 ? 0 : 1) = 정수값  1 
		int startPage= (int)(currentPage/10)*10+1;                                          //startPage = (int)(1/10)*10+1 =   정수값 1
		int pageBlock=10;     
        int endPage = startPage + pageBlock-1;                                           //endPage = 1+ 10-1 = 10
        
        if (endPage > pageCount) {                              //10 >1 참
        	endPage = pageCount;                                //endPage가 페이지1이다
        	}
        
   		if (startPage > 10) {    %>                                                
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>    <!--  startPage = 1 ->> false  -->
<%    }
   				   
         for (int i = startPage ; i <= endPage ; i++) {  %>                   <!-- startPage=1 endPage=1 이므로 1번 출력 -->
     	 <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>           <!--  1 -->
<%     }
    	    
      	 if (endPage < pageCount) {  %>                                         
      	 <a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>    <!--  10 < 1  false -->
<%	 }
    }
%>
</form>
</center>
</body>
</html>