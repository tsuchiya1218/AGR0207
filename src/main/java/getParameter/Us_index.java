package getParameter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StoreDao;

@WebServlet("/Us_index")
public class Us_index extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		
		String s_id = request.getParameter("id");
		String s_pass = request.getParameter("pass");
		
		StoreDao sDao = new StoreDao();
		if( sDao.login(s_id, s_pass) == true ) {
			session.setAttribute("s_id",s_id);
			RequestDispatcher rd = request.getRequestDispatcher("us01_03.jsp");
			rd.forward(request, response);
		} else {
			String error = "ID、またはパスワードが一致していません。";
			session.setAttribute("error",error);
			RequestDispatcher rd = request.getRequestDispatcher("us_index.jsp");
			rd.forward(request, response);
		}

	}
}
