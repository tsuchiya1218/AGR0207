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

import dao.MemberDao;


@WebServlet("/Uc01_06")
public class Uc01_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MemberDao mDao = new MemberDao();
		
		String sei = request.getParameter("sei");
		String mei = request.getParameter("mei");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String postcode1 = request.getParameter("postcode1");
		String postcode2 = request.getParameter("postcode2");
		String address = request.getParameter("address");
		String mail = request.getParameter("mail");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String pass1 = request.getParameter("pass1");
		String pass2 = request.getParameter("pass2");

		ArrayList<String> ary = new ArrayList<>();
		ary.add(sei);
		ary.add(mei);
		ary.add(year);
		ary.add(month);
		ary.add(day);
		ary.add(postcode1);
		ary.add(postcode2);
		ary.add(address);
		ary.add(mail);
		ary.add(tel1);
		ary.add(tel2);
		ary.add(tel3);
		ary.add(pass1);
		ary.add(pass2);
		session.setAttribute("arraylist",ary);
		if(mDao.serchMail(mail) == true) {
			RequestDispatcher rd = request.getRequestDispatcher("uc01_08.jsp");
			rd.forward(request, response);
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("e_uc01_06.jsp");
			rd.forward(request, response);
		}
	}
}
