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
import model.Member;


@WebServlet("/Uc05_s1")
public class Uc05_s1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("member");
		System.out.println(m.getM_id());
		String cardNum = request.getParameter("cardNum");
		String cardYear = request.getParameter("cardYear");
		String cardMonth = request.getParameter("cardMonth");
		String cardName = request.getParameter("cardName");
		String cardCord = request.getParameter("cardCord");
		ArrayList<String> ary = new ArrayList<>();
		ary.add(m.getM_id());
		ary.add(cardNum);
		ary.add(cardYear);
		ary.add(cardMonth);
		ary.add(cardName);
		ary.add(cardCord);
		MemberDao mDao = new MemberDao();
		mDao.updateCard(ary);
		mDao.findMember(m.getM_id());
		session.setAttribute("member",m);
		RequestDispatcher rd = request.getRequestDispatcher("uc05_02.jsp");
		rd.forward(request, response);

	}
}
