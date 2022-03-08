import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GoodsDao;
import dao.StoreDao;
import model.Goods;
import model.Store;


@WebServlet("/RoomRiyou")
public class RoomRiyou extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		StoreDao sdao = new StoreDao();
		GoodsDao gdao = new GoodsDao();
		ArrayList<Store> sArealist = sdao.findArea();
		ArrayList<Store> sADlist = sdao.findStoreAD();
		ArrayList<Store> sCClist = sdao.findStoreCC();
		ArrayList<Store> sKAlist = sdao.findStoreKA();
		ArrayList<Store> sKElist = sdao.findStoreKE();
		ArrayList<Store> sMIlist = sdao.findStoreMI();
		ArrayList<Store> sOUlist = sdao.findStoreOU();
		ArrayList<Store> sSAlist = sdao.findStoreSA();
		ArrayList<Store> sSMlist = sdao.findStoreSM();
		ArrayList<Store> sSOlist = sdao.findStoreSO();
		ArrayList<Store> sSSlist = sdao.findStoreSS();
		ArrayList<Store> sTNlist = sdao.findStoreTN();
		
		ArrayList<Goods> gSDlist = gdao.findSoftDrink();
		ArrayList<Goods> gAClist = gdao.findAlcohol();
		ArrayList<Goods> gFDlist = gdao.findFood();
		sdao.connectionClose();
		gdao.connectionClose();
		
		HttpSession session = request.getSession();
		session.setAttribute("storeArealist",sArealist);
		session.setAttribute("storeADlist",sADlist);
		session.setAttribute("storeCClist",sCClist);
		session.setAttribute("storeKAlist",sKAlist);
		session.setAttribute("storeKElist",sKElist);
		session.setAttribute("storeMIlist",sMIlist);
		session.setAttribute("storeOUlist",sOUlist);
		session.setAttribute("storeSAlist",sSAlist);
		session.setAttribute("storeSMlist",sSMlist);
		session.setAttribute("storeSOlist",sSOlist);
		session.setAttribute("storeSSlist",sSSlist);
		session.setAttribute("storeTNlist",sTNlist);
		session.setAttribute("goodsSDlist", gSDlist);
		session.setAttribute("goodsAClist", gAClist);
		session.setAttribute("goodsFDlist", gFDlist);

		RequestDispatcher rd = request.getRequestDispatcher("uc_index.jsp");
		rd.forward(request, response);
	}
}
