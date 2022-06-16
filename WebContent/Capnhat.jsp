<%@page import="bean.lopsanpham"%>
<%@page import="bean.loploai"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sanphambo"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.GioHangbean"%>
<%@page import="bo.GioHangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String sl = request.getParameter("inputsl");
		String masach = request.getParameter("ms");
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
				String key = request.getParameter("timkiem");
				ArrayList<loploai> dsloai = lbo.getloai();
				ArrayList<lopsanpham> dssach = sbo.getsp();
				if (ml != null)
					dssach = sbo.Timloai(dssach, ml);
					dssach = sbo.Tim(dssach, key);

				request.setAttribute("dsloai", dsloai);
				request.setAttribute("dssach", dssach);
				request.setAttribute("ml", ml);
				request.setAttribute("a", a);
				request.setAttribute("ms", masach);
				RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
				rd.forward(request, response);
		 } 
			}
		}
	%>
</body>
</html>