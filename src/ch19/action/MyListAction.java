package ch19.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class MyListAction implements CommandAction {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			
			String pageNum= request.getParameter("pageNum");
			String writer= request.getParameter("writer");
			if (pageNum == null) {
	            pageNum = "1";
	        }
	        int pageSize = 10;//한 페이지의 글의 개수
	        int currentPage = Integer.parseInt(pageNum);
	        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
	        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
	        int	 count = 0;
	        int number=0;

	        List articleList = null;
	        BoardDBBean dao = BoardDBBean.getInstance();//DB연동
	        count = dao.getMyArticleCount(writer);
	        //글이 있다면
	        if (count > 0) {
	            articleList = dao.getMyArticles(startRow,endRow,writer);//현재 페이지에 해당하는 글 목록
	            
	        //글이 없다면     
	        } else {
	            articleList = Collections.EMPTY_LIST;
	        }

			number=count-(currentPage-1)*pageSize;//글목록에 표시할 글번호
	        //해당 뷰에서 사용할 속성 
			//해당 뷰로 값을 전송
			
	        request.setAttribute("currentPage", new Integer(currentPage));
	        request.setAttribute("startRow", new Integer(startRow));
	        request.setAttribute("endRow", new Integer(endRow));
	        request.setAttribute("count", new Integer(count));
	        request.setAttribute("pageSize", new Integer(pageSize));
			request.setAttribute("number", new Integer(number));
	        request.setAttribute("articleList", articleList);
	       
	        request.setAttribute("writer", writer);
	        
	        System.out.println(pageNum);
	        System.out.println(count);
	        
			return "/ch19/mylist.jsp";
	}
}
