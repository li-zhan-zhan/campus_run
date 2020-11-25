package test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import tool.DBUtils;

public class Test {
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
//		Connection conn = DBUtils.getConnection();
//		Statement statement = conn.createStatement();
//		ResultSet rs = statement.executeQuery("select * from user");
//		while(rs.next()) {
//			System.out.println(rs.getString(1));
//			System.out.println(rs.getString("uname"));
//			System.out.println(rs.getString(3));
//		}
		System.out.println(new Timestamp(System.currentTimeMillis())+" 1");
	}
}
