package ch19.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;
import board.BoardDataBean;

public class TestAction implements CommandAction {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
				String subject=request.getParameter("subject");
				BoardDBBean dao=BoardDBBean.getInstance();
				BoardDataBean dto=new BoardDataBean(); 
				
			
			
			
		
			return null;
	}

}
