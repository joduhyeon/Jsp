<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="db.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<%
	try{
	  String id=request.getParameter("id");
	  String pw=request.getParameter("pw");
	  String autoLogin= request.getParameter("autoLogin");

	   // id, pw Ȯ�� �ڵ�
		DAO dao=DAO.getInstance();
		int check=dao.userCheck(id,pw);
		if (check==1){
			if (autoLogin !=null ) {  //�ڵ��α��� üũ �Ұ��
				//��Ű����
				Cookie coo1= new Cookie("cooId" , id);
				Cookie coo2= new Cookie("cooPw" , pw);
				//��Ű ��ȿ�Ⱓ
				coo1.setMaxAge(6000);
				coo2.setMaxAge(6000);
				
				//����: ���� ��Ű�� Ŭ���̾�Ʈ���� �ش�.
				response.addCookie(coo1);
				response.addCookie(coo2);
				}
			
			//���ǻ���
			session.setAttribute("sessionId",id);
			session.setAttribute("sessionPw", pw);
			// ������ �̵�
			response.sendRedirect("login.jsp");
		}
		   else if (check==0) { 
%>
	<script> 
	  alert("��й�ȣ�� ���� �ʽ��ϴ�.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("���̵� ���� �ʽ��ϴ�..");
	  history.go(-1);
	</script>
<%} } catch (Exception e){}	%>	
