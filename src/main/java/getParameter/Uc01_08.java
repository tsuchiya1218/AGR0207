package getParameter;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

@WebServlet("/Uc01_08")
public class Uc01_08 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		ArrayList<String> ary = (ArrayList<String>) session.getAttribute("arraylist");
		MemberDao mDao = new MemberDao();
		Random rand = new Random();
		int num = rand.nextInt(100000000) + 100;
		String id = String.valueOf(num);
		ary.add(0, id);
		try {
			String strDate = ary.get(3) + "-" + ary.get(4) + "-" + ary.get(5);
			SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = sdFormat.parse(strDate);
			mDao.setMember(ary, date);
			mDao.connectionClose();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("uc01_10.jsp");
		rd.forward(request, response);
	}
}
