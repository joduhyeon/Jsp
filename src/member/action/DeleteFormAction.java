package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteFormAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
			return "/member/deleteForm.jsp";
	}
}
