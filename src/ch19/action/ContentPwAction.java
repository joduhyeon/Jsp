package ch19.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class ContentPwAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
			int num = Integer.parseInt(request.getParameter("num"));
	        String pageNum = request.getParameter("pageNum");
	      

	        //�ش� �信�� ����� �Ӽ�
	        request.setAttribute("num" , new Integer(num));
	        request.setAttribute("pageNum", new Integer(pageNum));
	        
			return "/ch19/contentPw.jsp";
	}

}
