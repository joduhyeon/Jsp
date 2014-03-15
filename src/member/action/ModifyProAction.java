package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;
import db.DTO;

public class ModifyProAction implements CommandAction{

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		  
			DAO dao = DAO.getInstance();
		  	DTO dto= new DTO();
		  		   dto.setId(request.getParameter("id"));
				   dto.setPw(request.getParameter("pw"));
				   dto.setPw2(request.getParameter("pw2"));
				   dto.setAdr1(request.getParameter("adr1"));
				   dto.setAdr2(request.getParameter("adr2"));
				   dto.setSel1(request.getParameter("sel1"));
				   dto.setPnum1(request.getParameter("pnum1"));
				   dto.setPnum2(request.getParameter("pnum2"));
				   dto.setEm1(request.getParameter("em1"));
				   dto.setEm2(request.getParameter("em2"));
				   dto.setSel2(request.getParameter("sel2"));
				   dto.setEmr(request.getParameter("emr"));
				   
			try {
			   			dao.updateMember(dto);
		   		 } 
		   		
		   catch (Exception e) 
		   				{e.printStackTrace(); }
		   return "/member/modifyPro.jsp";
	}

}
