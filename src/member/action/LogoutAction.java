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
			request.setCharacterEncoding("euc-kr");  //이걸 해주면 한글 아디 로그인도 가능하다.
			
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
