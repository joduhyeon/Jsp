package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board.BoardDataBean;

public class CommentDAO {
	
	private Connection conn = null; 
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
    private static CommentDAO instance = new CommentDAO();
	public static CommentDAO getInstance() {return instance;}
	private CommentDAO() {}
	
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	//댓글 달기
	public void insertCommnet(CommentDTO comment) throws Exception {
		
		try{
				conn=getConnection();
				pstmt=conn.prepareStatement("insert into comments(num,comment_num,writer,content,reg_date,ip) "
						+ "values(?,board_seq.NEXTVAL,?,?,?,?)" );
				pstmt.setInt(1, comment.getNum());
				
				pstmt.setString(2, comment.getWriter());
				pstmt.setString(3, comment.getContent());
				pstmt.setTimestamp(4, comment.getReg_date());
				pstmt.setString(5, comment.getIp());
				pstmt.executeUpdate();		
			
			}
		catch(Exception ex) { ex.printStackTrace(); } 
		finally {
			     if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			     if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			     if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		        }
	}
	
	//글 전체 갯수
	public int getCommentCount() throws Exception { //글 갯수 세는 메서드
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from comments"); //레코드갯수몇개
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x= rs.getInt(1);     //카운트로 꺼낸건 하나만 나오니까 1이라고 표현
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
	
	//글목록 전체
    public ArrayList commentGetList(int num) throws Exception {
		ArrayList List=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from comments where num=?");
					pstmt.setInt(1, num); 
					rs = pstmt.executeQuery(); //진행된 결과는 갖는다.
					if (rs.next()) {
							List = new ArrayList(); 
						do{   //  if do while문 보다 whlie문이 좋다.
							CommentDTO comment= new CommentDTO();
							comment.setNum(rs.getInt("num"));
							comment.setComment_num(rs.getInt("comment_num"));
							comment.setWriter(rs.getString("writer"));
							comment.setReg_date(rs.getTimestamp("reg_date"));
							comment.setContent(rs.getString("content"));
							comment.setIp(rs.getString("ip"));
							List.add(comment); 
						}while(rs.next());
					}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
		return List;
	}
    
    //댓글삭제
    public void deleteComment(int comment_num) throws Exception {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(
					 "delete from comments where comment_num=?");
			pstmt.setInt(1, comment_num);
			pstmt.executeUpdate();
			
			} catch(Exception ex) { ex.printStackTrace(); }
			finally {
						if (rs != null) try { rs.close(); } catch(SQLException ex) {}
						if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
						if (conn != null) try { conn.close(); } catch(SQLException ex) {}
					}
	}
}
