package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import db.DAO;

public class LoginProAction implements CommandAction{

	
	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
			
			request.setCharacterEncoding("euc-kr");  //이걸 해주면 한글 아디 로그인도 가능하다.
		    
			HttpSession session= request.getSession();  
			String id = request.getParameter("id");   //아이디 패스워드 를 불러온다.
			String pw =request.getParameter("pw");
			String auto = request.getParameter("auto");
			
			if(auto==null) { auto = "0"; }
			Cookie[] cookies = request.getCookies();
			if(cookies != null){
				for(Cookie c: cookies){
					if(c.getName().equals("auto")) auto = c.getValue();
					if(c.getName().equals("cooId")) id = c.getValue();
					if(c.getName().equals("cooPw")) pw = c.getValue();
				}
			} 
			
			DAO dao = DAO.getInstance();  //db를 불러온다.
			
			int check;
			//내장객체를 불러올수 없으므로 session 쓰려고 참조변수를 생성
		try{
				check = dao.userCheck(id, pw);   //유저체크 메서드로 아디 비번을 체크한다.
				if (check==1) {
						if(auto.equals("1")){
								Cookie coo1= new Cookie("auto", auto);
								Cookie coo2 = new Cookie("cooId", id);
								Cookie coo3 = new Cookie("cooPw", pw);
								coo1.setMaxAge(60*60*24*7);
								coo2.setMaxAge(60*60*24*7);
								coo3.setMaxAge(60*60*24*7);
								response.addCookie(coo1);
								response.addCookie(coo2);
								response.addCookie(coo3);
								}
										//세션 생성
										session.setAttribute("id", id);             
										session.setAttribute("pw", pw);
										request.setAttribute("auto", auto); 
										request.setAttribute("check", new Integer(check));
										
										
										//체크가 1이면 아디 비번을 pro페이지로 넘긴다
									}
				else if (check==0){
							request.setAttribute("check", new Integer(check));  
							//비번이 맞지 않으면 check를  pro페이지로를 넘긴다.
				}
				else{ 
							 
							check=-1; 
							request.setAttribute("check", new Integer(check));
							//아디가 맞지 않음
				}
			} catch (Exception e) {e.printStackTrace();}
			
		return "/member/loginPro.jsp";
	}
}
