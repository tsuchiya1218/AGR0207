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

@WebServlet("/Uc11_04")
public class Uc11_04 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String cash = request.getParameter("cash");
		ArrayList<String> ary = (ArrayList<String>)session.getAttribute("ArrayList");
        int total = 
        		Integer.parseInt(ary.get(0))
        		+ Integer.parseInt(ary.get(1))
        		+ Integer.parseInt(ary.get(2))
        		;
		session.setAttribute("cash",cash);
		session.setAttribute("total",total);

		RequestDispatcher rd = request.getRequestDispatcher("uc11_06.jsp");
		rd.forward(request, response);
	}
}
