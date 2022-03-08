package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ModelDao;
import dao.RoomDao;
import dao.StoreDao;
import dao.UtilizationDao;
import model.Utilization;

@WebServlet("/Uc08_s2_02")
public class Uc08_s2_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String u_id = request.getParameter("u_id");
		ArrayList<String> ary = new ArrayList<>();

		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		SimpleDateFormat MM = new SimpleDateFormat("MM");
		SimpleDateFormat dd = new SimpleDateFormat("dd");
		SimpleDateFormat HH = new SimpleDateFormat("HH");
		SimpleDateFormat mm = new SimpleDateFormat("mm");

		UtilizationDao uDao = new UtilizationDao();
		Utilization u = uDao.Utilization(u_id);
		uDao.connectionClose();
		String year = yyyy.format(u.getU_enterDay());
		String month = MM.format(u.getU_enterDay());
		String day = dd.format(u.getU_enterDay());
		Calendar cal = Calendar.getInstance();
		cal.set(Integer.parseInt(year), Integer.parseInt(month), Integer.parseInt(day));
		String[] week_name = { "日", "月", "火", "水", "木", "金", "土" };
		int week = cal.get(Calendar.DAY_OF_WEEK) - 1;

		ModelDao mDao = new ModelDao();
		RoomDao rDao = new RoomDao();
		StoreDao sDao = new StoreDao();
		String time = Integer.parseInt(month) + "月" + Integer.parseInt(day) + "日(" + week_name[week] + ") "
				+ HH.format(u.getU_enterDay()) + ":" + mm.format(u.getU_enterDay());

		String shop = sDao.findStoreName(u.getS_id());
		String number = String.valueOf(u.getU_num());
		int hour = Integer.parseInt(HH.format(u.getU_time()));
		int min = Integer.parseInt(mm.format(u.getU_time()));
		String useTime = String.valueOf(hour * 60 + min);
		String roomNum = u.getR_id();
		String model_id = rDao.findModelId(u.getR_id());
		rDao.connectionClose();
		String model = mDao.findModelName(model_id);
		mDao.connectionClose();
		String rPrice = String.valueOf(u.getU_reservePrice());

		ary.add(time);
		ary.add(shop);
		ary.add(number);
		ary.add(useTime);
		ary.add(roomNum);
		ary.add(model);
		ary.add(rPrice);
		ary.add(u_id);

		session.setAttribute("utilizationAll", ary);
		RequestDispatcher rd = request.getRequestDispatcher("uc08_s2_02.jsp");
		rd.forward(request, response);
	}
}
