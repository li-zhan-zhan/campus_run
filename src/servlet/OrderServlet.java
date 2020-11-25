package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.DBUtils;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * flag含义：
	 * 0：取消订单
	 * 1：商家接单
	 * 2：骑手接单
	 * 3：确认送达
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		try {
			String flag = request.getParameter("flag");
//			System.out.println(flag);
			String order_id = request.getParameter("order_id");
			String id = (String)request.getSession().getAttribute("id");
			String sql="";
			String changeTime = ",time='"+new Timestamp(System.currentTimeMillis())+"'";
//			System.out.println(changeTime);
			switch(flag) {
			case "0":
				sql = "update `order` set `status`='已取消'"+changeTime+" where id="+order_id;
				break;
			case "1":
				sql = "update `order` set `status`='商家已接单'"+changeTime+" where id="+order_id;
				break;
			case "2":
				sql = "update `order` set `status`='骑手已接单',sender_id="+id+changeTime+" where id="+order_id;
				break;
			case "3":
				sql = "update `order` set `status`='已送达'"+changeTime+" where id="+order_id;
				break;
			}
			Connection conn = DBUtils.getConnection();
			Statement s = conn.createStatement();
			int num = s.executeUpdate(sql);
//			System.out.println(num);
			response.sendRedirect("order.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
