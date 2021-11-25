package user;

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
	//로그인 시도
	public int login(String userID, String userPassword) {
		String sql = "select userPassword from BBS where userID = ?";
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
	
	public int join(User user) {
		String sql = "insert into BBS values(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	// 데이터 베이스 오류
	
	}
}

