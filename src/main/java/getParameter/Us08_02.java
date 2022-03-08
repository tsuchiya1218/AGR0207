package getParameter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WorkerDao;

@WebServlet("/Us08_02")
public class Us08_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String w_id = request.getParameter("id");
		String w_pass = request.getParameter("pass");
		WorkerDao wDao = new WorkerDao();
		String truePass = wDao.findpass(w_id);
		if(w_pass.equals(truePass)) {
			session.setAttribute("error",null);
			RequestDispatcher rd = request.getRequestDispatcher("us08_04.jsp");
			rd.forward(request, response);
		}else {
			session.setAttribute("error","IDまたはパスワードが間違っています。");
			RequestDispatcher rd = request.getRequestDispatcher("us08_02.jsp");
			rd.forward(request, response);
		}
	}
}
