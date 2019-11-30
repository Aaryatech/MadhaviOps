<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>Monginis</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="Monginis" />
<meta name="description" content="Monginis" />
<meta name="author" content="Monginis">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/css/monginis.css"
	type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/newpos/css/jquery.classyscroll.css"
	type="text/css" />

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/newpos/images/favicon.png"
	type="images/png" sizes="32x32">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<!--font-family: 'Source Sans Pro', sans-serif;-->

</head>

<!--commanJS-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.classyscroll.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.mousewheel.js"></script>


<!--commanJS-->
<!-- jQuery Popup Overlay -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/newpos/js/jquery.popupoverlay.js"></script>
<c:url var="saveCustomerFromBill" value="/saveCustomerFromBill" />
<c:url var="editCustomerFromBill" value="/editCustomerFromBill" />
<c:url var="getCategoryListForCustomerBill"
	value="/getCategoryListForCustomerBill" />
<c:url var="getSubCategoryListForCustomerBill"
	value="/getSubCategoryListForCustomerBill" />
<c:url var="getAllItemlistForCustomerBill"
	value="/getAllItemlistForCustomerBill" />
<c:url var="getItemListByCatSubCatForCustomerBill"
	value="/getItemListByCatSubCatForCustomerBill" />
<c:url var="addItemInBillList" value="/addItemInBillList" />
<c:url var="deleteItemInBillList" value="/deleteItemInBillList" />
<c:url var="getCurrentItemList" value="/getCurrentItemList" />
<c:url var="billOnHold" value="/billOnHold" />
<c:url var="revertHoldBillOnCurrent" value="/revertHoldBillOnCurrent" />
<c:url var="cancelFromHoldBill" value="/cancelFromHoldBill" />
<c:url var="submitBill" value="/submitBill" />
<c:url var="submitBillByPaymentOption"
	value="/submitBillByPaymentOption" />
<c:url var="editItemQty" value="/editItemQty" />
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 30%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(101, 113, 119, 0.5);
	z-index: 2;
	cursor: pointer;
}

#text2 {
	position: absolute;
	top: 50%;
	left: 50%;
	font-size: 25px;
	color: white;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
}

