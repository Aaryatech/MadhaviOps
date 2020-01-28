<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/newpos/timeassets/css/bootstrap.min.css">
 --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/newpos/dist/bootstrap-clockpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/customerBill/chosen.css">
<style>
#overlay2 {
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(239, 219, 219, 0.5);
	z-index: 2;
	cursor: pointer;
}

.plus-button {
	border: 2px solid lightgrey;
	background-color: #fff;
	font-size: 16px;
	height: 1.8em;
	width: 2.5em;
	border-radius: 999px;
	position: relative;
}

.plus-button:after, .plus-button:before {
	content: "";
	display: block;
	background-color: grey;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.plus-button:before {
	height: 1em;
	width: 0.2em;
}

.plus-button:after {
	height: 0.2em;
	width: 1em;
}

<!--
MODAL CSS   -->.btn {
	background: #428bca;
	border: #357ebd solid 0px;
	border-radius: 3px;
	color: #fff;
	display: inline-block;
	font-size: 14px;
	padding: 8px 15px;
	text-decoration: none;
	text-align: center;
	min-width: 60px;
	position: relative;
	transition: color .1s ease;
}

.btn:hover {
	background: #357ebd;
}

.btn.btn-big {
	font-size: 18px;
	padding: 15px 20px;
	min-width: 100px;
}

.btn-close {
	color: #aaaaaa;
	font-size: 20px;
	text-decoration: none;
	padding: 10px;
	position: absolute;
	right: 7px;
	top: 0;
}

.btn-close:hover {
	color: #919191;
}

.modale:before {
	content: "";
	display: none;
	background: rgba(0, 0, 0, 0.6);
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 10;
}

.opened:before {
	display: block;
}

.opened .modal-dialog {
	-webkit-transform: translate(0, 0);
	-ms-transform: translate(0, 0);
	transform: translate(0, 0);
	top: 20%;
}

.modal-dialog {
	background: #fefefe;
	border: #333333 solid 0px;
	border-radius: 5px;
	margin-left: -200px;
	text-align: center;
	position: fixed;
	left: 50%;
	top: -100%;
	z-index: 11;
	width: 700px;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	-webkit-transform: translate(0, -500%);
	-ms-transform: translate(0, -500%);
	transform: translate(0, -500%);
	-webkit-transition: -webkit-transform 0.9s ease-out;
	-moz-transition: -moz-transform 0.9s ease-out;
	-o-transition: -o-transform 0.9s ease-out;
	transition: transform 0.9s ease-out;
}

.modal-body {
	padding: 20px;
}

.modal-body input {
	width: 200px;
	padding: 8px;
	border: 1px solid #ddd;
	color: #888;
	outline: 0;
	font-size: 14px;
	font-weight: bold
}

.modal-header, .modal-footer {
	padding: 10px 20px;
}

.modal-header {
	border-bottom: #eeeeee solid 1px;
}

.modal-header h2 {
	font-size: 20px;
}

<!--
MODAL CSS END  -->.myInput1 {
	margin-top: 10px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding: 5px 5px 5px 38px;
	width: 100%;
	background-position: 10px 10px;
	background-repeat: no-repeat;
	font-size: 14px;
}

.main-table tbody>tr:hover {
	background-color: #ffa;
}

.alert {
	padding: 15px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

a:link {
	color: black;
}

a:hover {
	color: black;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 25px;
	margin-top: 7px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: -2px;
	left: 0px;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 19px;
	width: 21px;
	left: 5px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .3s;
	transition: .3s;
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
	border-radius: 52px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>

<link
	href="${pageContext.request.contextPath}/resources/css/mdtimepicker.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/js/mdtimepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>    
		$(function() {
			$("#fromdatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#todatepicker").datepicker({
	            
				dateFormat : 'dd-mm-yy'
			});
		});
 
</script>
<body>
	<c:url var="qtyValidation" value="/quantityValidation"></c:url>
	<c:url value="/checkEmailText" var="checkEmailText"></c:url>
	<c:url value="/saveCustomerFromBill" var="saveCustomerFromBill"></c:url>
    <c:url var="editCustomerFromBill" value="/editCustomerFromBill" />

	<div id="overlay2">
		<div id="text2">
			<img
				src="${pageContext.request.contextPath}/resources/newpos/images/loader.gif"
				alt="madhvi_logo">
		</div>
	</div>
	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->


	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->

		<jsp:include page="/WEB-INF/views/include/logo.jsp">
			<jsp:param name="frDetails" value="${frDetails}" />

		</jsp:include>

		<!--topHeader-->

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />

				</jsp:include>

				<br>

				<!--leftNav-->
				<!--rightSidebar-->
				<div class="sidebarright">

					<!-- <div class="colOuter">
						
					</div>
					 -->

					<div class="order-left">
						<h2 class="pageTitle">Advance Order</h2>
						

					</div>




					<div class="row">
						<div class="col-md-3"></div>
						<div class="col-md-1">Dairy mart</div>
						<div class="col-md-2">
							<label class="switch"> <input type="checkbox" name="dm"
								id="dm" onchange="checkAdd() "> <span
								class="slider round"></span>
						</div>
						</label>
					</div>




					<form action="${pageContext.request.contextPath}/saveAdvanceOrder"
						name="form1" id="form1" method="post">

						<input type="hidden" id="menuId" name="menuId" value="${menuIdFc}" />
						<div class="colOuter">


							<div class="col-md-1">
								<div class="col1title">Customer</div>
							</div>
							<div class="col-md-2">
								<select name="custId" class="form-control chosen-select"
									tabindex="4" id="custId1" required>

									<option value="">Select Customer</option>
									<c:forEach items="${custList}" var="custList" varStatus="count">

										<option value="${custList.custId}">
											${custList.custName}-${custList.phoneNumber}</option>
									</c:forEach>

								</select>

							</div>
							<!-- <div class="col-md-1">
								<button class="plus-button openmodale"></button>

							</div> -->
							<div class="col-md-1">
								<button class="plus_btn addcust_open" type="button">
									<i class="fa fa-plus" aria-hidden="true"></i>
								</button>
							
								<button class="plus_btn" type="button" onclick="editCustomer(1)">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</button>
							</div>
							<div class="col-md-2">
								<div class="col1title">Delivery Date</div>
							</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal"
									required placeholder="Delivery Date" name="devDate"
									autocomplete="off" type="text" value="">



							</div>
							<div class="col-md-1">
								<div class="col1title">Time</div>
							</div>
							<div class="col-md-2">
								<div class="clearfix">
									<input type="text" id="delTime1" name="delTime" value=""
										style="text-align: center;" />

									<!-- 									<div class="input-group clockpicker-with-callbacks">
										 <input type="time" class="form-control" value="00:00" required
											name="delTime" id="delTime1" style="line-height: 15px;">
											 <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-time"></span>
										</span>
									</div> -->
								</div>
							</div>
							<!-- <div class="col-md-1">
								<div class="col1title">Dairy mart</div>
							</div>
							<div class="col-md-1">
								<label class="switch"> <input type="checkbox" name="dm"
									id="dm" onchange="checkAdd() "> <span
									class="slider round"></span>
							</div>
							</label> -->

						</div>
						<input type="hidden" name="menuTitle" value="${menuTitle}">

						<!--tabNavigation-->
						<div class="cd-tabs" style="margin-top: 2px;">
							<nav>
								<ul class="cd-tabs-navigation">
									<c:forEach var="tab" items="${subCatListTitle}"
										varStatus="loop">
										<c:choose>
											<c:when test='${loop.index==0}'>
												<li><a data-content='${tab.name}' href="#0"
													class="selected"
													onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>

											</c:when>
											<c:otherwise>
												<li><a data-content='${tab.name}' href="#0"
													onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</nav>
							<ul class="cd-tabs-content">
								<c:forEach var="tabs" items="${subCatListTitle}"
									varStatus="loop">
									<c:choose>
										<c:when test='${loop.index==0}'>
											<li data-content='${tabs.name}' class="selected">
										</c:when>
										<c:otherwise>
											<li data-content='${tabs.name}'>
										</c:otherwise>
									</c:choose>

									<div class="col-md-9"></div>
									<label for="search" class="col-md-3" id="search"> <!--  <i
										class="fa fa-search" style="font-size: 20px;"> --> </i> <input
										class="myInput1" type="text" id="myInput1${loop.index}"
										onkeyup="myFunction1(${loop.index})"
										style="border-radius: 25px;"
										placeholder="Search items by name" title="Type item name">
									</label>




									<!-- new table-html-code  -->
									<!--steaky table-->
									<div id="table-scroll"
										class="table-scroll responsive-table-one">
										<!-- class="table-scroll" -->

										<div id="faux-table" class="faux-table" aria="hidden">
											<!-- style="display:none" -->
											<table id="table_grid" class="main-table">
												<thead>
													<tr class="bgpink">
														<th class="col-md-2">Item</th>
														<th class="col-md-1">Min Qty</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">MRP</th>
														<th class="col-md-1">Rate</th>
														<th class="col-md-1">Total</th>
													</tr>
												</thead>
											</table>

										</div>
										<div class="table-wrap">

											<table id="table_grid1${loop.index}"
												class="responsive-table1" style="margin: 0px;">
												<!--   class="main-table" -->
												<thead>
													<tr class="bgpink">
														<th class="col-md-2">Item</th>
														<th class="col-md-1">Min Qty</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">MRP</th>
														<th class="col-md-1">Rate</th>
														<th class="col-md-1">Total</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="menuTime" value="${menu.timing}" />

													<c:forEach var="items" items="${itemList}" varStatus="loop">
														<c:if test="${items.catName eq tabs.name}">

															<c:choose>
																<c:when test="${frDetails.frRateCat=='1'}">
																	<tr>
																		<td class="col-md-2">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>

																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onkeydown="myFunction()" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChange('${items.itemRate1}','${items.itemMrp1}',${items.id},${frDetails.frKg1})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp1}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate1}' /></td>
																		<c:set var="rate" value="${items.itemRate1}" />
																		<c:set var="mrp" value="${items.itemMrp1}" />
																		<c:set var="qty" value="${items.itemQty}" />
																		<td class="col-md-1-1" id="total1${items.id}"><c:choose>
																				<c:when test="${frDetails.frKg1==1}">
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:when>
																				<c:otherwise>
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:otherwise>
																			</c:choose></td>

																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='2'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChange('${items.itemRate2}','${items.itemMrp2}',${items.id},${frDetails.frKg1})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate2}' /></td>
																		<c:set var="rate" value="${items.itemRate2}" />
																		<c:set var="mrp" value="${items.itemMrp2}" />
																		<c:set var="qty" value="${items.itemQty}" />


																		<td class="col-md-1-1" id="total1${items.id}"><c:choose>
																				<c:when test="${frDetails.frKg1==1}">
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:when>
																				<c:otherwise>
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:otherwise>
																			</c:choose></td>



																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='3'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChange('${items.itemRate3}','${items.itemMrp3}',${items.id},${frDetails.frKg1})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>


																		<td class="col-md-1"><c:out
																				value='${items.itemMrp3}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate3}' /></td>
																		<c:set var="rate" value="${items.itemRate3}" />
																		<c:set var="mrp" value="${items.itemMrp3}" />

																		<c:set var="qty" value="${items.itemQty}" />
																		<td class="col-md-1-1" id="total1${items.id}"><c:choose>
																				<c:when test="${frDetails.frKg1==1}">
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:when>
																				<c:otherwise>
																					<fmt:formatNumber type="number"
																						minFractionDigits="2" maxFractionDigits="2"
																						value="${mrp * qty}" />
																				</c:otherwise>
																			</c:choose></td>

																	</tr>
																</c:when>
															</c:choose>

														</c:if>
													</c:forEach>

												</tbody>

											</table>


										</div>
									</div>












								</c:forEach>


							</ul>


							<div class="row">

								<div class="col-md-2">Advance Amt:</div>

								<div class="col-md-1">

									<input type="text" name="advanceAmt" id="advanceAmt1"
										onkeypress="return event.charCode >= 48" onchange="setAmt(1)"
										oninput="setAmt(1)" class="texboxitemcode texboxcal2"
										value="0" autocomplete="off" class="form-control" size="20"
										required="required" />
								</div>

								<div class="col-md-2">Pending Amt:</div>
								<div class="col-md-1">

									<input type="text" name="remainAmt" id="remainAmt1" value="0"
										class="texboxitemcode texboxcal2" autocomplete="off" required
										class="form-control" size="20" readonly
										style="background-color: lightgrey;" />
								</div>


								<div class="col-md-1">Total:</div>
								<div class="col-md-1" id="calTotal1" style=" font-size:25px;color: red;text-shadow: 1px 1px 2px black, 0 0 25px yellow, 0 0 5px yellow;">00
								</div>


							</div>
							<input type="hidden" id="fintotal1" name="fintotal1" value="0">
							<div class="order-btn textright">

								<c:if test="${dispButton==0}">
									<input name="subm1" id="subm1" class="buttonsaveorder"
										value="SAVE ORDER" type="button">
								</c:if>
							</div>
						</div>
						<input type="hidden" name="dailyFlagMart" id="dailyFlagMart1"
							value="1">
					</form>
					<!-------------------------------------TABS FOR DAIRY MART----------------------------------------------------------->


					<form action="${pageContext.request.contextPath}/saveAdvanceOrder"
						id="form2" name="form2" method="post" style="display: none;">

						<input type="hidden" id="menuId" name="menuId" value="${menuIdFc}" />



						<div class="colOuter">


							<div class="col-md-1">
								<div class="col1title">Customer</div>
							</div>
							<div class="col-md-2">
								<select name="custId" class="form-control chosen-select"
									tabindex="4" id="custId2" required>
									<option value="">Select Customer</option>

									<c:forEach items="${custList}" var="custList" varStatus="count">

										<option value="${custList.custId}">
											${custList.custName}-${custList.phoneNumber}</option>
									</c:forEach>

								</select>

							</div>
							<!-- <div class="col-md-1">
								<button class="plus-button openmodale"></button>

							</div>
							 -->
							<div class="col-md-1">
								<button class="plus_btn addcust_open" type="button">
									<i class="fa fa-plus" aria-hidden="true"></i>
								</button>
							
								<button class="plus_btn" type="button" onclick="editCustomer(2)">
									<i class="fa fa-pencil" aria-hidden="true"></i>
								</button>
							</div>
							<div class="col-md-2">
								<div class="col1title">Delivery Date</div>
							</div>
							<div class="col-md-2">
								<input id="todatepicker" class="texboxitemcode texboxcal"
									required="required" placeholder="Delivery Date" name="devDate"
									autocomplete="off" type="text" value="">`

							</div>
							<div class="col-md-1">
								<div class="col1title">Time</div>
							</div>
							<div class="col-md-2">
								<div class="clearfix">

									<input type="text" id="delTime2" name="delTime" value=""
										style="text-align: center;" />

									<!-- 									<div class="input-group clockpicker-with-callbacks">
										<input type="time" class="form-control" value="00:00" required
											name="delTime" id="delTime2" style="line-height: 15px;">
											 <span
											class="input-group-addon"> <span
											class="glyphicon glyphicon-time"></span>
										</span>
									</div> -->
								</div>
							</div>


							<!-- <div class="col-md-1">
								<div class="col1title">Dairy mart</div>
							</div>
							<div class="col-md-1">
								<label class="switch"> <input type="checkbox" name="dm"
									id="dm" onchange="checkAdd() "> <span
									class="slider round"></span>
							</div>
							</label>
 -->
						</div>
						<input type="hidden" name="menuTitle" value="${menuTitle}">
						<div class="cd-tabs" style="margin-top: 2px;">
							<nav>
								<ul class="cd-tabs-navigation">
									<c:forEach var="tab" items="${subCatListTitle}"
										varStatus="loop">
										<c:choose>
											<c:when test='${loop.index==0}'>
												<li><a data-content='${tab.name}' href="#0"
													class="selected"
													onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>
											</c:when>
											<c:otherwise>
												<li><a data-content='${tab.name}' href="#0"
													onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</nav>
							<ul class="cd-tabs-content">
								<c:forEach var="tabs" items="${subCatListTitle}"
									varStatus="loop">
									<c:choose>
										<c:when test='${loop.index==0}'>
											<li data-content='${tabs.name}' class="selected">
										</c:when>
										<c:otherwise>
											<li data-content='${tabs.name}'>
										</c:otherwise>
									</c:choose>

									<div class="col-md-9"></div>
									<label for="search" class="col-md-3" id="search"> <!-- <i
										class="fa fa-search" style="font-size: 20px"></i> --> <input
										class="myInput1" type="text" id="myInput2${loop.index}"
										onkeyup="myFunction2(${loop.index})"
										style="border-radius: 25px;"
										placeholder="Search items by name" title="Type item name">
									</label>

									<div id="table-scroll"
										class="table-scroll responsive-table-one">
										<!-- class="table-scroll" -->

										<div id="faux-table" class="faux-table" aria="hidden">
											<!-- style="display:none" -->
											<table id="table_grid" class="main-table">
												<thead>
													<tr class="bgpink">
														<th class="col-md-2">Item</th>
														<th class="col-md-1">Min Qty</th>
														<th class="col-md-1">Min Limit</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">MRP</th>
														<th class="col-md-1">Rate</th>
														<th class="col-md-1">Disc %</th>
														<th class="col-md-1">Total</th>
													</tr>
												</thead>
											</table>

										</div>
										<div class="table-wrap">

											<table id="table_grid2${loop.index}"
												class="responsive-table2" style="margin: 0px;">
												<!--   class="main-table" -->
												<thead>
													<tr class="bgpink">
														<th class="col-md-2">Item</th>
														<th class="col-md-1">Min Qty</th>
														<th class="col-md-1">Min Limit</th>
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">MRP</th>
														<th class="col-md-1">Rate</th>
														<th class="col-md-1">Disc %</th>
														<th class="col-md-1">Total</th>
													</tr>
												</thead>
												<tbody>
													<c:set var="menuTime" value="${menu.timing}" />

													<c:forEach var="items" items="${itemList}" varStatus="loop">
														<c:if test="${items.catName eq tabs.name}">

															<c:choose>
																<c:when test="${frDetails.frRateCat=='1'}">
																	<tr>
																		<td class="col-md-2">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>

																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /> <input type="hidden"
																			value="${items.itemMrp2}" id="limit2${items.id}" /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onkeydown="myFunction()" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChangeDm('${items.itemMrp1}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp1}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate1}' /></td>
																		<c:set var="rate" value="${items.itemMrp1}" />
																		<c:set var="qty" value="${items.itemQty}" />

																		<td class="col-md-1"><c:out
																				value='${items.dmDiscPer}' /><input type="hidden"
																			value="${items.dmDiscPer}" id="dmDisc2${items.id}" /></td>

																		<!-- 	total -->
																		<td class="col-md-1-2" id="total2${items.id}"><fmt:formatNumber
																				type="number" minFractionDigits="2"
																				maxFractionDigits="2" value="${rate * qty}" /></td>

																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='2'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /><input type="hidden"
																			value="${items.itemMrp2}" id="limit2${items.id}" /></td>



																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChangeDm('${items.itemMrp2}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate2}' /></td>
																		<c:set var="rate" value="${items.itemMrp2}" />
																		<c:set var="qty" value="${items.itemQty}" />

																		<td class="col-md-1"><c:out
																				value='${items.dmDiscPer}' /><input type="hidden"
																			value="${items.dmDiscPer}" id="dmDisc2${items.id}" /></td>


																		<td class="col-md-1-2" id="total2${items.id}"><fmt:formatNumber
																				type="number" minFractionDigits="2"
																				maxFractionDigits="2" value="${rate * qty}" /></td>



																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='3'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /><input type="hidden"
																			value="${items.itemMrp2}" id="limit2${items.id}" /></td>



																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text" min="0" step="1"
																			onkeypress="return event.charCode >= 48"
																			onchange="onChangeDm('${items.itemMrp3}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>


																		<td class="col-md-1"><c:out
																				value='${items.itemMrp3}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate3}' /></td>
																		<c:set var="rate" value="${items.itemMrp3}" />
																		<c:set var="qty" value="${items.itemQty}" />
																		<td class="col-md-1"><c:out
																				value='${items.dmDiscPer}' /><input type="hidden"
																			value="${items.dmDiscPer}" id="dmDisc2${items.id}" /></td>
																		<td class="col-md-1-2" id="total2${items.id}"><fmt:formatNumber
																				type="number" minFractionDigits="2"
																				maxFractionDigits="2" value="${rate * qty}" /></td>

																	</tr>
																</c:when>
															</c:choose>

														</c:if>
													</c:forEach>

												</tbody>

											</table>


										</div>
									</div>


								</c:forEach>


							</ul>


							<div class="row">

								<div class="col-md-2">Advance Amt:</div>

								<div class="col-md-1">

									<input type="text" name="advanceAmt" id="advanceAmt2"
										onkeypress="return event.charCode >= 48" onchange="setAmt(2)"
										oninput="setAmt(2)" class="texboxitemcode texboxcal2"
										autocomplete="off" required class="form-control" size="20"
										value="0" />
								</div>

								<div class="col-md-2">Pending Amt:</div>
								<div class="col-md-1">

									<input type="text" name="remainAmt" id="remainAmt2"
										class="texboxitemcode texboxcal2" autocomplete="off" required
										value="0" class="form-control" size="20" readonly
										style="background-color: lightgrey;" />
								</div>


								<div class="col-md-1">Total:</div>
								<div class="col-md-1"  id="calTotal2" style=" font-size:25px; color: red;text-shadow: 1px 1px 2px black, 0 0 25px yellow, 0 0 5px yellow;">00
								</div>


							</div>
							<input type="hidden" name="fintotal1" id="fintotal2" value="0">

							<input type="hidden" name="dailyFlagMart" id="dailyFlagMart2"
								value="2">
							<div class="order-btn textright">

								<c:if test="${dispButton==0}">
									<input name="subm2" id="subm2" class="buttonsaveorder"
									value="SAVE ORDER" type="button">
								</c:if>
								
							</div>
						</div>





					</form>

				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
	</div>
	<!--rightContainer-->

	<!--  MODAL DIV  -->


	<!--  To submit Order-->
	<div id="addcust" class="add_customer" style="display: none;">
		<button class="addcust_close close_popup" id="addcust_close"
			onclick="clearAddCustomerpopup()">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
		<h3 class="pop_head" id="add_cust_head_name">Add Customer</h3>

		<div class="add_frm">
			<div class="add_frm_one">
				<div class="add_customer_one">Customer Name *</div>
				<div class="add_input">
					<input type="text" class="input_add"
						placeholder="Enter Customer Name" name="customerName"
						onchange="trim(this)" id="customerName" /> <input type="hidden"
						name="custId" id="custId" value="0" />
				</div>
				<div class="clr"></div>
			</div>
			<div class="add_frm_one">
					<div class="add_customer_one">Address *</div>
					<div class="add_input">
						<input placeholder="Enter Address" name="custAdd" id="custAdd"
							onchange="trim(this)" type="text" class="input_add" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">Distance(In Kms) *</div>
					<div class="add_input">
						<input placeholder="Enter distance in kms" name="kms" id="kms"
							onchange="trim(this)" type="text" class="input_add" />
					</div>
					<div class="clr"></div>
				</div>
			<div class="add_frm_one">
				<div class="add_customer_one">Mobile Number *</div>
				<div class="add_input">

					<input type="text" class="input_add"
						placeholder="Enter Mobile Number" name="mobileNo" id="mobileNo"
						onchange="trim(this)" maxlength="10"
						oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" />
				</div>
				<div class="clr"></div>
			</div>

			<div class="add_frm_one">
				<div class="add_customer_one">Gender *</div>
				<div class="add_input">
					<div class="radio_row popup_radio">
						<ul>
							<li><input type="radio" type="radio" name="gender"
								id="moption" checked value="1"> <label for="moption">M</label>
								<div class="check"></div></li>
							<li><input type="radio" id="foption" name="gender" value="2">
								<label for="foption">F </label>
								<div class="check">
									<div class="inside"></div>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="clr"></div>
			</div>
			<div class="add_frm_one" style="display: none;">
				<div class="add_customer_one">Type</div>
				<div class="add_input">
					<select name="custType" id="custType"
						data-placeholder="Customer Type" class="input_add"
						style="text-align: left;" required>
						<option value="0" style="text-align: left;">Select
							Customer Type</option>
						<option value="1">Owner</option>
						<option value="2">Employee</option>
						<option value="3" selected="selected">Customer</option>
					</select>
				</div>
			</div>
			<div class="add_frm_one">
				<div class="add_customer_one">Age-Group *</div>
				<div class="add_input">
					<select name="ageRange" id="ageRange"
						data-placeholder="Customer Age-Group" class="input_add"
						style="text-align: left;" required>
						<option value="0" style="text-align: left;">Customer
							Age-Group</option>
						<option value="14-21">14-21 Years</option>
						<option value="22-28">22-28 Years</option>
						<option value="29-35">29-35 Years</option>
						<option value="36-42">36-42 Years</option>
						<option value="43-49">43-49 Years</option>
						<option value="50-56">50-56 Years</option>
						<option value="57 & above">57 & above</option>

					</select>
				</div>
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
				<div class="add_customer_one">Business *</div>
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
					<div class="add_customer_one">Company Name *</div>
					<div class="add_input">
						<input placeholder="Enter Company Name" name="companyName"
							onchange="trim(this)" id="companyName" type="text"
							class="input_add" />
					</div>
					<div class="clr"></div>
				</div>
				<div class="add_frm_one">
					<div class="add_customer_one">GST Number *</div>
					<div class="add_input">
						<input placeholder="Enter GST Name" name="gstNo" id="gstNo"
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
				<a href="#" onclick="addCustomer()" id="saveCust">Save</a>
			</div>
			<div class="clr"></div>
		</div>


	</div>

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

	<!-- Modal to show cust creadit Bill end -->
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/chosen.jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/customerBill/init.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "100%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
		function openNav1() {
			document.getElementById("mySidenav1").style.width = "100%";
		}

		function closeNav1() {
			document.getElementById("mySidenav1").style.width = "0";
		}
		function openNav3() {
			document.getElementById("mySidenav3").style.width = "100%";
		}

		function closeNav3() {
			document.getElementById("mySidenav3").style.width = "0";
		}
	</script>


	<script type="text/javascript">

function isBuissness(value) {

	if (value == 1) {
		$("#isbuissnessdiv").show();
	} else {
		$("#isbuissnessdiv").hide();
	}

}

function checkGST(g){
    let regTest = /\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}/.test(g)
     if(regTest){
        let a=65,b=55,c=36;
        return Array['from'](g).reduce((i,j,k,g)=>{ 
           p=(p=(j.charCodeAt(0)<a?parseInt(j):j.charCodeAt(0)-b)*(k%2+1))>c?1+(p-c):p;
           return k<14?i+p:j==((c=(c-(i%c)))<10?c:String.fromCharCode(c+b));
        },0); 
    }
    return regTest
}


function addCustomer() {
	
	document.getElementById("saveCust").style.display="none";
	
	//$('#addcust').modal('hide');
	//$('#addcust').popup('hide'); //for close popup;
	var custId = document.getElementById("custId").value;
	var customerName = document.getElementById("customerName").value;
	var mobileNo = document.getElementById("mobileNo").value;
	var  kms= document.getElementById("kms").value;
	var dateOfBirth = document.getElementById("dateOfBirth").value;
	var custType = document.getElementById("custType").value;
	custType=3;
	var ageRange = document.getElementById("ageRange").value;
	
	$.getJSON('${checkEmailText}', {
		phoneNo : mobileNo,	
			ajax : 'true',
	},

	function(saveFlag) {
		document.getElementById("saveCust").style.display="block";
		 if(parseInt(saveFlag)>0 && parseInt(saveFlag)!=custId){		
			 
			 document.getElementById("saveCust").style.display="block";
			 
			   alert("Duplicate Mobile No Found.");
				//document.getElementById("sbtbtn4").disabled = true;
				document.getElementById("mobileNo").value = "";
				document.getElementById("mobileNo").focus();
		}else{
	var gender = 2;
	if (document.getElementById('moption').checked) {
		gender = 1;
	}
	
	//var isBuissness = document.getElementById("isBuissness").value;
	var buisness = 0;
	if (document.getElementById('y-option').checked) {
		buisness = 1;
	}
	var companyName = document.getElementById("companyName").value;
	var gstNo = document.getElementById("gstNo").value;
	var custAdd = document.getElementById("custAdd").value;

	var flag = 0;
//alert(gstNo);
	if (customerName == "") {
		alert("Please Enter Customer Name");
		flag = 1;
	}else if (custAdd == "") {
		alert("Please Enter Address");
		flag = 1;
	}else if (kms == "" || isNaN(kms)) {
		alert("Please Enter valid Distance");
		flag = 1;
	}
	else if (mobileNo == "" || !validateMobile(mobileNo)) {
		alert("Please Enter Valid Mobile No");
		flag = 1;
	}
	/* else if (dateOfBirth == "") {
		alert("Enter Date of Birth");
		flag = 1;
	} */
	/* else if (custType == 0) {
		alert("Please Select Customer Type");
		flag = 1;
	} */
	else if (ageRange == 0) {
		alert("Please Select Age Group");
		flag = 1;
	} else if (buisness == 1) {

		if (companyName == "") {
			alert("Please Enter Company Name");
			flag = 1;
		} else if (gstNo == "") {
			alert("Please Enter GST No");
			flag = 1;
		}else if(checkGST(gstNo)==false){
			alert("Invalid GST No");
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
							custType:custType,
							ageRange:ageRange,
							kms:kms,
							gender:gender,
							ajax : 'true'
						},
						function(data) {

							document.getElementById("saveCust").style.display="block";

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

								$('#custId1').html(html);
								$('#custId2').html(html);

								$("#custId1").trigger("chosen:updated");
								$("#custId2").trigger("chosen:updated");
								$('.chosen-select').trigger(
										'chosen:updated');

								document.getElementById("customerName").value = "";
								document.getElementById("mobileNo").value = "";
								document.getElementById("kms").value = "";
								document.getElementById("dateOfBirth").value = "";

								document.getElementById("n-option").checked = true;
								document.getElementById("companyName").value = "";
								document.getElementById("gstNo").value = "";
								document.getElementById("custAdd").value = "";
								document.getElementById("custId").value = 0;
								document.getElementById("moption").checked = true;
								document.getElementById("custType").value ="0";
								$("#custType").trigger("chosen:updated");
								document.getElementById("ageRange").value ="0";
								$("#ageRange").trigger("chosen:updated");
								$('.chosen-select').trigger('chosen:updated');
								document
										.getElementById("add_cust_head_name").innerHTML = "Add Customer";
								$("#isbuissnessdiv").hide();

								if (custId != 0) {
									alert("Update Successfully");
									

								} else {
									alert("Customer Added Successfully");
									
								}
								$('#addcust').popup('hide'); 

							} else {
								alert("Failed To Add Customer");
							}

						});
	}
		}
		 
	});

}








</script>
	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#addcust').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
			/* $('#myModalForCredit').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			}); */
		});
	function clearAddCustomerpopup() {
			
			document.getElementById("myBtn").disabled = false; 

			document.getElementById("customerName").value = "";
			document.getElementById("mobileNo").value = "";
			document.getElementById("kms").value = "";
			document.getElementById("dateOfBirth").value = "";
			document.getElementById("n-option").checked = true;
			document.getElementById("companyName").value = "";
			document.getElementById("gstNo").value = "";
			document.getElementById("custAdd").value = "";
			document.getElementById("custId").value = 0;
			document.getElementById("moption").checked = true;
			document.getElementById("custType").value ="0";
			$("#custType").trigger("chosen:updated");	
			document.getElementById("ageRange").value ="0";
		    $("#ageRange").trigger("chosen:updated");
			$('.chosen-select').trigger('chosen:updated');
			document.getElementById("add_cust_head_name").innerHTML = "Add Customer";
			$("#isbuissnessdiv").hide();
		}

	</script>


	<script>
		function checkAdd() {
			if (document.getElementById("dm").checked == true) {
				 document.getElementById("custId2_chosen").style.width="184px";
				//alert("dairyMart");
              		$('#form1').hide();
              		$('#form2').show();		
              		calTotal(1);
              		
            		// document.getElementById("dailyFlagMart2").value = 2;
            		// document.getElementById("dailyFlagMart1").value = 0;
 
              		
			} else {
				
				//alert("without dairyMart");
				    $('#form1').show();
				    $('#form2').hide();
				  //  document.getElementById("dailyFlagMart2").value = 0;
           		// document.getElementById("dailyFlagMart1").value = 1;
 
				    calTotal(0);
			}
		}
		function showDivOn(){
			
			 $('#form1').show();
			    $('#form2').hide();
					document.getElementById("ihide").style = "display:none"
						  document.getElementById("dailyFlagMart2").value = 0;
	           		 document.getElementById("dailyFlagMart1").value = 1;
 		}

	</script>
	<script type="text/javascript">
		function onChangeDm(rate,id) {
			var qty = parseFloat($('#qty2'+id).val());
			var minqty = parseFloat($('#minqty2'+id).val());
			var limit = parseFloat($('#limit2'+id).val());
				if(qty % minqty==0  &&  qty >= limit){
					var discPer = $('#dmDisc2'+id).val();
				    var total = rate * qty;
				    var finAmt=(total*discPer)/100;
				    var x=total-finAmt;
				   $('#total2'+id).html(x.toFixed(2));
				}else
				{
					 var total =0;
					alert("Please Enter Qty Multiple of Minimum Qty & greater than or Equal to Limit");
					$('#qty2'+id).val('0');
					$('#total2'+id).html(total);
					$('#qty2'+id).focus();
				}
				calTotal(2);
		}
	</script>
	<script type="text/javascript">
		function onChange(rate,mrp,id,isOwnStore) {
			var qty = $('#qty1'+id).val();
			var minqty = $('#minqty1'+id).val();
				if(qty % minqty==0 ){
					if(isOwnStore==1)
						{
						  var total = mrp * qty;
						   $('#total1'+id).html(total.toFixed(2));
						}else{
				    var total = mrp * qty;
				   $('#total1'+id).html(total.toFixed(2));
						}
				}else
				{
					 var total =0;
					alert("Please Enter Qty Multiple of Minimum Qty ");
					$('#qty1'+id).val('0');
					$('#total1'+id).html(total);
					$('#qty1'+id).focus();
				}
				calTotal(1);
		}
	</script>

	<script type="text/javascript">
        /*     function validate(id)
            {
                var  adv=$("#advanceAmt"+id).val();
        		var  total=$("#fintotal"+id).val();
        		var  remAmt=$("#remainAmt"+id).val();
        		var  calAmt=parseFloat(adv)+parseFloat(remAmt);
        	
        		if(parseFloat(calAmt)>parseFloat(total)){
                  alert("Entered Advance is gretor than Total Amount!!");
                } 
            } */
           /*  function button2(flag)
            { 
            	
            	var  adv=$("#advanceAmt"+flag).val();
    		var tot=$("#fintotal"+flag).val();
    		var remAmt=$("#remainAmt"+flag).val();
    		 var x=parseFloat(adv)+parseFloat(remAmt);
            	
            	 
                 if(  parseFloat(x)== parseFloat(tot)){
                	 var isSubmit=confirm("Do you want to save Order?");
                 
                if(isSubmit==true  ){    
                	document.getElementById("subm2").disabled = true;
                    form2.submit();
                } 
            }    else{
            	alert("Enter Advance & Remaining Amount Properly");
            }
            } */
           
        </script>
	<script>
	function calTotal(flag)
	{
		var sum = 0;
		    $('.responsive-table'+flag).find('.col-md-1-'+flag).each(function (index, element) {
		        sum += parseFloat($(element).text());
		    });
		 $('#calTotal'+flag).text(sum);
 		 document.getElementById("fintotal"+flag).value = sum;
 		 document.getElementById("remainAmt"+flag).value = sum;
 		document.getElementById("advanceAmt"+flag).value = 0.00;
 		
	}
	function setAmt(flag){ 
		
		var  adv=$("#advanceAmt"+flag).val();
		var tot=$("#fintotal"+flag).val();
		
		//alert("isNAN - "+isNaN(parseFloat(adv)));
		
		//alert("hii");
		if((parseFloat(adv) <= parseFloat(tot)) || isNaN(parseFloat(adv))){
			
			
			//alert("if");
			var rem=parseFloat(tot)-parseFloat(adv);
			//alert("rem - "+rem)
			
				document.getElementById("remainAmt"+flag).value = rem;
		}
		else{
			//alert("else");
			alert("Enter Advance Amount Less than Total Amount");
			document.getElementById("advanceAmt"+flag).value = 0.00;
			document.getElementById("remainAmt"+flag).value = tot;
			//document.getElementById("remainAmt"+flag).value = 0.00;
		}
		
	}
function validateMobile(mobile) {
	var mob = /^[1-9]{1}[0-9]{9}$/;
	if (mob.test($.trim(mobile)) == false) {
		//alert("Please enter a valid email address .");
		return false;
	}
	return true;
} 
function editCustomer(flag) {

	var custId = document.getElementById("custId"+flag).value;

	if (custId != 0) {
		//document.getElementById("overlay2").style.display = "block";
		$
				.post(
						'${editCustomerFromBill}',
						{
							custId : custId,
							ajax : 'true'
						},
						function(data) {
							//document.getElementById("overlay2").style.display = "none";
							$('.addcust_open').trigger('click');
							//$('#myModalEdit').modal('show');
							//$('#addcust').popup('show');
							document
									.getElementById("add_cust_head_name").innerHTML = "Edit Customer";
							document.getElementById("customerName").value = data.custName;
							document.getElementById("mobileNo").value = data.phoneNumber;
							document.getElementById("kms").value = data.exVar1;
							document.getElementById("custId").value = data.custId;
							document.getElementById("dateOfBirth").value = data.custDob;
							document.getElementById("custAdd").value = data.address;

							if (data.gender == 1) {
								document.getElementById("moption").checked = true;
								}else{
								document.getElementById("foption").checked = true;
								}
								document.getElementById("custType").value =data.exInt1;
								$("#custType").trigger("chosen:updated");
								document.getElementById("ageRange").value =data.ageGroup;
								$("#ageRange").trigger("chosen:updated");
								$('.chosen-select').trigger('chosen:updated');
							if (data.isBuissHead == 1) {

								$("#isbuissnessdiv").show();
								document.getElementById("y-option").checked = true;
								document.getElementById("companyName").value = data.companyName;
								document.getElementById("gstNo").value = data.gstNo;
							} else {
								$("#isbuissnessdiv").hide();
								document.getElementById("y-option").checked = false;
							}

						});

	} else {
		alert("Select Customer ");
	}

}
		</script>

	<script>
 
 
$(document).ready(function($) {
			   $('#subm2').click(function(){
				  var custId=document.getElementById("custId2").value;
				  var delTime=document.getElementById("delTime2").value;
				  
				//  alert(delTime);
				  
				  var devDate=document.getElementById("todatepicker").value;
 				   //document.getElementById("subm2").disabled = true; 
 				   if(custId==""){
 					   alert("Please Select Customer")
 				   }else  if(devDate==""){
 					   alert("Please Select Delivery Date")
 				   }
 				    else if(delTime==""){
 					   alert("Please Select Delivery Time")
 				   } 
 				   else{
						document.getElementById("overlay2").style.display = "block";

					$.ajax({
					   type: "POST",
					            url: "${pageContext.request.contextPath}/saveAdvanceOrder",
					            data: $("#form2").serialize(),
					            dataType: 'json',
					success: function(data){ 
				 if(data.advHeaderId>0)
					{
	 				  
					 window.location.reload();
					 // $('.modale').removeClass('opened');
					   document.getElementById("subm2").disabled = false; 
					    window.open("${pageContext.request.contextPath}/showAdvanceOrderMemo/"+data.advHeaderId+"/"+data.deliveryDate+"/"+data.frId);
						document.getElementById("overlay2").style.display = "";

					}else
						{
						document.getElementById("overlay2").style.display = "";
						alert("Please Place Valid Order!\n(please check delivery date, time and items)")
						}
					}
					}).done(function() {
					setTimeout(function(){
					},500);
					});
 				   }
				return false;
			});
		});
		</script>


	<script>
 
 
$(document).ready(function($) {
			   $('#subm1').click(function(){
				   var custId=document.getElementById("custId1").value;
				   var devDate=document.getElementById("fromdatepicker").value;
				   var delTime=document.getElementById("delTime1").value;
				   var adv=document.getElementById("advanceAmt1").value;
				   //alert("adv "+adv);
				   
				   if(custId==""){
 					   alert("Please Select Customer")
 				   }else  if(devDate==""){
 					   alert("Please Select Delivery Date")
 				   }
 				    else if(delTime==""){
 					   alert("Please Select Delivery Time")
 				   } 
 				   else if(adv==""){
 					   alert("Please Enter Advance Amount")
 				   }else{
 						document.getElementById("overlay2").style.display = "block";

				 // document.getElementById("subm1").disabled = true; 
					$.ajax({
					   type: "POST",
					            url: "${pageContext.request.contextPath}/saveAdvanceOrder",
					            data: $("#form1").serialize(),
					            dataType: 'json',
					success: function(data){
				 if(data.advHeaderId>0)
					{
					 
					//alert( window.location);
					window.location.reload(true);
					  document.getElementById("subm1").disabled = false; 
 					    window.open("${pageContext.request.contextPath}/showAdvanceOrderMemo/"+data.advHeaderId+"/"+data.deliveryDate+"/"+data.frId);
						document.getElementById("overlay2").style.display = "";

					}else
						{
						document.getElementById("overlay2").style.display = "";
						alert("Please Place Valid Order!\n(please check delivery date, time and items)")
						}
					}
					}).done(function() {
					setTimeout(function(){
					},500);
					});
 				  }
				return false;
			});
		});
		</script>

	<script type="text/javascript">

function uniquePhnNum(){
	
	var phoneNo = $("#mobileNo").val();
 	  var valid = false;
			$.getJSON('${checkEmailText}', {
					phoneNo : phoneNo,	
 					ajax : 'true',
				},

				function(data) {
					 if(parseInt(data)==1){		
						
							document.getElementById("sbtbtn4").disabled = true;
							document.getElementById("mobileNo").value = "";
							
					}else{
						valid=true;
						document.getElementById("sbtbtn4").disabled = false;
					}
					 
				});
			
			return valid;
	 
}
</script>
	<script type="text/javascript">
function showDiv(typdId){
	//alert("Id="+typdId);
		if (typdId == 1) {
 			document.getElementById("ihide").style = "visible"
		} else if (typdId == 2) {
			document.getElementById("ihide").style = "display:none"
	}
}

	
</script>
	<script>
(function() {
  var fauxTable = document.getElementById("faux-table");
  var mainTable = document.getElementById("table_grid");
  var clonedElement = table_grid.cloneNode(true);
  var clonedElement2 = table_grid.cloneNode(true);
  clonedElement.id = "";
  clonedElement2.id = "";
  fauxTable.appendChild(clonedElement);
  fauxTable.appendChild(clonedElement2);
});


	</script>
	<script>
	function openMod() {
	$('#modal_small').modal('show'); 
	}
	</script>




	<script type="text/javascript">
		function onKeyDown(id) {
			var e = $('#'+id).val();
			if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
		             // Allow: Ctrl/cmd+A
		            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+C
		            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+X
		            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: home, end, left, right
		            (e.keyCode >= 35 && e.keyCode <= 39)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
		            e.preventDefault();
		        }
		}
</script>
	<script type="text/javascript">
$(document).ready(function() {
    $("#5").keydown(function (e) {
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl/cmd+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+C
            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+X
            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
            e.preventDefault();
        }
    });
});
</script>
	<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("table_grid1");
  switching = true;
  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("TR");
    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
	<script>
	function myFunction1(index) {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput1"+index);
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid1"+index);
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	
	function myFunction2(index) {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput2"+index);
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid2"+index);
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	
</script>
	<!-- MODAL SCRIPT -->
	<script>
$('.openmodale').click(function (e) {
         e.preventDefault();
         $('.modale').addClass('opened');
    });
$('.closemodale').click(function (e) {
         e.preventDefault();
         $('.modale').removeClass('opened');
    });
</script>
	<!-- MODAL SCRIPT END-->
	<%-- 

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/newpos/timeassets/js/jquery.min.js"></script> --%>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/newpos/timeassets/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/newpos/dist/bootstrap-clockpicker.min.js"></script>
	<script type="text/javascript">
$('.clockpicker-with-callbacks').clockpicker({
		donetext: 'Done',
		init: function() { 
			console.log("colorpicker initiated");
		},
		beforeShow: function() {
			console.log("before show");
		},
		afterShow: function() {
			console.log("after show");
		},
		beforeHide: function() {
			console.log("before hide");
		},
		afterHide: function() {
			console.log("after hide");
		},
		beforeHourSelect: function() {
			console.log("before hour selected");
		},
		afterHourSelect: function() {
			console.log("after hour selected");
		},
		beforeDone: function() {
			console.log("before done");
		},
		afterDone: function() {
			console.log("after done");
		}
	})
	.find('input').change(function(){
		console.log(this.value);
	});

// Manually toggle to the minutes view
$('#check-minutes').click(function(e){
	// Have to stop propagation here
	e.stopPropagation();
	input.clockpicker('show')
			.clockpicker('toggleView', 'minutes');
});
</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/newpos/timeassets/js/highlight.min.js"></script>


	<script>
  $(document).ready(function(){
	  
    $('#delTime1').mdtimepicker(); //Initializes the time picker
    $('#delTime2').mdtimepicker(); //Initializes the time picker
    
  });
</script>


</body>
</html>