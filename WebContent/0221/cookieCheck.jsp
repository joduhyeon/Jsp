<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" %>

<%
	// getAttribute �� Object�� ������ -> String���� ����ȯ �ʿ�.
	String sessionId = (String)session.getAttribute("sessionId");
	String sessionPw = (String)session.getAttribute("sessionPw");
	String cooId = "";
	String cooPw = "";
	
	try{
		Cookie[] cookies = request.getCookies(); // ��û���� ��Ű�� �����´�.
		
		if(cookies!=null){ // ID,PW ��Ű�� ������
			for(int i=0; i<cookies.length; i++){                        
				if(cookies[i].getName().equals("cooId")){  //cooId�� �޾ƿµ� id�� ����.
					cooId=cookies[i].getValue();
				}
				if(cookies[i].getName().equals("cooPw")){  //cooPw�� �޾ƿµ� pw�� ����.
					cooPw=cookies[i].getValue();
				}
			}
		
			if(cooId.equals("")){  // ��Ű���� id�� ã�� ��������
				%>
				��Ű���� id�� ã�� ��������
				<%
				response.sendRedirect("form.jsp"); // �����̷�Ʈ
			}
			if(cooPw.equals("")){  // ��Ű���� id�� ã�� ��������
				%>
				��Ű���� id�� ã�� ��������
				<%
				response.sendRedirect("form.jsp"); // �����̷�Ʈ
			}
		}else{ // ID,PW ��Ű�� ������
			response.sendRedirect("form.jsp"); // �����̷�Ʈ
		}
	}catch(Exception e){}
%>


<form method="post" action="logoutForm.jsp">
	<h1 align="center">���� �α��� ���� </h1> 
		<font align="center">
	
	
	<table border=1 align="center" width=61%>
		<!--1����-->
		<tr>
			<td align="center">
				���̵�
			</td>
			
			<td align="center">
				���� : <%=sessionId%> // ��Ű : <%=cooId%> <br/>
			</td>
		</tr>
		
		<!--2����-->
		<tr>
			<td align="center">
				��й�ȣ
			</td>
			
			<td align="center">
				���� : <%=sessionPw%> // ��Ű : <%=cooPw%> <br/>
			</td>
		</tr>
	</table>
	
	
	<table  align="center" >
			<tr>
				<td>
					<input type="submit" value="�α׾ƿ�" />
				</td>
			</tr>
	</table>

</form>