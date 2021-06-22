package com.user;

import java.sql.Connection;
import java.sql.DriverManager;

public class BConnectionMaker implements ConnectionMaker {

	Connection con = null;

	@Override
	public Connection makeConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "web";
		String passward = "1234";

		try {
			Class.forName(driver);

			con = DriverManager.getConnection(url, user, passward);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
