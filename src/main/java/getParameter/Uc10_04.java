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

@WebServlet("/Uc10_04")
public class Uc10_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		GoodsDao gDao = new GoodsDao();
		ArrayList<Goods> goodslist = new ArrayList<>();
		ArrayList<Goods> glist = new ArrayList<>();
		ArrayList<Goods> orders = new ArrayList<>();
		ArrayList<Integer> quantity = new ArrayList<>();
		ArrayList<String> ary = (ArrayList<String>) session.getAttribute("utilizationAll");
		Goods goods = null;
		String s = request.getParameter("counter20");
		String order = "";
		int count = 0;
		goodslist = gDao.findSoftDrink();
		for (Goods g : goodslist) {
			glist.add(g);
		}
		goodslist = gDao.findAlcohol();
		for (Goods g : goodslist) {
			glist.add(g);
		}
		for (int i = 1; i <= glist.size(); i++) {
			String strI = String.valueOf(i);
			String c = request.getParameter("counter" + strI);
			if (c != null) {
				count = Integer.parseInt(c);
			}
			if (count >= 1) {
				goods = glist.get(i - 1);
				orders.add(goods);
				quantity.add(count);
			}
		}
		int totalQ = 0;
		for (int num : quantity) {
			totalQ += num;
		}
		totalQ += Integer.parseInt(s);
		if (Integer.parseInt(s) >= 1) {
			session.setAttribute("ato",s);
		}
		int i = 0;
		for (Goods g : orders) {
			System.out.println(g.getG_name());
			System.out.println(quantity.get(i) + "点");
			i++;
		}
		System.out.println(totalQ);
		System.out.println(ary.get(2));
		if (totalQ >= Integer.parseInt(ary.get(2))) {
			session.setAttribute("orderlist1", orders);
			session.setAttribute("quantity1", quantity);
			RequestDispatcher rd = request.getRequestDispatcher("uc10_06.jsp");
			rd.forward(request, response);
		} else {
			session.setAttribute("errorr", "人数分選択してください。");
			RequestDispatcher rd = request.getRequestDispatcher("uc10_04.jsp");
			rd.forward(request, response);
		}
	}
}
