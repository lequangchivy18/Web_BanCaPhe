package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.GioHangbo;

/**
 * Servlet implementation class Delete
 */
@WebServlet("/tralai")
public class tralai extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public tralai() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			String masach = request.getParameter("del");
			GioHangbo gh1;
			String mas = request.getParameter("mess");
		
			if (mas != null) {
				String[] dss = mas.split("[;]");
				int n = dss.length;
				gh1 = (GioHangbo) session.getAttribute("gh");
				for (int i = 0; i < n; i++) {
					gh1.xoa(dss[i]);
				}
			}
			if (masach!= null) {
				String[] dss = masach.split("[;]");
				int n = dss.length;
				gh1 = (GioHangbo) session.getAttribute("gh");
				for (int i = 0; i < n; i++) {
					gh1.xoa(dss[i]);
				}
			}
			response.sendRedirect("Htgio");
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
