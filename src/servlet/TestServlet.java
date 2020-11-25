package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.DBUtils;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			Connection conn = DBUtils.getConnection();
			String sql = "select * from buyer";
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery(sql);
			while(rs.next()) {
				if(rs.getString("username").equals(username) && rs.getString("password").equals(password)) {
					pw.print(1);
					return;
				}
			}
			pw.print("用户名或者密码错误！");
		} catch (Exception e) {
			System.out.println("err:"+e.getMessage());
		}
		pw.close();
	}
	

}
