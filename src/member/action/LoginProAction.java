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
			
			request.setCharacterEncoding("euc-kr");  //�̰� ���ָ� �ѱ� �Ƶ� �α��ε� �����ϴ�.
		    
			HttpSession session= request.getSession();  
			String id = request.getParameter("id");   //���̵� �н����� �� �ҷ��´�.
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
			
			DAO dao = DAO.getInstance();  //db�� �ҷ��´�.
			
			int check;
			//���尴ü�� �ҷ��ü� �����Ƿ� session ������ ���������� ����
		try{
				check = dao.userCheck(id, pw);   //����üũ �޼���� �Ƶ� ����� üũ�Ѵ�.
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
										//���� ����
										session.setAttribute("id", id);             
										session.setAttribute("pw", pw);
										request.setAttribute("auto", auto); 
										request.setAttribute("check", new Integer(check));
										
										
										//üũ�� 1�̸� �Ƶ� ����� pro�������� �ѱ��
									}
				else if (check==0){
							request.setAttribute("check", new Integer(check));  
							//����� ���� ������ check��  pro�������θ� �ѱ��.
				}
				else{ 
							 
							check=-1; 
							request.setAttribute("check", new Integer(check));
							//�Ƶ� ���� ����
				}
			} catch (Exception e) {e.printStackTrace();}
			
		return "/member/loginPro.jsp";
	}
}
