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
	
	//��� �ޱ�
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
	
	//�� ��ü ����
	public int getCommentCount() throws Exception { //�� ���� ���� �޼���
		int x=0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from comments"); //���ڵ尹���
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
    public ArrayList commentGetList(int num) throws Exception {
		ArrayList List=null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from comments where num=?");
					pstmt.setInt(1, num); 
					rs = pstmt.executeQuery(); //����� ����� ���´�.
					if (rs.next()) {
							List = new ArrayList(); 
						do{   //  if do while�� ���� whlie���� ����.
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
    
    //��ۻ���
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
