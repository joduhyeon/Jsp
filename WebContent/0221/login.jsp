<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>로그인</title>
<% 
	try{
		//세션이 없을때 
        if (session.getAttribute("sessionId")==null){ 
        	//쿠키가 있을경우 id, pw 저장
        	String id="";
        	String pw="";
        	try{
        	Cookie[] cookies = request.getCookies();
        	 if (cookies !=null){
        		 for (int i=0 ; i< cookies.length; i++){
        			 if (cookies[i].getName().equals("cooId")){
        				 id=cookies[i].getValue();
        			 }else if (cookies[i].getName().equals("cooPw")){
        				 pw= cookies[i].getValue();
        			 }
        		 }
        	 }
        	}catch(Exception e){ out.println("예외 오류"); }
%>
<% 
            //쿠키가 있다면
            if ( id !="" ){
%>
            	<jsp:forward page="loginPro.jsp">
            	<jsp:param value="<%=id %>" name="id"/>
            	<jsp:param value="<%=pw %>" name="pw"/>
            	</jsp:forward>
<% } else{ %>
<body onLoad="begin()">
     <form name="form" action="loginPro.jsp" onSubmit="return checkIt()">
		<table border=1 >
          <tr>
             <td>아이디</td>
             <td><input type="text"  name="id"/></td>
          </tr>
          <tr >
              <td>비밀번호</td>
              <td><input type="password" name="pw"/></td>
          </tr>
          <tr>
             <td colspan="2" align="center">
                 <input type="submit" value="로그인"/>
                 <input type="button" value="회원가입" onClick="mem()"/>
             </td>
         </tr>
         <tr><td colspan="2" align="center"> 
              <input type="checkbox" name="autoLogin" value="check" />자동로그인</td>
              </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">게시판</a></td></tr>
       </table>
     </form>
</body>
<% } %>

<%   //관리자 일때
       } else if (session.getAttribute("sessionId").equals("관리자")) {  
%> 
<form name="form" action="logout.jsp" >
		<table border=1 >
          <tr>
             <td colspan="2" align="center">관리자 계정으로 </br>
                                  로그인 하셨습니다.</td>
          </tr>
          <tr>
             <td colspan="2">
                  <input type="submit" value="로그아웃"/>
                  <input type="button" value="회원정보수정" onClick="mem()"/>
             </td>
         </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">게시판</a></td></tr>
       </table>
</form>

<%   //일반 회원일때
       } else {
%>
<form name="form" action="logout.jsp" >
		<table border=1 >
          <tr>
             <td colspan="2" align="center"><%=session.getAttribute("sessionId") %>님이</br>
                                  로그인 하셨습니다.
            	</td>
          </tr>
          <tr>
             <td colspan="2">
                  <input type="submit" value="로그아웃"/>
                  <input type="button" value="회원정보수정" onClick="mem()"/>
             </td>
         </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">게시판</a></td></tr>
       </table>
</form>
 
<%
			}  
		}catch(NumberFormatException e){}
%> 

       
       

<script>
		function mem(){
			location.href="membershipForm.jsp";
			}
		function begin(){
			document.form.id.focus();
			}
		function checkIt(){
			if(!document.form.id.value){
			alert("아이디를 입력하지 않았습니다.");
			document.form.id.focus();
			return false;
			}
			if(!document.form.pw.value){
			alert("비밀번호를 입력하지 않았습니다.");
			document.form.pw.focus();
			return false;
	          }
            }
		function modify(){
			location.href="modify.jsp";
		}
</script>
 















