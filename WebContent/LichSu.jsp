<%@page import="bean.LichSuMuabean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.Khachhangbean"%>
<%@page import="bean.GioHangbean"%>
<%@page import="bo.GioHangbo"%>
<%@page import="bo.sanphambo"%>
<%@page import="bo.loaibo"%>
<%@page import="bean.lopsanpham"%>
<%@page import="bean.loploai"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Lịch sử mua hàng</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<style type="text/css">
        .example{
            margin: 20px;
        }
    </style>

<body>
	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    
	    <ul class="nav navbar-nav">
	      <li><a href="HtSach">Trang chủ</a></li>
	      <li><a href="Htgio">Giỏ hàng
	      <%
		      	GioHangbo gh;
				int so;
				gh=(GioHangbo) session.getAttribute("gh");
				if(session.getAttribute("gh")!=null){
				gh=(GioHangbo) session.getAttribute("gh");
				so=gh.soMonHang(); 			 
			%>
          <span class="badge badge-light"><%=so%></span> <%} %></a></li>
	      <li><a href="#">Thanh toán</a></li>
	      <%
	      	Khachhangbean kh = (Khachhangbean)session.getAttribute("dn");
	      	if(kh == null){%>
	      	<li><a href="#" data-toggle="modal" data-target="#Dangnhap">Lịch sử mua hàng</a></li>
      	  <%}else{%>
      		<li><a href="HtLichsu">Lịch sử mua hàng</a></li>
      	  <% }%>
	    </ul>
	    <form class="navbar-form navbar-left" style="margin-left: 125px" method="post" action="HtSach">
	      <div class="form-group" style="magin-left=50px;">
	        <input type="text" class="form-control" placeholder="Search" name="search">
	      </div>
	      <button type="submit" class="btn btn-default">Submit</button>
	    </form>
	    <ul class="nav navbar-nav navbar-right">
	      <%
	      /* tên dn: haha , mk: 123*/
	      if(kh!=null){%>
	      	
	      	<li><a href="DangXuat">
	      		<span class="glyphicon glyphicon-user"></span>Đăng xuất</a>
	     	</li>
	     	
	      	<li><a href="#">Xin chào: <%=kh.getHoten() %></a></li>
	      <%}else{ %>
	      	<li><a href="HtDangKy">
	      		<span class="glyphicon glyphicon-user"></span>Đăng ký</a>
	      	</li>
	     	<li><a href="#" data-toggle="modal" data-target="#Dangnhap">
	           <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
	     	</li> 
	     	<%if(session.getAttribute("kt") != null && session.getAttribute("kt").toString().equals("0")){ %>
	     		<script>alert("Dang nhap sai");</script>
	     	<%} %>
	      <%} %>
	    </ul>
	</div>
	</nav>
	<!-- Modal login -->
	
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
		            <input name="txtpass" type="password" class="form-control">
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
	     ArrayList<LichSuMuabean> ds=(ArrayList<LichSuMuabean>)request.getAttribute("dsLS"); 
	  	 %>
  	<div width="100%" style="clear:both">
    	<div class="contain-right col-sm-2" style="margin-top:6px; margin-left:20px">
	        <table class="table table-hover table-borderless">
		        <thead>
			      <tr>
			        <th style="font-size: 24px">Các loại sách</th>
			      </tr>
			    </thead>
	             <%for(loploai loai: dsloai) {%>
	                    <tr>
	                      <td>
	                        <a href="HtSach?ml=<%=loai.getMaloai()%>"> <%=loai.getTenloai() %></a>
	                      </td>
	                    </tr>
	             <%} %>
	         </table>
    	</div>
    	<div class="container col-sm-9 " style="margin-left: 50px;">
		  <h2>Lịch sử mua hàng</h2>
		  <p>Wish you have a great experience</p>            
		  <table class="table table-hover" style="width:90%">
		    <thead>
		      <tr>
		        <th class="text-center">Mã hóa đơn</th>
		        <th>Tên sản phẩm</th>
		        <th>Số lượng</th>
		        <th class="text-center">Giá</th>
		        <th class="text-center">Thời gian mua</th>
		        <th class="text-center">Trạng thái</th>
		      </tr>
		    </thead>
		    <tbody>
		    <%
	    		int n=ds.size();
            	for(int i=0;i<n;i++) {
             		LichSuMuabean s=ds.get(i);
	    	%>
		      <tr>
		        <td class="text-center"><%=s.getMaHoaDon() %></td>
		        <td><%=s.getTenSp() %></td>
		        <td class="text-center"><%=s.getSlmua() %></td>
		        <td class="text-center"><%=s.getGia()*s.getSlmua()%>$</td>
		        <td class="text-center"><%=s.getNgaymua()%></td>
		        <%if(s.getTrangthai()==1){%>
		        	<td class="text-center">Đã thanh toán</td>
		        <%}else{ %>
		        	<td class="text-center">Chưa thanh toán</td>
		        <%} %>
		      </tr>
		      <% }%>
		    </tbody>
		  </table>
		</div>
	</div>
</body>
</html>