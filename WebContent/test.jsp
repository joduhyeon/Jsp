<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    사용 테이블 
    1. form    2. board   3. coment 
    	
전체글
	
	"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
	"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
	"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
	"from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");

	
나의글
	
	"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
	"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
	"from (select * from board where writer=? order by reg_date) order by reg_date ) where r >= ? and r <= ? ");
	
	
	
	 <c:if test="${count == 0}">
<table width="400" border="1" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
      			댓글이 없습니다.
    </td>
  </tr>
</table>
</c:if>
<c:forEach var="article" items="${articleList}">
<c:if test="${count > 0}">
<table border="1" width="400" cellpadding="0" cellspacing="0" align="center"> 
    <tr height="30" bgcolor="${value_c}"> 
      <td align="center"  width="100" >${article.writer}</td> 
      <td align="center"  width="150" >${article.reg_date}</td> 
      <td align="center"  width="100" >${article.ip}</td>    
    </tr>
   	<tr height="30" >
  	  <td  colspan="3"  align="center">comment 작성 공간 입니다 .</td>
 	 </tr>
</table>
 </c:if>
 </c:forEach>
<br/>
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
        <a href="/Jsp/ch19/list.do?pageNum=${startPage - 10 }">[이전]</a>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
       <a href="/Jsp/ch19/list.do?pageNum=${i}">[${i}]</a>  
   </c:forEach>
	
   <c:if test="${endPage < pageCount}">
        <a href="/Jsp/ch19/list.do?pageNum=${startPage + 10}">[다음]</a>
   </c:if>
</c:if> 	


   

