<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("euc-kr");%>

<jsp:useBean id="article" scope="page" class="board.BoardDataBean" />
   <jsp:setProperty name="article" property="*"/>     <%-- article ��ü�� ��  --%>
 <%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );         //�ð����� 
	article.setIp(request.getRemoteAddr());                                       //ip �ҷ��ͼ� ��

    BoardDBBean dbPro = BoardDBBean.getInstance();                       //dbPro get �ν��Ͻ� 
    dbPro.insertArticle(article);                                                      //dbPro�� insertArticle() �ȿ� ������ article �� �ִ´�.

    response.sendRedirect("list.jsp");                                              //�׸��� list.jsp�� ������ �̵�
%>
