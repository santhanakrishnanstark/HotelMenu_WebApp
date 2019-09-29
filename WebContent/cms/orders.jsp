<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hotelmenu.service.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Orders</title>

	<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
	<!--
	CSS
	============================================= -->
	<link rel="stylesheet" href="../css/linearicons.css">
	<link rel="stylesheet" href="../css/font-awesome.min.css">
	<link rel="stylesheet" href="../css/bootstrap.css">
	<link rel="stylesheet" href="../css/magnific-popup.css">
	<link rel="stylesheet" href="../css/jquery-ui.css">				
	<link rel="stylesheet" href="../css/nice-select.css">							
	<link rel="stylesheet" href="../css/animate.min.css">
	<link rel="stylesheet" href="../css/owl.carousel.css">				
	<link rel="stylesheet" href="../css/main.css">
	<link rel="stylesheet" href="../css/custom.css">
	<link rel="stylesheet" href="../css/cms_page.css">
</head>
<body>
	
	<header>
		<div class="container p-5">
			<h2 class="title">Admin Panel</h2>
		</div>
	</header>
	
	<main>
		<div class="container">
			<section class="food_record"> 
				<h3 class="mb-3">New Orders</h3>
				<table id="orders-table" class="table">
					<thead>
						<tr>
							<th>Table No</th>
							<th>User ID</th>
							<th>Date</th>
							<th>Food Name</th> 
							<th>Food QTY</th>
							<th>Status</th>
						</tr>
					</thead>
					<tbody>
						<% Statement st = DbConnect.getConnection();
							ResultSet rs = st.executeQuery("select * from orders order by date, delivery_status, user_id desc ");
							while(rs.next()){
						%>    <tr>
						    	<td><%=rs.getString("table_no") %></td>
						    	<td><%=rs.getString("user_id") %></td>
						    	<td><%=rs.getString("date") %></td>
						    	<td><%=rs.getString("food_name") %></td>
						    	<td><%=rs.getString("food_qty") %></td>
						    	<td><span class="d-status"><%=rs.getString("delivery_status") %></span> &nbsp; 
						    		<a href="#" foodQty="<%=rs.getString("food_qty") %>" foodId="<%=rs.getString("food_id") %>" date="<%=rs.getString("date") %>" userId="<%=rs.getString("user_id") %>" onclick="deliverThis(this)" class="tickIcn">
						    		<i class="fa fa-check" aria-hidden="true"></i></a>
					    		</td>
						      </tr>
						<%	}
						%>
					</tbody>
				</table>
			</section>
		</div>
	</main>
	
	<script src="../js/vendor/jquery-2.2.4.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/vendor/bootstrap.min.js"></script>			
	<script src="../js/jquery-ui.js"></script>					
	<script src="../js/easing.min.js"></script>			
	<script src="../js/hoverIntent.js"></script>
	<script src="../js/superfish.min.js"></script>	
	<script src="../js/jquery.ajaxchimp.min.js"></script>
	<script src="../js/jquery.magnific-popup.min.js"></script>						
	<script src="../js/jquery.nice-select.min.js"></script>					
	<script src="../js/owl.carousel.min.js"></script>			
    <script src="../js/isotope.pkgd.min.js"></script>								
	<script src="../js/mail-script.js"></script>	 
	<script src="../js/main.js"></script>	
	<script src="../js/datatables.min.js"></script>
	<script src="../js/cms-script.js"></script>
	<script>
	$("#orders-table").DataTable();
	deliveryStatus();
	</script>
</body>
</html>