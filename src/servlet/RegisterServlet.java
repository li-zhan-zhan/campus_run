package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import tool.DBUtils;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameterValues("type")[0];
		try {
			Connection conn = DBUtils.getConnection();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery("select * from "+type);
			while(rs.next()) {
				if(rs.getString("username").equals(username)) {
					session.setAttribute("message", "用户已存在！");
					response.sendRedirect("error.jsp");
					return;
				}
			}
			
			PreparedStatement ps = conn.prepareStatement("insert into "+type+"(username,password) values(?,?)");
			ps.setString(1, username);
			ps.setString(2, password);
			boolean res = ps.execute();
			if(!res) {
				session.setAttribute("username", username);
				session.setAttribute("type", type);
				response.sendRedirect(type+".jsp");
				
			} else {
				session.setAttribute("message", "注册失败！");
				response.sendRedirect("error.jsp");
			}
		} catch (Exception e) {
			System.out.println("err:"+e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
