package getParameter;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;


@WebServlet("/Uc05")
public class Uc05 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String postcode1 = request.getParameter("m_postcode1");
		String postcode2 = request.getParameter("m_postcode2");
		String address = request.getParameter("m_address");
		String mail = request.getParameter("m_mail");
		String phone1 = request.getParameter("m_phone1");
		String phone2 = request.getParameter("m_phone2");
		String phone3 = request.getParameter("m_phone3");
		String pass1 = request.getParameter("m_pass1");
		
		MemberDao mDao = new MemberDao();
		
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("member");
		if( postcode1 != "" && postcode2 != "" ) {
			m.setM_postcode(postcode1+postcode2);
			mDao.updatePostcode(m);
		}
		if( address != "" ) {
			m.setM_address(address);
			mDao.updateAddress(m);
		}
		if( mail != "" ) {
			m.setM_mail(mail);
			mDao.updateMail(m);
		}
		if( phone1 != "" && phone2 != "" && phone3 != "" ) {
			m.setM_phone1(phone1);
			m.setM_phone2(phone2);
			m.setM_phone3(phone3);
			mDao.updatePhone(m);
		}
		if( pass1 != "") {
			m.setM_pass(pass1);
			mDao.updatePass(m);
		}
		mDao.connectionClose();
		RequestDispatcher rd = request.getRequestDispatcher("uc05_02.jsp");
		rd.forward(request, response);

	}
}
