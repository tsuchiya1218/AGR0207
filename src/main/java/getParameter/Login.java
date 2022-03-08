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

import dao.MemberDao;
import dao.UtilizationDao;
import model.Member;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String mail = request.getParameter("m_mail");
		String pass = request.getParameter("m_pass");

		Member m = new Member();
		m.setSearchM_mail(mail);
		MemberDao mdao = new MemberDao();
		String m_id = mdao.logIn(m);

		m = mdao.findMember(m_id);
		mdao.connectionClose();
		HttpSession session = request.getSession();

		
		ArrayList<String> ary = new ArrayList<>();
		ary.add("null");
		ary.add("null");
		UtilizationDao uDao = new UtilizationDao();
		if( uDao.findEnterJudge(m.getM_id()) != null ){
			ary = uDao.findEnterJudge(m.getM_id());
			session.setAttribute("u_id",ary.get(0));
		}
		
		if( m.getM_id() != null ) {
			if( pass.equals(m.getM_pass()) ) {
				session.setAttribute("member",m);
				session.setAttribute("menu",ary);
				RequestDispatcher rd = request.getRequestDispatcher("uc02_03.jsp");
				rd.forward(request, response);
			}else{
				RequestDispatcher rd = request.getRequestDispatcher("uc_index.jsp?state=noPass");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("uc_index.jsp?state=noId");
			rd.forward(request, response);
		}

	}
}
