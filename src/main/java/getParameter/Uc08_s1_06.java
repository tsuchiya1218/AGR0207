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

@WebServlet("/Uc08_s1_06")
public class Uc08_s1_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<String> ary = new ArrayList<>();
		ArrayList<Integer> time = (ArrayList<Integer>) session.getAttribute("nowtime");
		String radio = request.getParameter("date");

		String todayMM = String.valueOf(time.get(1));
		int today = time.get(2);
		
		char weekChar = radio.charAt(0);
		int week = Character.getNumericValue(weekChar);
		String weekStr = String.valueOf(week);
		
		today += week;
		String todayStr = String.valueOf(today);
		
		String hh = radio.substring(1,3);
		String mm = radio.substring(3,5);
		
		ary.add(todayMM);
		ary.add(todayStr);
		ary.add(hh);
		ary.add(mm);
		ary.add(weekStr);
		
		session.setAttribute("utilization", ary);

		RequestDispatcher rd = request.getRequestDispatcher("uc08_s1_06.jsp");
		rd.forward(request, response);
	}
}
