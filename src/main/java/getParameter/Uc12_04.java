package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrdersDao;
import model.Goods;
@WebServlet("/Uc12_04")
public class Uc12_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<Goods> glist = (ArrayList<Goods>)session.getAttribute("orderlist");
		ArrayList<Integer> quantity = (ArrayList<Integer>)session.getAttribute("quantity");
		String u_id = (String)session.getAttribute("u_id");
		ArrayList<String> ary = null;
		

		Date d;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date;
		int i = 0;
		
		ary = new ArrayList<>();
		for( Goods g : glist ) {
			OrdersDao oDao = new OrdersDao();
			d = new Date();
			date = sdf.format(d);

			ary.add(u_id);
			ary.add(g.getG_id());
			ary.add(String.valueOf(quantity.get(i)));
			ary.add(date);
			oDao.setOrder(ary);
			oDao.connectionClose();
			i++;
			for(String s : ary){
				System.out.println(s);
			}
			System.out.println();
		}

		RequestDispatcher rd = request.getRequestDispatcher("uc12_06.jsp");
		rd.forward(request, response);
	}
}
