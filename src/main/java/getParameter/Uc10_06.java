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
import model.Goods;
@WebServlet("/Uc10_06")
public class Uc10_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();

		GoodsDao gDao = new GoodsDao();
		ArrayList<Goods> goodslist = new ArrayList<>();
		ArrayList<Goods> glist = new ArrayList<>();
		ArrayList<Goods> orders = (ArrayList<Goods>)session.getAttribute("orderlist1");
		ArrayList<Integer> quantity = (ArrayList<Integer>)session.getAttribute("quantity1");
		Goods goods = null;
		String order = "";
		int count = 0;
		goodslist = gDao.findFood();
		for( Goods g : goodslist ) {
			glist.add(g);
		}
		for(int i = 1 ; i <= glist.size() ; i++ ) {
			String strI = String.valueOf(i);
			String c = request.getParameter("counter" + strI);
			if( c != null ) {
				count = Integer.parseInt(c);
			}
			if( count >= 1 ) {
				goods = glist.get(i - 1);
				orders.add(goods);
				quantity.add(count);
			}
		}
		int i = 0;
		for(Goods g : orders) {
			System.out.println(g.getG_name());
			System.out.println(quantity.get(i) +"点");
			i++;
		}
		session.setAttribute("orderlist",orders);
		session.setAttribute("quantity", quantity);
		RequestDispatcher rd = request.getRequestDispatcher("uc10_08.jsp");
		rd.forward(request, response);
	}
}
