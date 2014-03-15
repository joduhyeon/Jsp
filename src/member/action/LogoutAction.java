package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("euc-kr");  //�̰� ���ָ� �ѱ� �Ƶ� �α��ε� �����ϴ�.
			
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie c: cookies){
					if(c.getName().equals("auto") || c.getName().equals("cooId") || c.getName().equals("cooPw")){
						c.setMaxAge(10);
						response.addCookie(c);
					}
				}
			}
				
			
			HttpSession session = request.getSession();
			session.invalidate();
			
		return "/member/logout.jsp";
	}

}
