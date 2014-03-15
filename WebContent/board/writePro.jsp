<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>

<jsp:useBean id="article" scope="page" class="board.BoardDataBean" />
   <jsp:setProperty name="article" property="*"/>     <%-- article 전체에 셋  --%>
 <%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );         //시간생성 
	article.setIp(request.getRemoteAddr());                                       //ip 불러와서 셋

    BoardDBBean dbPro = BoardDBBean.getInstance();                       //dbPro get 인스턴스 
    dbPro.insertArticle(article);                                                      //dbPro의 insertArticle() 안에 저장한 article 을 넣는다.

    response.sendRedirect("list.jsp");                                              //그리고 list.jsp로 페이지 이동
%>
