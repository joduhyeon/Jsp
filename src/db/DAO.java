package db;
import java.sql.*;

import javax.sql.DataSource;
import javax.naming.Context;  //Context.xml에 서버연결하는걸 넣어둬서 불러쓴다.
                              //그래서 conn=getConnection()에 패스와 아디 비번을 넣지않는다.
import javax.naming.InitialContext;

import java.util.*;

public class DAO {
	
	private Connection conn=null;        
	private PreparedStatement pstmt=null;  
	private ResultSet rs=null;
	
	private DAO(){}
	private static DAO dao=new DAO();
	public static DAO getInstance(){ return dao; }
	
    private Connection getConnection() throws Exception
    {
	Context ctx=new InitialContext();
	Context env=(Context)ctx.lookup("java:comp/env");
	DataSource ds=(DataSource)env.lookup("jdbc/orcl");
	return ds.getConnection();
    }
    
    //전체 DB
    public ArrayList<DTO> select(){
    	ArrayList<DTO> list=new ArrayList<DTO>();
    	try {
    	      conn=getConnection();
    	      pstmt=conn.prepareStatement("select * from form");
    	      rs=pstmt.executeQuery();
    	      while(rs.next()){
    	    	  DTO dto=new DTO();
    	    	  dto.setId(rs.getString("id"));
    	    	  dto.setPw(rs.getString("pw"));
    	    	  dto.setPw2(rs.getString("pw2"));
    	    	  dto.setNum1(rs.getString("num1"));
    	    	  dto.setNum2(rs.getString("num2"));
    	    	  dto.setAdr1(rs.getString("adr1"));
    	    	  dto.setAdr2(rs.getString("adr2"));
    	    	  dto.setSel1(rs.getString("sel1"));
    	    	  dto.setPnum1(rs.getString("pnum1"));
    	    	  dto.setPnum2(rs.getString("pnum2"));
    	    	  dto.setEm1(rs.getString("em1"));
    	    	  dto.setEm2(rs.getString("em2"));
    	    	  dto.setSel2(rs.getString("sel2"));
    	    	  dto.setEmr(rs.getString("emr"));
    	    	  list.add(dto);
    	    	  
    	      }
    	}catch(Exception e){ e.printStackTrace(); }
    	finally{ 
    		try {rs.close();}catch(SQLException e){}
    	    try {pstmt.close();}catch(SQLException e){}
    	    try {conn.close();}catch(SQLException e){}
    	}
    	return list;
    }
    
    //회원가입
    public void insert(DTO dto){
    	try { 
    		conn=getConnection();
    		String sql="insert into form values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, dto.getId());
    		pstmt.setString(2, dto.getPw());
    		pstmt.setString(3, dto.getPw2());
    		pstmt.setString(4, dto.getNum1());
    		pstmt.setString(5, dto.getNum2());
    		pstmt.setString(6, dto.getAdr1());
    		pstmt.setString(7, dto.getAdr2());
    		pstmt.setString(8, dto.getSel1());
    		pstmt.setString(9, dto.getPnum1());
    		pstmt.setString(10, dto.getPnum2());
    		pstmt.setString(11, dto.getEm1());
    		pstmt.setString(12, dto.getEm2());
    		pstmt.setString(13, dto.getSel2());
    		pstmt.setString(14, dto.getEmr());
    		pstmt.executeUpdate();
    		
    	}catch(Exception e){e.printStackTrace();}
    	finally{
    		try{ pstmt.close();} catch(SQLException e){}
    		try{ conn.close();} catch(SQLException e){}
    	}
    }
    
