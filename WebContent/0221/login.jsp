<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<title>�α���</title>
<% 
	try{
		//������ ������ 
        if (session.getAttribute("sessionId")==null){ 
        	//��Ű�� ������� id, pw ����
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
        	}catch(Exception e){ out.println("���� ����"); }
%>
<% 
            //��Ű�� �ִٸ�
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
             <td>���̵�</td>
             <td><input type="text"  name="id"/></td>
          </tr>
          <tr >
              <td>��й�ȣ</td>
              <td><input type="password" name="pw"/></td>
          </tr>
          <tr>
             <td colspan="2" align="center">
                 <input type="submit" value="�α���"/>
                 <input type="button" value="ȸ������" onClick="mem()"/>
             </td>
         </tr>
         <tr><td colspan="2" align="center"> 
              <input type="checkbox" name="autoLogin" value="check" />�ڵ��α���</td>
              </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">�Խ���</a></td></tr>
       </table>
     </form>
</body>
<% } %>

<%   //������ �϶�
       } else if (session.getAttribute("sessionId").equals("������")) {  
%> 
<form name="form" action="logout.jsp" >
		<table border=1 >
          <tr>
             <td colspan="2" align="center">������ �������� </br>
                                  �α��� �ϼ̽��ϴ�.</td>
          </tr>
          <tr>
             <td colspan="2">
                  <input type="submit" value="�α׾ƿ�"/>
                  <input type="button" value="ȸ����������" onClick="mem()"/>
             </td>
         </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">�Խ���</a></td></tr>
       </table>
</form>

<%   //�Ϲ� ȸ���϶�
       } else {
%>
<form name="form" action="logout.jsp" >
		<table border=1 >
          <tr>
             <td colspan="2" align="center"><%=session.getAttribute("sessionId") %>����</br>
                                  �α��� �ϼ̽��ϴ�.
            	</td>
          </tr>
          <tr>
             <td colspan="2">
                  <input type="submit" value="�α׾ƿ�"/>
                  <input type="button" value="ȸ����������" onClick="mem()"/>
             </td>
         </tr>
        </table>
        <table border= 1>
        <tr><td><a href="../board/list.jsp">�Խ���</a></td></tr>
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
			alert("���̵� �Է����� �ʾҽ��ϴ�.");
			document.form.id.focus();
			return false;
			}
			if(!document.form.pw.value){
			alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
			document.form.pw.focus();
			return false;
	          }
            }
		function modify(){
			location.href="modify.jsp";
		}
</script>
 















