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
			request.setCharacterEncoding("euc-kr");  //�̰� ���ָ� �ѱ� �Ƶ� �α��ε� �����ϴ�.
			
		try{	
			//�Ƶ� ��� üũ�� �ʱ�ȭ
			String id = null;
			String pw = null;
			String auto = null;
			
			//ProAction���� ���� ��Ű�� �ҷ��´�
			Cookie[] cookies = request.getCookies();
			 //��Ű�� �ִٸ�
			if(cookies != null){      					
				for(Cookie coo: cookies){             			// �������� ��Ű���� �����Ѵ�                            
					if(coo.getName().equals("auto")) auto = coo.getValue();
					if(coo.getName().equals("cooId")) id = coo.getValue();
					if(coo.getName().equals("cooPw")) pw = coo.getValue();
					}
				}
				//������ ���� �ִٸ� �̵��Ѵ�
				if(auto != null && id != null && pw != null){
					LoginProAction la=new LoginProAction();
					la.action(request, response);
				} 	
			}catch(Exception e){}
		 
		    return "/member/login.jsp";
	}
}






