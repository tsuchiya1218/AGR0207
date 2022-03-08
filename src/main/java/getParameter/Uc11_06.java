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

import dao.RoomDao;
import dao.UtilizationDao;
import model.Member;

@WebServlet("/Uc11_06")
public class Uc11_06 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("member");
		String u_id = (String)session.getAttribute("u_id");
		
		UtilizationDao uDao = new UtilizationDao();
		RoomDao rDao = new RoomDao();
		
		uDao.updateU_payment(u_id,1);
		
		ArrayList<String> ary = new ArrayList<>();
		ary.add("null");
		ary.add("null");
		session.setAttribute("menu",ary);

		RequestDispatcher rd = request.getRequestDispatcher("uc11_08.jsp");
		rd.forward(request, response);
	}
}
