<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<body>
	<form action="" method="get">

		<!--wrapper-start-->
		<div class="wrapper">

			<header>
				<div class="logo">
					<img
						src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg"
						alt="madhvi_logo">
				</div>
				<div class="drop_menu">
					<div class="dropdown">
						<div class="select">
							<span>Hold Bill</span>
						</div>
						<input type="hidden" name="gender">
						<ul class="dropdown-menu">
							<li id="male">Bill No. 1</li>
							<li id="female">Bill No. 1</li>
						</ul>
					</div>
				</div>
				<div class="clr"></div>
			</header>

			<section class="main_container">
				<div class="cat_l">
					<!--top-buttons row-->
					<div class="pending_row">
						<a href="#" class="pending_btn initialism slide_open">Pending
							Amt : <span>550.00000</span>
						</a> <a href="#" class="pending_btn initialism  ">Advance Amt : <span>550.00000</span>
						</a> <a href="#" class="pending_btn">Total Amt : <span>550.00000</span></a>
					</div>

					<!--customer drop down here-->
					<div class="add_customer_bx">
						<!--customer row 1-->
						<div class="customer_row">
							<div class="customer_one">Customer</div>
							<div class="customer_two">
								<select name="cust" id="cust" data-placeholder="Select Customer"
									class="input_add chosen-select" style="text-align: left;"
									required>
									<option value="0" style="text-align: left;">Select
										Customer</option>
									<c:forEach items="${customerList}" var="customerList">
										<option value="${customerList.custId}"
											style="text-align: left;">${customerList.custName}
											&nbsp;${customerList.phoneNumber}</option>
									</c:forEach>
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
							type="hidden">
						<!--customer row 2-->
						<div class="customer_row">
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
						</div>
					</div>

					<!--product table-->
					<div class="total_table_one">
						<div class="scrollbars">
							<table>

								<thead>
									<tr>
										<th style="text-align: center;" width="2%">Sr.No</th>
										<th style="text-align: center;">Product</th>
										<th style="text-align: center;" width="13%">Price</th>
										<th style="text-align: center;" width="10%">QTY</th>
										<th style="text-align: center;" width="13%">Total</th>
										<th style="text-align: center;" width="2%">Delete</th>
									</tr>
								</thead>
								<tbody>
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
						<table width="100%">
							<tr bgcolor="#ffe5e6">
								<td>Total Items</td>
								<td>1 (3.00)</td>
								<td>Total :</td>
								<td align="right">45.00</td>
							</tr>
							<tr bgcolor="#ffe5e6" style="border-top: 1px solid #f4f4f4;">
								<td>Discount</td>
								<td>(0.00) 0.00</td>
								<td>Order Tax</td>
								<td align="right">2.25</td>
							</tr>
							<tr bgcolor="#fefcd5" style="border-top: 1px solid #f4f4f4;">
								<td style="font-weight: 600;">Total Payable</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td style="font-weight: 600;" align="right">47.25</td>
							</tr>
						</table>
					</div>


					<!--five button here-->
					<div class="buttons_row">
						<div class="button_one">
							<a href="#" class="hold hold_btn">Hold</a> <a href="#"
								class="hold can_btn">Cancel</a>
						</div>
						<div class="button_one">
							<a href="#" class="hold print_btn">Print Order</a> <a href="#"
								class="hold bill_btn">Print Bill</a>
						</div>
						<div class="button_two">
							<a href="#" class="hold pay_btn initialism payment_open">Payment</a>
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
								<li><input type="radio" id="s-option" name="serachBy"
									onclick="getCatListAndSubCatList(2)"> <label
									for="s-option">Sub Category </label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
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
											<a href="#" onclick="getItemList(${catList.catId})"><img
												title="${catList.catName}"
												src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg"
												alt="laddu"> <span>${catList.catName}</span></a>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</div>
					<!--listing box start here-->
					<div class="cat_list_bx">
						<div class="cat_srach">
							<input name="myInput1" id="myInput1" type="text"
								class="input_cat" onkeyup="myFunction1()"
								placeholder="Search Item" />
						</div>
						<div class="cat_list">
							<div class="carlist_scrollbars" id="itemDiv"></div>
							<%-- <div class="cat_one cat itemDummyClass">
								<a href="#"><img
									src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg"
									alt="laddu">
									<p>210</p> <span>Order Booking</span></a>
							</div> --%>

						</div>
					</div>
				</div>
			</section>

		</div>

		<!--Add Customer-->
		<div id="addcust" class="add_customer">
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
		<div id="slide" class="pending_pop">
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
		<div id="payment" class="add_customer">
			<button class="payment_close close_popup">
				<i class="fa fa-times" aria-hidden="true"></i>
			</button>
			<h3 class="pop_head">Payment</h3>

			<div class="add_frm">
				<div class="add_frm_one">
					<div class="add_customer_one">Mode of Pay</div>
					<div class="add_input">
						<div class="radio_row popup_radio">
							<ul>
								<li><input type="radio" id="z-option" name="selector">
									<label for="z-option">Single</label>
									<div class="check"></div></li>
								<li><input type="radio" id="x-option" name="selector">
									<label for="x-option">Split </label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>

				<div class="add_frm_one">
					<div class="add_customer_one">Quantity</div>
					<div class="add_input">
						<input name="" type="text" class="input_add" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Type</div>
					<div class="add_input">

						<div class="dropdown popup_drop">
							<div class="select">
								<span>Payment Mode</span>
							</div>
							<input type="hidden" name="gender">
							<ul class="dropdown-menu">
								<li id="male">Case</li>
								<li id="female">Card</li>
								<li id="female">E-pay</li>
							</ul>
						</div>

					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Amount</div>
					<div class="add_input">
						<input name="" type="text" class="input_add" />
					</div>
					<div class="clr"></div>
				</div>

				<div class="add_frm_one">
					<div class="add_customer_one">Credit Bill</div>
					<div class="add_input">
						<div class="radio_row popup_radio">
							<ul>
								<li><input type="radio" id="yes" name="selector"> <label
									for="yes">Yes</label>
									<div class="check"></div></li>
								<li><input type="radio" id="no" name="selector"> <label
									for="no">No </label>
									<div class="check">
										<div class="inside"></div>
									</div></li>
							</ul>
						</div>
					</div>
					<div class="clr"></div>
				</div>

			</div>
			<div class="pop_btns">
				<div class="close_l">
					<button class="payment_close close_btn">Close</button>
				</div>
				<div class="close_r">
					<a href="#">Submit</a>
				</div>
				<div class="clr"></div>
			</div>

			<!--<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>-->
		</div>
		<div id="quantity" class="category_popup">
			<h3 class="pop_head" id="itemNmaeHeadeing">Quantity</h3>

			<div class="add_frm">

				<div class="add_row">
					<div class="add_row_l">
						<span class="add_txt">Enter QTY</span> <input name="enterQty"
							id="enterQty" type="text" value="1" class="input_add numberOnly"
							placeholder="QTY" onkeyup="itemRateCalculation(1)" />
					</div>
					<input name="rateHidden" id="rateHidden" type="hidden" /><input
						name="itemIdHidden" id="itemIdHidden" type="hidden" />
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

			<!--<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>-->
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

				$
						.post(
								'${editCustomerFromBill}',
								{
									custId : custId,
									ajax : 'true'
								},
								function(data) {
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
			var searchBy = 0;
			if (document.getElementById('f-option').checked) {
				searchBy = 1;
			} else if (document.getElementById('s-option').checked) {
				searchBy = 2;
			}
			
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
									
									var timeDiv = '<a href="#" title="' + data[i].itemName + '" onclick="opnItemPopup('+data[i].id+','+mrp+',\''+data[i].itemName+'\')"><img src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg" alt="laddu">'
											+ ' <p>'
											+ data[i].itemMrp1
											+ ' </p> <span>'
											+ data[i].itemName
											+ '</span></a>';

									$("#itemDiv")
											.append(
													$(
															'<div class="cat_one itemDummyClass"></li>')
															.html(timeDiv));
								}
								$('.carlist_scrollbars').ClassyScroll();
							});
		}

		function getCatListAndSubCatList(value) {

			
			document.getElementById("catSubCatDivHideShow").style.display = "block";

			if (value == 1) {
				getcatlist();
			} else if (value == 2) {
				getsubcatlist();
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
											+ '" onclick="getItemList('
											+ data.mCategoryList[i].catId
											+ ')"><img src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg"'+
							'alt="laddu"> <span>'
											+ data.mCategoryList[i].catName
											+ '</span></a>';

									$("#catSubCatDiv")
											.append(
													$(
															'<div class="cat_one catDummyClass"></li>')
															.html(timeDiv));
								}
								$('.category_scrollbars').ClassyScroll();
							});

		}
		
		function getsubcatlist() {

			$
					.post(
							'${getSubCategoryListForCustomerBill}',
							{
								ajax : 'true'
							},
							function(data) {
								$(".itemDummyClass").remove();
								$(".catDummyClass").remove();
								for (var i = 0; i < data.length; i++) {
									var timeDiv = '<a href="#" title="'
											+ data[i].subCatName
											+ '" onclick="getItemList('
											+ data[i].subCatId
											+ ')"><img src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg"'+
											'alt="laddu"> <span>'
											+ data[i].subCatName
											+ '</span></a>';

									$("#catSubCatDiv")
											.append(
													$(
															'<div class="cat_one catDummyClass"></li>')
															.html(timeDiv));
								}
								$('.category_scrollbars').ClassyScroll();
							});

		}
		function getAllItemlist() {
			$(".itemDummyClass").remove();
			$
					.post(
							'${getAllItemlistForCustomerBill}',
							{
								ajax : 'true'
							},
							function(data) {
								
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
									
									var timeDiv = '<a href="#" title="' + data[i].itemName + '"   onclick="opnItemPopup('+data[i].id+','+mrp+',\''+data[i].itemName+'\')"><img src="${pageContext.request.contextPath}/resources/newpos/images/laddu.jpg" alt="laddu">'
											+ ' <p>'
											+ mrp
											+ ' </p> <span>'
											+ data[i].itemName
											+ '</span></a>';

									$("#itemDiv")
											.append(
													$(
															'<div class="cat_one itemDummyClass"></li>')
															.html(timeDiv));
								}
								$('.carlist_scrollbars').ClassyScroll();
							});

		}
	</script>

	<script>
		function myFunction1() {
			  
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
	$('.numberOnly').on('input', function() {
		 this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
		});
	
		function opnItemPopup(itemId,mrp,itemName) {
			  
			$('#quantity').popup('show');
		    
			document
			.getElementById("itemNmaeHeadeing").innerHTML = itemName;
			document.getElementById("enterRate").value = mrp;
			document.getElementById("enterQty").value = 1;
			document.getElementById("rateHidden").value = mrp;
			document.getElementById("itemIdHidden").value = itemId;
			document
			.getElementById("rate_lable").innerHTML = "Rate : "+ mrp; 
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
			
			$
			.post(
					'${addItemInBillList}',
					{
						rateHidden : rateHidden,
						rate : rate,
						qty : qty,
						itemIdHidden : itemIdHidden, 
						ajax : 'true'
					},
					function(data) {
						 
					});
			  
		}
	</script>
</body>

</html>