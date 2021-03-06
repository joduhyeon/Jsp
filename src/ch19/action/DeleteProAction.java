package ch19.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class DeleteProAction implements CommandAction {//글삭제

    public String requestPro( HttpServletRequest request,
        HttpServletResponse response) throws Throwable {

        request.setCharacterEncoding("euc-kr");
      try{
        int num = Integer.parseInt(request.getParameter("num"));
        String pageNum = request.getParameter("pageNum");
        String passwd = request.getParameter("passwd");
	    
        BoardDBBean dbPro = BoardDBBean.getInstance();
        int check = dbPro.deleteArticle(num, passwd);

        //해당 뷰에서 사용할 속성
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("check", new Integer(check));
     
      	}catch(Exception e){}

        return "/ch19/deletePro.jsp";//해당뷰
    }
}
