package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "root", "0000");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	  public String getDate() // 현재시간을 넣어주기위해
	    {
		  String SQL = "SELECT TO_CHAR(SYSDATE, 'RRRR-MM-DD hh24:mi:ss') FROM DUAL";	        
		  try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                return rs.getString(1);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return ""; // 데이터베이스 오류
	    }
	    
	    public int getNext()
	    {
	        String SQL = "SELECT bbsID FROM BBS1 ORDER BY bbsID DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                return rs.getInt(1) + 1; // 그 다음 게시글의 번호
	            }
	            return 1; // 첫 번째 게시물인 경우
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    
	    public int write(String bbsTitle, String userID, String bbsContent) {
	        String SQL = "INSERT INTO BBS1 VALUES (?,?,?,?,?,?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext());
	            pstmt.setString(2, bbsTitle);
	            pstmt.setString(3, userID);
	            pstmt.setString(4, getDate());
	            pstmt.setString(5, bbsContent);
	            pstmt.setInt(6, 1);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    public ArrayList<Bbs> getList(int pageNumber)
	    {
	    	String SQL = "SELECT * FROM (SELECT * FROM BBS1 WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC) WHERE ROWNUM <= 10";	
	    	ArrayList<Bbs> list = new ArrayList<Bbs>();
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                Bbs bbs = new Bbs();
	                bbs.setBbsID(rs.getInt(1));
	                bbs.setBbsTitle(rs.getString(2));
	                bbs.setUserID(rs.getString(3));
	                bbs.setBbsDate(rs.getString(4));
	                bbs.setBbsContent(rs.getString(5));
	                bbs.setBbsAvailable(rs.getInt(6));
	                list.add(bbs);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list; 
	    }
//	    페이징 처리를 위한 함수
	    public boolean nextPage(int pageNumber) {
	        String SQL = "SELECT * FROM BBS1 WHERE bbsID < ? AND bbsAvailable = 1"; 
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstmt.executeQuery();
	            if (rs.next())
	            {
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false; 
	    }
	

	public Bbs getBbs(int bbsID) {
	    String SQL = "SELECT * FROM BBS1 WHERE bbsID = ? "; 
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            rs = pstmt.executeQuery();
            if (rs.next()){
            	 Bbs bbs = new Bbs();
	                bbs.setBbsID(rs.getInt(1));
	                bbs.setBbsTitle(rs.getString(2));
	                bbs.setUserID(rs.getString(3));
	                bbs.setBbsDate(rs.getString(4));
	                bbs.setBbsContent(rs.getString(5));
	                bbs.setBbsAvailable(rs.getInt(6));
                return bbs;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null; 
    }
	
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		 String SQL = "UPDATE BBS1 SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setString(1, bbsTitle);
	            pstmt.setString(2, bbsContent);
	            pstmt.setInt(3, bbsID);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	public int delete(int bbsID) {
		 String SQL = "UPDATE BBS1 SET bbsAvailable= 0 WHERE bbsID = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, bbsID);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	
	}
