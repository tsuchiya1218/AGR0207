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
import model.Member;


@WebServlet("/Uc06_04")
public class Uc06_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String mail = request.getParameter("mail");
		String pass = request.getParameter("pass");
		Member m = (Member) session.getAttribute("member");
		if( m.getM_mail().equals(mail) && m.getM_pass().equals(pass) ) {
			MemberDao mDao = new MemberDao();
			mDao.delete(m.getM_id());
			mDao.connectionClose();
			RequestDispatcher rd = request.getRequestDispatcher("uc06_06.jsp");
			rd.forward(request, response);
		}else {
			String error= "メールアドレス、またはパスワードが間違っています。";
			session.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("uc06_04.jsp");
			rd.forward(request, response);
		}
	}
}
