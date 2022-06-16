<%@page import="bo.GioHangbo"%>
<%@page import="bean.Khachhangbean"%>
<%@page import="bo.Khachhangbo"%>
<%@page import="bean.lopsanpham"%>
<%@page import="bean.loploai"%>
<%@page import="dao.loaidao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sanphambo"%>
<%@page import="bo.loaibo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
<body>
	
 	<%
		String anh=request.getParameter("anh");
		String masach=request.getParameter("ms");
		String tensach=request.getParameter("ts");
		
		String giatam=request.getParameter("gia");
		//Neu nguoi dung mua lan dau tien
		GioHangbo gh=null;
		if(session.getAttribute("gh")==null){
			gh=new GioHangbo();
			session.setAttribute("gh", gh);
		}
		//b1: gan session vao bien
		gh=(GioHangbo) session.getAttribute("gh");
		gh.Them(masach, tensach, Long.parseLong(giatam), (long)1 );
		session.setAttribute("gh", gh);
		response.sendRedirect("htgio.jsp");
	%>
</body>
</html>