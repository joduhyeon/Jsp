package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;
import db.DTO;

public class ModifyAction implements CommandAction{

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			HttpSession session=request.getSession();
		    String id=(String)session.getAttribute("id");
		 	DAO dao=DAO.getInstance();
		 	try {
			 		DTO dto=dao.getMember(id);
					request.setAttribute("id", dto.getId());
					request.setAttribute("pw", dto.getPw());
					request.setAttribute("pw2", dto.getPw2());
					request.setAttribute("adr1", dto.getAdr1());
					request.setAttribute("adr2", dto.getAdr2());
					request.setAttribute("pnum1", dto.getPnum1());
					request.setAttribute("pnum2", dto.getPnum2());
					request.setAttribute("em1", dto.getEm1());
					request.setAttribute("em2", dto.getEm2());
					request.setAttribute("emr", dto.getEmr());
					
		 		 } 
		 			
		 	catch (Exception e){ e.printStackTrace();	}
		 	
		 	return "/member/modify.jsp";
	}
}
