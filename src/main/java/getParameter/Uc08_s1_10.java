package getParameter;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
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
import dao.UtilizationDao;
import model.Utilization;

@WebServlet("/Uc08_s1_10")
public class Uc08_s1_10 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String u_id = (String)session.getAttribute("u_id");
		ArrayList<String> ary1 = (ArrayList<String>)session.getAttribute("utilization");
		ArrayList<String> ary2 = (ArrayList<String>)session.getAttribute("utilizationAll");
		
		Date dateObj = new Date();
		SimpleDateFormat dd = new SimpleDateFormat("dd");
		SimpleDateFormat dd2 = new SimpleDateFormat("d");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String year = sdf1.format(dateObj);
		String entryTime = year+"-"+ary1.get(0)+"-"+ary1.get(1)+" "
				+ary1.get(2)+":"+ary1.get(3)+":00";
		Calendar calendar = Calendar.getInstance();
		calendar = Calendar.getInstance();
		String useTime = year+"-"+ary1.get(0)+"-"+ary1.get(1)+" 00:00:00";
		Date date = null;
		Date eTime = null;
		try {
			eTime = sdf2.parse(entryTime);
			date = sdf2.parse(useTime);
		} catch (ParseException e) {e.printStackTrace();}
		calendar.setTime(date);
		int t = Integer.parseInt(ary2.get(3));
		calendar.add(Calendar.MINUTE,t);
		Date uTime = calendar.getTime();
		
		Timestamp e = new Timestamp(eTime.getTime());
		Timestamp u = new Timestamp(uTime.getTime());
		entryTime = sdf2.format(e);
		useTime = sdf2.format(u);

		UtilizationDao uDao = new UtilizationDao();
		Utilization uu = uDao.Utilization(u_id);
		if( !String.valueOf(uu.getU_num()).equals(ary2.get(2)) ) {
			uDao.updateU_num(u_id,ary2.get(2));
		}
		if( !String.valueOf(uu.getR_id()).equals(ary2.get(4)) ) {
			uDao.updateR_id(u_id,ary2.get(4));
		}
		String e_time = sdf2.format(uu.getU_enterDay());
		String u_time = sdf2.format(uu.getU_time());
		if( !e_time.equals(entryTime) ) {
			uDao.updateU_enterDay(u_id,entryTime);
		}
		if( !u_time.equals(useTime) ) {
			uDao.updateU_time(u_id,useTime);
		}
		if( !String.valueOf(uu.getU_roomPrice()).equals(ary2.get(6)) ) {
			uDao.updateU_roomPrice(u_id,ary2.get(6));
		}
		if( !String.valueOf(uu.getU_reservePrice()).equals(ary2.get(7)) ) {
			uDao.updateU_reservePrice(u_id,ary2.get(7));
		}
		Date d = new Date();
		if(Integer.parseInt(ary1.get(1))==Integer.parseInt(dd.format(d))) {
			RoomDao rDao = new RoomDao();
			String r_id = uDao.findR_id(u_id);
			rDao.updateR_clean(r_id,"予約");
			uDao.connectionClose();
			rDao.connectionClose();
		}

		RequestDispatcher rd = request.getRequestDispatcher("uc08_s1_10.jsp");
		rd.forward(request, response);
	}
}

