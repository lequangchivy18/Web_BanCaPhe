<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Registation Form * Form Tutorial</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form method="post" action="DangKy">
		<div class="container" style="max-width:80% !important; justify-content: center !important; display: flex !important;">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2 class="text-center">Registation Form - Input User's Detail Information</h2>
				</div>
				<div class="panel-body">
					<div class="form-group">
					  <label for="usr">Name:</label>
					  <input required="true" type="text" class="form-control" id="usr" name="txtht">
					</div>
					<div class="form-group">
					  <label for="email">Email:</label>
					  <input type="email" class="form-control" id="email" name="txtemail">
					</div>
					<div class="form-group">
					  <label for="phone">Phone:<span style="color: red;" id="errorPhone"></span></label>
					  <input type="text" class="form-control" onblur="myFunction()" id="phone" name="txtsdt">
					</div>
					<div class="form-group">
					  <label for="phone">User Name:</label>
					  <input required="true" type="text" class="form-control" id="username" name="txtdn">
					</div>
					<p class="text-danger" id="mess" style="margin-top:-15px">${mess}</p>
					<div class="form-group" style="margin-top:-5px">
					  <label for="pwd">Password:</label>
					  <input  required="true" type="password" class="form-control" id="pwd" name="txtpass">
					</div>
					<div class="form-group">
					  <label for="confirmation_pwd">Confirmation Password:</label>
					  <input  required="true" type="password" class="form-control" id="confirmation_pwd" name="re-txtpass">
					</div>
					<p class="text-danger" style="margin-top:-15px">${mess1}</p>
					<div class="form-group" style="margin-top:-5px">
					  <label for="address">Address:</label>
					  <input type="text" class="form-control" id="address" name="txtdc">
					</div>
					<button class="btn btn-success" onclick="validate()">Register</button>
				</div>
			</div>
		</div>
	</form>
	<script>
		function myFunction() {
		    var phone = document.getElementById("phone").value;
		    var errorPhone = document.getElementById("errorPhone").value;
		    var phoneno = /^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$/;
		   
		   	if(!phoneno.test(phone)) {
		    	alert("S??? ??i???n tho???i kh??ng h???p l???");
		   	  	console.log("ko hop l???");
		   	 	/* errorPhone.innerHTML="S??? ??i???n tho???i kh??ng h???p l???"; */
		   	}
	    }
	  	function validate() {
		
		<%-- var loi= <%=request.getAttribute("value")%>; --%>
	    var name = document.getElementById("usr").value;
	    var username = document.getElementById("username").value;
	    var password = document.getElementById("pwd").value;
	    var re_password = document.getElementById("confirmation_pwd").value;
	    
	   	
	    if (name == "") {
	      alert("????ng k?? th???t b???i, kh??ng ???????c ????? tr???ng h??? t??n");
	    }
	    /* else if (loi==1) {
			  alert("????ng k?? th???t b???i");
		} */
	    else if (username == "") {
	      alert("????ng k?? th???t b???i, kh??ng ???????c ????? tr???ng username");
	    }
	    else if (password == "") {
	      alert("????ng k?? th???t b???i, kh??ng ???????c ????? tr???ng password");
	    }
	    else if (re_password == "") {
		  alert("????ng k?? th???t b???i, kh??ng ???????c ????? tr???ng password");
		}
	    else{
	      return false;
	    }
	  }
	</script>
</body>
</html>