package tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {
	private static Connection conn;
	private static String driverName = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://121.41.228.94:3306/test?useUnicode=true&characterEncoding=utf8";
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