.itemDummyClass {
	cursor: pointer;
}
</style>
<body>
	<form action="" method="get">

		<!--wrapper-start-->
		<div class="wrapper">

			<header>
				<div class="logo">
					<a href="${pageContext.request.contextPath}/home"><img
						src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg"
						alt="madhvi_logo"></a>
				</div>

				<div class="drop_menu">
					<%-- <div class="dropdown">
						<div class="select">
							<span>Hold Bill</span>
						</div>

						<ul class="dropdown-menu">
							<c:forEach items="${holdingList}" var="holdingList">
								<a href="#"
									onclick="revertHoldBillOnCurrent(${holdingList.key})"><li
									id="${holdingList.key}">${holdingList.key}</li></a>
							</c:forEach>

						</ul>

					</div> --%>
					<select name="holdBillNo" id="holdBillNo"
						data-placeholder="Select Bill No" class="input_add chosen-select"
						style="text-align: left;" onchange="revertHoldBillOnCurrent()">
						<option value="" style="text-align: left;" selected>Select
							Bill No</option>
						<c:forEach items="${holdingList}" var="holdingList">
							<option value="${holdingList.key}" style="text-align: left;">${holdingList.value.tempCustomerName}</option>
						</c:forEach>
					</select>
					<div class="logout_btn">
						<a href="${pageContext.request.contextPath}/logout"><i
							class="fa fa-sign-out" aria-hidden="true"></i> Logout </a>
					</div>

				</div>
				<div class="clr"></div>
			</header>

			<section class="main_container">
				<div class="cat_l">
					<!--top-buttons row-->
					<!-- <div class="pending_row">
						<a href="#" class="pending_btn initialism slide_open">Pending
							Amt : <span>00.00</span>
						</a> <a href="#" class="pending_btn initialism  ">Advance Amt : <span>00.00</span>
						</a> <a href="#" class="pending_btn">Total Amt : <span>00.00</span></a>

					</div> -->

					<!--customer drop down here-->
					<div class="add_customer_bx">
						<!--customer row 1-->
						<div class="customer_row">
							<input name="defaultCustomer" id="defaultCustomer" type="hidden"
								value="${defaultCustomer}" /><input name="frtype" id="frtype"
								type="hidden" value="${frtype}" />
							<div class="customer_one">Customer</div>
							<div class="customer_two">
								<select name="cust" id="cust" data-placeholder="Select Customer"
									class="input_add chosen-select" style="text-align: left;"
									required>
									<option value="0" style="text-align: left;">Select
										Customer</option>

									<c:choose>
										<c:when test="${key>0}">
											<c:forEach items="${customerList}" var="customerList">
												<c:choose>
													<c:when test="${customerList.custId==holdBill.custId}">
														<option value="${customerList.custId}"
															style="text-align: left;" selected>${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:when>
													<c:otherwise>
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach items="${customerList}" var="customerList">
												<c:choose>
													<c:when test="${customerList.custId==defaultCustomer}">
														<option value="${customerList.custId}"
															style="text-align: left;" selected>${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:when>
													<c:otherwise>
														<option value="${customerList.custId}"
															style="text-align: left;">${customerList.custName}
															&nbsp;${customerList.phoneNumber}</option>
													</c:otherwise>
												</c:choose>

											</c:forEach>
										</c:otherwise>
									</c:choose>

								</select>
							</div>
							<div class="customer_three">
								<button class="plus_btn addcust_open" type="button">
									<i class="fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
							<div class="customer_three">
								<button class="plus_btn" type="button" onclick="editCustomer()">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</button>
							</div>
							<div class="clr"></div>
						</div>
						<input id=frRateCat name="frRateCat" value="${frRateCat}"
							type="hidden"> <input id=key name="key" value="${key}"
							type="hidden">
						<!--customer row 2-->
						<%-- <div class="customer_row">
							<div class="customer_one">Item</div>
							<div class="customer_two">
								<input list="items" id="itemName" name="itemName"
									class="input_add chosen" autocomplete="off"
									placeholder="Select Item" onchange="onSelectItem()"
									style="border-radius: 5px; padding: 2px 1px 0px 8px; height: 26px; text-align: left; background: linear-gradient(#fff 20%, #f6f6f6 50%, #eee 52%, #f4f4f4 100%); color: #444;"
									type="text">
								<datalist id="items">
									<c:forEach items="${newItemsList}" var="newItemsList">
										<option value='${newItemsList.id}'
											data-value='${newItemsList.itemName}'
											data-id='${newItemsList.id}'>${newItemsList.itemName}</option>
									</c:forEach>
								</datalist>
							</div>
							<div class="customer_three">
								<button class="plus_btn">
									<i class="fa fa-plus" aria-hidden="true"></i>
								</button>
							</div>
							<div class="clr"></div>
						</div> --%>
					</div>
					<c:set var="totalItemCount" value="0"></c:set>
					<c:set var="totalTaxableAmt" value="0"></c:set>
					<c:set var="totalTaxAmt" value="0"></c:set>
					<c:set var="totalAmt" value="0"></c:set>
					<!--product table-->
					<div class="total_table_one" id="printDivid">
						<div class="scrollbars">
							<table id="itemBillTable">

								<thead>
									<tr>
										<th style="text-align: center;" width="2%">Sr.No</th>
										<th style="text-align: center;">Product</th>
										<th style="text-align: center;" width="10%">QTY</th>
										<th style="text-align: center;" width="13%">Price</th>
										<th style="text-align: center;" width="13%">Total</th>
										<th style="text-align: center;" width="2%">Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${holdBill.itemList}" var="itemList"
										varStatus="count">
										<c:set var="totalItemCount" value="${totalItemCount+1}"></c:set>
										<tr>
											<td>${count.index+1}</td>
											<td>${itemList.itemName}</td>
											<td style="text-align: right;" onclick="opnItemPopup('${itemList.taxPer}','${itemList.itemId}','${itemList.orignalMrp}','${itemList.itemName}')"><fmt:formatNumber
													type="number" groupingUsed="false" value="${itemList.qty}"
													maxFractionDigits="3" minFractionDigits="3" /></td>
											<td style="text-align: right;"><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${itemList.orignalMrp}" maxFractionDigits="0"
													minFractionDigits="0" /></td>
											<td style="text-align: right;"><fmt:formatNumber
													type="number" groupingUsed="false"
													value="${itemList.total}" maxFractionDigits="2"
													minFractionDigits="2" /></td>
											<td style="text-align: center;"><a href="#"
												title="Delete"
												onclick="deleteItemInBillList(${count.index})"><i
													class="fa fa-trash"></i></a></td>
										</tr>
										<c:set var="totalTaxableAmt"
											value="${totalTaxableAmt+itemList.taxableAmt}"></c:set>
										<c:set var="totalTaxAmt"
											value="${totalTaxAmt+itemList.taxAmt}"></c:set>
										<c:set var="totalAmt" value="${totalAmt+itemList.total}"></c:set>
									</c:forEach>
									<!-- <tr>
										<td>1</td>
										<td>Cakes</td>
										<td style="text-align: right;">350</td>
										<td style="text-align: right;">2</td>
										<td style="text-align: right;">350</td>
										<td style="text-align: center;"><a href="#"
											title="Delete"><i class="fa fa-trash"></i></a></td>
									</tr>
									<tr>
										<td>2</td>
										<td>Chocolates</td>
										<td style="text-align: right;">200</td>
										<td style="text-align: right;">1</td>
										<td style="text-align: right;">200</td>
										<td style="text-align: center;"><a href="#"
											title="Delete"><i class="fa fa-trash"></i></a></td>
									</tr> -->
								</tbody>
							</table>
						</div>
					</div>

					<!--total-table start here-->
					<div class="total_tab">
						<c:choose>
							<c:when test="${key>0}">
								<table width="100%">
									<tr bgcolor="#ffe5e6">
										<td>Total Items</td>
										<td id="totalItemLable">${totalItemCount}</td>
										<td>Total :</td>
										<td style="text-align: right;" id="taxableAmtLable"><fmt:formatNumber
												type="number" groupingUsed="false"
												value="${totalTaxableAmt}" maxFractionDigits="2"
												minFractionDigits="2" /></td>
									</tr>
									<tr bgcolor="#ffe5e6" style="border-top: 1px solid #f4f4f4;">
										<td>Discount</td>
										<td>(0.00) 0.00</td>
										<td>Order Tax</td>
										<td style="text-align: right;" id="taxAmtLable"><fmt:formatNumber
												type="number" groupingUsed="false" value="${totalTaxAmt}"
												maxFractionDigits="2" minFractionDigits="2" /></td>
									</tr>
									<tr bgcolor="#fefcd5" style="border-top: 1px solid #f4f4f4;">
										<td style="font-weight: 600;">Total Payable</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td style="font-weight: 600; text-align: right;"
											id="totalLable"><fmt:formatNumber type="number"
												groupingUsed="false" value="${totalAmt}"
												maxFractionDigits="2" minFractionDigits="2" /></td>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<table width="100%">
									<tr bgcolor="#ffe5e6">
										<td>Total Items</td>
										<td id="totalItemLable">0</td>
										<td>Total :</td>
										<td style="text-align: right;" id="taxableAmtLable">0.00</td>
									</tr>
									<tr bgcolor="#ffe5e6" style="border-top: 1px solid #f4f4f4;">
										<td>Discount</td>
										<td>(0.00) 0.00</td>
										<td>Order Tax</td>
										<td style="text-align: right;" id="taxAmtLable">0.00</td>
									</tr>
									<tr bgcolor="#fefcd5" style="border-top: 1px solid #f4f4f4;">
										<td style="font-weight: 600;">Total Payable</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
										<td style="font-weight: 600; text-align: right;"
											id="totalLable">0.00</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>

					</div>


					<!--five button here-->
					<div class="buttons_row">
						<div class="button_one">
							<a href="#" class="hold hold_btn" onclick="billOnHold()">Hold</a>
							<a href="#" class="hold can_btn"
								onclick="cancelFromHoldBill(${key})">Cancel</a>
						</div>
						<div class="button_one">
							<a href="#" class="hold print_btn" onclick="openPaymentPopup()">Payment
								Option</a> <a href="#" class="hold bill_btn "
								onclick="submitBill(2)">Print Bill</a>
						</div>
						<div class="button_two">
							<a href="#" class="hold pay_btn " onclick="submitBill(1)">Bill</a>
						</div>
					</div>


				</div>

				<!--right-side-box-->
				<div class="cat_r">
					<!--item search row-->
					<div class="radio_row_one">
						<h3 class="item_head">Item Search</h3>
						<div class="radio_row">
							<ul>
								<li><input type="radio" id="f-option" name="serachBy"
									checked onclick="getCatListAndSubCatList(1)"> <label
									for="f-option">Category</label>
									<div class="check"></div></li>
								<!-- <li><label
									for="s-option">Sub Category </label>
									<div class="check">
										<div class="inside"></div>
									</div></li> -->
								<input type="hidden" id="s-option" name="serachBy"
									onclick="getCatListAndSubCatList(2)">
								<li><input type="radio" id="g-option" name="serachBy"
									onclick="getCatListAndSubCatList(3)"> <label
									for="g-option">All Items</label>
									<div class="check"></div></li>


							</ul>
						</div>
					</div>

					<!--category box start here-->
					<div id="catSubCatDivHideShow">
						<div class="cat_bx_one">
							<div class="category_list">
								<div class="category_scrollbars" id="catSubCatDiv">
									<c:forEach items="${catList}" var="catList">
										<div class="cat_one catDummyClass">
											<a href="#" onclick="getsubcatlist(${catList.catId})"><img
												title="${catList.catName}"
												src="${pageContext.request.contextPath}/resources/newpos/images/${catList.itemImage}"
												onerror="imgError(this);" alt="${catList.catName}"> <span>${catList.catName}</span></a>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>

					</div>
					<!--listing box start here-->


					<div class="a"
						style="display: inline-block; width: 100%; margin: 20px 0 0 0;">
						<div class="a" style="float: left; width: 70%">
							<div class="bx_tabs">
								<ul id="subcatUl">
									<!-- <li class="subCatDummyClass"><a href="#"
										style="margin-bottom: 5px;">Sweet</a></li>
									<li class="subCatDummyClass"><a href="#">Lassi</a></li>
									<li class="subCatDummyClass"><a href="#">Kaju &amp;
											Combo</a></li>
									<li class="subCatDummyClass"><a href="#">Bengal Namkin</a></li>
									<li class="subCatDummyClass"><a href="#">Sweet</a></li>
									<li class="subCatDummyClass"><a href="#">Lassi</a></li>
									<li class="subCatDummyClass"><a href="#">Sweet</a></li>
									<li class="subCatDummyClass"><a href="#">Lassi</a></li>
									<li class="subCatDummyClass"><a href="#">Kaju &amp;
											Combo</a></li>
									<li class="subCatDummyClass"><a href="#">Bengal Namkin</a></li>
									<li class="subCatDummyClass"><a href="#">Sweet</a></li>
									<li class="subCatDummyClass"><a href="#">Lassi</a></li> -->

									<ul>
							</div>
						</div>
						<div class="a" style="float: right; width: 30%">
							<div class="cat_srach">
								<input name="myInput1" id="myInput1" type="text"
									class="input_cat" onkeyup="myFunction1()"
									placeholder="Search Item" />
							</div>
						</div>
					</div>


					<div class="cat_list_bx">

						<div class="cat_list">
							<div class="carlist_scrollbars" id="scrollDiv">
								<!--<div class="cat_one cat"><a href="#" class="initialism quantity_open"><img src="images/laddu.jpg" alt="laddu"> <p>210</p> <span>Order Booking</span></a></div>-->


								<div class="sweet_list" id="aaaaaa">
									<ul id="itemDiv">
										<!-- <li class="itemDummyClass">
											<div class="sweet_one">
												<a href="#"><p>210</p> Maramari <span>Qty : 6</span></a>
											</div>
										</li> -->

									</ul>
								</div>



							</div>
						</div>
					</div>

				</div>
			</section>

		</div>

		<!--Add Customer-->
		<div id="addcust" class="add_customer" style="display: none;">
			<button class="addcust_close close_popup"
				onclick="clearAddCustomerpopup()">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
			<h3 class="pop_head" id="add_cust_head_name">Add Customer</h3>

			<div class="add_frm">
				<div class="add_frm_one">
					<div class="add_customer_one">Customer Name</div>
					<div class="add_input">
						<input type="text" class="input_add"
							placeholder="Enter Customer Name" name="customerName"
							onchange="trim(this)" id="customerName" /> <input type="hidden"
							name="custId" id="custId" value="0" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Mobile Number</div>
					<div class="add_input">
						<input type="text" class="input_add"
							placeholder="Enter Mobile Number" name="mobileNo" id="mobileNo"
							onchange="trim(this)" maxlength="10" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">DOB</div>
					<div class="add_input">
						<input autocomplete="off" placeholder="Date Of Birth"
							name="dateOfBirth" id="dateOfBirth" type="date" class="input_add" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Business</div>
					<div class="add_input">
						<div class="radio_row popup_radio">
							<ul>
								<li><input type="radio" type="radio" name="selector"
									id="y-option" onclick="isBuissness(1)"> <label
									for="y-option">Yes</label>
									<div class="check"></div></li>
								<li><input type="radio" id="n-option" name="selector"
									onclick="isBuissness(0)" checked> <label for="n-option">No
								</label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<div style="display: none;" id="isbuissnessdiv">
					<div class="add_frm_one">
						<div class="add_customer_one">Company Name</div>
						<div class="add_input">
							<input placeholder="Enter Company Name" name="companyName"
								onchange="trim(this)" id="companyName" type="text"
								class="input_add" />
						</div>
						<div class="clr"></div>
					</div>
					<div class="add_frm_one">
						<div class="add_customer_one">GST Number</div>
						<div class="add_input">
							<input placeholder="Enter GST Name" name="gstNo" id="gstNo"
								onchange="trim(this)" type="text" class="input_add" />
						</div>
						<div class="clr"></div>
					</div>
					<div class="add_frm_one">
						<div class="add_customer_one">Address</div>
						<div class="add_input">
							<input placeholder="Enter Address" name="custAdd" id="custAdd"
								onchange="trim(this)" type="text" class="input_add" />
						</div>
						<div class="clr"></div>
					</div>
				</div>
			</div>

			<div class="pop_btns">
				<div class="close_l">
					<button class="addcust_close close_btn"
						onclick="clearAddCustomerpopup()">Close</button>
				</div>
				<div class="close_r">
					<a href="#" onclick="addCustomer()">Save</a>
				</div>
				<div class="clr"></div>
			</div>


		</div>

		<!--pending amount popup-->
		<div id="slide" class="pending_pop" style="display: none;">
			<button class="slide_close">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
			<div style="overflow-x: auto;">
				<table class="pending_tab">
					<tr>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Points</th>
						<th>Points</th>
						<th>Points</th>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Eve</td>
						<td>Jackson</td>
						<td>94</td>
						<td>94</td>
						<td>94</td>
					</tr>
					<tr>
						<td>Adam</td>
						<td>Johnson</td>
						<td>67</td>
						<td>67</td>
						<td>67</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Eve</td>
						<td>Jackson</td>
						<td>94</td>
						<td>94</td>
						<td>94</td>
					</tr>
					<tr>
						<td>Adam</td>
						<td>Johnson</td>
						<td>67</td>
						<td>67</td>
						<td>67</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>
					<tr>
						<td>Eve</td>
						<td>Jackson</td>
						<td>94</td>
						<td>94</td>
						<td>94</td>
					</tr>
					<tr>
						<td>Adam</td>
						<td>Johnson</td>
						<td>67</td>
						<td>67</td>
						<td>67</td>
					</tr>
					<tr>
						<td>Jill</td>
						<td>Smith</td>
						<td>50</td>
						<td>50</td>
						<td>50</td>
					</tr>


				</table>
			</div>
		</div>
		<div id="payment" class="add_customer" style="display: none;">
			<button class="payment_close close_popup">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
			<h3 class="pop_head">Payment</h3>

			<div class="add_frm">

				<div class="add_frm_one">
					<div class="add_customer_one">Total AMT</div>
					<div class="add_input" id="totalAmtPopup">
						<fmt:formatNumber type="number" groupingUsed="false"
							value="${totalAmt}" maxFractionDigits="2" minFractionDigits="2" />
					</div>
					<div class="clr"></div>
				</div>

				<div class="add_frm_one">
					<div class="add_customer_one">Credit Bill</div>
					<div class="add_input">
						<div class="radio_row popup_radio">
							<ul>
								<li><input type="radio" id="creditBillyes"
									name="creditBill" onclick="modeOfPayDivHideShow(1)"> <label
									for="creditBillyes">Yes</label>
									<div class="check"></div></li>
								<li><input type="radio" id="creditBillno" name="creditBill"
									checked onclick="modeOfPayDivHideShow(2)"> <label
									for="creditBillno">No </label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>
				<div id="modeOfPayDiv">

					<div class="add_frm_one">
						<div class="add_customer_one">Mode of Pay</div>
						<div class="add_input">
							<div class="radio_row popup_radio">
								<ul>
									<li><input type="radio" id="single" name="modePay"
										onclick="changeSplitSingle(1)" checked> <label
										for="single">Single</label>
										<div class="check"></div></li>
									<li><input type="radio" id="split" name="modePay"
										onclick="changeSplitSingle(2)"> <label for="split">Split
									</label>
										<div class="check">
											<div class="inside"></div>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="clr"></div>
					</div>
					<div id="splitDiv" style="display: none;">
						<div class="add_frm_one">
							<div class="add_customer_one">Cash</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="cashCheck"
											name="cashCheck" checked> &nbsp;  --> <input type="text"
											id="cashAmt" name="cashAmt" class=" input_add numberOnly"
											placeholder="Cash Ammount" value="0">
										</li>
									</ul>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">Card</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="cardCheck"
											name="cardCheck"> &nbsp;  --> <input type="text" id="cardAmt"
											name="cardAmt" class=" input_add numberOnly"
											placeholder="Card Ammount" value="0">
										</li>
									</ul>
								</div>
							</div>
							<div class="clr"></div>
						</div>

						<div class="add_frm_one">
							<div class="add_customer_one">E-Pay</div>
							<div class="add_input">
								<div class="radio_row popup_radio">
									<ul>
										<li>
											<!-- <input type="checkbox" id="epayCheck"
											name="epayCheck"> &nbsp;  --> <input type="text" id="epayAmt"
											name="epayAmt" class="input_add numberOnly"
											placeholder="E-Pay Ammount" value="0">
										</li>
									</ul>
								</div>
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<div id="singleDiv">
						<div class="add_frm_one">
							<div class="add_customer_one">Type</div>
							<div class="add_input">
								<select name="billType" id="billType" data-placeholder="Type"
									class="input_add " style="text-align: left;">
									<option value="1" style="text-align: left;" selected>Cash</option>
									<option value="2" style="text-align: left;">Card</option>
									<option value="3" style="text-align: left;">E-Pay</option>
								</select>
								<!-- <div class="dropdown popup_drop">
									<div class="select">
										<span>Payment Mode</span>
									</div>

									<ul class="dropdown-menu">
										<li id="male">Cash</li>
										<li id="female">Card</li>
										<li id="female">E-pay</li>
									</ul>
								</div> -->

							</div>
							<div class="clr"></div>
						</div>
						<div class="add_frm_one">
							<div class="add_customer_one">Amount</div>
							<div class="add_input">
								<input name="payAmt" id="payAmt" type="text"
									class="input_add numberOnly" placeholder="Enter Ammount"
									value="0" />
							</div>
							<div class="clr"></div>
						</div>
					</div>
					<!-- <div class="add_frm_one">
						<div class="add_customer_one">Amount</div>
						<div class="add_input">
							<input name="" type="text" class="input_add" />
						</div>
						<div class="clr"></div>
					</div> -->
				</div>
			</div>
			<div class="pop_btns">
				<div class="close_l">
					<button class="payment_close close_btn">Close</button>
				</div>

				<div class="close_r">
					<a href="#" onclick="submitBillByPaymentOption(2)">GST Bill</a>
					&nbsp;<a href="#" onclick="submitBillByPaymentOption(1)">KOT</a>
				</div>
				<div class="clr"></div>
			</div>

			<!--<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>-->
		</div>

		<!-- <div id="quantity" class="category_popup" style="display: none;">
			<h3 class="pop_head" id="itemNmaeHeadeing">Quantity</h3>

			<div class="add_frm">

				<div class="add_row">
					<div class="add_row_l">
						<span class="add_txt">Enter QTY</span> <input name="enterQty"
							id="enterQty" type="text" value="1" class="input_add numberOnly"
							placeholder="QTY" onkeyup="itemRateCalculation(1)" />
					</div>
					<input name="rateHidden" id="rateHidden" type="hidden" /><input
						name="itemIdHidden" id="itemIdHidden" type="hidden" /><input
						name="taxperHidden" id="taxperHidden" type="hidden" /><input
						name="itemNameHidden" id="itemNameHidden" type="hidden" />
					<div class="add_row_r">
						<span class="add_txt">Rate </span> <input name="enterRate"
							id="enterRate" type="text" class="input_add numberOnly"
							placeholder="Enter Rate" onkeyup="itemRateCalculation(2)" />
					</div>
					<div class="clr"></div>
				</div>

				<div class="add_row add_row_marg">
					<div class="add_row_l">
						<span class="add_txt" id="qty_lable">QTY : 1</span>
					</div>
					<div class="add_row_r">
						<span class="add_txt" id="rate_lable">Rate: 100.00</span>
					</div>
					<div class="clr"></div>
				</div>
			</div>

			<div class="pop_btns">
				<div class="close_l">
					<button class="quantity_close close_btn">Close</button>
				</div>
				<div class="close_r">
					<a href="#" onclick="addItemInBillList()">Add</a>
				</div>
				<div class="clr"></div>
			</div>


		</div> -->

		<!--pending amount popup-->
		<div id="quantity" class="add_customer calcy" style="display: none;">
			<div>
				<div class="close_l">
					<h3 class="pop_head" id="itemNmaeHeadeing">Quantity</h3>
				</div>
				<div class="close_r" style="margin: 10px 10px 0 0;">
					<button class="quantity_close close_btn">Close</button>
				</div>
			</div>
			<div class="clr"></div>
			<div class="calcy_bx">
				<div class="calcy_1">
					<div class="calculator_bx">
						<input name="rateHidden" id="rateHidden" type="hidden" /><input
							name="itemIdHidden" id="itemIdHidden" type="hidden" /><input
							name="taxperHidden" id="taxperHidden" type="hidden" /><input
							name="itemNameHidden" id="itemNameHidden" type="hidden" />
						<div class="cal_quan">
							<div class="qty_l">QTY</div>
							<div class="qty_m">
								<input name="enterQty" id="enterQty" type="text" value="1"
									class="qty_one numberOnly" placeholder="QTY"
									onkeyup="itemRateCalculation(1)" />
							</div>
							<div class="qty_r">
								<button type="submit" class="go_btn" onclick="calPad(1,10)"></button>
							</div>
							<div class="clr"></div>
						</div>

						<div class="calc_no">
							<div class="calc_no_l">
								<ul>
									<li><a href="#" onclick="calPad(1,7)">7</a></li>
									<li><a href="#" onclick="calPad(1,8)">8</a></li>
									<li><a href="#" onclick="calPad(1,9)">9</a></li>
									<li><a href="#" onclick="calPad(1,4)">4</a></li>
									<li><a href="#" onclick="calPad(1,5)">5</a></li>
									<li><a href="#" onclick="calPad(1,6)">6</a></li>
									<li><a href="#" onclick="calPad(1,1)">1</a></li>
									<li><a href="#" onclick="calPad(1,2)">2</a></li>
									<li><a href="#" onclick="calPad(1,3)">3</a></li>
									<li><a href="#" onclick="calPad(1,0)">0</a></li>
									<li><a href="#" onclick="calPad(1,'.')">.</a></li>
									<li><a href="#" onclick="calPad(1,11)">C<%-- <img
											src="${pageContext.request.contextPath}/resources/newpos/images/next_arrow_one.png"
											alt="next_arrow_one"> --%>
									</a></li>
								</ul>
							</div>
							<div class="calc_no_r">
								<a href="#" onclick="addItemInBillList()"><img
									src="${pageContext.request.contextPath}/resources/newpos/images/right_arrow_one.png"
									alt="right_arrow_one"></a>
							</div>
							<div class="clr"></div>
						</div>

					</div>
				</div>
				<div class="calcy_2">
					<div class="calculator_bx">
						<div class="cal_quan">
							<div class="qty_l">AMT</div>
							<div class="qty_m">
								<input name="enterRate" id="enterRate" type="text"
									class="qty_one numberOnly" placeholder="Enter Rate"
									onkeyup="itemRateCalculation(2)" />
							</div>
							<div class="qty_r">
								<button type="submit" class="go_btn" onclick="calPad(2,10)"></button>
							</div>
							<div class="clr"></div>
						</div>

						<div class="calc_no">
							<div class="calc_no_l">
								<ul>
									<li><a href="#" onclick="calPad(2,7)">7</a></li>
									<li><a href="#" onclick="calPad(2,8)">8</a></li>
									<li><a href="#" onclick="calPad(2,9)">9</a></li>
									<li><a href="#" onclick="calPad(2,4)">4</a></li>
									<li><a href="#" onclick="calPad(2,5)">5</a></li>
									<li><a href="#" onclick="calPad(2,6)">6</a></li>
									<li><a href="#" onclick="calPad(2,1)">1</a></li>
									<li><a href="#" onclick="calPad(2,2)">2</a></li>
									<li><a href="#" onclick="calPad(2,3)">3</a></li>
									<li><a href="#" onclick="calPad(2,0)">0</a></li>
									<li><a href="#" onclick="calPad(2,'.')">.</a></li>
									<li><a href="#" onclick="calPad(2,11)">C<%-- <img
											src="${pageContext.request.contextPath}/resources/newpos/images/next_arrow_one.png"
											alt="next_arrow_one"> --%>
									</a></li>
								</ul>
							</div>
							<div class="calc_no_r">
								<a href="#" onclick="addItemInBillList()"><img
									src="${pageContext.request.contextPath}/resources/newpos/images/right_arrow_one.png"
									alt="right_arrow_one"></a>
							</div>
							<div class="clr"></div>
						</div>

					</div>
				</div>

				<div class="add_row add_row_marg">
					<div class="add_row_l">
						<span class="add_txt" id="qty_lable">QTY : 1</span>
					</div>
					<div class="add_row_r">
						<span class="add_txt" id="rate_lable">Rate: 100.00</span>
					</div>
					<div class="clr"></div>
				</div>
				<div class="clr"></div>
			</div>

<!-- 
			<div class="pop_btns">
				<div class="close_l">
					<button class="quantity_close close_btn">Close</button>
				</div>
				<div class="close_r">
					<a href="#" onclick="addItemInBillList()">Submit</a>
				</div>
				<div class="clr"></div>
			</div> -->
		</div>
		<div id="myModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>Enter Customer Name</p>


				<div class="add_frm_one">
					<div class="add_customer_one">Customer Name</div>
					<div class="add_input">
						<input placeholder="Customer Name" name="holdCustName"
							onchange="trim(this)" id="holdCustName" type="text"
							class="input_add" />
					</div>
					<div class="clr"></div>
				</div>

				<div class="pop_btns">

					<div class="close_r">
						<a href="#" onclick="submitBillOnHold()">Submit</a>
					</div>

					<div class="clr"></div>
				</div>

			</div>
		</div>
		<div id="overlay2">
			<div id="text2">
				<img
					src="${pageContext.request.contextPath}/resources/newpos/images/loader.gif"
					alt="madhvi_logo">
			</div>
		</div>
		<!--wrapper-end-->
	</form>

	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#addcust').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>
	<script type="text/javascript">
		/*Dropdown Menu*/
		$('.dropdown').click(function() {
			$(this).attr('tabindex', 1).focus();
			$(this).toggleClass('active');
			$(this).find('.dropdown-menu').slideToggle(300);
		});
		$('.dropdown').focusout(function() {
			$(this).removeClass('active');
			$(this).find('.dropdown-menu').slideUp(300);
		});
		$('.dropdown .dropdown-menu li').click(
				function() {
					$(this).parents('.dropdown').find('span').text(
							$(this).text());
					$(this).parents('.dropdown').find('input').attr('value',
							$(this).attr('id'));
				});
		/*End Dropdown Menu*/
	</script>

	<script type="text/javascript">
		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines
			return;
		}
		function validateMobile(mobile) {
			var mob = /^[1-9]{1}[0-9]{9}$/;

			if (mob.test($.trim(mobile)) == false) {

				//alert("Please enter a valid email address .");
				return false;

			}
			return true;

		}

		function editCustomer() {

			var custId = document.getElementById("cust").value;

			if (custId != 0) {
				document.getElementById("overlay2").style.display = "block";
				$
						.post(
								'${editCustomerFromBill}',
								{
									custId : custId,
									ajax : 'true'
								},
								function(data) {
									document.getElementById("overlay2").style.display = "none";
									$('.addcust_open').trigger('click');
									//$('#myModalEdit').modal('show');
									//$('#addcust').popup('show');
									document
											.getElementById("add_cust_head_name").innerHTML = "Edit Customer";
									document.getElementById("customerName").value = data.custName;
									document.getElementById("mobileNo").value = data.phoneNumber;
									document.getElementById("custId").value = data.custId;
									document.getElementById("dateOfBirth").value = data.custDob;

									if (data.isBuissHead == 1) {

										$("#isbuissnessdiv").show();
										document.getElementById("y-option").checked = true;
										document.getElementById("companyName").value = data.companyName;
										document.getElementById("gstNo").value = data.gstNo;
										document.getElementById("custAdd").value = data.address;
									} else {
										$("#isbuissnessdiv").hide();
										document.getElementById("y-option").checked = false;
									}

								});

			} else {
				alert("Select Customer ");
			}

		}

		function addCustomer() {
			//$('#addcust').modal('hide');
			//$('#addcust').popup('hide'); //for close popup;
			var custId = document.getElementById("custId").value;
			var customerName = document.getElementById("customerName").value;
			var mobileNo = document.getElementById("mobileNo").value;
			var dateOfBirth = document.getElementById("dateOfBirth").value;
			//var isBuissness = document.getElementById("isBuissness").value;
			var buisness = 0;
			if (document.getElementById('y-option').checked) {
				buisness = 1;
			}
			var companyName = document.getElementById("companyName").value;
			var gstNo = document.getElementById("gstNo").value;
			var custAdd = document.getElementById("custAdd").value;

			var flag = 0;

			if (customerName == "") {
				alert("Enter Customer Name");
				flag = 1;
			} else if (mobileNo == "" || !validateMobile(mobileNo)) {
				alert("Enter Valid Mobile No");
				flag = 1;
			} else if (dateOfBirth == "") {
				alert("Enter Date of Birth");
				flag = 1;
			} else if (buisness == 1) {

				if (companyName == "") {
					alert("Enter Company Name");
					flag = 1;
				} else if (gstNo == "") {
					alert("Enter GST No");
					flag = 1;
				} else if (custAdd == "") {
					alert("Enter Address");
					flag = 1;
				}
			}

			if (flag == 0) {
				$
						.post(
								'${saveCustomerFromBill}',
								{
									customerName : customerName,
									mobileNo : mobileNo,
									dateOfBirth : dateOfBirth,
									buisness : buisness,
									companyName : companyName,
									gstNo : gstNo,
									custAdd : custAdd,
									custId : custId,
									ajax : 'true'
								},
								function(data) {

									//alert(JSON.stringify(data));

									if (data.error == false) {

										var html = '<option value="0" selected>Select Customer</option>';
										var len = data.customerList.length;
										//alert(data.addCustomerId);
										for (var i = 0; i < len; i++) {

											if (data.customerList[i].custId == data.addCustomerId) {
												html += '<option value="' + data.customerList[i].custId + '" selected>'
														+ data.customerList[i].custName
														+ '&nbsp;'
														+ data.customerList[i].phoneNumber
														+ '</option>';
											} else {
												html += '<option value="' + data.customerList[i].custId + '">'
														+ data.customerList[i].custName
														+ '&nbsp;'
														+ data.customerList[i].phoneNumber
														+ '</option>';
											}

										}

										$('#cust').html(html);

										$("#cust").trigger("chosen:updated");
										$('.chosen-select').trigger(
												'chosen:updated');

										document.getElementById("customerName").value = "";
										document.getElementById("mobileNo").value = "";

										document.getElementById("dateOfBirth").value = "";

										document.getElementById("n-option").checked = true;
										document.getElementById("companyName").value = "";
										document.getElementById("gstNo").value = "";
										document.getElementById("custAdd").value = "";
										document.getElementById("custId").value = 0;
										document
												.getElementById("add_cust_head_name").innerHTML = "Add Customer";
										$("#isbuissnessdiv").hide();

										if (custId != 0) {
											alert("Update Successfully");
										} else {
											alert("Customer Add Successfully");
										}
										$('.addcust_close').trigger('click');
									} else {
										alert("Failed To Add Customer");
									}

								});
			}

		}
	</script>
	<script type="text/javascript">
		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines
			return;
		}
		function validateMobile(mobile) {
			var mob = /^[1-9]{1}[0-9]{9}$/;

			if (mob.test($.trim(mobile)) == false) {

				//alert("Please enter a valid email address .");
				return false;

			}
			return true;

		}
		function isBuissness(value) {

			if (value == 1) {
				$("#isbuissnessdiv").show();
			} else {
				$("#isbuissnessdiv").hide();
			}

		}
		function isBuissnessEdit(value) {

			if (value == 1) {
				$("#isbuissnessdivedit").show();
			} else {
				$("#isbuissnessdivedit").hide();
			}

		}
		function modeOfPayDivHideShow(value) {

			if (value == 2) {
				$("#modeOfPayDiv").show();
			} else {
				$("#modeOfPayDiv").hide();
			}

		}
		function changeSplitSingle(value) {

			if (value == 2) {
				$("#splitDiv").show();
				$("#singleDiv").hide();
			} else {
				$("#singleDiv").show();
				$("#splitDiv").hide();
			}

		}
		function clearAddCustomerpopup() {

			document.getElementById("customerName").value = "";
			document.getElementById("mobileNo").value = "";
			document.getElementById("dateOfBirth").value = "";
			document.getElementById("n-option").checked = true;
			document.getElementById("companyName").value = "";
			document.getElementById("gstNo").value = "";
			document.getElementById("custAdd").value = "";
			document.getElementById("custId").value = 0;
			document.getElementById("add_cust_head_name").innerHTML = "Add Customer";
			$("#isbuissnessdiv").hide();
		}

		function getItemList(catId) {
			//alert(catId)
			  
					$(".act_subcat").removeClass('act');
					$("#subcat"+catId).addClass('act');
			var searchBy = 2;
			/* if (document.getElementById('f-option').checked) {
				searchBy = 1;
			} else if (document.getElementById('s-option').checked) {
				searchBy = 2;
			} */
			
			$
					.post(
							'${getItemListByCatSubCatForCustomerBill}',
							{
								searchBy : searchBy,
								catId : catId,
								ajax : 'true'
							},
							function(data) {
								$(".itemDummyClass").remove();
								var frRateCat =  $('#frRateCat').val();
								
								for (var i = 0; i < data.length; i++) { 
									var mrp=0; 
									if(frRateCat==1){
										mrp=data[i].itemMrp1;
									}else if(frRateCat==2){
										mrp=data[i].itemMrp2;
									}else if(frRateCat==3){
										mrp=data[i].itemMrp3;
									}
									var taxper=data[i].itemTax1+data[i].itemTax2;
									var timeDiv = '<div class="sweet_one"><a href="#" title="' + data[i].itemName + '"   onclick="opnItemPopup('+taxper+','+data[i].id+','+mrp+',\''+data[i].itemName+'\')"><p>'
									+ mrp
									+ ' </p> '
									+ data[i].itemName
									+ '<span></span></a></div>';

									/* $("#itemDiv")
											.append(
													$(
															'<li class="itemDummyClass"></li>')
															.html(timeDiv)); */
									$("#itemDiv")
									.append(
											$(
											'<li class="itemDummyClass" alt="' + data[i].itemName + '"   onclick="opnItemPopup('+taxper+','+data[i].id+','+mrp+',\''+data[i].itemName+'\')">'+timeDiv+'</li>'));
								}
								//$('.carlist_scrollbars').ClassyScroll();
								 $(".scrollbar-content").css("top", "0");
								 $(".scrollbar-handle").css("top", "0");
							});
		}

		function getCatListAndSubCatList(value) {

			
			document.getElementById("catSubCatDivHideShow").style.display = "block";

			if (value == 1) {
				//getcatlist();
				$(".itemDummyClass").remove();
			} else if (value == 2) {
				//getsubcatlist();
			} else {
				document.getElementById("catSubCatDivHideShow").style.display = "none";
				
				getAllItemlist();
			}

		}

		function getcatlist() {
			
			$
					.post(
							'${getCategoryListForCustomerBill}',
							{
								ajax : 'true'
							},
							function(data) {
								$(".itemDummyClass").remove();
								$(".catDummyClass").remove();
								for (var i = 0; i < data.mCategoryList.length; i++) {
									 
									var timeDiv = '<a href="#" title="'
											+ data.mCategoryList[i].catName
											+ '" onclick="getsubcatlist('
											+ data.mCategoryList[i].catId
											+ ')"><img src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg"'+
							'alt="laddu"> <span>'
											+ data.mCategoryList[i].catName
											+ '</span></a>';

									$("#catSubCatDiv")
											.append(
													$(
															'<div class="cat_one catDummyClass"></div>')
															.html(timeDiv));
								}
								$('.category_scrollbars').ClassyScroll();
							});

		}
		
		function getsubcatlist(catId) {

			$
					.post(
							'${getSubCategoryListForCustomerBill}',
							{
								catId : catId,
								ajax : 'true'
							},
							function(data) {
								$(".itemDummyClass").remove();
								$(".subCatDummyClass").remove();
								
								var subcatid=0;
								
								for (var i = 0; i < data.length; i++) {
									
									if(i==0){
										subcatid=data[i].subCatId;
									}
									
									var timeDiv = '<a href="#" class="act_subcat" id="subcat'+data[i].subCatId+'"  title="'
										+ data[i].subCatName
										+ '" onclick="getItemList('
										+ data[i].subCatId
										+ ')">'+ data[i].subCatName
										+'</a>';

									$("#subcatUl")
											.append(
													$(
															'<li class="subCatDummyClass "></li>')
															.html(timeDiv));
								}
								
								getItemList(subcatid);
								//$('.category_scrollbars').ClassyScroll();
							});

		}
		function getAllItemlist() {
			
			$
					.post(
							'${getAllItemlistForCustomerBill}',
							{
								ajax : 'true'
							},
							function(data) {
								$(".subCatDummyClass").remove();
								$(".itemDummyClass").remove();
								var frRateCat =  $('#frRateCat').val();
								
								
								
								for (var i = 0; i < data.length; i++) {
									
									var mrp=0;
									
									if(frRateCat==1){
										mrp=data[i].itemMrp1;
									}else if(frRateCat==2){
										mrp=data[i].itemMrp2;
									}else if(frRateCat==3){
										mrp=data[i].itemMrp3;
									}
									 
									var taxper=data[i].itemTax1+data[i].itemTax2;
									var timeDiv = '<div class="sweet_one"><p>'
									+ mrp
									+ ' </p> '
									+ data[i].itemName
									+ '<span></span></div>';

									$("#itemDiv")
											.append(
													$(
													'<li class="itemDummyClass" alt="' + data[i].itemName + '"   onclick="opnItemPopup('+taxper+','+data[i].id+','+mrp+',\''+data[i].itemName+'\')">'+timeDiv+'</li>'));
															 
								}
							//	$('#scrollDiv').removeClass('carlist_scrollbars');
								 //$('.scrollbar-content').animate({ scrollTop: 0 }, "fast");
								 $(".scrollbar-content").css("top", "0");
								 $(".scrollbar-handle").css("top", "0");
								 
								//  document.getElementById("scrollDiv").style.top = "0px";
								//$('#scrollingDiv').load('a.html #scrollingDiv');
								//$('#scrollDiv').addClass('carlist_scrollbars');
								//$('.carlist_scrollbars').ClassyScroll();
							});

		}
	</script>

	<script>
		function myFunction1() {
			
			$(".scrollbar-content").css("top", "0");
			 $(".scrollbar-handle").css("top", "0");
		    $('.itemDummyClass').hide();
		    var txt = $('#myInput1').val();
		    $('.itemDummyClass').each(function(){
		       if($(this).text().toUpperCase().indexOf(txt.toUpperCase()) != -1){
		           $(this).show();
		       }
		    });
		     
		}
	</script>
	<script type="text/javascript">
			$(document).ready(function () {
		 
				 
			    $('#payment').popup({
			        focusdelay: 400,
			        outline: true,
			        vertical: 'top'
			    });
			});
			</script>
	<script type="text/javascript">
			$(document).ready(function () {
			    $('#quantity').popup({
			        focusdelay: 400,
			        outline: true,
			        vertical: 'top'
			    });
			});
			</script>
	<script>
				$(document).ready(function() {
						$('.category_scrollbars').ClassyScroll();
				});
				$(document).ready(function() {
					$('.carlist_scrollbars').ClassyScroll();
			});
				$(document).ready(function() {
					$('.scrollbars').ClassyScroll();
			});
		</script>

	<script>
	
	function calPad(side,value) {
		var qty =  $('#enterQty').val() ;
		var rate =  $('#enterRate').val() ;
		//alert(value);
		 if(side==1){
			 
			 if(qty=="NaN"){
				 qty="";
			 }
			 
			  if(value=="."){
				 qty += value
				 qty = qty.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); 
				 
			 }else if(value==10){
				  
				 if(qty.length!=0){
					 
					 qty  = qty.substring(0, qty.length - 1);
				 }
				  
			 }else{
				 qty += value
			 }
			 document.getElementById("enterQty").value = qty;
			 itemRateCalculation(1);
			 $("#enterQty").focus(); 
			 
		 }else if(side==2){
			 
			  
			 if(rate=="NaN"){ 
				 rate="";
			 } 
			 if(value=="."){ 
				  rate += value
				  rate = rate.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); 
				 
			 }else if(value==10){
				  
				 if(rate.length!=0){
					 
					 rate  = rate.substring(0, rate.length - 1);
				 }
				  
			 }else{
				 rate += value
			 }
			 document.getElementById("enterRate").value = rate;
			 itemRateCalculation(2);
			 $("#enterRate").focus(); 
		 }
		 
		 if(value==11){
			 document.getElementById("enterQty").value = "";
			 document.getElementById("enterRate").value = "";
		 }
		 
	}
	
	$('.numberOnly').on('input', function() {
		 this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
		});
	
		function opnItemPopup(taxper,itemId,mrp,itemName) {
					document.getElementById("enterRate").value = 0;
					document.getElementById("enterQty").value = 0;
			$.post('${editItemQty}',
					{
						itemId: itemId,
						ajax : 'true'
					},
					function(data) {
						document.getElementById("enterQty").value = data.qty;
						document.getElementById("enterRate").value = data.total;

					});
			$('#quantity').popup('show');
			
			document
			.getElementById("itemNmaeHeadeing").innerHTML = itemName;
			
			document.getElementById("rateHidden").value = mrp;
			document.getElementById("taxperHidden").value = taxper;
			document.getElementById("itemNameHidden").value = itemName;
			document.getElementById("itemIdHidden").value = itemId;
			document
			.getElementById("rate_lable").innerHTML = "Rate : "+ mrp; 
			$("#enterQty").focus(); 
			
			
		}
		function itemRateCalculation(flag) {
			
			var rateHidden = parseFloat($('#rateHidden').val());
			var rate = parseFloat($('#enterRate').val());
			var qty = parseFloat($('#enterQty').val());
			 
			 
				if(flag==1){
					var newrate = parseFloat(rateHidden*qty);
					document.getElementById("enterRate").value = newrate;
					 
				}else{
					var newQty = (rate/rateHidden).toFixed(3);
					document.getElementById("enterQty").value = newQty;
				}
			 
		}
		
	function addItemInBillList() {
			 
			var rateHidden = parseFloat($('#rateHidden').val());
			var rate = parseFloat($('#enterRate').val());
			var qty = parseFloat($('#enterQty').val());
			var itemIdHidden =  $('#itemIdHidden').val() ;
			var itemNameHidden =  $('#itemNameHidden').val() ;
			var taxperHidden =  $('#taxperHidden').val() ;
			var flag=0;
			if(isNaN(rate) || rate==0){
				alert("Enter Valid Rate ");
				flag=1;
			}else if(isNaN(qty) || qty==0){
				alert("Enter Valid QTY ");
				flag=1;
			}
			
			 
			if(flag==0){
				 document.getElementById("overlay2").style.display = "block";
				$
				.post(
						'${addItemInBillList}',
						{
							rateHidden : rateHidden,
							rate : rate,
							qty : qty,
							itemIdHidden : itemIdHidden, 
							itemNameHidden : itemNameHidden,
							taxperHidden : taxperHidden,
							ajax : 'true'
						},
						function(data) {
							 document.getElementById("overlay2").style.display = "none";
							$('#quantity').popup('hide');  
							getCurrentItemList();
									 
						});
			}
			
			  
		}
	
	function deleteItemInBillList(index) {
		   
			  $
			.post(
					'${deleteItemInBillList}',
					{
						index : index, 
						ajax : 'true'
					},
					function(data) {
						  
						getCurrentItemList();
								 
					});   
	}
	
	function getCurrentItemList() {
		
		$
		.post(
				'${getCurrentItemList}',
				{ 
					ajax : 'true'
				},
				function(data) {
					 
					$('#quantity').popup('hide'); 
					$('#itemBillTable tr').remove();
					
					var mainTrStr = '<tr>'
					+'<th style="text-align: center;" width="2%">Sr.No</th>'
					+'<th style="text-align: center;">Product</th>'
					+'<th style="text-align: center;" width="10%">QTY</th>'
					+'<th style="text-align: center;" width="13%">Price</th>' 
					+'<th style="text-align: center;" width="13%">Total</th>'
					+'<th style="text-align: center;" width="2%">Delete</th>'
					+'</tr>';
				var mainTr = $(mainTrStr);
				$('#itemBillTable tbody').append(
						mainTr);
				
				
				
					var taxableAmt=0;
					var taxAmt=0;
					var total=0;
					$
					.each(
							data,
							function(key, item) {
								 
								var tr = $('<tr></tr>');
								 
								tr
										.append($(
												'<td ></td>')
												.html(key+1));
								tr
										.append($(
												'<td ></td>')
												.html(
														item.itemName));
								tr
								.append($(
										'<td style="text-align: right;"onclick="opnItemPopup('+item.taxPer+','+item.itemId+','+item.orignalMrp+',\''+item.itemName+'\')"></td>')
										.html(
												(item.qty).toFixed(3))); 
								tr
										.append($(
												'<td style="text-align: right;"></td>')
												.html(
														item.orignalMrp)); 
								tr
										.append($(
												'<td style="text-align: right;"></td>')
												.html(
														(item.total).toFixed(2)));
								tr
								.append($(
										'<td style="text-align: center;"></td>')
										.html('<a href="#" title="Delete" onclick="deleteItemInBillList('+key+')"><i class="fa fa-trash"></i></a>'));
								
								taxableAmt=taxableAmt+item.taxableAmt;
								taxAmt=taxAmt+item.taxAmt;
								total=total+item.total;
								
								$('#itemBillTable tbody').append(
										tr);

							})
							
							document.getElementById("taxableAmtLable").innerHTML = taxableAmt.toFixed(2); 
							document.getElementById("taxAmtLable").innerHTML = taxAmt.toFixed(2); 
							document.getElementById("totalLable").innerHTML = total.toFixed(2); 
							document.getElementById("totalItemLable").innerHTML = data.length; 
							document.getElementById("totalAmtPopup").innerHTML = total.toFixed(2); 
				});
		
	}
	function billOnHold() {
		   
		var key =  $('#key').val() ;
		var custId =  $('#cust').val() ;
		
		var rowcount = $('#itemBillTable tr').length;
		 
	 if(rowcount>1){
		 
		 if(key>0){
			 submitBillOnHold();
		 }else{
			 var modal = document.getElementById("myModal");
			 modal.style.display = "block"; 
			 document.getElementById("holdCustName").focus();
		 }
		  
	 }else{
		 alert("Add Minimum One Product");
	 }
		    
	}
	
	function submitBillOnHold() {
		   
		var key =  $('#key').val() ;
		var custId =  $('#cust').val() ;
		var holdCustName =  $('#holdCustName').val() ;
		 
		if(holdCustName!="" || key>0){
			 
			var modal = document.getElementById("myModal");
			 modal.style.display = "none";
			  $.post(
					'${billOnHold}',
					{
						key : key, 
						custId : custId,
						holdCustName : holdCustName,
						ajax : 'true'
					},
					function(data) {
						
						window.location = "${pageContext.request.contextPath}/newcustomerbill/0";
								 
					});  
		}else{
			alert("Enter Customer Name");
			document.getElementById("holdCustName").focus();
		}
		  
		    
	}
	
	function revertHoldBillOnCurrent() {
		   
		var index =  $('#holdBillNo').val() ;
		  $
		.post(
				'${revertHoldBillOnCurrent}',
				{
					key : index,  
					ajax : 'true'
				},
				function(data) {
					  
					window.location = "${pageContext.request.contextPath}/newcustomerbill/1";
							 
				});   
	}
	
	function cancelFromHoldBill(index) {
		   
		 
		  $
		.post(
				'${cancelFromHoldBill}',
				{
					key : index,  
					ajax : 'true'
				},
				function(data) {
					  
					window.location = "${pageContext.request.contextPath}/newcustomerbill/0";
							 
				});   
	}	
	function imgError(image) {
	    image.onerror = "";
	    image.src = "${pageContext.request.contextPath}/resources/newpos/images/noimage.jpeg";
	    return true;
	}
	</script>
	<script type="text/javascript">
	
	function submitBill(printbilltype) {
		   
		var key =  $('#key').val() ;
		var custId =  $('#cust').val() ;
		var selectedText = $("#cust option:selected").text(); 
		//alert(selectedText);
		var frtype =  $('#frtype').val() ;
		var rowcount = $('#itemBillTable tr').length;
		var flag = 0;
		   
		 if(rowcount<=1){
			 alert("Select Minimum Product");
			 flag=1;
		 }else if(custId==0){
			 flag=1;
			 alert("Select Customer");
		 }
		 
		 if(flag==0){
		 document.getElementById("overlay2").style.display = "block";
		   $
			.post(
					'${submitBill}',
					{
						key : key,  
						custId : custId,
						selectedText : selectedText,
						ajax : 'true'
					},
					function(data) {
						  
						
							if(key==0){
								
								if(printbilltype==1){
									
									 window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
									 
								}else if(printbilltype==2){
									 
									if(frtype<=10000000){
										window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
									}else{
										window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
									}
								}
								
								 	var defaultCustomer =  $('#defaultCustomer').val() ;
								 	//alert(defaultCustomer)
								 	document.getElementById("cust").value = defaultCustomer;
									getCurrentItemList(); 
									$('.chosen-select').trigger(
									'chosen:updated');
									document.getElementById("overlay2").style.display = "none";	 
							 }else{
								 if(printbilltype==1){
										
									 window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
									 
								}else if(printbilltype==2){
									 
									if(frtype<=10000000){
										window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
									}else{
										window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
									}
								}
								 window.location = "${pageContext.request.contextPath}/newcustomerbill/0";
							 }
						 
						 
						
					});    
		 }
		  
	}
	
	function openPaymentPopup() {
		   
		var key =  $('#key').val() ;
		var custId =  $('#cust').val() ;
		 
		//alert(selectedText);
		
		var rowcount = $('#itemBillTable tr').length;
		var flag = 0;
		  
		 if(rowcount<=1){
			 alert("Select Minimum Product");
			 flag=1;
		 }else if(custId==0){
			 flag=1;
			 alert("Select Customer");
		 }
		 
		 if(flag==0){
			 $('#payment').popup('show');
		 }
		  
	}
	
	function submitBillByPaymentOption(printbilltype) {
		   
		var key =  $('#key').val() ;
		var custId =  $('#cust').val() ;
		var cashAmt =  $('#cashAmt').val() ;
		var cardAmt =  $('#cardAmt').val() ;
		var epayAmt =  $('#epayAmt').val() ;
		var billType =  $('#billType').val() ;
		var payAmt =  $('#payAmt').val() ;
		var frtype =  $('#frtype').val() ;
		
		var creditBill = 1;
		var single = 1;
		var selectedText = $("#cust option:selected").text(); 
		var flag=0;
		
		if (document.getElementById('creditBillno').checked) {
			creditBill = 2;
		}
		if (document.getElementById('split').checked) {
			single = 2;
		}
		
		if (cashAmt=="") {
			cashAmt=0;
		}
		if (cardAmt=="") {
			cardAmt=0;
		}
		if (epayAmt=="") {
			epayAmt=0;
		}
		
		if(creditBill==2 && single==1 && payAmt==""){
			alert("Enter Ammount");
		}else{
			 $('#payment').popup('hide');
			  document.getElementById("overlay2").style.display = "block";
			   $
				.post(
						'${submitBillByPaymentOption}',
						{
							key : key,  
							custId : custId,
							creditBill : creditBill,
							paymentMode : single,
							billType : billType,
							cashAmt : cashAmt,
							cardAmt : cardAmt,
							epayAmt : epayAmt,
							selectedText : selectedText,
							payAmt : payAmt,
							ajax : 'true'
						},
						function(data) {
							  
							 if(key==0){
								 if(printbilltype==1){
										
									 window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
									 
								}else if(printbilltype==2){
									 
									if(frtype<=10000000){
										window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
									}else{
										window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
									}
								}
								 var defaultCustomer =  $('#defaultCustomer').val() ;
									document.getElementById("cust").value = defaultCustomer;
									getCurrentItemList(); 
									$('.chosen-select').trigger(
									'chosen:updated');
									document.getElementById("overlay2").style.display = "none";	
									
									 
									 document.getElementById('creditBillno').checked = true;
									 document.getElementById('single').checked = true;
									 document.getElementById("cashAmt").value = 0; 
									 document.getElementById("cardAmt").value = 0; 
									 document.getElementById("epayAmt").value = 0; 
									 document.getElementById("payAmt").value = 0; 
									 $("#splitDiv").hide();
									 $("#singleDiv").show();
							 }else{
								 if(printbilltype==1){
										
									 window.open('${pageContext.request.contextPath}/printKotBill/'+data.message,'_blank');
									 
								}else if(printbilltype==2){
									 
									if(frtype<=10000000){
										window.open('${pageContext.request.contextPath}/printBillOfSupply/'+data.message,'_blank');
									}else{
										window.open('${pageContext.request.contextPath}/printBillOfInvoice/'+data.message,'_blank');
									}
								}
								 window.location = "${pageContext.request.contextPath}/newcustomerbill/0";
							 }
							
						});   
		} 
	}
	/* function printDiv(divName) {
	     var printContents = document.getElementById(divName).innerHTML;
	     var originalContents = document.body.innerHTML;

	     document.body.innerHTML = printContents;

	     window.print();

	     document.body.innerHTML = originalContents;
	} */
</script>
	<script>
// Get the modal
var modal = document.getElementById("myModal");  
var span = document.getElementsByClassName("close")[0]; 
span.onclick = function() {
  modal.style.display = "none";
} 
</script>
</body>

</html>