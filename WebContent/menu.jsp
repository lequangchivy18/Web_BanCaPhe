<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>Trang Chủ</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://fonts.googleapis.com/css2?family=Kanit&display=swap" rel="stylesheet">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link href="style.css" rel="stylesheet">
</head>	

<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    
	    <ul class="nav navbar-nav">
	      <li><a href="HtSach">Trang chủ</a></li>
	      <li><a href="Htgio">Giỏ hàng
	      		<%
	      GioHangbo gh;
	      	      		  			int so=0;
	      	      			gh=(GioHangbo) session.getAttribute("gh");
	      	      			if(session.getAttribute("gh")!=null){
	      	      			gh=(GioHangbo) session.getAttribute("gh");
	      	      			so=gh.soMonHang();
	      %>
	      <span class="badge badge-light"><%=so%></span> <%
 			}%></a></li>
	      <li><a href="#">Thanh toán</a></li>
	      <%
	      Khachhangbean kh = (Khachhangbean)session.getAttribute("dn");
	      	      	      	if(kh == null){
	      %>
	      	<li><a href="#" data-toggle="modal" data-target="#Dangnhap">Lịch sử mua hàng</a></li>
      	  <%
      	  }else{
      	  %>
      		<li><a href="HtLichsu">Lịch sử mua hàng</a></li>
      	  <%
      	  }
      	  %>
	    </ul>
	    <form class="navbar-form navbar-left" style="margin-left: 125px" method="post" action="HtSach">
	      <div class="form-group" style="magin-left=50px;">
	        <input type="text" class="form-control" placeholder="Search" name="search">
	      </div>
	      <button type="submit" class="btn btn-default">Submit</button>
	    </form>
	    <ul class="nav navbar-nav navbar-right">
	      <%
	      if(kh!=null){
	      %>
	      	<li><a href="DangXuat">
	      		<span class="glyphicon glyphicon-user"></span>Đăng xuất</a>
	      	</li>
	      	<li><a href="#">Xin chao: <%=kh.getHoten()%></a></li>
	      <%
	      }else{
	      %>
	      	<li><a href="HtDangKy">
	      		<span class="glyphicon glyphicon-user"></span>Đăng ký</a>
	      	</li>
	     	<li><a href="#" data-toggle="modal" data-target="#Dangnhap">
	           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
	     	</li> 
	     	<%
 	     	if(session.getAttribute("kt") != null && session.getAttribute("kt").toString().equals("0")){
 	     	%>
	     		<script>alert("Dang nhap sai");</script>
	     	<%
	     	}
	     	%>
	      <%
	      }
	      %>
	    </ul>
	</div>
	</nav>
	 <!-- Modal login-->
	  <div class="modal fade" id="Dangnhap" role="dialog">
	    <div class="modal-dialog" style="max-width: 30%;" role="document">
	      <div class="modal-content">
	      	<div class="modal-header">
	 			<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">Đăng nhập hệ thống</h4>
	        </div>
	        <div class="modal-body">
	        	<form method="post" action="ktdn">
	            	<label> Tên đăng nhập: </label>
	 				<input name="txtun" type="text" class="form-control">
		            <label> Mật khẩu: </label>
		            <input name="txtpass" type="password" class="form-control"><br>
		            <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
	        	</form>
	        </div>
	      </div>
	    </div>
	  </div>
	  <%
	  response.setCharacterEncoding("utf-8");
	  	  	    request.setCharacterEncoding("utf-8");
	  	  	    ArrayList<loploai> dsloai =(ArrayList<loploai>)request.getAttribute("dsloai");
	  	  	    ArrayList<lopsanpham> ds=(ArrayList<lopsanpham>)request.getAttribute("dssach");
	  %>
	   <div>
	   		<div class="contain-right col-sm-2" style="margin-top:6px; margin-left:20px">
	        <table class="table table-hover table-borderless">
		        <thead>
			      <tr>
			        <th style="font-size: 24px">Loại sản phẩm</th>
			      </tr>
			    </thead>
	            <c:forEach items="${requestScope.dsloai}" var="s">
	            	<tr>
	                   <td>
	                     <a href="HtSach?ml=${s.getMaloai()}"> ${s.getTenloai()}</a>
	                   </td>
	               </tr>
	            </c:forEach>
	         </table>
    		</div>
    		
    		<div class="row col-sm-9">
	    	<%
	    	int n=ds.size();
	    	for(int i=0;i<n;i++) {
	    	lopsanpham s=ds.get(i);
	    	%>
	    			
	                    <div class="col-sm-3 col-md-6 col-lg-4">
							<div class="card">
								<div class="card-body text-center">
									<img src=<%=s.getAnh()%> class="product-image">
									<p class="card-text small card-title"><%=s.getTensp()%></p>
									<p class="tags"><%=s.getGia()%>$</p>
									<a href="Htgio?ms=<%=s.getMasp()%>&ts=<%=s.getTensp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>"  class="btn btn-success button-text"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Add to cart</a>
								</div>
							</div>
						</div>
	                    <%i++;
	                         if(i<n){
	                        	 s=ds.get(i);%>
	                	<div class="col-sm-3 col-md-6 col-lg-4">
							<div class="card">
								<div class="card-body text-center">
									<img src=<%=s.getAnh()%> class="product-image">
									<p class="card-text small card-title"><%=s.getTensp()%></p>
									<p class="tags"><%=s.getGia()%>$</p>
									<a href="Htgio?ms=<%=s.getMasp()%>&ts=<%=s.getTensp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>"  class="btn btn-success button-text"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Add to cart</a>
								</div>
							</div>
						</div>
	                       <%} %>
	                       <%i++;
	                         if(i<n){
	                        	 s=ds.get(i);%>
	                       	<div class="col-sm-3 col-md-6 col-lg-4">
								<div class="card">
									<div class="card-body text-center">
										<img src=<%=s.getAnh()%> class="product-image">
										<p class="card-text small card-title"><%=s.getTensp()%></p>
										<p class="tags"><%=s.getGia()%>$</p>
										<a href="Htgio?ms=<%=s.getMasp()%>&ts=<%=s.getTensp()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>"  class="btn btn-success button-text"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Add to cart</a>
									</div>
								</div>
							</div>
	                        <%} %>
	                        <% 
					        	if(request.getParameter("a")!=null){
					        		response.sendRedirect("htgio.jsp?ms="+s.getMasp()+"&gia="+s.getGia()+"&anh="+s.getAnh());
					        	}
					        %>
	                 
	           <%} %>
	    	</div> 
	   </div>
</body>
</html>