<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.hotelmenu.service.DbConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=yes">

	<title>Checkout</title>
	<%long millis=System.currentTimeMillis(); %>
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
	<style>
		.checkout{
		background: #fff !important;
    	padding: 20px 8px !important;
    }
    .total-row{ color: black; font-weight: bold; }
	</style>
</head>
<body>
	
	<header>
		<div class="container p-5">
			<h2 class="title">Admin Panel</h2>
		</div>
	</header>
	
	<main>
		<div class="container">
			<section class="food_record checkout"> 
				<h3 class="mb-3">Checkout</h3>
				<div> Date : <%=new Date(millis)%> </div>
				<table id="orders-table" class="table">
					<thead>
						<tr>
							<th>Food Name</th>
							<th>Food QTY</th>
							<th>Food Cost</th>
						</tr>
					</thead>
					<tbody id="checkout_list">
						
					</tbody>
				</table>
			</section>
		</div>
	</main>
	
	<!-- start footer Area -->		
			<footer class="footer-area" id="contact_us">
				<div class="footer-widget-wrap">
					<div class="container">
						<div class="row section-gap">
							<div class="col-lg-4  col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h4>Opening Hours</h4>
									<ul class="hr-list">
										<li class="d-flex justify-content-between">
											<span>Monday - Friday</span> <span>08.00 am - 10.00 pm</span>
										</li>
										<li class="d-flex justify-content-between">
											<span>Saturday</span> <span>08.00 am - 10.00 pm</span>
										</li>
										<li class="d-flex justify-content-between">
											<span>Sunday</span> <span>08.00 am - 10.00 pm</span>
										</li>																				
									</ul>
								</div>
							</div>
							<div class="col-lg-4  col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h4>Contact Us</h4>
									<p>
										No 51, 150 Feet By-Pass Road, Ganapathy Nagar, Velachery, Chennai, Tamil Nadu 600042
									</p>
									<p class="number">
										012-6532-568-9746 <br>
										012-6532-569-9748
									</p>
								</div>
							</div>						
							<div class="col-lg-4  col-md-6 col-sm-6">
								<div class="single-footer-widget">
									<h4>Newsletter</h4>
									<p>You can trust us. we only send promo offers, not a single spam.</p>
									<div class="d-flex flex-row" id="mc_embed_signup">


										  <form class="navbar-form" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get">
										    <div class="input-group add-on align-items-center d-flex">
										      	<input class="form-control" name="EMAIL" placeholder="Your Email address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email address'" required="" type="email">
												<div style="position: absolute; left: -5000px;">
													<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
												</div>
										      <div class="input-group-btn">
										        <button class="genric-btn"><span class="lnr lnr-arrow-right"></span></button>
										      </div>
										    </div>
										      <div class="info mt-20"></div>
										  </form>
									</div>
								</div>
							</div>						
						</div>					
					</div>					
				</div>
				<div class="footer-bottom-wrap">
					<div class="container">
						<div class="row footer-bottom d-flex justify-content-between align-items-center">
							<p class="col-lg-8 col-mdcol-sm-6 -6 footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved 
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
							<ul class="col-lg-4 col-mdcol-sm-6 -6 social-icons text-right">
	                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
	                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
	                            <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
	                            <li><a href="#"><i class="fa fa-behance"></i></a></li>           
	                        </ul> 
						</div>						
					</div>
				</div>
			</footer>
			<!-- End footer Area -->
	
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
	<script src="../js/checkout.js"></script>
	<script>
		checkout();
	</script>
</body>
</html>