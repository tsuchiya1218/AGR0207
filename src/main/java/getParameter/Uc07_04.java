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

@WebServlet("/Uc07_04")
public class Uc07_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<String> ary = new ArrayList<>();
		ArrayList<String> ary2 = (ArrayList<String>) session.getAttribute("nowtime");
		String radio = request.getParameter("date");
		
		String todayMM = ary2.get(1);
		int today = Integer.parseInt(ary2.get(2));
		
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
		RequestDispatcher rd = request.getRequestDispatcher("uc07_06.jsp");
		rd.forward(request, response);
	}
}
