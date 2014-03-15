<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/view/color.jspf"%>


<title>글 검색 목록</title>

<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">
<center><b>글목록(전체 글:${count})</b>


<table width="700">
  <tr>
    <td align="right" bgcolor="${value_c}">
       <a href="/Jsp/ch19/writeForm.do">글쓰기</a>
       <a href="/Jsp/ch19/list.do" >전체글목록</a>
       
       			<!--  문자열을 비교할때 ' ' 을 쓴다 -->
       			<!--  관리자 라면  -->
      		 	<c:if test="${id eq 'admin'}" >    
      						<a href="/Jsp/member/allmember.nhn">회원목록</a>
       			</c:if>
       			
       	<a href="/Jsp/member/login.nhn">로그인화면</a>
    </td>
  </tr>
</table>


<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      게시판에 저장된 글이 없습니다.
    </td>
  </tr>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
		    <tr height="30" bgcolor="${value_c}"> 
				      <td align="center"  width="50"  >번 호</td> 
				      <td align="center"  width="250" >제   목</td> 
				      <td align="center"  width="100" >작성자</td>
				      <td align="center"  width="150" >작성일</td> 
				      <td align="center"  width="50" >조 회</td> 
				      <td align="center"  width="100" >IP</td>    
		    </tr>

<c:forEach var="article" items="${articleList}">
		   <tr height="30">
		    <td align="center"  width="50" >
			  <c:out value="${number}"/>
			  <c:set var="number" value="${number - 1}"/>
			</td>
		    <td  width="250" >
			  <c:if test="${article.re_level > 0}">
			  	<img src="images/level.gif" width="${5 * article.re_level}" height="16">
			    <img src="images/re.gif">
			  </c:if>
			  <c:if test="${article.re_level == 0}">
			    <img src="images/level.gif" width="${5 * article.re_level}" height="16">
			  </c:if>
		           
		      <a href="/Jsp/ch19/content.do?num=${article.num}&pageNum=${currentPage}">
		          ${article.subject}</a> 
		          
		          <c:if test="${article.readcount >= 20}">
		            <img src="images/hot.gif" border="0"  height="16">
				  </c:if>
			</td>
		    <td align="center"  width="100"> 
		       <a href="mailto:${article.email}">${article.writer}</a>
			</td>
		    <td align="center"  width="150">${article.reg_date}
			</td>
		    <td align="center"  width="50">${article.readcount}</td>
		    <td align="center" width="100" >${article.ip}</td>
		  </tr>
</c:forEach>
</table>
</c:if>

<c:if test="${count > 0}">
   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
   <c:set var="pageBlock" value="${10}"/>
   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
   <c:set var="startPage" value="${result * 10 + 1}" />
   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
   <c:if test="${endPage > pageCount}">
        <c:set var="endPage" value="${pageCount}"/>
   </c:if> 
          
   <c:if test="${startPage > 10}">
        <a href="/Jsp/ch19/search.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/Jsp/ch19/search.do?pageNum=${i}&subject=${subject}">[${i}]</a>
       <%-- 1번은 누르면 다시 search액션으로 가서 재검사 하는데?  그럴려면 
               글제목을 다시 검색 하게 하려면 이걸누르면 같이 전송이 되야 는데 페이지값만 넘어감
				 <a href="/Jsp/ch19/search.do?pageNum=${i}&search=${search}"> 하면 되긴하는데;;--%>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
        <a href="/Jsp/ch19/search.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if>
</center>
</body>
</html>