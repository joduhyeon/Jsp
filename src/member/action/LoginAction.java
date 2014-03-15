package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginAction implements CommandAction{
	
	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("euc-kr");  //이걸 해주면 한글 아디 로그인도 가능하다.
			
		try{	
			//아디 비번 체크값 초기화
			String id = null;
			String pw = null;
			String auto = null;
			
			//ProAction에서 만든 쿠키를 불러온다
			Cookie[] cookies = request.getCookies();
			 //쿠키가 있다면
			if(cookies != null){      					
				for(Cookie coo: cookies){             			// 변수들의 쿠키값을 저장한다                            
					if(coo.getName().equals("auto")) auto = coo.getValue();
					if(coo.getName().equals("cooId")) id = coo.getValue();
					if(coo.getName().equals("cooPw")) pw = coo.getValue();
					}
				}
				//세개다 값이 있다면 이동한다
				if(auto != null && id != null && pw != null){
					LoginProAction la=new LoginProAction();
					la.action(request, response);
				} 	
			}catch(Exception e){}
		 
		    return "/member/login.jsp";
	}
}






