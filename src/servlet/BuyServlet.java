package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.DBUtils;

@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection conn = null;
		String goods_id = request.getParameter("goods_id");
		String seller_id = request.getParameter("seller_id");
		String buyer_id = request.getParameter("buyer_id");
		try {
			conn = DBUtils.getConnection();
			conn.setAutoCommit(false); //开启事务，禁止自动提交
			String updateSql = "update goods set stock=stock-1 where id=?";
			PreparedStatement updateGoodsPs = conn.prepareStatement(updateSql);
			updateGoodsPs.setString(1, goods_id);
			int num1 = updateGoodsPs.executeUpdate();
			if(num1==1) {
//				System.out.println("库存减少成功");
			}
			
			String addSql = "insert into `order`(goods_id,buyer_id,seller_id,time,status) "+
			" values(?,?,?,?,?)";
			PreparedStatement addOrderPs = conn.prepareStatement(addSql);
			addOrderPs.setString(1, goods_id);
			addOrderPs.setString(2, buyer_id);
			addOrderPs.setString(3,seller_id);
			addOrderPs.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			addOrderPs.setString(5, "已下单");
			int num2 = addOrderPs.executeUpdate();
			if(num1==1&&num2==1) {
				conn.commit(); //执行成功，提交事务
				response.sendRedirect("order.jsp");
			} else {
				conn.rollback(); //发生异常，事务回滚
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
