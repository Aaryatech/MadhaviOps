<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>Monginis</title>


<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/images/feviconicon.png"
	type="image/x-icon" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--autocomplete-->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/autocomplete.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/autocomplete.css">
<script
	src="${pageContext.request.contextPath}/resources/css/easy-responsive-tabs.css"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>

<script type="text/javascript">
	jQuery(document).ready(function() {
		jQuery("#menuzord").menuzord({
			align : "left"
		});
	});
</script>
<!--rightNav-->

<!--new css added by kalpesh -->
<!-- <link href='http://fonts.googleapis.com/css?family=Cuprum&subset=latin' rel='stylesheet' type='text/css'> -->

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />

<%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/styles.css" />   --%>

<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script> -->
<!--new css added by kalpesh -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.css">

<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.js"></script>
<!-- 1 css and 2 js for search item   -->

<!----------------------------------------Dropdown With Search----------------------------------------------- -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--------------------------------------------------------------------------------------- -->
<%-- <script src="${pageContext.request.contextPath}/resources/jquery.confirm/jquery.confirm.js"></script> --%>



<!-- custom scrollbar plugin added by kalpesh -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>



<style>
.chosen-container {
	width: 80% !important;
}

/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader {
	display: none;
}

.js #loader {
	display: block;
	position: absolute;
	left: 100px;
	top: 0;
}

.se-pre-con {
	position: absolute;
	left: 20px;
	top: 230px;
	width: 96%;
	height: 53%;
	z-index: 9999;
	z-index: 9999;
	opacity: 1;
	background: url(resources/images/loader1.gif) center no-repeat #fff;
}

.checkdiv {
	position: absolute;
	left: 20px;
	top: 230px;
	width: 96%;
	height: 53%;
	z-index: 9999;
	z-index: 9999;
	opacity: 1;
	background: url(resources/images/check.gif) center no-repeat #fff;
}

body {
	font-family: sans-serif
}

.option {
	padding-left: 5px;
}

.dialog-ovelay {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.50);
	opacity: 1;
	z-index: 1000;
}

.dialog-ovelay .dialog {
	width: 25%;
	height: 25%;
	border-radius: 25px;
	margin: 320px auto 0;
	background-color: #fff;
	box-shadow: 0 0 20px rgba(0, 0, 0, .2);
	overflow: hidden
}

.dialog-ovelay .dialog header {
	padding: 10px 8px;
	border-radius: 25px 25px 0px 0px;
	background-color: #beccd8;
	border-bottom: 1px solid #e5e5e5
}

.dialog-ovelay .dialog header h3 {
	font-size: 15px;
	margin: 0;
	color: #000;
	display: inline-block
}

.dialog-ovelay .dialog header .fa-close:active {
	box-shadow: 0 0 5px #673AB7;
	color: #a2a2a2
}

.dialog-ovelay .dialog .dialog-msg {
	padding: 15px 10px
}

.dialog-ovelay .dialog .dialog-msg p {
	margin: 0;
	font-size: 15px;
	color: #333
}

.dialog-ovelay .dialog footer {
	border-top: 1px solid #e5e5e5;
	padding: 8px 8px
}

.dialog-ovelay .dialog footer .controls {
	margin: 8px;
	direction: rtl
}

.dialog-ovelay .dialog footer .controls .button {
	padding: 5px 15px;
	border-radius: 3px
}

.button {
	cursor: pointer
}

.button-default {
	background-color: rgb(248, 248, 248);
	border: 1px solid rgba(204, 204, 204, 0.5);
	color: #5D5D5D;
}

.button-danger {
	background-color: #f44336;
	border: 1px solid #d32f2f;
	color: #f5f5f5
}

.link {
	padding: 5px 10px;
	cursor: pointer
}

@media screen and (max-width:700px) {
	.dialog-ovelay .dialog {
		width: 90%;
		height: auto;
		border-radius: 10px;
	}
	.dialog-ovelay .dialog header {
		border-radius: 10px 10px 0 0;
	}
}
</style>
<style>
.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

label:before {
	border: 0px solid #ccc;
}
</style>
</head>
<body>

	<style type="text/css">
.topSlide2 {
	padding: 20px 60px 20px 20px;
}

