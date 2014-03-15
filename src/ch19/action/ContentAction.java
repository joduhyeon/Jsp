package ch19.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import comment.CommentDAO;
import comment.CommentDTO;
import board.BoardDataBean;
import board.BoardDBBean;

public class ContentAction implements CommandAction {//글내용 처리

    public String requestPro(HttpServletRequest request,
        HttpServletResponse response)throws Throwable {
    	request.setCharacterEncoding("EUC-KR");	
  try{
        int num = Integer.parseInt(request.getParameter("num"));//해당 글번호
     
        String writer= request.getParameter("writer");
        String pageNum = request.getParameter("pageNum");//해당 페이지 번호
        
     
        BoardDBBean dbPro = BoardDBBean.getInstance();//DB처리
        BoardDataBean article =  dbPro.getArticle(num);//해당 글번호에 대한 해당 레코드
        
        CommentDAO dao = CommentDAO.getInstance();
        ArrayList list = dao.commentGetList(num);
        
        request.setAttribute("list", list);
        
        request.setAttribute("num", new Integer(num));
        request.setAttribute("pageNum", new Integer(pageNum));
        request.setAttribute("article", article);
        
        
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        System.out.println(num);
        System.out.println(pageNum);
        System.out.println(list);
        System.out.println(id);
        
  		}catch(Exception e){e.printStackTrace();}
     
 
        
        
        
        return "/ch19/content.jsp";//해당 뷰
    }
}
