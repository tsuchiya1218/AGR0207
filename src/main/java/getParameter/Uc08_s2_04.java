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

import dao.UtilizationDao;

@WebServlet("/Uc08_s2_04")
public class Uc08_s2_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		ArrayList<String> ary = (ArrayList<String>)session.getAttribute("utilizationAll");
		String u_id =ary.get(7);
		UtilizationDao uDao = new UtilizationDao();
		uDao.delete(u_id);
		uDao.connectionClose();

		RequestDispatcher rd = request.getRequestDispatcher("uc08_s2_04.jsp");
		rd.forward(request, response);
	}
}