    //아디 비번 체크
	public int userCheck(String id, String pw) throws Exception {
		String dbpasswd="";
		int x=-1;
        
		try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select pw from form where id = ?");
            pstmt.setString(1, id);
            rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("pw"); 
				if(dbpasswd.equals(pw))
					x= 1; //인증 성공
				else
					x= 0; //비밀번호 틀림
			}else
				x= -1;//해당 아이디 없음
			
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
	}
    	      
    public DTO getMember(String id)
    	    throws Exception {
    	     
    	        DTO dto=null;
    	        try {
    	            conn = getConnection();
    	            
    	            pstmt = conn.prepareStatement(
    	            	"select * from form where id = ?");
    	            pstmt.setString(1, id);
    	            rs = pstmt.executeQuery();

    	            if (rs.next()) {
    	                dto = new DTO();
    	                  dto.setId(rs.getString("id"));
    	    	    	  dto.setPw(rs.getString("pw"));
    	    	    	  dto.setPw2(rs.getString("pw2"));
    	    	    	  dto.setNum1(rs.getString("num1"));
    	    	    	  dto.setNum2(rs.getString("num2"));
    	    	    	  dto.setAdr1(rs.getString("adr1"));
    	    	    	  dto.setAdr2(rs.getString("adr2"));
    	    	    	  dto.setSel1(rs.getString("sel1"));
    	    	    	  dto.setPnum1(rs.getString("pnum1"));
    	    	    	  dto.setPnum2(rs.getString("pnum2"));
    	    	    	  dto.setEm1(rs.getString("em1"));
    	    	    	  dto.setEm2(rs.getString("em2"));
    	    	    	  dto.setSel2(rs.getString("sel2"));
    	    	    	  dto.setEmr(rs.getString("emr"));
    	            }
    	        } catch(Exception ex) {
    	            ex.printStackTrace();
    	        } finally {
    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    			return dto;
    	    }
    //정보수정
    public void updateMember(DTO dto)

    	    throws Exception {
    	        Connection conn = null;
    	        PreparedStatement pstmt = null;
    	        
    	        try {
    	            conn = getConnection();
    	            
    	            pstmt = conn.prepareStatement(
"update form set pw=?, pw2=?, num1=?,num2=?,adr1=?,adr2=?,sel1=?,pnum1=?,pnum2=?,em1=?,em2=?,sel2=?,emr=?" +
    	              "where id=?");
    	            pstmt.setString(1, dto.getPw());
    	            pstmt.setString(2, dto.getPw2());
    	            pstmt.setString(3, dto.getNum1());
    	    		pstmt.setString(4, dto.getNum2());
    	    		pstmt.setString(5, dto.getAdr1());
    	    		pstmt.setString(6, dto.getAdr2());
    	    		pstmt.setString(7, dto.getSel1());
    	    		pstmt.setString(8, dto.getPnum1());
    	    		pstmt.setString(9, dto.getPnum2());
    	    		pstmt.setString(10, dto.getEm1());
    	    		pstmt.setString(11, dto.getEm2());
    	    		pstmt.setString(12, dto.getSel2());
    	    		pstmt.setString(13, dto.getEmr());
    	    		pstmt.setString(14, dto.getId());
    	    		
    	            pstmt.executeUpdate();
    	        } catch(Exception ex) {
    	            ex.printStackTrace();
    	        } finally {
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    	    }
    
    //회원탈퇴
    public boolean deleteMember(String id, String pw)
    	    throws Exception {
    	       
    	        String dbpw="";
    	        boolean x=false;
    	        try {
    				conn = getConnection();

    	            pstmt = conn.prepareStatement(
    	            	"select pw from form where id = ?");
    	            pstmt.setString(1, id);
    	            rs = pstmt.executeQuery();
    	            
    				if(rs.next()){
    					dbpw= rs.getString("pw"); 
    					if(dbpw.equals(pw)){
    						pstmt = conn.prepareStatement(
    	            	      "delete from form where id=?");
    	                    pstmt.setString(1, id);
    	                    pstmt.executeUpdate();
    						x= true; //회원탈퇴 성공
    					}else
    						x= false; //비밀번호 틀림
    				}
    	        } catch(Exception e) {
    	            e.printStackTrace();
    	        } finally {
    	            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    			return x;
    	    }

    public boolean confirmId(String id) 
    		throws Exception {
    			Connection conn = null;
    	        PreparedStatement pstmt = null;
    			ResultSet rs= null;
    	        boolean x=false;
    	        
    			try {
    	            conn = getConnection();
    	            
    	            pstmt = conn.prepareStatement(
    	            	"select id from form where id = ?");
    	            pstmt.setString(1, id);
    	            rs= pstmt.executeQuery();

    				if(rs.next())
    					x= true; //해당 아이디 있음
    				else
    					x= false;//해당 아이디 없음		
    	        } catch(Exception e) {
    	            e.printStackTrace();
    	        } finally {
    				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
    	            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    	            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    	        }
    			return x;
    		}
}
