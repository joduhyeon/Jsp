package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;

public class ConfirmIdAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		 			String id=request.getParameter("id");
		 			DAO dao= DAO.getInstance();
		 			
		 			boolean result;
		 			try {
						    result = dao.confirmId(id);
						    request.setAttribute("id", id);
						    request.setAttribute("result", result);;
		 			}catch (Exception e) 
								{ e.printStackTrace(); }
		 			
		 			return "/member/confirmId.jsp";
	}
}
