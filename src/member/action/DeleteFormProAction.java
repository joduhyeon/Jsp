package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DAO;

public class DeleteFormProAction implements CommandAction {

	public String action(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		   	HttpSession session=request.getSession();
		   	
			String id = (String)session.getAttribute("id");  //접속한 아디를 가져온다
			String pw =request.getParameter("pw");        //비밀번호 입력한 값을를 가져온다
			DAO dao=DAO.getInstance();                      // db를 연다.
			boolean result;
			try 
			{
				result=dao.deleteMember(id, pw);          			  //delete 메서드에  아디랑 비번을 넣으면 삭제를 진행한다
				if (result){														  // 참이면 
					  			request.setAttribute("result", result);     //Pro페이지에  Result=true 값을 보낸다
								session.invalidate(); 							 //그리고 세션을 지우고 탈퇴 처리한다.
				}else{
					  result=false;
					  request.setAttribute("result", result);				//틀리면 리절트값을 false로 보낸다.
				}
			} 
			
			catch (Exception e) { e.printStackTrace(); }
	
			return "/member/deleteFormPro.jsp";						//Pro페이지로 이동한다
	}
}
