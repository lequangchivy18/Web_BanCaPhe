package Controller;

import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.GioHangbean;
import bean.Khachhangbean;
import bo.GioHangbo;
import bo.Khachhangbo;

/**
 * Servlet implementation class ThanhToan
 */
@WebServlet("/ThanhToan")
public class ThanhToan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String masach = request.getParameter("del");
			GioHangbo gh1;
			Khachhangbo khbo =new Khachhangbo();
			Khachhangbean kh =(Khachhangbean)session.getAttribute("dn");
			int makh=kh.getMakh();
			String[] dss = masach.split("[;]");
			int n = dss.length;
			if(dss!=null) {
				khbo.themDonhang(makh, 1);
				gh1 = (GioHangbo) session.getAttribute("gh");
				for (int i = 0; i < n; i++) {
					for (GioHangbean g1 : gh1.ds) {
						if (kh != null && dss[i].equals(g1.getMasp())) {
							khbo.themchitietDonhang(makh, dss[i], g1.getSl(), 1);
							//gh1.xoa(dss[i]);
						}
					}
				}
			}
			request.setAttribute("mess",masach);
			request.getRequestDispatcher("tralai").forward(request, response);response.sendRedirect("Htgio");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
