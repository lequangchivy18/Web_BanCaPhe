package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import bean.Khachhangbean;
import bo.Khachhangbo;
import dao.Khachhangdao;

/**
 * Servlet implementation class DangKy
 */
@WebServlet("/DangKy")
public class DangKy extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DangKy() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			//HttpSession session = request.getSession();
				response.setCharacterEncoding("utf-8");
				request.setCharacterEncoding("utf-8");
				Khachhangbo khbo = new Khachhangbo();
				Khachhangdao khdao =new Khachhangdao();
				String hoten = request.getParameter("txtht");
				String diachi = request.getParameter("txtdc");
				String sodt = request.getParameter("txtsdt");
				String email = request.getParameter("txtemail");
				String tendn = request.getParameter("txtdn");
				String matkhau = request.getParameter("txtpass");
				String matkhau1 = request.getParameter("re-txtpass");
				Khachhangbean ten= khdao.getTendn(tendn);
				if(ten!= null) {
					//request.setAttribute("value", (long)1);
					request.setAttribute("mess", "Tên đăng nhập đã được sử dụng");
					request.getRequestDispatcher("HtDangKy").forward(request, response);	
				}else {	
					if(!matkhau.equals(matkhau1)) {
						request.setAttribute("mess1", "Mật khẩu không khớp. Hãy thử lại");
						request.getRequestDispatcher("HtDangKy").forward(request, response);
					}else {
						khbo.them(hoten, diachi, sodt, email, tendn, matkhau);
						request.getRequestDispatcher("HtSach").forward(request, response);
					}
				}
			
			//response.sendRedirect("HtSach");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
