package getParameter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;


@WebServlet("/Uc01_02")
public class Uc01_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		MemberDao mDao = new MemberDao();
		String mail = request.getParameter("mail");
		String error = "すでに登録済のメールアドレスです。\n他のメールアドレスをご利用ください。";

		if(mDao.serchMail(mail) == true) {
			session.setAttribute("mail",mail);
			RequestDispatcher rd = request.getRequestDispatcher("uc01_04.jsp");
			rd.forward(request, response);
		}else{
			session.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("uc01_02.jsp");
			rd.forward(request, response);
		}
	}
}
