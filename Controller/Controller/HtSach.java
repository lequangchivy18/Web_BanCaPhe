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

import bean.loploai;

import bean.lopsanpham;
import bo.GioHangbo;
import bo.loaibo;

import bo.sanphambo;

/**
 * Servlet implementation class HtSach
 */
@WebServlet("/HtSach")
public class HtSach extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HtSach() {
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
			HttpSession session = request.getSession();
			String masp = request.getParameter("ms");
			String tensp = request.getParameter("ts");
			String giatam = request.getParameter("gia");
			String ml= request.getParameter("ml");
			GioHangbo gh = null;
			if (session.getAttribute("gh") == null) {
				gh = new GioHangbo();
				session.setAttribute("gh", gh);
			}
			if (masp != null) {
				long gia = Long.valueOf(giatam);
				gh = (GioHangbo) session.getAttribute("gh");
				gh.Them(masp, tensp, gia, (long) 1);// b2
				session.setAttribute("gh", gh);
			}
			loaibo lbo = new loaibo();
			sanphambo sbo = new sanphambo();
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			
			String key = request.getParameter("search");
			ArrayList<loploai> dsloai = lbo.getloai();
			ArrayList<lopsanpham> dssach = sbo.getsp();
			if (ml != null)
				dssach = sbo.Timloai(dssach, ml);
			else if (key != null)
				dssach = sbo.Tim(dssach, key);
			request.setAttribute("dsloai", dsloai);
			request.setAttribute("dssach", dssach);
			RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");
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
