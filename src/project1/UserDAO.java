package project1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "root", "0000");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String sql = "select userPassword from PROJECT where userID = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;	// 로그인 성공
				}else {
					return 0;	// 비밀번호 불일치
				}
			}else {
				return -1;	//아이디가 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;		// 데이터 베이스 오류
	}
	
	public int join(UserVO user) {
		String sql = "insert into PROJECT values(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			System.out.println(user.getUserID());
			System.out.println(user.getUserPassword());
			System.out.println(user.getUserName());
			System.out.println(user.getUserGender());
			System.out.println(user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn != null) {conn.close();}} catch (Exception ex) {ex.printStackTrace();}
			try {if(rs != null)   {rs.close();}}   catch (Exception ex) {ex.printStackTrace();}
			try {if(pstmt != null){pstmt.close();}}catch (Exception ex) {ex.printStackTrace();}
		}
		return -1;
	}
	
}











