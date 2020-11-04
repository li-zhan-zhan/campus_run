package tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static Connection conn;
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/test";
	private static String username = "root";
	private static String password = "root";
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		if(conn==null) {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);			
		}
		return conn;
	}
}
