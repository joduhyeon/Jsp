package ch19.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDBBean;

public class SearchAction implements CommandAction {

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
			
			request.setCharacterEncoding("euc-kr");
			
			String pageNum = request.getParameter("pageNum");
			String subject= request.getParameter("subject");
			if (pageNum == null){
				pageNum= "1";	
			}
		        int pageSize = 10;//�� �������� ���� ����
		        int currentPage = Integer.parseInt(pageNum);
		        int startRow = (currentPage - 1) * pageSize + 1;//�� �������� ���۱� ��ȣ
		        int endRow = currentPage * pageSize;//�� �������� ������ �۹�ȣ
		        int count = 0;
		        int number=0;

		        List articleList = null;
		        BoardDBBean dbPro = BoardDBBean.getInstance();
		        count = dbPro.searchCount(subject);//��ü ���� �� 
		        if (count > 0) {
		            articleList = dbPro.SubSearch(startRow,endRow,subject);//���� �������� �ش��ϴ� �� ���
		        } else {
		        	//���� ������ ������ list�� �����
		            articleList = Collections.EMPTY_LIST;
		        }

				number=count-(currentPage-1)*pageSize;//�۸�Ͽ� ǥ���� �۹�ȣ
		        //�ش� �信�� ����� �Ӽ� 
				//�ش� ��� ���� ����
		        request.setAttribute("currentPage", new Integer(currentPage));
		        request.setAttribute("startRow", new Integer(startRow));
		        request.setAttribute("endRow", new Integer(endRow));
		        request.setAttribute("count", new Integer(count));
		        request.setAttribute("pageSize", new Integer(pageSize));
				request.setAttribute("number", new Integer(number));
		        request.setAttribute("articleList", articleList);
		        
		        //������� ���� ������ ���ִ� �ǵ�?\
		        
		        request.setAttribute("subject", subject);

		        System.out.println(pageNum);
				System.out.println(count);
		        
		return "/ch19/search.jsp";
	}
}
