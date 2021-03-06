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

<title>Madhvi</title>

<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet" type="text/css" />

<%-- <link rel="icon"
	href="${pageContext.request.contextPath}/images/feviconicon.png"
	type="image/x-icon" /> --%><%-- 
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>
 --%>
<!--autocomplete-->
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<script src="https://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
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
<!--new css added by kalpesh --><%-- 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.mCustomScrollbar.css">

 --%><script
	src="${pageContext.request.contextPath}/resources/css/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.css" />
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap-select.min.js"></script>
<!-- 1 css and 2 js for search item   -->

<%-- <script src="${pageContext.request.contextPath}/resources/jquery.confirm/jquery.confirm.js"></script> --%>
<style>
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
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {

		 
		$("#datepicker").datepicker({
			dateFormat : 'dd-mm-yy', 
		});
	});
	 
</script>

</head>
<body id="myBodyId" onload="showBill()">

	<c:url var="findItemRateById" value="/findItemRateById"></c:url>
	<c:url var="addItemInList" value="/addItemInList"></c:url>
	<c:url var="insertOtherItem" value="/insertOtherItem"></c:url>
	<c:url var="getOtherBillBetweenDate" value="/getOtherBillBetweenDate"></c:url>
	<c:url var="deleteItemInOtherBill" value="/deleteItemInOtherBill"></c:url>
	<c:url var="deleteOrder" value="/deleteOrder"></c:url>
	<c:url var="generateBill" value="/generateBill"></c:url>
	<c:url var="findItemById" value="/getItemById" />
	<c:url var="getItemIdByBarcode" value="/getItemIdByBarcode" />
	<c:url var="clearData" value="/clearData" />




	<div class="sidebarOuter"></div>

	<div class="wrapper">

		<!--topHeader-->
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

				<!------------ Place Actual content of page inside this div ----------->
				<div class="sidebarright">
			
					<div class="order-left">
						<h2 class="pageTitle">Other Purchase Bill</h2>

					</div>
					<br>
					<div class="order-right" align="right">
					 
						<a href="${pageContext.request.contextPath}/addSupplier"><input type="button" value="Add Supplier" class="buttonsaveorder">
										</a>
						<a href="${pageContext.request.contextPath}/viewOtherItemBill"><input type="button" value="List Of Other Purchase Bill" class="buttonsaveorder">
										</a>
					</div>

					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->
						<nav>
							<ul class="cd-tabs-navigation">
								 
							</ul>
						</nav>
						<!--tabMenu-->
						<ul class="cd-tabs-content">
							<!--tab1-->
							<li data-content="tab1" class="selected" onshow="onloadTab(1)">
								<div class="row">
									<div class="col-md-9">
										<div class="control-label">
										
										<div class="row">
											<!-- <div class="col-md-4">
												<h4 class="col-md-7">
													<b>Invoice No:-</b>
												</h4>
												<input type="text" class="form-control"
												placeholder="Enter Invoice No" name="invoiceNo" id="invoiceNo"
												 required><br>
											</div> -->

											 

											<div class="col-md-4">
												<h4 ><!--style="margin-top: 5px" class="col-md-8"  -->
													<b>Supplier:-</b>
												</h4>
		
												<select class="form-control" data-live-search="true" title="Please Select Item"
																			name="suppId" id="suppId"
																			required>
																			<option value="1">Select Supplier</option>
																				<c:forEach items="${supplierList}" var="supplierList"> 
																				<option value="${supplierList.suppId}">${supplierList.suppName}</option> 
																				</c:forEach>

																		</select> 
											</div>
											<div class="col-md-4">
												<h4 ><!--style="margin-top: 5px" class="col-md-8"  -->
													<b>From Date:-</b>
												</h4>
													<div><!--  class="col-md-8" -->
														<input id="datepicker1" class="texboxitemcode texboxcal" value="${fromDate}"  autocomplete="off"
															name="fromDate" type="text" required>
													</div>
 											</div>
 											
 											<div class="col-md-4">
												<h4 ><!--style="margin-top: 5px" class="col-md-8"  -->
													<b>To Date:-</b>
												</h4>
													<div><!-- class="col-md-8" -->
														<input id="datepicker2"  class="texboxitemcode texboxcal" value="${toDate}" autocomplete="off"
															name="toDate" type="text" required>
													</div>
 											</div>
 											
								<div class="clearfix"></div>
									   

								</div>
								<div class="row"></div>
										<div align="center">
									<input type="submit" class="buttonsaveorder" id="insert"  onclick="showBill()"
										 value="Submit" style="margin-top: 5px;">  
								 
								</div>
					
