	<!DOCTYPE html>
	<%@page import="java.sql.ResultSet"%>
<%@page import="com.hotelmenu.service.DbConnect"%>
<%@page import="java.sql.Statement"%>
<html lang="zxx" class="no-js">
	<head>
		<!-- Mobile Specific Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<!-- Favicon-->
		<link rel="shortcut icon" href="../img/fav.png">
		<!-- Author Meta -->
		<meta name="author" content="colorlib">
		<!-- Meta Description -->
		<meta name="description" content="">
		<!-- Meta Keyword -->
		<meta name="keywords" content="">
		<!-- meta character set -->
		<meta charset="UTF-8">
		<!-- Site Title -->
		<title>Menu</title>

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
		</head>
		<body>	
			<header id="header">
				<div class="header-top">
					<div class="container">
				  		<div class="row justify-content-center">
						      <div id="logo">
						        <a href="index.html"> <h1 class="main_title">Menu Card</h1> </a>
						      </div>
				  		</div>			  					
					</div>
				</div>
				<div class="container main-menu">
					<div class="row align-items-center justify-content-center d-flex">			
				      <nav id="nav-menu-container">
				        <ul class="nav-menu">
				          <li><a href="index.html">Home</a></li>
				          <li><a href="#about">About</a></li>
				          <li><a href="#menu">Menu</a></li>
				          <li><a href="#gallery">Gallery</a></li>
				          <!-- <li class="menu-has-children"><a href="">Blog</a>
				            <ul>
				              <li><a href="blog-home.html">Blog Home</a></li>
				              <li><a href="blog-single.html">Blog Single</a></li>
				            </ul>
				          </li>	
				          <li class="menu-has-children"><a href="">Pages</a> -->
				            <ul>
				            	  <li><a href="elements.html">Elements</a></li>
						          <li class="menu-has-children"><a href="">Level 2 </a>
						            <ul>
						              <li><a href="#">Item One</a></li>
						              <li><a href="#">Item Two</a></li>
						            </ul>
						          </li>					                		
				            </ul>
				          </li>					          					          		          
				          <li><a href="#contact_us">Contact</a></li>
				        </ul>
				      </nav><!-- #nav-menu-container -->					      		  
					</div>
				</div>
			</header><!-- #header -->
			
			<!-- start banner Area -->
			<section class="banner-area">		
				<div class="container">
					<div class="row fullscreen align-items-center justify-content-between">
						<div class="col-lg-12 banner-content">
							<h6 class="text-white">Wide Options of Choice</h6>
							<h1 class="text-white">Delicious Recipes</h1>
							<p class="text-white">
								inappropriate behavior is often laughed off as “boys will be boys,” women face higher conduct standards especially in the workplace. That’s why it’s crucial that, as women.
							</p>
							<a href="#menu" class="primary-btn text-uppercase">Check Our Menu</a>
						</div>
					</div>
				</div>					
			</section>
			<!-- End banner Area -->

			<!-- Start home-about Area -->
			<section class="home-about-area section-gap" id="about">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-lg-6 home-about-left">
							<h1>About Our Story</h1>
							<p>
								Who are in extremely love with eco friendly system. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
							</p>
							<a href="#" class="primary-btn">view full menu</a>
						</div>
						<div class="col-lg-6 home-about-right">
							<img class="img-fluid" src="../img/food_img/hyderabadi-dum-biryani.jpg" alt="">
						</div>
					</div>
				</div>	
			</section>
			<!-- End home-about Area -->			

			<!-- Start menu-area Area -->
            <section class="menu-area section-gap" id="menu">
                <div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">What kind of Foods we serve for you</h1>
								<p>Who are in extremely love with eco friendly system.</p>
							</div>
						</div>
					</div>	

                    <ul class="filter-wrap filters col-lg-12 no-padding">
                        <li class="active" data-filter="*">All Menu</li>
                        <li data-filter=".breakfast">Breakfast</li>
                        <li data-filter=".lunch">Lunch</li>
                        <li data-filter=".dinner">Dinner</li>
                        <!-- <li data-filter=".budget-meal">Budget Meal</li>
                        <li data-filter=".buffet">Buffet</li> -->
                    </ul>
                    
                    <div class="filters-content">
                        <div class="row grid">
                            <% Statement st = DbConnect.getConnection();
								ResultSet rs = st.executeQuery("select * from food_record");
								while(rs.next()){
									if(rs.getString("availability").startsWith("1")){ 
							%>		<div class="col-md-6 all <%= rs.getString("category")%>">
										<div class="single-menu">
											<div class="title-wrap d-flex justify-content-between">
												<h4><%=rs.getString("name") %></h4>
												<h4 class="price"><%=rs.getString("cost") %> Rs</h4>
											</div>
											<p>Some Description About the Dish</p>
											<div class="d-flex justify-content-between">
												<h4></h4>
												<div class="menu-buttons">
													<span class="minus" onclick="decItem(this)">-</span>
													<span item="<%=rs.getString("food_id") %>" price="<%=rs.getString("cost") %>" class="number">0</span>
													<span class="plus" onclick="incItem(this)">+</span>
												</div>
											</div>
										</div>
									</div>
							<%		}
								}
							%>         
                        </div>
                    </div>
                    
                </div>
            </section>
            <!-- End menu-area Area -->			

			<!-- Start Order Popup -->
			<div class="order-menu">
				<div class="order-title"  onclick="toggleOrderPopup()">
					<h5>Your List >>></h5>
					<span><i class="fa fa-bars" aria-hidden="true"></i></span>
				</div>
				<div class="order-content">
					<table class="table" width="100%">
						<thead>
							<tr>
								<th>Item Name</th>
								<th>Quantity</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody id="total-order-list">
							
						</tbody>
					</table>
				</div>
				<div class="order-content">
					<h3 class="my-3"> Your Current List</h3>
					<table class="table" width="100%">
						<thead>
							<tr>
								<th>Item Name</th>
								<th>Quantity</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody id="order-list">
							
						</tbody>
					</table>
				</div>
			</div>			
			<!-- End Order Popup -->

			<!-- Start gallery-area Area -->
            <section class="gallery-area section-gap" id="gallery">
                <div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-70 col-lg-8">
							<div class="title text-center">
								<h1 class="mb-10">Food and Customer Gallery</h1>
								<p>Who are in extremely love with eco friendly system.</p>
							</div>
						</div>
					</div>	
                    
                    <ul class="filter-wrap filters col-lg-12 no-padding">
                        <li class="active" data-filter="*">All Menu</li>
                        <li data-filter=".breakfast">Breakfast</li>
                        <li data-filter=".lunch">Lunch</li>
                        <li data-filter=".dinner">Dinner</li>
                        <!-- <li data-filter=".budget-meal">Budget Meal</li>
                        <li data-filter=".buffet">Buffet</li> -->
                    </ul>
                    
                    
                    <div class="filters-content">
                        <div class="row grid">
                            <div class="col-lg-4 col-md-6 col-sm-6 all breakfast dinner">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/BreakFast.jpg" alt="">
                            	</div>	                          
							</div> 
							<div class="col-lg-4 col-md-6 col-sm-6 all breakfast">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/poori.jpg" alt="">
                            	</div>                            
                            </div>                          
                            <div class="col-lg-4 col-md-6 col-sm-6 all breakfast dinner">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/uthapam.jpg" alt="">
                            	</div>                            
							</div>
                            <div class="col-lg-4 col-md-6 col-sm-6 all lunch">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/Biriyani.jpg" alt="">
                            	</div>                            
							</div>
							<div class="col-lg-4 col-md-6 col-sm-6 all lunch">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/fish.jpg" alt="">
                            	</div>                            
							</div>
							<div class="col-lg-4 col-md-6 col-sm-6 all lunch">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/food_img/prawn.jpg" alt="">
                            	</div>                            
                            </div>
                            <!-- <div class="col-lg-4 col-md-6 col-sm-6 all budget-meal">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/g3.jpg" alt="">
                            	</div>                            
                            </div> -->
                            <!-- <div class="col-lg-4 col-md-6 col-sm-6 all buffet">
                            	<div class="single-gallery">
                            		<img class="img-fluid" src="../img/g6.jpg" alt="">
                            	</div>                            
                            </div>                             -->
                        </div>
                    </div>
                    
                </div>
            </section>
            <!-- End gallery-area Area -->									

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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | 
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
			<script src="../js/menu-script.js"></script>	
		</body>
	</html>