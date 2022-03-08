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

import dao.ModelDao;
import dao.RoomDao;

@WebServlet("/Uc07_06")
public class Uc07_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<String> getAry = (ArrayList<String>) session.getAttribute("utilization");
		ArrayList<String> getToday = (ArrayList<String>) session.getAttribute("nowtime");
		ArrayList<String> getAry2 = (ArrayList<String>) session.getAttribute("ArrayList");
		ArrayList<String> ary = new ArrayList<>();
		ModelDao mDao = new ModelDao();
		RoomDao rDao = new RoomDao();
		String[] week_name = { "日", "月", "火", "水", "木", "金", "土" };
		String r_id = request.getParameter("room");
		int today = Integer.parseInt(getToday.get(3));
		int weekInt = Integer.parseInt(getAry.get(4));
		int week = today;
		for( int i = 1 ; i <= weekInt ; i++ ) {
			week++;
			if(week > 6) {
				week = 0;
			}
		}
		String time = getAry.get(0)+"月"+getAry.get(1)+"日("+week_name[week]+") "+getAry.get(2)+":"+getAry.get(3);
		String shop = getAry2.get(0);
		String number = getAry2.get(1);
		String useTime = getAry2.get(2);
		String roomNum = r_id;
		String model_id = rDao.findModelId(r_id);
		rDao.connectionClose();
		String model = mDao.findModelName(model_id);
		mDao.connectionClose();
		int priceInt;
		String price;
		String rPrice;
		if( week_name[week].equals("土") || week_name[week].equals("日") ) {
			priceInt = 300 * (Integer.parseInt(useTime)/30) * Integer.parseInt(number) - 300;
			if(Integer.parseInt(useTime) > 180) {
				price = String.valueOf(1800 * Integer.parseInt(number) - 300);
			}else {
				price = String.valueOf(priceInt);
			}
			rPrice = "300";
		}else {
			priceInt = 150 * (Integer.parseInt(useTime)/30) * Integer.parseInt(number) - 150;
			if(Integer.parseInt(useTime) > 180) {
				price = String.valueOf(900 * Integer.parseInt(number) - 150);
			}else {
				price = String.valueOf(priceInt);
			}
			rPrice = "150";
		}
		
		ary.add(time);
		ary.add(shop);
		ary.add(number);
		ary.add(useTime);
		ary.add(roomNum);
		ary.add(model);
		ary.add(price);
		ary.add(rPrice);
		
		session.setAttribute("utilizationAll", ary);
		RequestDispatcher rd = request.getRequestDispatcher("uc07_08.jsp");
		rd.forward(request, response);
	}
}
