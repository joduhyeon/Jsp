package member.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DAO;
import db.DTO;

public class AllMemberAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		  
		 	DAO dao=DAO.getInstance();   			//��� ����
		 	ArrayList <DTO>list= dao.select();    	//select �޼���� ��ü ������ list�� ��´�.
			
		 	request.setAttribute("list", list);	
		 	
		 	return "/member/allmember.jsp";
	}
}
