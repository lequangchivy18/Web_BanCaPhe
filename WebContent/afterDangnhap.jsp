<%@page import="bo.Khachhangbo"%>
<%@page import="bean.Khachhangbean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
   Khachhangbo khbo=new Khachhangbo();
   String un=request.getParameter("txtun");
   String pass=request.getParameter("txtpass");
   Khachhangbean kh=khbo.ktdn(un, pass);
   if(kh!=null){
	   session.setAttribute("dn", kh);
	   session.setAttribute("kt", (long)1);
	   response.sendRedirect("menu.jsp");
   }else{
	   response.sendRedirect("menu.jsp");
   	   session.setAttribute("kt", (long)0);
   }
%>

</body>
</html>