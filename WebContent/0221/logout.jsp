<%@ page contentType="text/html; charset=euc-kr"%>
<% 
	session.invalidate();
    //���� �����
%>
<%
 		Cookie[] cookies = request.getCookies();  //��Ű 0�� ���� = ����
		
		if ( cookies != null ){
			for (int i= 0 ; i < cookies.length ; i++ ){
				if(cookies[i].getName().equals("cooId")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				} else if(cookies[i].getName().equals("cooPw")){
					cookies[i].setMaxAge(0);
					response.addCookie(cookies[i]);
				}
			}
		} 
%>
<script>
    	alert("�α׾ƿ� �Ǿ����ϴ�.");
    	location.href="login.jsp";
</script>