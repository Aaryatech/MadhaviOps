<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">

<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>Madhvi</title>


<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css"/>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>	
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
	
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#menuzord").menuzord({
		align:"left"
	});
});
</script>
<!--rightNav-->



</head> --%>

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#todatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#fromdatepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>
<!--datepicker-->
<body onload="return searchSellBill()">

	<c:url var="getSellBillHeader" value="/getSellBillHeader" />

	<div class="sidebarOuter"></div>

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

				<!-- Place Actual content of page inside this div -->
				<div class="sidebarright">


					<div class="row">
						<br>
						<div class="col-md-12">
							<h2 class="pageTitle">View Bills</h2>
						</div>
						<br>
					</div>
					<%
						String frmDate = session.getAttribute("fromSellBillDate").toString();
						String tDate = session.getAttribute("toSellBillDate").toString();
					%>
					<div class="row">

						<div class="col-md-2" style="float:none;">
							<h4 class="pull-left">From Date:-</h4>
						</div>
						<div class="col-md-2 "  >
							<input id="fromdatepicker" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="DD-MM-YYYY" name="fromDate"
								type="text" value="<%=frmDate%>">
						</div>
						<div class="col-md-1"  >
							<h4 class="pull-left">To Date:-</h4>
						</div>
						<div class="col-md-2 "  >
							<input id="todatepicker" class="texboxitemcode texboxcal"
								autocomplete="off" placeholder="DD-MM-YYYY" name="toDate"
								type="text" value="<%=tDate%>">
						</div>
						<div class="col-md-2">
							<button class="buttonsaveorder" onclick="searchSellBill()">Search</button>
						</div>

					</div>

					<div align="center" id="loader" style="display: none">
						<span> <br>
							<h4>
								<font color="#343690">Loading</font>
							</h4>
						</span> <span class="l-1"></span> <span class="l-2"></span> <span
							class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
						<span class="l-6"></span>
					</div>

					<input name="frtype" id="frtype" type="hidden" value="${frtype}" />
					<div class="row">
						<div class="col-md-12">
							<!--table-->
							<div class="clearfix"></div>


							<div id="table-scroll">
								<!-- class="table-scroll" -->
								<div id="faux-table" aria="hidden">
									<!-- class="faux-table" -->
									<table width="100%" border="1" cellspacing="0" cellpadding="1"
										id="table_grid" class="main-table" style="display: none;">
										<thead>
											<tr class="bgpink">
												<th style="text-align: center;">Sr No</th>
												<th style="text-align: center;">Invoice No</th>
												<th style="text-align: center;">Bill Date</th>
												<th style="text-align: center;">Grand Total</th>
												<th style="text-align: center;">Payable Amount</th>
												<th style="text-align: center;">Paid Amount</th>
												<!-- 									<th style="text-align:center;">Paymode</th>
 -->
												<th style="text-align: center;">Bill Type</th>
												<th style="text-align: center;">Action</th>
											</tr>
										</thead>
										<tbody>

										</tbody>
									</table>
								</div>
								<div class="table-wrap">

									<table width="100%" border="1" cellspacing="0" cellpadding="1"
										id="table_grid" class="responsive-table">
										<!-- class="main-table" -->
										<thead>
											<tr class="bgpink">
												<th style="text-align: center;">Sr No</th>
												<th style="text-align: center;">Invoice No</th>
												<th style="text-align: center;">Bill Date</th>
												<th style="text-align: center;">Grand Total</th>
												<th style="text-align: center;">Payable Amount</th>
												<th style="text-align: center;">Paid Amount</th>
												<!-- 									<th style="text-align:center;">Paymode</th>
 -->
												<th style="text-align: center;">Bill Type</th>

												<th style="text-align: center;">Action</th>
											</tr>
										</thead>
										<tbody>

										</tbody>

									</table>

								</div>
							</div>
						</div>
						<!--table end-->

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


	<script type="text/javascript">
		function searchSellBill() {
			
			$('#loader').show();
			
			$('#table_grid td').remove();
			var isValid = validate();

			if (isValid) {

				var fromDate = document.getElementById("fromdatepicker").value;
				var toDate = document.getElementById("todatepicker").value;

				var grandTot=0,payableTot=0,paidTot=0;
				
				
				$
						.getJSON(
								'${getSellBillHeader}',
								{

									fromDate : fromDate,
									toDate : toDate,
									ajax : 'true',

								},
								function(data) {
									
									$('#loader').hide();

									//$('#table_grid td').remove();

									if (data == "") {
										alert("No records found !!");

									}
									//alert(data);

									$
											.each(
													data,
													function(key, sellBillData) {

														var index = key + 1;

														var tr = $('<tr></tr>');
														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				key + 1));
														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.invoiceNo));
														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.billDate));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.grandTotal)
																						.toFixed(2))));
														
														grandTot=grandTot+sellBillData.grandTotal;
														
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.payableAmt)
																						.toFixed(2))));
														
														payableTot=payableTot+sellBillData.payableAmt;

				
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.paidAmt)
																						.toFixed(2))));
														
														paidTot=paidTot+sellBillData.paidAmt;
														
														
														/* var payMode="";
														if(sellBillData.paymentMode==1)
														payMode="Cash";
														else if(sellBillData.paymentMode==2)
														payMode="Card";	
														else if(sellBillData.paymentMode==3)
														payMode="Other";	
														
														tr.append($('<td style="text-align:center;"></td>').html(payMode)); */
														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.billType));
														if (sellBillData.billType == 'S') {
															if ((sellBillData.invoiceNo).length > 1) {
																tr
																		.append($(
																				' <td style="text-align:center;"></td>')
																				.html(
																						'SP &nbsp; <a  href="" onclick="return custBillPdf('
																								+ sellBillData.sellBillNo
																								+ ',\''
																								+ sellBillData.billType
																								+ ');"><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></a> '));
															} else {
																tr
																		.append($(
																				'<td style="text-align:center;"></td>')
																				.html(
																						"SP"));
															}
														} else {
															if (sellBillData.grandTotal > 0)
																tr
																		.append($(
																				'<td style="text-align:center;"></td>')
																				.html(
																						"<a href=${pageContext.request.contextPath}/viewBillDetails?sellBillNo="
																								+ sellBillData.sellBillNo
																								+ '&billDate='
																								+ sellBillData.billDate
																								+ ' class="action_btn" name='
																								+ '><abbr title="Details"><i class="fa fa-list"></i></abbr></a> &nbsp;&nbsp;&nbsp; <a  href=""onclick="return custBillPdf('
																								+ sellBillData.sellBillNo
																								+ ',\''
																								+ sellBillData.billType
																								+ '\');"><abbr title="PDF"><i class="fa fa-file-pdf-o"></i></abbr></a> '));
															else
																tr
																		.append($(
																				'<td style="text-align:center;"></td>')
																				.html(
																						""));

														}

														$('#table_grid tbody')
																.append(tr);

													})
													
													
													var tr = $('<tr></tr>');
														tr.append($('<td colspan="3"></td>').html("TOTAL"));
														
														tr.append($('<td></td>').html(""+addCommas(grandTot.toFixed(2))));
														
														tr.append($('<td></td>').html(""+addCommas(payableTot.toFixed(2))));
														tr.append($('<td></td>').html(""+addCommas(paidTot.toFixed(2))));
														
														tr.append($('<td></td>').html(""));
														tr.append($('<td></td>').html(""));
														
													
													$('#table_grid tbody')
													.append(tr);	

								});
				/* 			<a href=${pageContext.request.contextPath}/editBillDetails?sellBillNo='+ sellBillData.sellBillNo+'&billDate='+sellBillData.billDate+' class="action_btn" name='+'><abbr title="edit"><i class="fa fa-edit"></i></abbr></a>
				 */}

		}

		function custBillPdf(sellBillNo, type) {
			var frtype = document.getElementById("frtype").value;
			var loginWindow = window.open('', 'UserLogin');
			if (type == 'S') {
				loginWindow.location.href = '${pageContext.request.contextPath}/printBillOfSupply/'
						+ sellBillNo;
			} else {
				if (frtype == 10000000) {
					loginWindow.location.href = '${pageContext.request.contextPath}/printBillOfInvoice/'
							+ sellBillNo;
				} else {
					loginWindow.location.href = '${pageContext.request.contextPath}/printBillOfSupply/'
							+ sellBillNo;
				}

			}
		}
	</script>
	
	
	<script type="text/javascript">
	
	 function addCommas(x){

		 x=String(x).toString();
		  var afterPoint = '';
		  if(x.indexOf('.') > 0)
		     afterPoint = x.substring(x.indexOf('.'),x.length);
		  x = Math.floor(x);
		  x=x.toString();
		  var lastThree = x.substring(x.length-3);
		  var otherNumbers = x.substring(0,x.length-3);
		  if(otherNumbers != '')
		      lastThree = ',' + lastThree;
		  return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
		 }
	 
	</script>
	
	
	
	<script type="text/javascript">
		function validate() {

			var fromDate = $("#fromdatepicker").val();
			var toDate = $("#todatepicker").val();

			var isValid = true;

			if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			} else if (toDate == "" || toDate == null) {

				isValid = false;
				alert("Please select To Date");
			}
			return isValid;

		}

		(function() {
			var fauxTable = document.getElementById("faux-table");
			var mainTable = document.getElementById("table_grid");
			var clonedElement = table_grid.cloneNode(true);
			var clonedElement2 = table_grid.cloneNode(true);
			clonedElement.id = "";
			clonedElement2.id = "";
			fauxTable.appendChild(clonedElement);
			fauxTable.appendChild(clonedElement2);
		})();
	</script>

</body>
</html>
