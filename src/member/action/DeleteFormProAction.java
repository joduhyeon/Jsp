package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;

public class DeleteFormProAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		   	HttpSession session=request.getSession();
		   	
			String id = (String)session.getAttribute("id");  //������ �Ƶ� �����´�
			String pw =request.getParameter("pw");        //��й�ȣ �Է��� ������ �����´�
			DAO dao=DAO.getInstance();                      // db�� ����.
			boolean result;
			try 
			{
				result=dao.deleteMember(id, pw);          			  //delete �޼��忡  �Ƶ�� ����� ������ ������ �����Ѵ�
				if (result){														  // ���̸� 
					  			request.setAttribute("result", result);     //Pro��������  Result=true ���� ������
								session.invalidate(); 							 //�׸��� ������ ����� Ż�� ó���Ѵ�.
				}else{
					  result=false;
					  request.setAttribute("result", result);				//Ʋ���� ����Ʈ���� false�� ������.
				}
			} 
			
			catch (Exception e) { e.printStackTrace(); }
	
			return "/member/deleteFormPro.jsp";						//Pro�������� �̵��Ѵ�
	}
}
