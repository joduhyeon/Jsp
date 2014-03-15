package ch19.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class ContentPwProAction implements CommandAction{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			int num = Integer.parseInt(request.getParameter("num"));//해당 글번호
	        String pageNum = request.getParameter("pageNum");//해당 페이지 번호
	        String passwd = request.getParameter("passwd");
	        String id = request.getParameter("id");

	        BoardDBBean dbPro = BoardDBBean.getInstance();//DB처리
	        int check = dbPro.writePasswd(num, passwd);
	        
	        
	        //해당 뷰에서 사용할 속성
	        request.setAttribute("num", new Integer(num));
	        request.setAttribute("pageNum", new Integer(pageNum));
	        request.setAttribute("check", new Integer(check));
	        request.setAttribute("id" , id);
			return "/ch19/contentPwPro.jsp";
	}

}
