package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.DBConnection;

@WebServlet("/LoginCheckServlet")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameterValues("type")[0];
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "select * from user";
			Statement cs = conn.createStatement();
			ResultSet rs = cs.executeQuery(sql);
			while(rs.next()) {
				System.out.println("db "+rs.getString("uname") +rs.getString("pwd"));
				System.out.println("input "+username+password);
				if(rs.getString("uname").equals(username) && rs.getString("pwd").equals(password)) {
					session.setAttribute("username", username);
					session.setAttribute("type", type);
					if(rs.getString(4).equals(type)) {
						response.sendRedirect(type+".jsp");
						return;
					} else {
						session.removeAttribute("username");
						session.removeAttribute("type");
						session.setAttribute("message", "用户未注册！");
						response.sendRedirect("error.jsp");
						return;
					}
				}
			}
			session.setAttribute("message", "用户名或者密码错误！");
			response.sendRedirect("error.jsp");
			return;
		} catch (Exception e) {
			System.out.println("err:"+e.getMessage());
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
