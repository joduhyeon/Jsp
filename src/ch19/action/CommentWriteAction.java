package ch19.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.CommentDAO;
import comment.CommentDTO;

public class CommentWriteAction implements CommandAction {
	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("EUC-KR");	
	try{
        //瘩臂静扁
       
        CommentDTO dto = new CommentDTO();//单捞磐贸府 后
        dto.setNum(Integer.parseInt(request.getParameter("num")));
        dto.setComment_num(Integer.parseInt(request.getParameter("comment_num")));
        dto.setWriter(request.getParameter("writer"));
        dto.setReg_date(new Timestamp(System.currentTimeMillis()));
        dto.setContent(request.getParameter("content"));
        dto.setIp(request.getRemoteAddr());
        
        CommentDAO dao=CommentDAO.getInstance();
        dao.insertCommnet(dto);
        
        request.setAttribute("num", Integer.parseInt(request.getParameter("num")));
        request.setAttribute("pageNum", Integer.parseInt(request.getParameter("pageNum")));
        }
		catch(NumberFormatException e){}
					
		return "/ch19/commentWritePro.jsp";
	}
}