.sidebarOuter {
	width: 80px;
}

.sidebarhome li a {
	width: 80px;
	padding-top: 12px;
	padding-bottom: 12px;
	padding-left: 0px;
	padding-right: 0px;
}

.sidebarhome ul {
	width: 80px;
}

.sidebarhome {
	width: 80px;
}

.sidebarhome li {
	width: 80px;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 1px;
}

.sidebarright {
	padding-left: 100px;
	padding-right: 10px;
}

/* HORIZONTAL SCROLL - CATEGORY */
div.scrollmenu {
	background-color: #ffffff;
	overflow: auto;
	white-space: nowrap;
}

div.scrollmenu a {
	display: inline-block;
	color: black;
	text-align: center;
	padding: 14px;
	text-decoration: none;
}

div.scrollmenu a:hover {
	background-color: #FFE8FB;
}

/*  GRID VIEW - ITEM   */
.grid-container {
	display: grid;
	grid-template-columns: auto auto auto auto;
	grid-gap: 10px;
	padding: 10px;
}

.grid-container>div {
	text-align: center;
	padding: 20px 0;
	display: flex;
}

/* ----RADIO-------------- */
.container {
	display: block;
	position: relative;
	margin-bottom: 12px;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

/* Hide the browser's default radio button */
.container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 15px;
	width: 15px;
	background-color: #eee;
	border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
	background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
	background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
	display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
	top: 4px;
	left: 4px;
	width: 6px;
	height: 6px;
	border-radius: 50%;
	background: white;
}

.btn {
	background-color: DodgerBlue;
	border: none;
	color: white;
	cursor: pointer;
}

/* Darker background on mouse-over */
.btn:hover {
	background-color: RoyalBlue;
}

/* TABLE */
table.responsive-table {
	margin: 0 0;
}

.responsive-table td {
    text-align: left;
    padding: 5px;
    font-size: inherit;
}

