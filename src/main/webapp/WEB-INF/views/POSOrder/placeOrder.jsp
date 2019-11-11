<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<style>
.plus-button {
	border: 2px solid lightgrey;
	background-color: #fff;
	font-size: 16px;
	height: 1.8em;
	width: 2.5em;
	border-radius: 999px;
	position: relative;
	}
	.plus-button:after,
	.plus-button:before {
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
	margin-top: 14px;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 25px;
	margin-top: 14px;
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


<body onload="showDivOn()">
	<c:url var="qtyValidation" value="/quantityValidation"></c:url>
	<c:url value="/checkEmailText" var="checkEmailText"></c:url>

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


				<!--leftNav-->
				<!--rightSidebar-->
				<div class="sidebarright">
					<form action="${pageContext.request.contextPath}/saveAdvanceOrder"
						name="form1" method="post">

						<div class="order-left">
							<h2 class="pageTitle">Place Order</h2>

						</div>

						<div class="order-right"></div>

						<div class="colOuter">


							<div class="col-md-1">
								<div class="col1title">Select Customer</div>
							</div>
							<div class="col-md-2">
								<select name="custId" class="form-control chosen" tabindex="4"
									id="custId" required>

									<option value="-1">Select Customer</option>
									<c:forEach items="${custList}" var="custList" varStatus="count">

										<option value="${custList.custId}">
											${custList.custName}-${custList.phoneNumber}</option>
									</c:forEach>

								</select>

							</div>
							<div class="col-md-1">
								<button class="plus-button openmodale"></button>

							</div>

							<div class="col-md-2">
								<div class="col1title">Delivery Date</div>
							</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal"
									placeholder="From Date" name="devDate" autocomplete="off"
									type="text"">

							</div>
							<div class="col-md-1">
								<div class="col1title">Dairy mart</div>
							</div>
							<div class="col-md-1">
								<label class="switch"> <input type="checkbox" name="dm"
									id="dm" onchange="checkAdd() "> <span
									class="slider round"></span>
							</div>
							</label>

						</div>
						<input type="hidden" name="menuTitle" value="${menuTitle}">

						<!--tabNavigation-->
						<div class="cd-tabs" style="margin-top: 2px;" id="sub1">
							<nav>
								<ul class="cd-tabs-navigation">
									<c:forEach var="tab" items="${subCatListTitle}"	varStatus="loop">
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
									<label for="search" class="col-md-3" id="search"> <i
										class="fa fa-search" style="font-size: 20px"></i> <input
										class="myInput1" type="text" id="myInput${loop.index}"
										onkeyup="myFunction1(${loop.index})"
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
														<th class="col-md-1">Qty</th>
														<th class="col-md-1">MRP</th>
														<th class="col-md-1">Rate</th>
														<th class="col-md-1">Total</th>
													</tr>
												</thead>
											</table>

										</div>
										<div class="table-wrap">

											<table id="table_grid${loop.index}" class="responsive-table1"
												style="margin: 0px;">
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
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		
																		<td class="col-md-1"><c:out value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onkeydown="myFunction()"
																			onchange="onChange('${items.itemRate1}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp1}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate1}' /></td>
																		<c:set var="rate" value="${items.itemRate1}" />
																		<c:set var="qty" value="${items.itemQty}" />
																		<td class="col-md-1-1" id="total1${items.id}"><fmt:formatNumber
																				type="number" minFractionDigits="2"
																				maxFractionDigits="2" value="${rate * qty}" /></td>
																				
																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='2'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onchange="onChange('${items.itemRate2}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate2}' /></td>
																		<c:set var="rate" value="${items.itemRate2}" />
																		<c:set var="qty" value="${items.itemQty}" />


																		<td class="col-md-1-1" id="total1${items.id}"><fmt:formatNumber
																				type="number" minFractionDigits="2"
																				maxFractionDigits="2" value="${rate * qty}" /></td>
																				
																				
															
																	</tr>
																</c:when>

																<c:when test="${frDetails.frRateCat=='3'}">
																	<tr>

																		<td class="col-md-1">${items.itemName}<a
																			href="${url}${items.itemImage}"
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty1${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onchange="onChange('${items.itemRate3}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty1${items.id}" /></td>
																			
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp3}' /></td>

												<td class="col-md-1"><c:out value='${items.itemRate3}' /></td>
												<c:set var="rate" value="${items.itemRate3}" />
												<c:set var="qty" value="${items.itemQty}" />
												<td class="col-md-1-1" id="total1${items.id}">
												<fmt:formatNumber	type="number" minFractionDigits="2"	maxFractionDigits="2" value="${rate * qty}" /></td>
																					
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

							<div class="col-md-1">Advance:</div>

							<div class="col-md-1">

								<input type="text" name="advanceAmt" id="advanceAmt1"
									onchange="setAmt(1)" class="texboxitemcode texboxcal2"
									autocomplete="off" required class="form-control" size="20" />
							</div>

							<div class="col-md-2">Pending Amt:</div>
							<div class="col-md-1">

								<input type="text" name="remainAmt" id="remainAmt1"
									class="texboxitemcode texboxcal2" autocomplete="off" required
									class="form-control" size="20" />
							</div>


							<div class="col-md-1">Total:</div>
							<div class="col-md-1" id="calTotal1" style="color: red;">00
							</div>


						</div>
						<input type="hidden" id="fintotal1" name="fintotal1" value="0">
						<div class="order-btn textcenter">

							<input name="" id="subm" class="buttonsaveorder"
								value="SAVE ORDER" type="button" ONCLICK="button1()">
						</div>
						</div>
<!-------------------------------------TABS FOR DAIRY MART----------------------------------------------------------->

			<div class="cd-tabs" style="margin-top: 2px;display: none;" id="sub2" >
							<nav>
								<ul class="cd-tabs-navigation">
									<c:forEach var="tab" items="${subCatListTitle}"	varStatus="loop">
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
									<label for="search" class="col-md-3" id="search"> <i
										class="fa fa-search" style="font-size: 20px"></i> <input
										class="myInput1" type="text" id="myInput${loop.index}"
										onkeyup="myFunction1(${loop.index})"
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

											<table id="table_grid${loop.index}" class="responsive-table2"
												style="margin: 0px;">
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
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		
																		<td class="col-md-1"><c:out value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out value='${items.itemMrp2}' />
																		<input type="hidden" value="${items.itemMrp2}" id="limit2${items.id}" /></td>

																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onkeydown="myFunction()"
																			onchange="onChangeDm('${items.itemRate1}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp1}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate1}' /></td>
																		<c:set var="rate" value="${items.itemRate1}" />
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
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /><input type="hidden"
																			value="${items.itemMrp2}" id="limit2${items.id}" /></td>



																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onchange="onChangeDm('${items.itemRate2}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemRate2}' /></td>
																		<c:set var="rate" value="${items.itemRate2}" />
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
																			data-lightbox="image-1" tabindex="-1"><i
																				class="fa fa-file-image-o"
																				style="font-size: 16px; color: green"></i></a></td>
																		<td class="col-md-1"><c:out
																				value='${items.minQty}' /></td>

																		<td class="col-md-1"><c:out
																				value='${items.itemMrp2}' /><input type="hidden"
																			value="${items.itemMrp2}" id="limit2${items.id}" /></td>



																		<td class="col-md-1"><input name='${items.id}'
																			id='qty2${items.id}' value='${items.itemQty}'
																			class="tableInput" type="text"
																			onchange="onChangeDm('${items.itemRate3}',${items.id})">

																			<input type="hidden" value="${items.minQty}"
																			id="minqty2${items.id}" /></td>
																			
																			
																		<td class="col-md-1"><c:out
																				value='${items.itemMrp3}' /></td>

												<td class="col-md-1"><c:out value='${items.itemRate3}' /></td>
												<c:set var="rate" value="${items.itemRate3}" />
												<c:set var="qty" value="${items.itemQty}" />
												<td class="col-md-1"><c:out	value='${items.dmDiscPer}' /><input type="hidden"	value="${items.dmDiscPer}" id="dmDisc2${items.id}" /></td>
												<td class="col-md-1-2" id="total2${items.id}">
												<fmt:formatNumber	type="number" minFractionDigits="2"	maxFractionDigits="2" value="${rate * qty}" /></td>
																					
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

							<div class="col-md-1">Advance:</div>

							<div class="col-md-1">

								<input type="text" name="advanceAmt" id="advanceAmt2"
									onchange="setAmt(2)" class="texboxitemcode texboxcal2"
									autocomplete="off" required class="form-control" size="20" />
							</div>

							<div class="col-md-2">Pending Amt:</div>
							<div class="col-md-1">

								<input type="text" name="remainAmt" id="remainAmt2"
									class="texboxitemcode texboxcal2" autocomplete="off" required
									class="form-control" size="20" />
							</div>


							<div class="col-md-1">Total:</div>
							<div class="col-md-1" id="calTotal2" style="color: red;">00
							</div>


						</div>
						<input type="hidden" name="fintotal1"  id="fintotal2" value="0">
						<div class="order-btn textcenter">

							<input name="" id="subm" class="buttonsaveorder"
								value="SAVE ORDER" type="button" ONCLICK="button1()">
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
	<div class="modale" id="abs" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-header">
				<h2>Add Customer</h2>
				<a href="#" class="btn-close closemodale" aria-hidden="true">&times;</a>
			</div>
			<div class="modal-body">

				<form action="${pageContext.request.contextPath}/saveQuickCust"
					name="modalfrm4" id="modalfrm4" method="post">

					<div class="colOuter">


						<div class="col-md-3">
							<div class="col1title">Customer Name</div>
						</div>
						<div class="col-md-6">

							<input type="text" name="custName" id="custName"
								class="texboxitemcode texboxcal2" autocomplete="off"
								placeholder="Customer Name" class="form-control" size="20" />
						</div>
						<div class="col-md-3">
							<span id="custName_err" style="display: none; color: red">This
								Field is Required.</span>
						</div>
					</div>

					<div class="colOuter">


						<div class="col-md-3">
							<div class="col1title">Phone No.</div>
						</div>
						<div class="col-md-6">

							<input type="text" name="phoneNum" id="phoneNum"
								onchange="uniquePhnNum()" class="texboxitemcode texboxcal2"
								autocomplete="off" placeholder="Phone No" class="form-control"
								size="20" />
						</div>
						<div class="col-md-3">
							<span class="col1title" id="error_phoneNum"
								style="display: none; color: red">This Field is Required.</span>
						</div>
					</div>
					<div class="colOuter">


						<div class="col-md-3">
							<div class="col1title">Age Group</div>
						</div>
						<div class="col-md-6">
							<input type="text" name="ageGrp" placeholder="Age Group"
								id="ageGrp" class="texboxitemcode texboxcal2" autocomplete="off"
								class="form-control" size="20" />
						</div>
						<div class="col-md-3">
							<span class="col1title" id="error_ageGrp"
								style="display: none; color: red">This Field is Required.</span>
						</div>
					</div>
					<div class="colOuter">

						<div class="col-md-3">
							<div class="col1title">DOB</div>
						</div>
						<div class="col-md-6">
							<input id="fromdatepicker" type="date"
								class="texboxitemcode texboxcal" placeholder="Date of Birth"
								class="texboxitemcode texboxcal2" autocomplete="off" id="dob"
								name="dob" autocomplete="off" type="text"">

						</div>
						<div class="col-md-3">
							<span class="col1title" id="error_dob"
								style="display: none; color: red">This Field is Required.</span>
						</div>

					</div>
					<div class="colOuter">
						<div class="col-md-3">Gender:</div>

						<div class="col-md-2">
							<input type="radio" name="gender" id="gender" value="1"
								checked="checked" style="width: 10px;"> Male
						</div>
						<div class="col-md-2">
							<input type="radio" name="gender" id="gender" value="2"
								style="width: 10px;"> Female

						</div>
						<div class="col-md-2">
							<input type="radio" name="gender" id="gender" value="3"
								style="width: 10px;"> Other
						</div>
					</div>





					<div class="colOuter">
						<div class="col-md-3">Is Buisness Head:</div>
						<div class="col-md-2">
							<input type="radio" name="isBuiss" id="isBuiss" value="1"
								onclick="showDiv(this.value)" style="width: 10px;"> Yes
						</div>
						<div class="col-md-2">
							<input type="radio" name="isBuiss" id="isBuiss" value="2"
								checked="checked" onclick="showDiv(this.value)"
								style="width: 10px;"> No
						</div>
					</div>
					<div id="ihide">
						<div class="colOuter">


							<div class="col-md-3">
								<div class="col1title">GST No.</div>
							</div>
							<div class="col-md-6">

								<input type="text" name="gstNo" placeholder="GST No." id="gstNo"
									class="texboxitemcode texboxcal2" autocomplete="off"
									class="form-control" size="20" />
							</div>
							<div class="col-md-3">
								<span class="col1title" id="error_gstNo"
									style="display: none; color: red">This Field is
									Required.</span>
							</div>
						</div>
						<div class="colOuter">


							<div class="col-md-3">
								<div class="col1title">Company Name</div>
							</div>
							<div class="col-md-6">

								<input type="text" name="compName" placeholder="Company Name"
									class="texboxitemcode texboxcal2" autocomplete="off"
									id="compName" class="form-control" size="20" />
							</div>
							<div class="col-md-3">
								<span class="col1title" id="error_compName"
									style="display: none; color: red">This Field is
									Required.</span>
							</div>
						</div>

						<div class="col-md-3">
							<div class="col1title">Address</div>
						</div>
						<div class="col-md-6">

							<textarea name="address" id="address" placeholder="Address"
								class="col1full" rows="" style="width: 250px; height: 60px"
								maxlength="300" autocomplete="off" required class="form-control" /></textarea>
						</div>
						<div class="col-md-3">
							<span class="col1title" id="error_address"
								style="display: none; color: red">This Field is Required.</span>
						</div>
					</div>
					<div class="colOuter">
						<input name="" id="sbtbtn4" class="buttonsaveorder" value="Add"
							type="button">


					</div>
				</form>
			</div>

		</div>
	</div>


	<script>
		function checkAdd() {
			if (document.getElementById("dm").checked == true) {
              		$('#sub1').hide();
              		$('#sub2').show();		
              		calTotal(1);
			} else {
				    $('#sub1').show();
				    $('#sub2').hide();
				    calTotal(0);
			}
		}
		function showDivOn(){
					document.getElementById("ihide").style = "display:none"
		}

	</script>
	<script type="text/javascript">
		function onChangeDm(rate,id) {
			var qty = $('#qty2'+id).val();
			var minqty = $('#minqty2'+id).val();
			var limit = $('#limit2'+id).val();
				if(qty % minqty==0  ||  qty >= limit){
					var discPer = $('#dmDisc2'+id).val();
				    var total = rate * qty;
				    var finAmt=(total*discPer)/100;
				    var x=total-finAmt;
				   $('#total2'+id).html(x.toFixed(2));
				}else
				{
					 var total =0;
					alert("Please Enter Qty Multiple of Minimum Qty & Less than or Equal to Limit");
					$('#qty2'+id).val('0');
					$('#total2'+id).html(total);
					$('#qty2'+id).focus();
				}
				calTotal(2);
		}
	</script>
	<script type="text/javascript">
		function onChange(rate,id) {
			var qty = $('#qty1'+id).val();
			var minqty = $('#minqty1'+id).val();
				if(qty % minqty==0 ){
				    var total = rate * qty;
				   $('#total1'+id).html(total.toFixed(2));
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
	

	<script>
	function calTotal(flag)
	{
		var sum = 0;
		    $('.responsive-table'+flag).find('.col-md-1-'+flag).each(function (index, element) {
		        sum += parseFloat($(element).text());
		    });
		 $('#calTotal'+flag).text(sum);
 		 document.getElementById("fintotal"+flag).value = sum;
	}
	function setAmt(flag){ 
		var  adv=$("#advanceAmt"+flag).val();
		var tot=$("#fintotal"+flag).val();
		var rem=parseFloat(tot)-parseFloat(adv);
		document.getElementById("remainAmt"+flag).value = rem;
	}
function validateMobile(mobile) {
	var mob = /^[1-9]{1}[0-9]{9}$/;
	if (mob.test($.trim(mobile)) == false) {
		//alert("Please enter a valid email address .");
		return false;
	}
	return true;
} 
$(document).ready(function($) {
			   $('#sbtbtn4').click(function(){
				var isError = false;
				var errMsg = "";
				if ($("#custName").val() == "") {
					isError = true;
					$("#custName_err").show()
				} else {
					$("#custName_err").hide()
				}
				 if (!$("#phoneNum").val() || !validateMobile($("#phoneNum").val())) {
					isError = true;
					$("#error_phoneNum").show()
				} else {
					$("#error_phoneNum").hide()
				}
				 if (!$("#ageGrp").val() ) {
						isError = true;
						$("#error_ageGrp").show()
					} else {
						$("#error_ageGrp").hide()
					}
					var x = document.getElementById("isBuiss").value; 
				 if(x==1){
				 if (!$("#gstNo").val() ) {

						isError = true;

						$("#error_gstNo").show()

					} else {
						$("#error_gstNo").hide()
					}
				 if (!$("#compName").val() ) {

						isError = true;

						$("#error_compName").show()

					} else {
						$("#error_compName").hide()
					}
				

			 
				if (!$("#address").val() ) {

					isError = true;

					$("#error_address").show()

				} else {
					$("#error_address").hide()
				} 
				}
			if (isError==true) {
					alert("error")
					var x = true;
					if (x == true) {

						//document.getElementById("sbtbtn4").disabled = true;
					 
						return true;
					}
					//end ajax send this to php page
				}
				
				else{
					$.ajax({
					   type: "POST",
					            url: "${pageContext.request.contextPath}/saveQuickCust",
					            data: $("#modalfrm4").serialize(),
					            dataType: 'json',
					success: function(data){
				 if(data!==null)
					{
					 $('#abs').modal('hide');
					 document.getElementById("custId").label =data.custName; 
					 document.getElementById("custId").value = data.custId; 
					 document.getElementById("custId").selectedIndex = "0";
					}
					}
					}).done(function() {
					setTimeout(function(){
					},500);
					});
				}
				return false;
			});isBuiss
		});
		</script>

	<script type="text/javascript">

function uniquePhnNum(){
	
	var phoneNo = $("#phoneNum").val();
 	  var valid = true;
			if (phoneNo == null || phoneNo == "") {
				valid = false;
			} 
			if(valid == true){
				$.post('${checkEmailText}', {
					phoneNo : phoneNo,	
 					ajax : 'true',
				},

				function(data) {
					 if(parseInt(data)==1){		
						 alert("This Contact Number already exist.");
						 
							document.getElementById("sbtbtn4").disabled = true;
							document.getElementById("phoneNum").value = "";
						return false;
					}else{
						document.getElementById("sbtbtn4").disabled = false;
					}
					 
				});
			} 
			return true;
	 
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


	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

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
            function button1()
            {
                var isSubmit=confirm("Do you want to save Order?");
                if(isSubmit==true){    
                	document.getElementById("subm").disabled = true;
                    form1.submit();
                }
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
<script type="text/javascript"	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

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
		input = document.getElementById("myInput"+index);
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid"+index);
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
	
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid1");
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
</body>
</html>