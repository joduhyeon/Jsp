package ch19.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentDAO;

public class CommentDeleteAction implements CommandAction {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			int num =Integer.parseInt(request.getParameter("num"));
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int comment_num= Integer.parseInt(request.getParameter("comment_num"));
			
			CommentDAO dao=CommentDAO.getInstance();
			dao.deleteComment(comment_num);
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);
			
		
			return "/ch19/commentDelete.jsp";
	}

}