<%-- 											<div>
												<div class="shInnerwidth">
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0" class="table">
														<tr>
															<td align="center" valign="middle" style="padding: 0px;">
																<table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr class="bgpink">
																		<td>Item Code</td>
																		<td>Item Name</td>
																		<td>Qty</td>
																		<td>Rate</td>
																		<td>Discount</td>
																	</tr>
																	<tr>
																		<td><input type="text" class="form-control"
																			id="barcode1" name="barcode1"
																			placeholder="Enter Barcode" onchange="selectItem(1)"
																			onkeypress="onBarcode(event,1)"></td>
																		<td><select class="form-control" data-live-search="true" title="Please Select Item"
																			name="itemName1" id="itemName1"
																			data-rule-required="true">
																			<option value="">Select Item</option> 
																				<c:forEach items="${itemsList}" var="itemsList"> 
																				<option value="${itemsList.id}">${itemsList.itemName}</option> 
																				</c:forEach>

																		</select> <input name="item_name1" id="item_name1"
																			type="hidden" value="" /></td>
																		<td><input type="number" min="0" max="500"
																			class="form-control" name="qty" id="qty" value="1"
																			onkeypress="onQty(event,1)"
																			oninput="validity.valid||(value='');"></td>
																		<td id="rateTdVal1">00</td>
																		<td><input type="text" min="0" max="500"
																			class="form-control" name="discPer" id="discPer" value="0"
																			onkeypress="onQty(event,1)"
																			oninput="validity.valid||(value='');"></td>
																		 <td ><input type="button" class="btn additem_btn" value="Add Item" onclick="addItem();"
												id="b1"/> </td>
																	</tr>
																</table>
															</td>
														</tr>

													</table>
												</div>
											</div> --%>
										</div>
									</div>




									<div class="col-md-2">
										<input name="rate1" id="rate1" type="hidden" value="00" />

										 <%-- <center>
											<button class="btn additem_btn" onclick="addItem();"
												id="b1">Add Item</button>
										</center> --%>
									</div>
								</div>


								<div class="clearfix"></div> <br /> <!-- Form End -->



								<div id="table-scroll" ><!-- class="table-scroll" -->
									<!-- <div id="faux-table" class="faux-table" aria="hidden"></div> -->
									<div class="table-wrap table-wrap-custbill">
										<table id="table_grid1" class="responsive-table" style="margin:0;"><!-- class="main-table small-td" -->
											<thead>
												<tr class="bgpink">
													<th class="col-sm-1">Sr no.</th>
													<th class="col-md-1">Invoice No</th> 
													<th class="col-md-2">Invoice Date</th>
													<th class="col-md-1">Supplier</th>
													<th class="col-md-1">Franchise</th>
													<th class="col-md-1">Grand Total</th>
													<th class="col-md-1">Action</th>
												</tr>
											</thead>
											<tbody>
											
											<%-- <c:forEach items="${otherBillHeaderlist}" var="itm" varStatus="count">
											
											<tr>
											
											<td style="text-align: center">${count.index+1}</td>
											<td style="text-align: center">${itm.invoiceNo}</td>
											<td style="text-align: center">${itm.billDate}</td>
											<td style="text-align: center">${itm.suppName}</td>
											<td style="text-align: center">${itm.frName}</td>
											<td style="text-align: center">${itm.grandTotal}</td>
											</tr>
											</c:forEach> --%>
											</tbody>

										</table>
									</div>
								</div>




							


								

							</li>
							<!--tab1-->

							 
						</ul>

					</div>
					<!--tabNavigation--

				</div>
				<!--rightSidebar-->

			</div>
			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<!--easyTabs-->
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

	<script type="text/javascript">
	
	$(document).ready(
			function() {

				$('#itemName1').change(
						function() {

							$.getJSON('${findItemRateById}', {
								id : $(this).val(),
								ajax : 'true'
							},
									function(data) {

										document.getElementById("barcode1")
												.setAttribute('value',
														data.itemId);

										$("#rateTdVal1").html(data.itemRate1);
									});
						});
			});
	
 	function showBill() {

		var custId = document.getElementById("suppId").value;		
		var fromDate = document.getElementById("datepicker1").value;
		var toDate = document.getElementById("datepicker2").value;
		var valid = true;
	
		if (fromDate == null || fromDate == "") {
				valid = false;
				alert("Please select from date");
			}			
		 
		else if (toDate == null || toDate == "") {
			valid = false;
			alert("Please select to date");
		}			
	
		if(fromDate > toDate){
			valid = false;
			alert("from date greater than todate ");
		}
		if(valid==true)
			{
		$('#loader').show();

		$
				.getJSON(
						'${getOtherBillBetweenDate}',

						{
							 
							custId : custId,
							fromDate : fromDate,
							toDate : toDate,
							ajax : 'true',

						},
						function(data) {

							$('#table_grid1 td').remove();
							$('#loader').hide();

							if (data == "") {
								alert("No records found !!");

							}
						 
						  $.each(
										data,
										function(key, itemList) {
										

											var tr = $('<tr></tr>');
											 
										  	tr.append($('<td></td>').html(key+1));
										  	/* tr.append($('<td></td>').html(itemList.billNo)); */
										  	tr.append($('<td></td>').html(itemList.invoiceNo));
										  	tr.append($('<td></td>').html(itemList.billDate));
										  	tr.append($('<td></td>').html(itemList.frName));
										  	tr.append($('<td></td>').html(itemList.suppName));
										  	tr.append($('<td></td>').html(itemList.grandTotal));
										  	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+itemList.billNo+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+itemList.billNo+')" class="fa fa-trash"></i></abbr>'));
										    $('#table_grid1 tbody').append(tr);

											 

										})  						  				
						});

			}
		
	
	}
	
	function edit(billNo) {
		//alert("editBill");
		window.open("${pageContext.request.contextPath}/editBill/"+billNo);
		
	} 
	
	function del(billNo) {
		alert("delBill:"+billNo);
		window.open("${pageContext.request.contextPath}/deleteBill/"+billNo);
	} 
	
	function changeQty(itemId)
	{
		
		//alert(itemId);
		var id = itemId;
		var index= parseInt(document.getElementById("index").value);
		var cgstPer=parseFloat(document.getElementById("cgstPer"+itemId).value);
		var sgstPer=parseFloat(document.getElementById("sgstPer"+itemId).value);
		var taxRate = cgstPer+sgstPer;
		document.getElementById("tax_rate"+itemId).innerText=taxRate;
		var qty=parseFloat(document.getElementById("qty"+itemId).value);
		var rate=parseFloat(document.getElementById("itemRate"+itemId).value); 
		var discPer=parseFloat(document.getElementById("discPer"+itemId).value);
		var baseRate = (rate*100)/(100+sgstPer+cgstPer);
		
		baseRate = (baseRate).toFixed(2);
		
		var val = parseFloat(qty*baseRate);
		
		var discAmt=parseFloat((discPer/100)*val);
		
		document.getElementById("disc_amt"+itemId).innerText=(discAmt).toFixed(2);
		var taxableAmt = (val-discAmt).toFixed(2); 
		document.getElementById("total_amt"+itemId).innerText=taxableAmt;
	
		 var taxRs = ((taxRate/100)*taxableAmt).toFixed(2); 
		 var grndTotal=parseFloat(taxableAmt)+parseFloat(taxRs); 
		 document.getElementById("grndTotal"+itemId).innerText=(grndTotal).toFixed(2);
		 	

						$.getJSON('${insertOtherItem}', {
							 id : id,
							 rate : rate,
							qty : qty,
							discPer :discPer, 
							ajax : 'true',
						},
								function(data) {
						//alert("sdf");
						 document.getElementById("grandTotal").value=(grandTotal).toFixed(2);
									/* document.getElementById("barcode1")
											.setAttribute('value',
													data.itemId);

									$("#rateTdVal1").html(data.itemRate1); */
								});
		
	}
	
	/* function submit(key)
	{
		var qty=document.getElementById("qty"+key).value;
		var discPer=document.getElementById("discPer"+key).value;
		document.getElementById("qty"+key).disabled = true; 
		document.getElementById("edit"+key).style.visibility="visible";
		document.getElementById("ok"+key).style.visibility="hidden";
		$
		.getJSON(
				'${updateQtyOtherBill}',

				{
					 
					index : key,
					updateQty : qty,
					discPer :discPer,
				
					ajax : 'true'

				},
				function(data) {
					
					$('#table_grid1 td').remove(); 
					var total=0;
					var taxAmt=0;
					var discTotal=0;

				  $.each(
								data,
								function(key, itemList) {
								

									var tr = $('<tr></tr>');
									 
									tr.append($('<td></td>').html(key+1));
								  	tr.append($('<td></td>').html(itemList.itemId));
								  	tr.append($('<td></td>').html(itemList.itemName));
								  	tr.append($('<td></td>').html('<input type="text" id="qty'+key+'" onkeyup="changeQty('+key+');" value="'+itemList.qty+'" class="form-control" disabled="true">')); 
								  	tr.append($('<td></td>').html('<input type="hidden" value="'+itemList.baseRate+'" id="itemBaseRate'+key+'" class="form-control" disabled="true"><h4>'+itemList.baseRate.toFixed(2)+'</h4>')); 
								  	tr.append($('<td></td>').html('<input type="text" id="discPer'+key+'" onkeyup="changeQty('+key+');" value="'+itemList.discPer+'" class="form-control" disabled="true">')); 
								  	tr.append($('<td ></td>').html('<h4 id="discAmt'+key+'" >'+itemList.discAmt.toFixed(2)+'</h4> ')); 
								  	tr.append($('<td ></td>').html('<h4 id="total'+key+'" >'+itemList.taxableAmt.toFixed(2)+'</h4> ')); 
								  	total=total+itemList.taxableAmt;
								  	taxAmt=taxAmt+itemList.itemTax3rs;
								  	discTotal=discTotal+itemList.discAmt;
								  	tr.append($('<td></td>').html('<input type="hidden" value="'+itemList.itemTax3+'" id="taxRate'+key+'" class="form-control" disabled="true"><h4>'+itemList.itemTax3.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<h4 id="taxRs'+key+'" >'+itemList.itemTax3rs.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<h4 id="grndTotal'+key+'" >'+itemList.grandTotal.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+key+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+key+')" class="fa fa-trash"></i></abbr>'));
								    $('#table_grid1 tbody').append(tr);

									 

								})  
								document.getElementById("totalSum").innerText = (total).toFixed(2);
				  				document.getElementById("totalSumText").value = (total).toFixed(2);
				  				document.getElementById("taxtotal").innerText = (taxAmt).toFixed(2);
				  				document.getElementById("taxtotalText").value = (taxAmt).toFixed(2);
				  				document.getElementById("grandTotal").innerText = (total+taxAmt).toFixed(2);
				  				document.getElementById("grandTotalText").value = (total+taxAmt).toFixed(2);
				  				document.getElementById("discTotal").innerText = (discTotal).toFixed(2);
				  				document.getElementById("discTotalText").value = (discTotal).toFixed(2);
					
					
					
				});
		
		
	} */
	
	/* function del(key)
	{
		//alert("key1"+key);
		var key=key;
		$('#loader').show();
		$
		.getJSON(
				'${deleteItemInOtherBill}',

				{
					 
					index : key,
					
				
					ajax : 'true'

				},
				function(data) {
					
					$('#table_grid1 td').remove();
					$('#loader').hide();

					if (data == "") {
						alert("No records found !!");
						document.getElementById("insert").disabled =true;

					}
					var total=0;
					var taxAmt=0;
					var discTotal=0;

				  $.each(
								data,
								function(key, itemList) {
								

									var tr = $('<tr></tr>');
									 
									tr.append($('<td></td>').html(key+1));
								  	tr.append($('<td></td>').html(itemList.itemId));
								  	tr.append($('<td></td>').html(itemList.itemName));
								  	tr.append($('<td></td>').html('<input type="text" id="qty'+key+'" onkeyup="changeQty('+key+');" value="'+itemList.qty+'" class="form-control" disabled="true">')); 
								  	tr.append($('<td></td>').html('<input type="hidden" value="'+itemList.baseRate+'" id="itemBaseRate'+key+'" class="form-control" disabled="true"><h4>'+itemList.baseRate.toFixed(2)+'</h4>')); 
								  	tr.append($('<td></td>').html('<input type="text" id="discPer'+key+'" onkeyup="changeQty('+key+');" value="'+itemList.discPer+'" class="form-control" disabled="true">')); 
								  	tr.append($('<td ></td>').html('<h4 id="discAmt'+key+'" >'+itemList.discAmt.toFixed(2)+'</h4> ')); 
								  	tr.append($('<td ></td>').html('<h4 id="total'+key+'" >'+itemList.taxableAmt.toFixed(2)+'</h4> ')); 
								  	total=total+itemList.taxableAmt;
								  	taxAmt=taxAmt+itemList.itemTax3rs;
								  	discTotal=discTotal+itemList.discAmt;
								  	tr.append($('<td></td>').html('<input type="hidden" value="'+itemList.itemTax3+'" id="taxRate'+key+'" class="form-control" disabled="true"><h4>'+itemList.itemTax3.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<h4 id="taxRs'+key+'" >'+itemList.itemTax3rs.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<h4 id="grndTotal'+key+'" >'+itemList.grandTotal.toFixed(2)+'</h4>'));
								  	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+key+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+key+')" class="fa fa-trash"></i></abbr>'));
								    $('#table_grid1 tbody').append(tr);

									 

								})  
								document.getElementById("totalSum").innerText = (total).toFixed(2);
				  				document.getElementById("totalSumText").value = (total).toFixed(2);
				  				document.getElementById("taxtotal").innerText = (taxAmt).toFixed(2);
				  				document.getElementById("taxtotalText").value = (taxAmt).toFixed(2);
				  				document.getElementById("grandTotal").innerText = (total+taxAmt).toFixed(2);
				  				document.getElementById("grandTotalText").value = (total+taxAmt).toFixed(2);
				  				document.getElementById("discTotal").innerText = (discTotal).toFixed(2);
				  				document.getElementById("discTotalText").value = (discTotal).toFixed(2);
	  				
					
				});
		
		
	} 
 */		function setCursor() {
			$("#barcode1").focus();

		}
	</script>

	<!-- document.getElementById("mySelect").value = "orange"; -->
</body>
</html>
