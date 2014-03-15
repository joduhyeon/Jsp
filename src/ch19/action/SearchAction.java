package ch19.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class SearchAction implements CommandAction {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			request.setCharacterEncoding("euc-kr");
			
			String pageNum = request.getParameter("pageNum");
			String subject= request.getParameter("subject");
			if (pageNum == null){
				pageNum= "1";	
			}
		        int pageSize = 10;//한 페이지의 글의 개수
		        int currentPage = Integer.parseInt(pageNum);
		        int startRow = (currentPage - 1) * pageSize + 1;//한 페이지의 시작글 번호
		        int endRow = currentPage * pageSize;//한 페이지의 마지막 글번호
		        int count = 0;
		        int number=0;

		        List articleList = null;
		        BoardDBBean dbPro = BoardDBBean.getInstance();
		        count = dbPro.searchCount(subject);//전체 글의 수 
		        if (count > 0) {
		            articleList = dbPro.SubSearch(startRow,endRow,subject);//현재 페이지에 해당하는 글 목록
		        } else {
		        	//글의 갯수가 없으면 list를 비워라
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
		        
		        //재수행을 위한 제목값을 넣주는 건데?\
		        
		        request.setAttribute("subject", subject);

		        System.out.println(pageNum);
				System.out.println(count);
		        
		return "/ch19/search.jsp";
	}
}
