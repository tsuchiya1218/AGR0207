package getParameter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RoomDao;

@WebServlet("/Us06")
public class Us06 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		RoomDao rDao = new RoomDao();
		String w_id = request.getParameter("w_id");
		String r_id = request.getParameter("r_id");
		String finR_id = request.getParameter("finR_id");
		if(w_id == null && r_id == null && finR_id != null){
			rDao.updateR_clean(finR_id,"空き");
			rDao.updateW_id(finR_id, "NO");
		}else if( w_id !=""&&r_id!=null&&finR_id==null ){
			rDao.updateR_clean(r_id,"清掃中");
			rDao.updateW_id(r_id, w_id);
		}
		RequestDispatcher rd = request.getRequestDispatcher("us06_02.jsp");
		rd.forward(request, response);
	}
}
