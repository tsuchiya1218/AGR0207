package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
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

@WebServlet("/Uc08_s1_04")
public class Uc08_s1_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<Integer> time = new ArrayList<>();
		ArrayList<String> ary = (ArrayList<String>)session.getAttribute("ArrayList");
		ArrayList<String> update = new ArrayList<>();
		ArrayList<Date> eTimelist = new ArrayList<>();
		ArrayList<Date> uTimelist = new ArrayList<>();
		ArrayList<Utilization> ulist = null;
		String u_id = (String)session.getAttribute("u_id");
		UtilizationDao uDao = new UtilizationDao();
		Utilization u = uDao.Utilization(u_id);
		
//		Timestamp t = u.getU_enterDay();
		Date t = new Date();
		SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");
		SimpleDateFormat MM = new SimpleDateFormat("MM");
		SimpleDateFormat dd = new SimpleDateFormat("dd");
		int year = Integer.parseInt(yyyy.format(t));
		int month = Integer.parseInt(MM.format(t));
		int day = Integer.parseInt(dd.format(t));
		Calendar cal = Calendar.getInstance();
		cal.set(year,month,day);
		int week = cal.get(Calendar.DAY_OF_WEEK) - 1;
		time.add(year);
		time.add(month);
		time.add(day);
		time.add(week);
		
		ulist = uDao.findAll();
		Date uDate = new Date();
		Date eDate = new Date();
		for(Utilization ut : ulist) {
			uDate = ut.getU_enterDay();
			eDate = ut.getU_time();
			eTimelist.add(uDate);
			uTimelist.add(eDate);
		}
		
		String num = request.getParameter("num");
		String min = request.getParameter("min");
		if( ary.get(2) != num ) {
			update.add(num);
		}
		if( ary.get(3) != min ) {
			update.add(min);
		}
		ary.add(2,num);
		ary.add(3,min);
		
		StoreDao sDao = new StoreDao();
		RoomDao rDao = new RoomDao();
		ArrayList<Room> rlist = null;
		//錦町店のROOMリストを検索
				String s_id = sDao.findId("錦町店");
				rlist = rDao.findRoom(s_id);

		//店舗ごとのROOMリストを検索(97舗全てのルームをデータベースに登録するのは手間と考え省略 *1店舗あたり30部屋)
//				String s_id = sDao.findId(s_store);
//				rlist = rDao.findRoom(s_id);
				
		session.setAttribute("nowtime",time);
		session.setAttribute("ArrayList",ary);
		session.setAttribute("roomlist", rlist);
		session.setAttribute("eTimelist",eTimelist);
		session.setAttribute("uTimelist",uTimelist);
		RequestDispatcher rd = request.getRequestDispatcher("uc08_s1_04.jsp");
		rd.forward(request, response);
	}
}
