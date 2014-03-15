package ch19.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentPwProAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			int num = Integer.parseInt(request.getParameter("num"));//�ش� �۹�ȣ
	        String pageNum = request.getParameter("pageNum");//�ش� ������ ��ȣ
	        String passwd = request.getParameter("passwd");
	        String id = request.getParameter("id");

	        BoardDBBean dbPro = BoardDBBean.getInstance();//DBó��
	        int check = dbPro.writePasswd(num, passwd);
	        
	        
	        //�ش� �信�� ����� �Ӽ�
	        request.setAttribute("num", new Integer(num));
	        request.setAttribute("pageNum", new Integer(pageNum));
	        request.setAttribute("check", new Integer(check));
	        request.setAttribute("id" , id);
			return "/ch19/contentPwPro.jsp";
	}

}
