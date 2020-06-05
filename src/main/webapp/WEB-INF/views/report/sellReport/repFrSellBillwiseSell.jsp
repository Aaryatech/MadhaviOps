
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<style>
/* .chosen-single {
	text-align: left;
} */
table, th, td {
	border: 1px solid #9da88d;
}

/* chosen-container {
	width: 82%;
} */
</style>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">
	
	

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
<body>
	<!-- onload="searchSellBill()" -->



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

	<c:url var="getBilwiselReport" value="/getBilwiselReport" />

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
							<h2 class="pageTitle">Billwise Sale Report</h2>

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
								style="text-align: right;">Choose Option </label>
							<div class="col-sm-6 col-lg-4" style="text-align: left;">

								<input type="radio" id="rdRem" name="radio" value="1"
									onchange="radioOption()" checked="checked">All/Pending
								Bill &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
									id="rdPay" onchange="radioOption()" name="radio" value="2">Payment
								Option
							</div>

							<div id="divRemAmt">

								<label class="col-sm-3 col-lg-2 control-label"
									style="text-align: right;">Choose Remaining Amt Option
								</label>
								<div class="col-sm-6 col-lg-4" style="text-align: left;">


									<select data-placeholder="Choose Remaining Amt Option"
										name="selRemOpt" tabindex="-1" id="selRemOpt"
										data-rule-required="true" class="chosen-select"
										style="text-align: left; width: 82%;" required="">

										<option selected value="1"><c:out value="All" /></option>
										<option value="2"><c:out value="Remaining Amount" /></option>
									</select>
								</div>

							</div>

							<div id="divPayOpt" style="display: none;">

								<label class="col-sm-3 col-lg-2 control-label"
									style="text-align: right;">Choose Payment Option </label>
								<div class="col-sm-6 col-lg-4" style="text-align: left;">

									<select data-placeholder="Choose Payment Option"
										name="selPayOpt" tabindex="-1" id="selPayOpt"
										data-rule-required="true" class="chosen-select"
										style="text-align: left; width: 82%;" required="required">

										<option selected value="0"><c:out value="All" /></option>
										<option value="1"><c:out value="Cash" /></option>
										<option value="2"><c:out value="Card" /></option>
										<option value="3"><c:out value="E-Pay" /></option>

									</select>

								</div>

							</div>


						</div>
					</div>

					<div class="row">
						<br>
						<div class="form-group">

							<label class="col-sm-3 col-lg-2 control-label"
								style="text-align: right;">Choose Option </label>
							<div class="col-sm-6 col-lg-4" style="text-align: left;">

								<input type="radio" id="idCust" name="opt" value="1"
									onchange="custAge(this.value)" checked="checked">Customer
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="idAge"
									onchange="custAge(this.value)" name="opt" value="2">
								Age Group
							</div>

							<div id="div_cust">
								<div class="form-group">

									<label class="col-sm-3 col-lg-2 control-label"
										style="text-align: right;">Customer </label>
									<div class="col-sm-6 col-lg-4">

										<select data-placeholder="Choose Customer" multiple="multiple"
											class="chosen-select" tabindex="6" id="selCust"
											name="selCust" multiple="multiple">


											<option selected value="0" style="text-align: left;"><c:out
													value="All" /></option>

											<c:forEach items="${customerList}" var="cust"
												varStatus="count">
												<option value="${cust.custId}" style="text-align: left;"><c:out
														value="${cust.custName}-${cust.phoneNumber}" /></option>
											</c:forEach>
										</select>

									</div>
								</div>
							</div>

							<div id="age_div" style="display: none;">
								<label class="col-sm-3 col-lg-2 control-label"
									style="text-align: right;">Age-Group </label>
								<div class="col-sm-6 col-lg-4">

									<select name="ageRange" id="ageRange"
										class="chosen-select chosen"
										style="text-align: left; font-size: 16px;">
										<option value="0" style="text-align: left;"><c:out
												value="Customer Age-Group" /></option>
										<option value="14-21" style="text-align: left;">14-21
											Years</option>
										<option value="22-28" style="text-align: left;">22-28
											Years</option>
										<option value="29-35" style="text-align: left;">29-35
											Years</option>
										<option value="36-42" style="text-align: left;">36-42
											Years</option>
										<option value="43-49" style="text-align: left;">43-49
											Years</option>
										<option value="50-56" style="text-align: left;">50-56
											Years</option>
										<option value="57 & above" style="text-align: left;">57
											& above</option>

									</select>

								</div>
							</div>
						</div>
					</div>


					<div class="row" style="display: none;">
						<br>
						<div class="form-group">

							<label class="col-sm-3 col-lg-2 control-label"
								style="text-align: right;">Payment Mode </label>
							<div class="col-sm-6 col-lg-4" style="text-align: left;">


								<select data-placeholder="Select Payment Mode" name="payMode"
									tabindex="-1" id="payMode" data-rule-required="true"
									class="chosen-select" style="text-align: left; width: 82%;"
									required="">

									<option selected value="0"><c:out value="All" /></option>
									<option value="1"><c:out value="Cash" /></option>
									<option value="2"><c:out value="Card" /></option>
									<option value="3"><c:out value="EPay" /></option>
									<option value="4"><c:out value="Debit Card" /></option>
									<option value="5"><c:out value="Credit Card" /></option>
									<option value="6"><c:out value="Bank Transaction" /></option>
									<option value="7"><c:out value="Paytm" /></option>
									<option value="8"><c:out value="Google Pay" /></option>
									<option value="9"><c:out value="Amazon Pay" /></option>


								</select>
							</div>

						</div>
					</div>




					<div class="row">
						<br>
						<div class="form-group">


							<button class="buttonsaveorder" onclick="searchSellBill()">HTML
								View</button>

							<button class="btn btn-primary" value="PDF" id="PDFButton"
								onclick="genPdf()">PDF</button>


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
													<th style="text-align: center;">Invoice No</th>
													<th style="text-align: center;">Bill Date</th>
													<th style="text-align: center; width: 40px;">Customer</th>
													<th style="text-align: center;">Disc%</th>
													<th style="text-align: center;">Disc Amt</th>
													<th style="text-align: center;">Taxable</th>
													<th style="text-align: center;">Total Tax</th>
													<th style="text-align: center;">Grand Total</th>
													<th style="text-align: center;">Payable Amt</th>
													<th style="text-align: center;">Paid Amt</th>
													<th style="text-align: center;">Remaining Amt</th>
													<th style="text-align: center;">Round Off</th>
													<th style="text-align: center;">Payment Mode</th>
													<th style="text-align: center;">Payment Sub Type</th>

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
		function custAge(val) {
			//alert(val);	

			if (val == 1) {
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
				//document.getElementById('btn_pdf').style.display = "block";
				var fromDate = document.getElementById("fromdatepicker").value;
				var toDate = document.getElementById("todatepicker").value;
				var age = document.getElementById("ageRange").value;
				//var cust = document.getElementById("selCust").value;
				var cust = $("#selCust").val();

				var rdRem = document.getElementById("rdRem");
				var rdpay = document.getElementById("rdPay");

				//var payMode = document.getElementById("payMode");

				var rdType = 0;
				var rdSubType = 0;

				//alert("jj");

				if (rdRem.checked == true) {
					rdType = "1";
					rdSubType = document.getElementById("selRemOpt").value;
				} else {
					rdType = "2";
					rdSubType = document.getElementById("selPayOpt").value;
				}

				//alert(JSON.stringify(cust));

				$
						.getJSON(
								'${getBilwiselReport}',
								{

									fromDate : fromDate,
									toDate : toDate,
									cust : JSON.stringify(cust),
									rdType : rdType,
									rdSubType : rdSubType,
									age : age,
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
									var roundTotal = 0;

									var subCashTotal = 0;
									var subCardTotal = 0;
									var subEpayTotal = 0;
									var subCreditCardTotal = 0;
									var subDebitCardTotal = 0;
									var subBankTrTotal = 0;
									var subPaytmTotal = 0;
									var subGooglePayTotal = 0;
									var subAmazonPayTotal = 0;

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

														/* if (cash != 0
																|| card != 0
																|| epay != 0) { */

														tr
																.append($(
																		'<td  style="text-align:center;"></td>')
																		.html(
																				key + 1));

														tr
																.append($(
																		'<td  style="text-align:center;" ></td>')
																		.html(
																				sellBillData.invoiceNo));

														tr
																.append($(
																		'<td style="text-align:center;"></td>')
																		.html(
																				sellBillData.billDate));

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
																		.html(
																				addCommas(sellBillData.discountAmt
																						.toFixed(2))));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				addCommas(sellBillData.taxableAmt
																						.toFixed(2))));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				addCommas(sellBillData.totalTax
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.grandTotal)
																						.toFixed(2))));
														tr
																.append($(
																		'<td  style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.payableAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.paidAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.remainingAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td   style="text-align:right;"></td>')
																		.html(
																				addCommas((sellBillData.roundOff)
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

														roundTotal = roundTotal
																+ sellBillData.roundOff;

														ttlDiscAmt = ttlDiscAmt
																+ sellBillData.discountAmt;

														var paymentMode = sellBillData.paymentMode;

														var pMode = "";
														var ch = sellBillData.cash;
														var cd = sellBillData.card;
														var ep = sellBillData.ePay;

														if (sellBillData.cash > 0) {
															pMode = ch
																	+ "-Cash";
														}
														if (sellBillData.card > 0) {
															pMode = pMode
																	+ "&nbsp;&nbsp;&nbsp;"
																	+ cd
																	+ "-Card";
														}
														if (sellBillData.ePay > 0) {
															pMode = pMode
																	+ "&nbsp;&nbsp;&nbsp;"
																	+ ep
																	+ "-E-pay";
														}

														tr
																.append($(
																		'<td  style="text-align:center;"></td>')
																		.html(
																				pMode));

														/* PAYMENT SUB TYPE */

														var payType = "";
														var str_arr = sellBillData.frName
																.split(',');

														for (i = 0; i < str_arr.length; i++) {

															if (str_arr[i] === "1") {
																payType = ch
																		+ "-Cash";
																subCashTotal = subCashTotal
																		+ ch;
															}
															if (str_arr[i] === "2") {
																payType = payType
																		+ ", "
																		+ cd
																		+ "-Card";
																subCardTotal = subCardTotal
																		+ cd;
															}
															if (str_arr[i] === "3") {
																payType = payType
																		+ ", "
																		+ ep
																		+ "-Epay";
																subEpayTotal = subEpayTotal
																		+ ep;
															}
															if (str_arr[i] === "4") {
																payType = payType
																		+ ", "
																		+ cd
																		+ "-Debit Card";
																subDebitCardTotal = subDebitCardTotal
																		+ cd;
															}
															if (str_arr[i] === "5") {
																payType = payType
																		+ ", "
																		+ cd
																		+ "-Credit Card";
																subCreditCardTotal = subCreditCardTotal
																		+ cd;
															}
															if (str_arr[i] === "6") {
																payType = payType
																		+ ", "
																		+ ep
																		+ "-Bank Transaction";
																subBankTrTotal = subBankTrTotal
																		+ ep;
															}
															if (str_arr[i] === "7") {
																payType = payType
																		+ ", "
																		+ ep
																		+ "-Paytm";
																subPaytmTotal = subPaytmTotal
																		+ ep;
															}
															if (str_arr[i] === "8") {
																payType = payType
																		+ ", "
																		+ ep
																		+ "-Google Pay";
																subGooglePayTotal = subGooglePayTotal
																		+ ep;
															}
															if (str_arr[i] === "9") {
																payType = payType
																		+ ", "
																		+ ep
																		+ "-Amazon Pay";
																subAmazonPayTotal = subAmazonPayTotal
																		+ ep;
															}

														}

														payType = payType
																.replace(/^,/,
																		'');

														tr
																.append($(
																		'<td  style="text-align:center;"></td>')
																		.html(
																				payType));

														$('#table_grid tbody')
																.append(tr);
														//}

													})

									var tr = "<tr>";
									var total = "<td colspan='5'>&nbsp;&nbsp;&nbsp;<b> Total</b></td>";

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

									var round = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
											+ (roundTotal).toFixed(2);
									+"</b></td>";

									var payMode = cashTotal
											+ "-Cash,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ cardTotal
											+ "-Card,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ epayTotal + "-E-pay";

									var pay = "<td style=text-align:center;><b>"
											+ addCommas(payMode) + "</b></td>";

									var subPayMode = "<td style=text-align:center;><b>"
											+ addCommas(subCashTotal)
											+ "-Cash,&nbsp;&nbsp;&nbsp;&nbsp;"
											/* + addCommas(subCardTotal)
											+ "-Card,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ addCommas(subEpayTotal)
											+ "-E-Pay,<br>" */
											+ addCommas(subDebitCardTotal)
											+ "-Debit Card,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ addCommas(subCreditCardTotal)
											+ "-Credit Card,<br>"
											+ addCommas(subBankTrTotal)
											+ "-Bank Transaction,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ addCommas(subPaytmTotal)
											+ "-Paytm,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ addCommas(subGooglePayTotal)
											+ "-Google Pay,&nbsp;&nbsp;&nbsp;&nbsp;"
											+ addCommas(subAmazonPayTotal)
											+ "-Amazon Pay" + "</b></td>";

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
									$('#table_grid tbody').append(
											addCommas(round));
									$('#table_grid tbody').append(pay);
									$('#table_grid tbody').append(subPayMode);

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

		function addCommas(x) {

			x = String(x).toString();
			var afterPoint = '';
			if (x.indexOf('.') > 0)
				afterPoint = x.substring(x.indexOf('.'), x.length);
			x = Math.floor(x);
			x = x.toString();
			var lastThree = x.substring(x.length - 3);
			var otherNumbers = x.substring(0, x.length - 3);
			if (otherNumbers != '')
				lastThree = ',' + lastThree;
			return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",")
					+ lastThree + afterPoint;
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
				var age = document.getElementById("ageRange").value;
				var cust = $("#selCust").val();

				var rdRem = document.getElementById("rdRem");
				var rdpay = document.getElementById("rdPay");

				var rdType = 0;
				var rdSubType = 0;

				//alert("jj");

				if (rdRem.checked == true) {
					rdType = "1";
					rdSubType = document.getElementById("selRemOpt").value;
				} else {
					rdType = "2";
					rdSubType = document.getElementById("selPayOpt").value;
				}

				window
						.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showSellBillwiseReportPdf/'
								+ fromDate
								+ '/'
								+ toDate
								+ '/'
								+ frId
								+ '/'
								+ cust
								+ '/'
								+ rdType
								+ '/'
								+ rdSubType
								+ '/'
								+ age);
			}

		}
	</script>



</body>
</html>
