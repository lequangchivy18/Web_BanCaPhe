<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<title>Giỏ hàng</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
          <span class="badge badge-light"><%=so%></span> <%
 }
 %></a></li>
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
	      	<li><a href="#">Xin chào: <%=kh.getHoten()%></a></li>
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
	<!-- Modal login -->
	
	  <div class="modal fade" id="Dangnhap" role="dialog">
	    <div class="modal-dialog" style="max-width: 30%;" role="document">
	      <div class="modal-content">
	      	<div class="modal-header">
	 			<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">Đăng nhập hệ thống</h4>
	        </div>
	        <div class="modal-body">
	        	<form method="post" action="ktdn?trang=Htgio">
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
 		 			     ArrayList<lopsanpham> ds=(ArrayList<lopsanpham>)request.getAttribute("dssach");
 		%>
  	<div width="100%" style="clear:both">
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
        <div class="contain-left col-sm-7">
        	<div style="display: ">
        		<div style="cursor:pointer; width:auto; float: left">	
            		<h3 style="fontsize: 26px !important;">GIỎ HÀNG CỦA BẠN</h3>
        		</div>
        		<div style="float: right; line-height:47px; margin-top: 10px; width:auto;">
        			<label class="checkbox-inline" style="line-height: 20px; font-size: 20px">
        				<input type="checkbox" value="" id="checkbox-all" name="check-all" style="position: static; width:16px; height:16px; margin-right: 3px;">
        				Chọn tất cả
        			</label>
        		</div>
        	</div>
        	<table class="table table-hover">
	            <tbody>
	            	<%
	            	long tong=0;
	            	GioHangbo gh1;
	            	String sl=request.getParameter("sl");
	            	String masachsl=request.getParameter("ms");
	            	if(session.getAttribute("gh")!=null){
		            	gh1=(GioHangbo) session.getAttribute("gh");
		            	tong=gh1.TongTien();
		            	for(GioHangbean g1: gh1.ds){
			            	int n=ds.size();
			            	for(int i=0;i<n;i++) {
				            	lopsanpham s=ds.get(i);
				            	if(s.getMasp().equals(g1.getMasp())){%>
				            	<tr>
      		                    	<td valign="top" width="70px" height="90px"><img src=<%=s.getAnh() %> class="frameSmall" width="70px" height="90px"></td>
							<% }
			            	}%>
		                    	<form action="Capnhat?ms=<%=g1.getMasp()%>" method="post">
		                    		<td valign="top"><span style="color:black"><b>Tên sản phẩm: <%=g1.getTensp() %></b></span><br><br>
			                        	<b>Giá: <span style="color:#6d2524"><%=g1.getGia() %></span></b> x 
			                        	<input type="text" style="width:25px" value="<%=(sl!=null&&g1.getMasp().equals(masachsl)?sl:g1.getSl()) %>" maxlength="3" name="inputsl"> &nbsp; 
			                        	<input name="btnUpdate" value="Cập nhật" type="submit">
			                        	<label class="checkbox-inline" style="font-size: 16px;">
				                        	<input type="checkbox"  name="checks[]" value="<%=g1.getMasp()%>" style="position: static; width:16px; height:16px; margin-right: 3px;margin-left:5px; margin-top:5px">
				                        	Chọn
			                        	</label>
	                    			</td>
		                    	</form>
                 		</tr>
                 		<%}} %>
	                <tr>
	                    <td colspan="2"></td>
	                </tr>
	            </tbody>
        	</table>
        	<table width="100%" style="margin-top:-15px">
	            <tbody>
	                <tr>
	                    <td valign="top">
	                    	<span style="font-size:medium; font-weight:bold; color:black">Tổng cộng: <%=tong%>$</span></td>
	                    <td align="right" valign="top">
	                    	<span style="font-size:medium; font-weight:bold; color:black">Trọng lượng: Gr </span>
	                        <br><br><span class=""> (Tham khảo chi phí mua hàng <a href="#"><b>click vào đây)</b></a></span>
	                    </td>
	                </tr>
	            </tbody>
        	</table>
        	<div style="width:auto;border-bottom:#d6d6d6 1px solid;"> &nbsp;</div>
        	<br>
        	<div style="padding-left:10px">
            	<center>
            	<input id="btntra"type="button" value="Trả lại" class="btn btn-default check-all-submit-btn disabled">
                	<a href="HtSach">
                		<input type="button" value="Tiếp tục mua hàng"class="btn btn-default">
                	</a>
                	<%if (kh == null)
                    {%> 
                	<input type="button" value="Đặt Hàng" data-toggle="modal" data-target="#Dangnhap" class="btn btn-primary check-all-submit-btn disabled">
                	<%}else{%>
                	<input type="button" value="Đặt Hàng" class="btn btn-primary check-all-submit-btn disabled" data-toggle="modal" data-target="#myModal">
                	<% }%>
            	</center>
        	</div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
      <div class="modal-dialog" style="max-width: 450px;">
      
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header" >
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h3 class="modal-title text-center">Xác nhận đặt hàng</h3>
          </div>
          <div class="modal-body text-center">
            <h4>Bạn đồng ý đặt hàng chứ?</h4>
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Yes" id="thanhtoan">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
          </div>
        </div>
        
      </div>
    </div>
                        
    <script>
    	var checkboxAll= $('#checkbox-all');
    	var courseItemCheckbox = $('input[name="checks[]"]');
    	var checkAllSubmitBtn = $('.check-all-submit-btn');
    	
    	//checkboxAll clicked
    	checkboxAll.change(function(){
    		var isCheckedAll = $(this).prop('checked');
    		courseItemCheckbox.prop('checked',isCheckedAll);
    		renderCheckAllSubmitBtn();
    	});
    	
    	//Course item checkbox changed
    	courseItemCheckbox.change(function(){
    		var isCheckedAll = courseItemCheckbox.length ===$('input[name="checks[]"]:checked').length;
    		checkboxAll.prop('checked',isCheckedAll);
    		renderCheckAllSubmitBtn();
    	});
    	
    	//Re-render check all submit button
    	function renderCheckAllSubmitBtn(){
    		var checkedCount = $('input[name="checks[]"]:checked').length;
    		if(checkedCount>0){
    			checkAllSubmitBtn.removeClass('disabled');
    		}else{
    			checkAllSubmitBtn.addClass('disabled')
    		}
    	}
    	//
    	document.getElementById('thanhtoan').onclick = function()
    	{
			// Khai báo tham số
			var checkbox = document.getElementsByName('checks[]');
			var result = "";
										             
			// Lặp qua từng checkbox để lấy giá trị
			for (var i = 0; i < checkbox.length; i++){
				if (checkbox[i].checked === true){
				result +=checkbox[i].value+";";
				}
			}

			window.location.href = "ThanhToan?del=" + result;
		} 
    	document.getElementById('btntra').onclick = function()
		{
			// Khai báo tham số
			var checkbox = document.getElementsByName('checks[]');
			var result = "";
										             
			// Lặp qua từng checkbox để lấy giá trị
			for (var i = 0; i < checkbox.length; i++){
				if (checkbox[i].checked === true){
				result +=checkbox[i].value+";";
				}
			}

			window.location.href = "tralai?del=" + result;
		}
	</script>
</body>
</html>