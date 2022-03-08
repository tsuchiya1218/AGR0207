package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StoreDao;
import dao.UtilizationDao;
import model.Utilization;

@WebServlet("/Uc08_s1_02")
public class Uc08_s1_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ArrayList<String> ary = new ArrayList<>();
		String u_id = request.getParameter("u_id");
		UtilizationDao uDao = new UtilizationDao();
		StoreDao sDao = new StoreDao();
		Utilization u = uDao.Utilization(u_id);
		String area = sDao.findAreaName(u.getS_id());
		String store = sDao.findStoreName(u.getS_id());
		String num = String.valueOf(u.getU_num());
		
		SimpleDateFormat HH = new SimpleDateFormat("HH");
		SimpleDateFormat mm = new SimpleDateFormat("mm");
		int hour = Integer.parseInt(HH.format(u.getU_time()));
		int min = Integer.parseInt(mm.format(u.getU_time()));
		int minTime = hour * 60 + min;
		
		ary.add(area);
		ary.add(store);
		ary.add(num);
		ary.add(String.valueOf(minTime));
		HttpSession session = request.getSession();
		session.setAttribute("u_id",u_id);
		session.setAttribute("ArrayList", ary);
		RequestDispatcher rd = request.getRequestDispatcher("uc08_s1_02.jsp");
		rd.forward(request, response);
	}
}
