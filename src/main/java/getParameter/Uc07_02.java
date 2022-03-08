package getParameter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import dao.StoreDao;
import dao.UtilizationDao;
import model.Room;
import model.Utilization;

@WebServlet("/Uc07_02")
public class Uc07_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Calendar calendar = Calendar.getInstance();
		ArrayList<String> ary = new ArrayList<>();
		ArrayList<String> time = new ArrayList<>();
		ArrayList<Room> rlist = null;
		ArrayList<Utilization> ulist = null;
		ArrayList<Date> eTimelist = new ArrayList<>();
		ArrayList<Date> uTimelist = new ArrayList<>();
		StoreDao sDao = new StoreDao();
		RoomDao rDao = new RoomDao();
		UtilizationDao uDao = new UtilizationDao();
		String t;
		String s_store = request.getParameter("subbox");
		String num = request.getParameter("num");
		String min = request.getParameter("min");

		ary.add(s_store);
		ary.add(num);
		ary.add(min);
//錦町店のROOMリストを検索
		String s_id = sDao.findId("錦町店");
		rlist = rDao.findRoom(s_id);

//店舗ごとのROOMリストを検索(97舗全てのルームをデータベースに登録するのは手間と考え省略 *1店舗あたり30部屋)
//		String s_id = sDao.findId(s_store);
//		rlist = rDao.findRoom(s_id);
		sDao.connectionClose();
		rDao.connectionClose();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH) + 1;
		int day = calendar.get(Calendar.DATE);
		int week = calendar.get(Calendar.DAY_OF_WEEK) - 1;
		t = String.valueOf(year);
		time.add(t);
		t = String.valueOf(month);
		time.add(t);
		t = String.valueOf(day);
		time.add(t);
		t = String.valueOf(week);
		time.add(t);
		
		ulist = uDao.findAll();
		Date uDate = new Date();
		Date eDate = new Date();
		for(Utilization u : ulist) {
			uDate = u.getU_enterDay();
			eDate = u.getU_time();
			eTimelist.add(uDate);
			uTimelist.add(eDate);
		}

		HttpSession session = request.getSession();
		session.setAttribute("ArrayList", ary);
		session.setAttribute("roomlist", rlist);
		session.setAttribute("nowtime", time);
		session.setAttribute("utilizationlist",ulist);
		session.setAttribute("eTimelist",eTimelist);
		session.setAttribute("uTimelist",uTimelist);
		
		RequestDispatcher rd = request.getRequestDispatcher("uc07_04.jsp");
		rd.forward(request, response);
	}
}
