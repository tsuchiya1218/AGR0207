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
import dao.RoomDao;
import dao.UtilizationDao;
import model.Goods;
import model.Member;
@WebServlet("/Uc10_08")
public class Uc10_08 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<Goods> glist = (ArrayList<Goods>)session.getAttribute("orderlist");
		ArrayList<Integer> quantity = (ArrayList<Integer>)session.getAttribute("quantity");
		Member m = (Member)session.getAttribute("member");
		String u_id = (String)session.getAttribute("u_id");
		ArrayList<String> ary = null;
		
		Date d;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date;
		int i = 0;
		
			for( Goods g : glist ) {
				OrdersDao oDao = new OrdersDao();
				ary = new ArrayList<>();
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
		
		
		UtilizationDao uDao = new UtilizationDao();
		RoomDao rDao = new RoomDao();
		String r_id = uDao.findR_id(u_id);
		Date time = new Date();
		String enterTime = sdf.format(time);
		uDao.updateU_payment(u_id,1);
		uDao.updateU_enterTime(u_id,enterTime);
		rDao.updateR_clean(r_id,"予約");
		ArrayList<String> ary2 = new ArrayList<>();
		ary2.add("null");
		ary2.add("null");
		if( uDao.findEnterJudge(m.getM_id()) != null ){
			ary2 = uDao.findEnterJudge(m.getM_id());
			session.setAttribute("menu",ary2);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("uc10_10.jsp");
		rd.forward(request, response);
	}
}
