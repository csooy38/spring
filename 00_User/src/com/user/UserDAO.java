package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private ConnectionMaker connectionMaker;
	
	public UserDAO() { }	// 기본생성자
	
	public UserDAO(ConnectionMaker connectionMaker) {
		this.connectionMaker = connectionMaker;
	}

	// user 테이블에 회원을 추가하는 메서드
	public void add(UserDTO dto) {

		try {
			connectionMaker.makeConnection();

			String sql = "insert into users values(?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());

			pstmt.executeUpdate();

			pstmt.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public UserDTO getUser(String id) {
		UserDTO dto = new UserDTO();

		try {
			connectionMaker.makeConnection();

			String sql = "select * from users where id = ?";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
			}

			rs.close();
			pstmt.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return dto;
	}

	
}
