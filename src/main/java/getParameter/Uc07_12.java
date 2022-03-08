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
import dao.StoreDao;
import dao.UtilizationDao;
import model.Member;

@WebServlet("/Uc07_12")
public class Uc07_12 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Calendar calendar = Calendar.getInstance();
		HttpSession session = request.getSession();
		ArrayList<String> ary1 = (ArrayList<String>)session.getAttribute("utilization");
		ArrayList<String> ary2 = (ArrayList<String>)session.getAttribute("utilizationAll");
		ArrayList<String> send = new ArrayList<>();
		String cash = (String)session.getAttribute("cash");
		Member m = (Member) session.getAttribute("member");
		UtilizationDao uDao = new UtilizationDao();
		StoreDao sDao = new StoreDao();
		
		Date dateObj = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String year = sdf1.format(dateObj);
		String entryTime = year+"-"+ary1.get(0)+"-"+ary1.get(1)+" "
				+ary1.get(2)+":"+ary1.get(3)+":00";
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
		
		String max_id = uDao.findMaxId();
		String u_id = null;
		if( max_id != null ) {
			int max = Integer.parseInt(max_id);
			max++;
			u_id = String.valueOf(max);
			do {
				u_id = "0" + u_id;
			}while( u_id.length() < 8 );
		}
		if( u_id == null ) {
			u_id = "00000001";
		}
		
		String s_id = sDao.findId(ary2.get(1));
		
		send.add(u_id);
		send.add(m.getM_id());
		send.add(ary2.get(4));
//		錦町店のみ予約可能(他店のルームが未登録なため)
		send.add("AD01");
//		send.add(s_id);
		send.add(ary2.get(2));
		send.add(useTime);
		send.add(entryTime);
		send.add(ary2.get(7));
		send.add(ary2.get(6));
		send.add(cash);
		
		uDao.setUtilization(send);
		ArrayList<String> ary3 = new ArrayList<>();
		ary3.add("null");
		ary3.add("null");
		
		SimpleDateFormat dd = new SimpleDateFormat("d");
		Date d = new Date();
		if(Integer.parseInt(ary1.get(1))==Integer.parseInt(dd.format(d))) {
			RoomDao rDao = new RoomDao();
			String r_id = uDao.findR_id(u_id);
			rDao.updateR_clean(r_id,"予約");
			uDao.connectionClose();
			rDao.connectionClose();
		}

		RequestDispatcher rd = request.getRequestDispatcher("uc07_14.jsp");
		rd.forward(request, response);
	}
}
