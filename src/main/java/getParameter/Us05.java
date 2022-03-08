package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrdersDao;
import dao.RoomDao;

@WebServlet("/Us05")
public class Us05 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		RoomDao rDao = new RoomDao();
		OrdersDao oDao = new OrdersDao();
		String w_id = request.getParameter("w_id");
		String o_id = request.getParameter("o_id");
		String finO_id = request.getParameter("fin");
		System.out.println( w_id+o_id+ finO_id);
		if (o_id == null && finO_id != null) {
			System.out.println("完了");
			oDao.updateO_offerTime(finO_id, sdf.format(date));
			oDao.updateO_situation(finO_id,"届け済");
		} else if (w_id == "" && o_id != null) {
			System.out.println("名無し確定");
			oDao.updatew_id(o_id, "NO");
			oDao.updateO_makeTime(o_id, sdf.format(date));
		} else {
			System.out.println("名前確定");
			oDao.updatew_id(o_id, w_id);
			oDao.updateO_makeTime(o_id, sdf.format(date));
		}
		RequestDispatcher rd = request.getRequestDispatcher("us05_02.jsp");
		rd.forward(request, response);
	}
}
