<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:include page="/WEB-INF/views/include/header.jsp" />

<html>
<head>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>


<!-- -----------------------------------------CODE FOR MULTIPLE DROPDOWN (CSS)------------------------------------------------------------ -->

<!-- chosen CSS ============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">

<!-- ----------------------------------------------------END------------------------------------------------------------ -->

<!-- </head>
<body> -->

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker3").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker4").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker5").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>
</head>
<body onload="hideShowCat()">
	<!--datepicker-->
	<c:url var="getMenus" value="/getMenus" />

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<c:url var="findAddOnRate" value="/getAddOnRate" />




		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>


		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>


				<!--leftNav-->

				<!--rightSidebar-->
				<br>
				<div class="sidebarright">
					<div class="order-left" style="width: 100%">
						<br>


						<div class="row">

							<div class="col-md-2">
								<h2 class="pageTitle">Orders</h2>
							</div>
							<div class="col-md-6"></div>

							<div class="col-md-4" style="text-align: right;">

								<input id="datepicker" class="texboxitemcode texboxcal"
									autocomplete="off" placeholder="Delivery Date" style="width: 50%"
									name="datepicker" type="text" value="${todaysDate}">

								<input name="" class="buttonsaveorder" value="Search"
									type="submit" onclick="Print()">

							</div>


						</div>

					</div>


					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->

						<c:set var="selectedMenu" scope="session" value="${selectedMenu}" />

						<div class="clearfix"></div>

						<div id="table-scroll" class="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"></div>
							<div class="table-wrap"
								style="max-height: none; min-height: none;">
								<table id="table_grid" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr No</th>
											<th class="col-md-2" style="text-align: center;">Order
												ID</th>
											<th class="col-md-2" style="text-align: center;">Customer</th>
											<th class="col-md-2" style="text-align: center;">Mobile
												Number</th>
											<th class="col-md-1" style="text-align: center;">Order
												From</th>
											<th class="col-sm-1" style="text-align: center;">Total</th>
											<th class="col-md-2" style="text-align: center;">Status</th>
											<th class="col-md-2" style="text-align: center;">Delivery
												Date</th>
											<th class="col-md-2" style="text-align: center;">Delivery
												Time</th>
											<th class="col-md-2" style="text-align: center;">Kilometer</th>
											<th class="col-md-1" style="text-align: center;">Action</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach var="i" begin="1" end="5">

											<tr>
												<td class="col-md-1">${i}</td>
												<td class="col-md-1" style="text-align: center;">#2315</td>
												<td class="col-md-1">Test Customer</td>
												<td class="col-md-1" style="text-align: center;">9090909090</td>
												<td class="col-md-1">Mobile App</td>
												<td class="col-md-1" style="text-align: right;">450/-</td>


												<c:choose>

													<c:when test="${i==2}">
														<td class="col-md-1" style="text-align: center;"><input
															type="text" readonly="readonly"
															style="text-align: center; border-radius: 50px 50px 50px 50px; background: #b4ffaf; padding: 5px; width: 100px; border: 1px solid #b4ffaf;"
															value="Completed"></td>
													</c:when>


													<c:when test="${i==4}">
														<td class="col-md-1" style="text-align: center;"><input
															type="text" readonly="readonly"
															style="text-align: center; border-radius: 50px 50px 50px 50px; background: #ffd2d2; padding: 5px; width: 100px; border: 1px solid #ffd2d2;"
															value="Delivered"></td>
													</c:when>

													<c:otherwise>
														<td class="col-md-1" style="text-align: center;"><input
															type="text" readonly="readonly"
															style="text-align: center; border-radius: 50px 50px 50px 50px; background: #fffed2; padding: 5px; width: 100px; border: 1px solid #fffed2;"
															value="Process"></td>
													</c:otherwise>

												</c:choose>



												<td class="col-md-1" style="text-align: center;">13/07/2020</td>
												<td class="col-md-1" style="text-align: center;">11:30am</td>
												<td class="col-md-1" style="text-align: right;">7</td>
												<td class="col-md-1" style="text-align: center;"><a
													onclick="openBillPopup()" title="view/generate bill"><i
														class="fa fa-shopping-cart" aria-hidden="true"></i></a> &nbsp;

													<a href="#" title="KOT">KOT</a> &nbsp; <a href="#"
													title="GST Bill"><i class="fa fa-file-pdf-o"
														aria-hidden="true"></i></a></td>

												</td>

											</tr>

										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>

						<br />


					</div>

				</div>

				<br> <br>



			</div>
			<!--tabNavigation-->


			<!--fullGrid-->
		</div>
		<!--rightContainer-->


		<div id="billPopup" class="add_customer" style="width: 60%;">
			<button class="addcust_close close_popup" onclick="closeBillPopup()">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
			<h3 class="pop_head">
				<div class="row" style="margin-right: 25px;">

					<div class="col-lg-3" style="margin-top: 5px;">Generate Bill</div>
					<div class="col-lg-9">

						<input type="text" readonly="readonly"
							style="text-align: center; border-radius: 50px 50px 50px 50px; background: #fffed2; padding: 5px; width: 100px; border: 1px solid #fffed2;"
							value="Process">

					</div>

				</div>
			</h3>

			<div class="col-lg-12">

				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-2" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Order ID :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-4">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">#2132</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Delivery Date :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">13/07/2020 11:30am
								</div>
							</div>

						</div>
					</div>

				</div>

				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-2" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Customer :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-4">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">Test Customer</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Mobile Number :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">9090909090</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-2" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Address :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-10">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">MADHVI DAIRY PVT
									LTD Pratiti House, Opp. Adarsh High School, Dairy Road,
									Palanpur</div>
							</div>

						</div>
					</div>


				</div>


				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-2" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Pincode :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-4">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">400000</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Kilometer :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%;">7</div>
							</div>

						</div>
					</div>

				</div>
				<br>

				<div class="row">

					<div id="table-scroll" class="table-scroll" style="width: 90%">
						<div class="table-responsive"
							style="max-height: none; min-height: none;">
							<table id="table_grid" class="main-table">
								<thead>
									<tr class="bgpink">
										<th class="col-md-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">SR</th>
										<th class="col-md-2"
											style="text-align: center; padding: 0 !important; font-size: 14px;">PRODUCT</th>
										<th class="col-md-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">QTY</th>
										<th class="col-sm-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">UOM</th>
										<th class="col-md-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">PRICE</th>
										<th class="col-md-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">DISCOUNT</th>
										<th class="col-md-1"
											style="text-align: center; padding: 0 !important; font-size: 14px;">TOTAL</th>

									</tr>
								</thead>
								<tbody>

									<c:forEach var="i" begin="1" end="3">

										<tr>
											<td class="col-md-1"
												style="padding: 2 !important; font-size: 14px;">${i}</td>
											<td class="col-md-1"
												style="padding: 2 !important; font-size: 14px;">Madhvi
												Penda</td>
											<td class="col-md-1"
												style="text-align: right; padding: 2 !important; font-size: 14px;">5.00</td>
											<td class="col-md-1"
												style="padding: 2 !important; font-size: 14px;">Kgs</td>
											<td class="col-md-1"
												style="text-align: right; padding: 2 !important; font-size: 14px;">480</td>
											<td class="col-md-1"
												style="text-align: right; padding: 2 !important; font-size: 14px;">0</td>
											<td class="col-md-1"
												style="text-align: right; padding: 2 !important; font-size: 14px;">2400.00</td>

										</tr>

									</c:forEach>


								</tbody>

							</table>
						</div>
					</div>

				</div>

				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-6" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one" style="font-size: 14px;">Total
									UOM :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-6">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%; text-align: right;">Kgs
									= 5 &nbsp;&nbsp;&nbsp;TOTAL = 5</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row"
					style="margin-left: 15px; margin-right: 15px; background: #ffe5e6">

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Total Items :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-2">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one" style="font-size: 14px;">5</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Total :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-4" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%; text-align: right;">2285.71
								</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-3" style="padding-left: 15px;"></div>

					<div class="col-lg-2"></div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Order Tax :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-4" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%; text-align: right;">114.29
								</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row"
					style="margin-left: 15px; margin-right: 15px; background: #e5ffeb">

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Item Discount :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-2">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0">
								<div class="add_customer_one" style="font-size: 14px;">0</div>
							</div>

						</div>
					</div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Bill Discount :</div>
							</div>

						</div>
					</div>

					<div class="col-lg-4" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%; text-align: right;">0
								</div>
							</div>

						</div>
					</div>

				</div>


				<div class="row"
					style="margin-left: 15px; margin-right: 15px; background: #fefcd5">

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Total Payable :</div>
							</div>

						</div>
					</div>
					<div class="col-lg-2"></div>

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%"></div>
							</div>

						</div>
					</div>

					<div class="col-lg-4" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%; text-align: right;">2400.00
								</div>
							</div>

						</div>
					</div>

				</div>

				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-3" style="padding-left: 15px;">
						<div class="add_frm" style="padding: 0px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">Payment Mode :</div>
							</div>

						</div>
					</div>


					<div class="col-lg-9" style="padding-left: 15px;">
						<div class="add_frm"
							style="padding: 0px 0px 0px 15px; border-bottom: 0px">
							<div class="add_frm_one" style="margin: 0;">
								<div class="add_customer_one"
									style="font-size: 14px; width: 100%">COD</div>
							</div>

						</div>
					</div>

				</div>

				<br>
				<div class="row" style="margin-left: 15px; margin-right: 15px;">

					<div class="col-lg-4">
						<button class="hold can_btn" onclick="closeBillPopup()">REJECT</button>
					</div>
					<div class="col-lg-4">
						<button class="hold hold_btn" onclick="closeBillPopup()">KOT</button>
					</div>
					<div class="col-lg-4">
						<button class="hold pay_btn" onclick="closeBillPopup()">GST
							BILL</button>
					</div>


				</div>
				<br>


			</div>



		</div>



	</div>
	<!--wrapper-end-->

	<script type="text/javascript">
		$(document).ready(function() {
			$('#billPopup').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>

	<script type="text/javascript">
		function openBillPopup() {

			$('#billPopup').popup('show');

		}

		function closeBillPopup() {

			$('#billPopup').popup('hide');

		}
	</script>


	<!-- chosen JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>

</body>
</html>
