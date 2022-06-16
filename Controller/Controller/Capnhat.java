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

import bean.GioHangbean;
import bean.loploai;
import bean.lopsanpham;
import bo.GioHangbo;
import bo.loaibo;
import bo.sanphambo;


/**
 * Servlet implementation class Xoa
 */
@WebServlet("/Capnhat")
public class Capnhat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Capnhat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String masach = request.getParameter("ms");
			String sl=request.getParameter("inputsl");
			HttpSession session = request.getSession();
			Long a=Long.parseLong(sl);
			GioHangbo gh1;
			if (session.getAttribute("gh") != null) {
				gh1 = (GioHangbo) session.getAttribute("gh");
				for(GioHangbean g1: gh1.ds){
					if(request.getParameter("btnUpdate")!=null && g1.getMasp().equals(masach)){
						 gh1.sua(masach, a);
						 loaibo lbo = new loaibo();
							sanphambo sbo = new sanphambo();
						 String ml = request.getParameter("ml");
							String key = request.getParameter("search");
							ArrayList<loploai> dsloai = lbo.getloai();
							ArrayList<lopsanpham> dssach = sbo.getsp();
							if (ml != null)
								dssach = sbo.Timloai(dssach, ml);
							else if (key != null)
								dssach = sbo.Tim(dssach, key);
							request.setAttribute("dsloai", dsloai);
							request.setAttribute("dssach", dssach);
							request.setAttribute("a", a);
							request.setAttribute("ml", ml);
							RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
							rd.forward(request, response);
					 } 
				}
			}	
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
