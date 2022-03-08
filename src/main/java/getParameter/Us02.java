package getParameter;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RoomDao;
import dao.UtilizationDao;

@WebServlet("/Us02")
public class Us02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String r_id = request.getParameter("r_id");
		String u_id = request.getParameter("u_id");
		String syori = request.getParameter("button");
		UtilizationDao uDao = new UtilizationDao();
		RoomDao rDao = new RoomDao();
		System.out.println(r_id + syori+u_id);
		
		if( syori.equals("入室") ) {
			uDao.updateU_enterJudge(u_id,"入室中");
			boolean b = uDao.check(u_id);
			if( b == true ) {
				rDao.updateR_clean(r_id,"使用中");
			}
		}
		if( syori.equals("退室") ) {
			uDao.updateU_enterJudge(u_id,"退室済");
			uDao.updateU_exitTime(u_id,sdf.format(date));
			boolean b = uDao.check(u_id);
			if( b == true ) {
				rDao.updateR_clean(r_id,"未清掃");
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("us02_02.jsp?r_id="+r_id);
		rd.forward(request, response);
	}
}



