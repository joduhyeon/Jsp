package board;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BoardDBBean {
	private Connection conn = null; 
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
    private static BoardDBBean instance = new BoardDBBean();
	public static BoardDBBean getInstance() {return instance;}
	private BoardDBBean() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	//�� �ۼ�
	public void insertArticle(BoardDataBean article) throws Exception {
	
		int num=article.getNum();        
		int ref=article.getRef();              
		int re_step=article.getRe_step();        
		int re_level=article.getRe_level();          // num, re_step, re_level = �������� article�� ����� ��
		                                               //��ü���� ��Ʈ writeForm���� -> writePro�� �Ѱ��ְ� article�� �����ϰ� 
                                                       //BoardDBBEAN���� �ͼ� �����ͺ��̽��� �ִ´�
        int number=0;
		String sql="";
		try {
			conn = getConnection(); 
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			if (rs.next()) 
			{	number=rs.getInt(1)+1;   }	
			else
				number=1; 
			   if (num!=0) 
			   { 
				sql="update board set re_step=re_step+1 "
						+ "where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step=re_step+1;
				re_level=re_level+1;
			}else{ 
				ref=number;
				re_step=0;
				re_level=0;
			}
 
         sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
         sql+="ref,re_step,re_level,content,ip) "
		     + "values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			pstmt.executeUpdate();
		} 
		catch(Exception ex) { ex.printStackTrace(); } 
		finally {
			     if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			     if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			     if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
	}
	
	//�� ��ü ����
	public int getArticleCount() throws Exception { //�� ���� ���� �޼���
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board"); //���ڵ尹���
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);     //ī��Ʈ�� ������ �ϳ��� �����ϱ� 1�̶�� ǥ��
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x; 
	}
	
	//�۸�� ��ü
    public List getArticles(int start, int end) throws Exception {
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "
			+
			"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					                                                                                 // r�� rownum�� ��Ī
			"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount " +
			"from board order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
                                                                  //��������	  ��������		   
			        // *,from�̾ȵǼ� ���� ǥ�������� ����̴�.
					pstmt.setInt(1, start); 
					pstmt.setInt(2, end); 

					rs = pstmt.executeQuery(); //����� ����� ���´�.
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{   //  if do while�� ���� whlie���� ����.
							BoardDataBean article= new BoardDataBean();
							article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
							article.setEmail(rs.getString("email"));
							article.setSubject(rs.getString("subject"));
							article.setPasswd(rs.getString("passwd"));
							article.setReg_date(rs.getTimestamp("reg_date"));
							article.setReadcount(rs.getInt("readcount"));
							article.setRef(rs.getInt("ref"));
							article.setRe_step(rs.getInt("re_step"));
							article.setRe_level(rs.getInt("re_level"));
							article.setContent(rs.getString("content"));
							article.setIp(rs.getString("ip"));
							articleList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		
		return articleList;
	}
	
    //���Ѱ� �ҷ�����
	public BoardDataBean getArticle(int num) throws Exception {
	
		BoardDataBean article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"update board set readcount=readcount+1 where num = ?"); 
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			pstmt = conn.prepareStatement(
			"select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return article;
	}
	
	//�� ���� �ҷ�����
    public BoardDataBean updateGetArticle(int num) throws Exception {
		BoardDataBean article=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select * from board where num = ?"); 
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}

		return article;
	}
	
    //�� �����ϱ� 
    public int updateArticle(BoardDataBean article) throws Exception {
	
		String dbpasswd="";
		String sql="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(article.getPasswd())){
					sql="update board set writer=?,email=?,subject=?,passwd=?";
					sql+=",content=? where num=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x= 1;
				}else{
					x= 0;
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
	
    //�� ���� 
    public int deleteArticle(int num, String passwd) throws Exception {
	
		String dbpasswd="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if(dbpasswd.equals(passwd)){
					pstmt = conn.prepareStatement(
					"delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x= 1; 
				}else
					x= 0; 
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
    
    //�� ��й�ȣȮ��
    public int writePasswd(int num, String passwd) throws Exception {
    	String dbpasswd="";
		int x=-1;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
			"select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd");
				if((dbpasswd.equals(passwd))){
					  x=1;
				}
			}else{
					x= 0; 
			}
		} catch(Exception ex) {
					ex.printStackTrace();
		    
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return x;
	}
    
    //���� �۸��
    public List getMyArticles(int start, int end, String writer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
					"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
					"from (select * from board where writer=? order by reg_date) order by reg_date ) where r >= ? and r <= ? ");
					pstmt.setString(1, writer);
					pstmt.setInt(2, start); 
					pstmt.setInt(3, end); 

					rs = pstmt.executeQuery();
					if (rs.next()) {
						articleList = new ArrayList(end); 
						do{ 
							BoardDataBean article= new BoardDataBean();
							article.setNum(rs.getInt("num"));
							article.setWriter(rs.getString("writer"));
							article.setEmail(rs.getString("email"));
							article.setSubject(rs.getString("subject"));
							article.setPasswd(rs.getString("passwd"));
							article.setReg_date(rs.getTimestamp("reg_date"));
							article.setReadcount(rs.getInt("readcount"));
							article.setRef(rs.getInt("ref"));
							article.setRe_step(rs.getInt("re_step"));
							article.setRe_level(rs.getInt("re_level"));
							article.setContent(rs.getString("content"));
							article.setIp(rs.getString("ip"));
							articleList.add(article); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		return articleList;
	}
    
    //���� �� ����
    public int getMyArticleCount(String writer) throws Exception {

    	int count=0;
    	try {
	    		 conn = getConnection();
				 pstmt = conn.prepareStatement("select count(*) from board where writer=?");
				 pstmt.setString(1, writer);
				 rs = pstmt.executeQuery();
				 if (rs.next())
				 {
	 				count= rs.getInt(1); 
				 }
    		}catch(Exception e) { e.printStackTrace(); } 
    		 finally {
			 if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			 if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			 if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    		}
    		return count; 
    	}

    //�� �˻�
    public ArrayList SubSearch(int start, int end, String subject) throws Exception{
  
    	ArrayList list = new ArrayList();
    	try {
    	
    	
    		conn = getConnection();
        	pstmt= conn.prepareStatement(
			"select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,r "+
			"from (select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r " +
			"from (select * from board where subject like ? order by reg_date) order by reg_date ) where r >= ? and r <= ? ");
        	pstmt.setString(1, "%"+subject+"%");
        	pstmt.setInt(2, start);
        	pstmt.setInt(3, end);
        	
        	rs= pstmt.executeQuery();
        	while(rs.next()){
        		BoardDataBean article=new BoardDataBean();
        		article.setNum(rs.getInt("num"));
     	        article.setWriter(rs.getString("writer"));
     	        article.setEmail(rs.getString("email"));
     	        article.setSubject(rs.getString("subject"));
     	        article.setPasswd(rs.getString("passwd"));
   				article.setReg_date(rs.getTimestamp("reg_date"));
   				article.setReadcount(rs.getInt("readcount"));
   				article.setRef(rs.getInt("ref"));
   				article.setRe_step(rs.getInt("re_step"));
   				article.setRe_level(rs.getInt("re_level"));
   				article.setContent(rs.getString("content"));
   				article.setIp(rs.getString("ip"));
        		list.add(article);
        	}
    	}
    	catch (Exception e) {e.printStackTrace();}
    	finally{
    		if(rs != null)try{rs.close();}catch(SQLException e){e.printStackTrace();}
    		if(pstmt != null)try{pstmt.close();}catch(SQLException e){e.printStackTrace();}
    		if(conn != null)try{conn.close();}catch(SQLException e){e.printStackTrace();}
    	}
    	return list;
    }
    
    //�� �˻� ����
    public int searchCount(String subject) throws Exception{
		    	
    			int count=0;
		try{
		    	conn=getConnection();
		    	pstmt=conn.prepareStatement("select count(*) from board where subject like ?");
		    	pstmt.setString(1,"%"+subject+"%" );
		    	rs=pstmt.executeQuery();
		    	if(rs.next()){
		    	  	count=rs.getInt(1);
		    	}
		   	} catch(Exception e){ e.printStackTrace();}
			finally{
				 if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				 if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				 if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}
    	return count;
    }
    
    //��� �ޱ�
    public void comment(BoardDataBean article)throws Exception{
    		
	    	int num=article.getNum();        
			int ref=article.getRef();              
			int re_step=article.getRe_step();        
			int re_level=article.getRe_level();
    	
			 int number=0;
				String sql="";
				try {
					conn = getConnection(); 
					pstmt = conn.prepareStatement("select max(num) from board");
					rs = pstmt.executeQuery();
					if (rs.next()) 
					{	number=rs.getInt(1)+1;   }	
					else
						number=1; 
					   if (num!=0) 
					   { 
						sql="update board set re_step=re_step+1 "
								+ "where ref= ? and re_step> ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, ref);
						pstmt.setInt(2, re_step);
						pstmt.executeUpdate();
						re_step=re_step+1;
						re_level=re_level+1;
					}else{ 
						ref=number;
						re_step=0;
						re_level=0;
					}
		 
		         sql = "insert into board(num,writer,email,subject,passwd,reg_date,";
		         sql+="ref,re_step,re_level,content,ip) "
				     + "values(board_seq.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setTimestamp(5, article.getReg_date());
					pstmt.setInt(6, ref);
					pstmt.setInt(7, re_step);
					pstmt.setInt(8, re_level);
					pstmt.setString(9, article.getContent());
					pstmt.setString(10, article.getIp());
					pstmt.executeUpdate();
				} 
				catch(Exception ex) { ex.printStackTrace(); } 
				finally {
					     if (rs != null) try { rs.close(); } catch(SQLException ex) {}
					     if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
					     if (conn != null) try { conn.close(); } catch(SQLException ex) {}
				        }
    }
}