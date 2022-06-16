package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Khachhangbean;
import bo.Khachhangbo;

/**
 * Servlet implementation class ktdn
 */
@WebServlet("/ktdn")
public class ktdn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ktdn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();	
			Khachhangbo khbo=new Khachhangbo();
			String un=request.getParameter("txtun");
			String pass=request.getParameter("txtpass");
			Khachhangbean kh=khbo.ktdn(un, pass);
			String gh = request.getParameter("trang");	
			if(gh == null) {
				if(kh!=null){
					   session.setAttribute("dn", kh);
					   session.setAttribute("kt", (long)1);
					   response.sendRedirect("HtSach");
				   }else{
				   	   session.setAttribute("kt", (long)0);
				   	   response.sendRedirect("HtSach");
				   }
			}else {				
				if(kh!=null){
					   session.setAttribute("dn", kh);
					   session.setAttribute("kt", (long)1);
					   response.sendRedirect("Htgio");
				   }else{
				   	   session.setAttribute("kt", (long)0);
				   	   response.sendRedirect("Htgio");
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
