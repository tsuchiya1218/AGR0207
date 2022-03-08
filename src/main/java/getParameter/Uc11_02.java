package getParameter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GoodsDao;
import dao.OrdersDao;
import dao.UtilizationDao;
import model.Orders;
import model.Utilization;

@WebServlet("/Uc11_02")
public class Uc11_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		OrdersDao oDao = new OrdersDao();
		GoodsDao gDao = new GoodsDao();
		UtilizationDao uDao = new UtilizationDao();
		String u_id = (String)session.getAttribute("u_id");
		ArrayList<String> ary = new ArrayList<>();
		ArrayList<String> food1 = new ArrayList<>();
		ArrayList<String> food2 = new ArrayList<>();
		
		ArrayList<Orders> olist = oDao.findOrders(u_id);
		String g_name = null;
		int o_quantity = 0;
		int total = 0;
		int price = 0;
		for( Orders o : olist ) {
			g_name = gDao.findName(o.getG_id());
			o_quantity = o.getO_quantity();
			price = gDao.findPrice(o.getG_id());
			total += price * o_quantity;
			food1.add(g_name);
			food2.add(String.valueOf(o_quantity));
		}
		Utilization u = uDao.Utilization(u_id);
		String ePrice = String.valueOf(u.getU_Eprice());
		String roomPrice = String.valueOf(u.getU_roomPrice());
		String reservePrice = String.valueOf(u.getU_reservePrice());
		
		ary.add(String.valueOf(total));
		ary.add(ePrice);
		ary.add(roomPrice);
		ary.add(reservePrice);
		
		int u_num = u.getU_num();
		
		session.setAttribute("u_num",u_num);
		session.setAttribute("foodName", food1);
		session.setAttribute("foodQuantity", food2);
		session.setAttribute("ArrayList",ary);
		RequestDispatcher rd = request.getRequestDispatcher("uc11_02.jsp");
		rd.forward(request, response);
	}
}
