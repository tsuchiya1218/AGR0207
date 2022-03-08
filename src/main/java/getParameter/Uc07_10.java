package getParameter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Uc07_10")
public class Uc07_10 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String cash = request.getParameter("cash");

		HttpSession session = request.getSession();
		session.setAttribute("cash", cash);
		RequestDispatcher rd = request.getRequestDispatcher("uc07_12.jsp");
		rd.forward(request, response);
	}
}
