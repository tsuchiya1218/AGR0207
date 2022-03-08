package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.WorkerDao;

@WebServlet("/Us09")
public class Us09 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		String w_id = request.getParameter("w_id");
		String w_name = request.getParameter("w_name");
		String button = request.getParameter("button");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		ArrayList<String> ary = new ArrayList<>();
		WorkerDao wDao = new WorkerDao();
		if (button.equals("subsc")) {
			if (!wDao.checkId(w_id)) {
				session.setAttribute("error", "既に使用されているIDです。");
				RequestDispatcher rd = request.getRequestDispatcher("us09_02.jsp");
				rd.forward(request, response);
			} else if (w_id.equals("") || w_name.equals("")) {
				session.setAttribute("error", "正しい名前を入力してください。");
				RequestDispatcher rd = request.getRequestDispatcher("us09_02.jsp");
				rd.forward(request, response);
			} else {
				ary.add(w_id);
				ary.add(w_name);
				ary.add(sdf.format(date));
				wDao.setWorker(ary);
			}
		} else {
			wDao.deleteWorker(button);
			wDao.connectionClose();
		}
		session.setAttribute("error", null);
		RequestDispatcher rd = request.getRequestDispatcher("us09_02.jsp");
		rd.forward(request, response);
	}
}
