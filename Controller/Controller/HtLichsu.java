package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Khachhangbean;
import bean.LichSuMuabean;
import bean.loploai;

import bean.lopsanpham;
import bo.LichSuMuaBo;
import bo.loaibo;

import bo.sanphambo;

/**
 * Servlet implementation class HtLichsu
 */
@WebServlet("/HtLichsu")
public class HtLichsu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HtLichsu() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {	
				response.setCharacterEncoding("utf-8");
				request.setCharacterEncoding("utf-8");
				HttpSession session = request.getSession();
				LichSuMuaBo dsLS = new LichSuMuaBo();
				Khachhangbean kh = (Khachhangbean) session.getAttribute("dn");
				int makhach = kh.getMakh();
			
				ArrayList<LichSuMuabean> ds = dsLS.getLs(makhach);
				response.getWriter().print(ds);
				request.setAttribute("dsLS", ds);
				RequestDispatcher rd;			
				
				loaibo lbo = new loaibo();
				sanphambo sbo = new sanphambo();
				
				String key = request.getParameter("search");
				String ml= request.getParameter("ml");
				ArrayList<loploai> dsloai = lbo.getloai();
				ArrayList<lopsanpham> dssach = sbo.getsp();
				if (ml != null)
					dssach = sbo.Timloai(dssach, ml);
				else if (key != null)
					dssach = sbo.Tim(dssach, key);
				request.setAttribute("dsloai", dsloai);
				request.setAttribute("dssach", dssach);
				rd = request.getRequestDispatcher("LichSu.jsp");
				rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
