package member.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.CommandAction;
public class MemberController extends HttpServlet {
	
	static HashMap map= new HashMap();
	
	public void init(ServletConfig config)throws ServletException{
		String path= config.getInitParameter("path");
		Properties pr=null;
		FileInputStream f=null;
		try {
			    f= new FileInputStream(path);
				pr = new Properties();
				pr.load(f);
				Iterator iter=pr.keySet().iterator();
				while(iter.hasNext()){
					String key = (String)iter.next();
					String value = pr.getProperty(key);
					Class className = Class.forName(value);
			 		Object obj = className.newInstance();
			 		map.put(key ,obj);
					}
			} catch (Exception e) 
		      		{e.printStackTrace(); }
		}
	protected void service(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
		
				String uri = request.getRequestURI();
				CommandAction ca = (CommandAction)map.get(uri);
				String view=ca.action(request, response);
				RequestDispatcher rd=request.getRequestDispatcher(view);
				rd.forward(request, response);
		}
}








