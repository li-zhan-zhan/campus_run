package servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameterValues("type")[0];
		String id = "";
		try {
			Connection conn = DBUtils.getConnection();
			Statement s = conn.createStatement();
			ResultSet rs = s.executeQuery("select * from "+type +" order by id ");
			rs.last();
			id = rs.getString("id");
			rs.beforeFirst();
			while(rs.next()) {
				
				if(rs.getString("username").equals(username)) {
					out.print("err");
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
				session.setAttribute("id", id);
				out.print(type);
			} else {
				out.print("err");
			}
		} catch (Exception e) {
			System.out.println("err:"+e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
