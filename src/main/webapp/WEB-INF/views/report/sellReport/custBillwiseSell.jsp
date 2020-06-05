
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<style>
.chosen-single{
text-align: left;
}
table, th, td {
	border: 1px solid #9da88d;
}

chosen-container {
	width: 82%;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
<body ><!-- onload="searchSellBill()" -->



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

	<c:url var="getCustomerBilwiselReport" value="/getCustomerBilwiselReport" />

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
							<h2 class="pageTitle">Customer wise Sell Report</h2>

						</div>
						<br>
					</div>

					<input type="hidden" name="frId" id="frId" value="${frId}">

					<div class="row">
						<br>
						<div class="form-group">

							<label class="col-sm-3 col-lg-2 control-label"
								style="text-align: right;">From Date </label>
							<div class="col-sm-6 col-lg-4">

								<input id="fromdatepicker" placeholder="From Date"
									class="texboxitemcode texboxcal float_l" name="from_Date"
									value="${fromDate}" type="text" autocomplete="off" size="35">
							</div>

							<label class="col-sm-3 col-lg-2 control-label"
								style="text-align: right;">To Date </label>
							<div class="col-sm-6 col-lg-4">

								<input id="todatepicker" placeholder="To Date" name="to_Date"
									class="texboxitemcode texboxcal float_l" autocomplete="off"
									value="${toDate}" type="text" size="35">
							</div>

						</div>
					</div>

					

					<div class="row">
						<br>
						<div class="form-group">
								<label class="col-sm-3 col-lg-2 control-label"
									style="text-align: right;">Customer </label>
								<div class="col-sm-6 col-lg-4">
	
									<select data-placeholder="Choose Customer" multiple="multiple"
										class="chosen-select chosen" tabindex="6" id="selCust"
										name="selCust">
	
										<option selected value="0" style="text-align: left;"><c:out value="All" /></option>
	
										<c:forEach items="${customerList}" var="cust" varStatus="count">
											<option value="${cust.custId}" style="text-align: left;"><c:out
													value="${cust.custName}-${cust.phoneNumber}" /></option>
										</c:forEach>
									</select>
	
								</div>
								
								<div class="col-sm-6 col-lg-6">
								
								<button class="buttonsaveorder" onclick="searchSellBill()">HTML
									View</button>

								<button class="btn btn-primary" value="PDF" id="PDFButton"
									onclick="genPdf()">PDF</button>
									
								</div>
						</div>
					</div>


					
					
					<div class="row">
						<br>
						<div class="form-group">

							
								
							

							<div align="center" id="loader" style="display: none">
								<span> <br>
									<h4>
										<font color="#343690">Loading</font>
									</h4>
								</span> <span class="l-1"></span> <span class="l-2"></span> <span
									class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
								<span class="l-6"></span>
							</div>

						</div>
					</div>
					

					<div class="row">
						<br>
						<div class="col-md-12">
							<!--table-->
							<div class="clearfix"></div>

<div class="table-responsive">
							<div id="table-scroll" class="table-scroll responsive-table-one">

								<div>
									<table id="table_grid" class="responsive-table">
										<thead>
											<tr class="bgpink">

												<th style="text-align: center;">Sr.No.</th>
												<!-- <th style="text-align: center;">Invoice No</th>
												<th style="text-align: center;">Bill Date</th> -->
												<th style="text-align: center; width: 40px;">Customer</th>
												<th style="text-align: center;">Disc%</th>
												<th style="text-align: center;">Disc Amt</th>
												<th style="text-align: center;">Taxable</th>
												<th style="text-align: center;">Total Tax</th>
												<th style="text-align: center;">Grand Total</th>
												<th style="text-align: center;">Payable Amt</th>
												<th style="text-align: center;">Paid Amt</th>
												<th style="text-align: center;">Remaining Amt</th>
												<th style="text-align: center;">Payment Mode</th>

											</tr>
										</thead>

										<tbody>

										</tbody>

									</table>

								</div>

							</div>
							</div>
							<!--table end-->
							<br>
							<div class="form-group" style="display: none;" id="range">



								<div class="col-sm-3  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();"
										disabled="disabled">
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
	<%-- <script src="${pageContext.request.contextPath}/resources/js/main.js"></script> --%>
	<!--easyTabs-->

	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>



	<script type="text/javascript">
	
	function custAge(val){
		//alert(val);	
		
		if (val==1) {
			$('#div_cust').show();
			$('#age_div').hide();
		} else {	
			$('#div_cust').hide();
			$('#age_div').show();
		}
	}
	
		function radioOption() {

			var val1 = document.getElementById("rdRem");
			var val2 = document.getElementById("rdPay");

			if (val1.checked == true) {
				$('#divRemAmt').show();
				$('#divPayOpt').hide();
			} else {
				$('#divRemAmt').hide();
				$('#divPayOpt').show();
			}

		}
	</script>


	<script type="text/javascript">
		function searchSellBill() {

			$('#table_grid td').remove();
			$('#loader').show();

			var isValid = validate();

			if (isValid) {
				var fromDate = document.getElementById("fromdatepicker").value;
				var toDate = document.getElementById("todatepicker").value;
				var cust = $("#selCust").val();

				//alert(JSON.stringify(cust));

				$
						.getJSON(
								'${getCustomerBilwiselReport}',
								{

									fromDate : fromDate,
									toDate : toDate,
									cust : JSON.stringify(cust),									
									ajax : 'true',

								},
								function(data) {

									$('#loader').hide();

									//alert( JSON.stringify(data));

									//$('#table_grid td').remove();

									if (data == "") {
										alert("No records found !!");
										document.getElementById("expExcel").disabled = true;
									}

									//	var cashTotal=0;
									//	var cardTotal=0;
									var amtTotal = 0;
									var taxableTotal = 0;
									var taxTotal = 0;
									var payableTotal = 0;
									var paidTotal = 0;
									var remainingTotal = 0;
									var ttlDiscAmt = 0;

									var cashTotal = 0;
									var cardTotal = 0;
									var epayTotal = 0;

									//var otherTotal=0;
									$
											.each(
													data,
													function(key, sellBillData) {

														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById('range').style.display = 'block';

														var tr = $('<tr class="responsive-table"></tr>');
														
														var cash = sellBillData.cash;
														var card = sellBillData.card;
														var epay = sellBillData.ePay;
														
														if(cash!=0 || card!=0 || epay!=0){

														tr
																.append($(
																		'<td  style="text-align:center;"></td>')
																		.html(
																				key + 1));

														/* tr
																.append($(
																		'<td  style="text-align:center;" ></td>')
																		.html(
																				sellBillData.invoiceNo));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.billDate)); */

														var cust = sellBillData.custName
																+ "_"
																+ sellBillData.phoneNumber;

														tr.append($(
																'<td ></td>')
																.html(cust));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				sellBillData.discountPer
																						.toFixed(2)));
														tr
														.append($(
																'<td style="text-align:right;"></td>')
																.html(addCommas(
																		sellBillData.discountAmt
																				.toFixed(2))));
														
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(addCommas(
																				sellBillData.taxableAmt
																						.toFixed(2))));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(addCommas(
																				sellBillData.totalTax
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(addCommas(
																				(sellBillData.grandTotal)
																						.toFixed(2))));
														tr
																.append($(
																		'<td  style="text-align:right;"></td>')
																		.html(addCommas(
																				(sellBillData.payableAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(addCommas(
																				(sellBillData.paidAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(addCommas(
																				(sellBillData.remainingAmt)
																						.toFixed(2))));

														amtTotal = amtTotal
																+ sellBillData.grandTotal;
														taxableTotal = taxableTotal
																+ sellBillData.taxableAmt;
														taxTotal = taxTotal
																+ sellBillData.totalTax;
														payableTotal = payableTotal
																+ sellBillData.payableAmt;
														paidTotal = paidTotal
																+ sellBillData.paidAmt;
														remainingTotal = remainingTotal
																+ sellBillData.remainingAmt;

														 cashTotal = cashTotal
																+ sellBillData.cash;
														cardTotal = cardTotal
																+ sellBillData.card;
														epayTotal = epayTotal
																+ sellBillData.ePay;
 
														ttlDiscAmt = ttlDiscAmt
																+sellBillData.discountAmt;
														
														var paymentMode = sellBillData.paymentMode;

														tr
																.append($(
																		'<td  style="text-align:right;"></td>')
																		.html(addCommas(
																				paymentMode)));

														$('#table_grid tbody')
																.append(tr);
													}
													})

									var tr = "<tr>";
									var total = "<td colspan='3'>&nbsp;&nbsp;&nbsp;<b> Total</b></td>";
									

									var totalDiscAmt = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (ttlDiscAmt).toFixed(2);

									var totalAmt = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (amtTotal).toFixed(2);
									+"</b></td>";

									var taxable = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (taxableTotal).toFixed(2);
									+"</b></td>";

									var tax = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (taxTotal).toFixed(2);
									+"</b></td>";

									var payable = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (payableTotal).toFixed(2);
									+"</b></td>";
									var paid = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (paidTotal).toFixed(2);
									+"</b></td>";
									var remaining = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (remainingTotal).toFixed(2);
									+"</b></td>";

									var payMode = cashTotal + "-Cash ,"
											+ cardTotal + "-Card ," + epayTotal
											+ "-E-pay";

									var pay = "<td style=text-align:right;><b>"
											+ addCommas(payMode) + "</b></td>";

									var td = "<td></td>";

									var trclosed = "</tr>";

									$('#table_grid tbody').append(tr);
									$('#table_grid tbody').append(tr);
									$('#table_grid tbody').append(total);									
									$('#table_grid tbody').append(
											addCommas(totalDiscAmt));
									$('#table_grid tbody').append(
											addCommas(taxable));
									$('#table_grid tbody').append(
											addCommas(tax));
									$('#table_grid tbody').append(
											addCommas(totalAmt));
									$('#table_grid tbody').append(
											addCommas(payable));
									$('#table_grid tbody').append(
											addCommas(paid));
									$('#table_grid tbody').append(
											addCommas(remaining));
									$('#table_grid tbody').append(pay);
									$('#table_grid tbody').append(trclosed);
									$('#table_grid tbody').append(trclosed);
								});

			}
		}
	</script>

	<script type="text/javascript">
		function getSelectValues(select) {
			var result = [];
			var options = select && select.options;
			var opt;

			for (var i = 0, iLen = options.length; i < iLen; i++) {
				opt = options[i];

				if (opt.selected) {
					result.push(opt.value || opt.text);
				}
			}
			return result;
		}
		
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
		 function addCommas(nStr) {
			nStr += '';
			x = nStr.split('.');
			x1 = x[0];
			x2 = x.length > 1 ? '.' + x[1] : '';
			var rgx = /(\d+)(\d{3})/;
			while (rgx.test(x1)) {
				x1 = x1.replace(rgx, '$1' + ',' + '$2');
			}
			return x1 + x2;
		} 

		/* function addCommas(x){
			
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
			} */ 
	</script>


	<script type="text/javascript">
		function validate() {

			var fromDate = $("#fromdatepicker").val();
			var toDate = $("#todatepicker").val();
			var cust = $("#selCust").val();

			//alert(cust);

			var isValid = true;

			if (fromDate == "" || fromDate == null) {

				isValid = false;
				alert("Please select From Date");
			} else if (toDate == "" || toDate == null) {

				isValid = false;
				alert("Please select To Date");
			} else if (cust == "" || cust == null) {

				isValid = false;
				alert("Please select Customer");
			}

			return isValid;

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
		})();

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>
	<script type="text/javascript">
		function genPdf() {
		
			var isValid = validate();
			if (isValid == true) {
				var fromDate = document.getElementById("fromdatepicker").value;
				var toDate = document.getElementById("todatepicker").value;
				var frId = document.getElementById("frId").value;
				var cust = $("#selCust").val();
				
				window
						.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showCustSellBillPdf/'
								+ fromDate
								+ '/'
								+ toDate
								+ '/'
								+ frId
								+ '/'
								+ cust);
			}

		}
	</script>



</body>
</html>