</style>




	<div class="sidebarOuter"></div>


	<div class="wrapper">

		<!--topHeader-->
		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>



		<!--topHeader-->




		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">


				<!--rightSidebar-->

				<!------------ Place Actual content of page inside this div ----------->
				<div class="sidebarright">


					<div class="sidebarhome">
						<div class="content mCustomScrollbar">
							<ul>
								<li style="background-color: #7EE146"><a href="#"
									onClick="openNav()"> C1 </a></li>

								<li><a href="#" onClick="openNav()"> C2 </a></li>

								<li><a href="#" onClick="openNav()"> C3 </a></li>

								<li><a href="#" onClick="openNav()"> C4 </a></li>

								<li><a href="#" onClick="openNav()"> C5 </a></li>

								<li><a href="#" onClick="openNav()"> C6 </a></li>

								<li><a href="#" onClick="openNav()"> C7 </a></li>

								<li><a href="#" onClick="openNav()"> C8 </a></li>
							</ul>
						</div>
					</div>


					<div class="row">

						<div class="col-sm-7">

							<h2 class="pageTitle">Billing</h2>

							<br>
							<div class="row">
								<div class="col-md-2">
									<div class="col1title">Customer</div>
								</div>
								<div class="col-md-10" style="text-align: left;">
									<!-- class="chosen-select"  -->
									<select name="cust" id="cust"
										data-placeholder="Select Customer" class="chosen-select"
										style="text-align: left;" tabindex="6" required>

										<option value="-1" style="text-align: left;">Anmol</option>
										<option value="-1" style="text-align: left;">Sachin</option>


									</select>
									<button class="btn">
										<i class="fa fa-plus"></i>
									</button>
									<button class="btn">
										<i class="fa fa-edit"></i>
									</button>
								</div>



							</div>

							<div class="row">
								<div class="col-md-2">
									<div class="col1title">Item</div>
								</div>
								<div class="col-md-10" style="text-align: left;">
									<!-- class="chosen-select"  -->
									<select name="cust" id="cust"
										data-placeholder="Select Customer" class="chosen-select"
										style="text-align: left;" tabindex="6" required>

										<option value="-1" style="text-align: left;">Cake</option>
										<option value="-1" style="text-align: left;">Chocolates</option>


									</select>
									<button class="btn">
										<i class="fa fa-plus"></i>
									</button>

								</div>



							</div>



							<div id="table-scroll">
								<!-- class="table-scroll" -->
								<div id="faux-table" aria="hidden"></div>
								<!-- class="faux-table"  -->
								<div class="table-wrap table-wrap-custbill">
									<table id="table_grid1" class="responsive-table">
										<!--  class="main-table small-td"> -->
										<thead>
											<tr class="bgpink">
												<th class="col-sm-1">Sr no.</th>
												<th class="col-md-2">Item</th>
												<th class="col-md-1">Price</th>
												<th class="col-md-1">Qty</th>
												<th class="col-md-1">UOM</th>
												<th class="col-md-1">Total</th>
												<th class="col-md-1">Delete</th>
											</tr>
										</thead>
										<tbody>


											<tr>
												<td>1</td>
												<td>Cakes</td>
												<td>350</td>
												<td class="col-md-1"><input type="text" value="1"></td>
												<td>kg</td>
												<td>350</td>
												<td><a href="#" title="Delete"><i class="fa fa-trash"></i></a></td>

											</tr>
											
											<tr>
												<td>2</td>
												<td>Chocolates</td>
												<td>200</td>
												<td class="col-md-1"><input type="text" value="1"></td>
												<td>kg</td>
												<td>200</td>
												<td><a href="#" title="Delete"><i class="fa fa-trash"></i></a></td>

											</tr>

										</tbody>

									</table>
								</div>
							</div>
							
							<div>
							
							<div class="row">
							
							<div class="col-md-3">Items<input type="text" value="2" readonly="readonly"></div>
							<div class="col-md-3">Total<input type="text" value="2" readonly="readonly"></div>
							<div class="col-md-3">Order Tax<input type="checkbox" name="vehicle1" value="Bike"> I have a bike<input type="text" value="2" readonly="readonly"></div>
							<div class="col-md-3">Discount<input type="text" value="2" readonly="readonly"></div>
							
							</div>
							
							</div>

							<div class="cd-tabs">

								<div class="cd-tabs-content"></div>

							</div>

						</div>


						<div class="col-sm-5">



							<div class="row">
								<div class="col-sm-4">
									<h2 class="pageTitle">Item Search</h2>
								</div>

								<div class="col-sm-8" style="display: flex; margin-top: 15px;">
									<label class="container" style="font-weight: normal;">Category
										<input type="radio" checked="checked" name="radio"> <span
										class="checkmark"></span>
									</label> <label class="container" style="font-weight: normal;">Sub
										Category <input type="radio" checked="checked" name="radio">
										<span class="checkmark"></span>
									</label> <label class="container" style="font-weight: normal;">All
										<input type="radio" checked="checked" name="radio"> <span
										class="checkmark"></span>
									</label>
								</div>

							</div>





							<div class="cd-tabs">
								<div class="cd-tabs-content">

									<div class="scrollmenu">

										<a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a> <a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a> <a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a> <a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a> <a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a> <a style="border: 1px;" href="#" onClick="openNav()">
											<div class="img" style="width: 80px; height: 80px;">
												<img
													src="${pageContext.request.contextPath}/resources/images/mongi.png"
													alt="img">
											</div>
											<div class="title">
												Order <span>Booking</span>
											</div>
										</a>

									</div>
								</div>
							</div>

							<div class="cd-tabs">
								<div class="cd-tabs-content">

									<div class="grid-container">
										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

										<div>
											<a style="border: 1px;" href="#" onClick="openNav()">
												<div class="img" style="width: 80px; height: 80px;">
													<img
														src="${pageContext.request.contextPath}/resources/images/mongi.png"
														alt="img">
												</div>
												<div class="title">
													Order <span>Booking</span>
												</div>
											</a>
										</div>

									</div>

								</div>


							</div>


						</div>

					</div>





				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->





	<!-- document.getElementById("mySelect").value = "orange"; -->
	<!----------------------------------------Dropdown With Search----------------------------------------------- -->
	<%-- <script
		src="${pageContext.request.contextPath}/resources/customerBill/jquery-3.2.1.min.js"
		type="text/javascript"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>



</body>
</html>
