<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="dto" class="test.bean.Dto" />
<jsp:setProperty property="msg" name="dto" />

<font size="7">
		   기본방식 =>1.<%=dto.getMsg() %> <br>
		   2.<jsp:getProperty property="msg" name="dto" />
</font>
   </br>
<font size="7">
		   표현언어 => ${dto.msg}
</font>