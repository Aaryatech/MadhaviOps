<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/newpos/images/favicon.png"
	type="images/png" sizes="32x32">
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<style>
.alert1 {
	padding: 10px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 25px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 18px;
	line-height: 10px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

.form-control {
	text-align: left !important;
}
</style>
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
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/custom.css"
	rel="stylesheet" type="text/css" />

<!--rightNav-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">

</head> --%>
<body onload="calClosingAmt()">
	<!-- getData() -->

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/loader.css">
	<!--datepicker-->
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
	<!--datepicker-->


	<c:url var="getPettyCashData" value="/getPettyCashData"></c:url>
	<c:url var="getPettyCashHandOverData" value="/getPettyCashHandOverData"></c:url>


	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->


		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>


		<!--topHeader-->





		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2 single">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />
				</jsp:include>


				<!--leftNav-->
				<div class="colOuter">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<c:if test="${not empty message}">
							<div class="alert1">
								<span class="closebtn"
									onclick="this.parentElement.style.display='none';">&times;</span>
								${message}
							</div>
						</c:if>
					</div>
				</div>

				<!--rightSidebar-->
				<div class="main_container">

					<div class="page_head">
						<div class="page_title">Petty Cash Management</div>
						<div class="custom_right">
							<a
								href="${pageContext.request.contextPath}/getPettyCashTransactions"><input
								type="button" value="Petty Cash Details"
								class="buttonsaveorder singlebtn"> </a>
						</div>
					</div>


					<form action="${pageContext.request.contextPath}/addPettyCash"
						method="post"
						onsubmit="return confirm('Do you want to Day End ?');">
						<input type="hidden" value="${pettycash.pettycashId}"
							name="petty_id"> <input type="hidden"
							value="${pettycash.cashAmt}" name="cash_edit_amt">
						<div class="frm_row_one">
							<div class="four_one three">
								<div class="multi_title">Date</div>
								<input id="fromdate" class="form-control" readonly="readonly"
									autocomplete="off" placeholder="Date" name="cash_date"
									type="text" value="${pettycash.date}" onchange="compareDate()">
							</div>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0" value="${pettycash.openingAmt}"
								groupingUsed="false" var="openingAmt" />
							<div class="four_one three">
								<div class="multi_title">Opening Amt</div>
								<input id="opening_amt" class="form-control" readonly="readonly"
									value="${openingAmt}" autocomplete="off"
									placeholder="Opening Amt" name="opening_amt" type="text">
							</div>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="todaysBillTotal" />

							<div class="four_one three">
								<div class="multi_title">Today's Amt</div>
								<input id="cash_amt" class="form-control"
									value="${todaysBillTotal}" autocomplete="off"
									placeholder="Today's Amt" name="cash_amt"
									onchange="calClosingAmt()" type="text" readonly="readonly"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<div class="four_one three">
								<div class="multi_title">Withdrawal Amt</div>
								<input id="withdrawal_amt" class="form-control"
									value="${pettycash.withdrawalAmt}" autocomplete="off"
									placeholder="Withdrawal Amt" name="withdrawal_amt" type="text"
									onblur="calClosingAmt()"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							</div>
							<div class="four_one three">
								<div class="multi_title">Closing Amt</div>
								<input id="closing_amt" class="form-control" readonly="readonly"
									autocomplete="off" placeholder="Closing Amt" name="closing_amt"
									type="text">
							</div>

							<div class="four_one extra_margin">

								<c:if test="${isDayEnd==1}">
									<input class="buttonsaveorder" value="Day End" type="submit"
										id="btnsub">
								</c:if>

								<c:if test="${isDayEnd==0}">
									<input class="buttonsaveorder" value="Day End" type="submit"
										id="btnsub" style="display: none;">
								</c:if>


								<input class="buttonsaveorder redbtn" value="Cash Hand Over"
									type="button" id="show">
							</div>

						</div>
					</form>


					<div class="second_titlerow" id="pc_div" style="display: none;">
						<div class="page_head">
							<div class="page_title">Petty Cash Hand Over</div>
							<div class="custom_right">
								<a href="#"
									class="buttonsaveorder singlebtn initialism slide_open"
									id="popbtn" style="display: none;" onclick="getData()">
									Cash Hand Over Data</a>
							</div>
						</div>

						<form action="insertPettyCashHandOver" method="POST"
							id="petty_cash_hand" name="petty_cash_hand">
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0" value="${pettycash.openingAmt}"
								groupingUsed="false" var="handoverOpeningAmt" />
							<div class="four_one three">
								<div class="multi_title">Opening Amt</div>
								<input id="open_amt" class="form-control"
									value="${handoverOpeningAmt}" autocomplete="off"
									placeholder="Opening Amt" name="open_amt" readonly="readonly"
									type="text">
							</div>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="sellingTotal" />
							<div class="four_one three">
								<div class="multi_title">Selling Amt</div>
								<input id="sell_amt" class="form-control"
									value="${sellingTotal}" autocomplete="off"
									placeholder="Selling Amt" name="sell_amt" readonly="readonly"
									type="text">
							</div>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${pettycash.openingAmt+trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="handOverTotal" />
							<div class="four_one three">
								<div class="multi_title">Total Cash Hand Over Amt</div>
								<input id="total_cash_amt" class="form-control"
									value="${handOverTotal}" autocomplete="off"
									placeholder="Total Cash Amt" name="total_cash_amt"
									readonly="readonly" type="text">
							</div>
							<fmt:formatNumber type="number" maxFractionDigits="0"
								minFractionDigits="0"
								value="${pettycash.openingAmt+trCashAmt+advAmt-expAmt-creditNote}"
								groupingUsed="false" var="actHandOverTotal" />
							<div class="four_one three">
								<div class="multi_title">Actual Cash Hand Over Amt</div>
								<%-- <input id="actual_cash_amt"  class="form-control" value="${totalCash}"
										autocomplete="off" placeholder="Actual Cash Amt" name="actual_cash_amt"
										type="text"> --%>
								<input id="actual_cash_amt" class="form-control"
									value="${actHandOverTotal}" autocomplete="off"
									placeholder="Actual Cash Amt" name="actual_cash_amt"
									type="text">

							</div>
							<div class="four_one three" style="display: none;">
								<div class="multi_title">From Employee</div>
								<select name="from_emp" id="from_emp" class="form-control"
									required>
									<option style="text-align: left;" value="0">Select
										Employee</option>
									<c:forEach items="${empList}" var="empList">
										<c:if test="${frId == empList.frEmpId}"></c:if>
										<option selected="selected"
											value="${empList.frEmpId}-${empList.frEmpName}"
											style="text-align: left;">${empList.frEmpName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="four_one three">
								<div class="multi_title">To Employee</div>
								<select name="to_emp" id="to_emp" class="form-control" required>
									<option style="text-align: left;" value="0">Select
										Employee</option>
									<c:forEach items="${empList}" var="empList">
										<c:if test="${empList.frEmpId != loginEmpId}">
											<option value="${empList.frEmpId}-${empList.frEmpName}"
												style="text-align: left;">${empList.frEmpName}</option>
										</c:if>
									</c:forEach>

								</select>
							</div>
							<div class="four_one extra_margin">
								<input class="buttonsaveorder" value="Submit" type="submit"
									id="btnsub2"> <input class="buttonsaveorder redbtn"
									value="Close" type="button" id="hide">
							</div>
							<div class="four_one"></div>
							<div class="four_one"></div>

						</form>
					</div>









					<!-- Petti Cash Hand Over Div Close -->
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
	<div>
		<div id="slide" class="pending_pop">

			<div class="row">
				<button class="slide_close">
					<i class="fa fa-times" aria-hidden="true"></i>
				</button>
				<h2 class="page_title" id="add_cust_head_name">Petty Cash Hand
					Over Transaction</h2>
				<div class="clr"></div>


				<div class="pop_date">
					<div class="pop_date_one">
						<div class="pop_date_txt">From Date :-</div>
						<div class="pop_date_fld">

							<input name="fromDate" id="fromDate" type="date"
								class="datepicker_fld" value="${dateForSearch}" />
						</div>
					</div>

					<div class="pop_date_one">
						<div class="pop_date_txt">To Date :-</div>
						<div class="pop_date_fld">
							<input name="toDate" id="toDate" type="date"
								class="datepicker_fld" value="${dateForSearch}" />
						</div>
					</div>

					<div class="pop_date_btn">
						<button class="buttonsaveorder" onclick="getData()">Search
						</button>
					</div>

					<div align="center" id="loader" style="display: none">

						<span>
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
				<div class="col-md-12">
					<!--table-->
					<div class="clearfix"></div>

					<div class="pending_tab" style="overflow-x: auto; height: 350px;">
						<table class="pending_tab1" id="table_grid">
							<thead>
								<tr>
									<th>Sr. No</th>
									<th>Transaction Date</th>
									<th>From Employee</th>
									<th>To Employee</th>
									<th>Opening Amt</th>
									<th>Selling Amt</th>
									<th>Total Cash Amt</th>
									<th>Actual Cash Hand Over</th>
									<th>Difference</th>
									<th>Emp Sell</th>

								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>
	<!--easyTabs-->
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->

	<script>
		$(document).ready(function($) {

			$("#petty_cash_hand").submit(function(e) {

				var isError = false;
				var errMsg = "";

				/*  var e1 = $("#from_emp").val();
				 if(e1 == 0){			 
					 alert("Select From Employee");
					 return false;
				 } */

				var e2 = $("#to_emp").val();
				if (e2 == 0) {

					alert("Select To Employee");
					return false;
				}

			});
		});

		$(document).ready(function() {
			$("#hide").click(function() {
				$("#pc_div").hide();
			});
			$("#show").click(function() {
				$("#pc_div").show();
			});

			$("#hide").click(function() {
				$("#popbtn").hide();
			});
			$("#show").click(function() {
				$("#popbtn").show();
			});

		});

		function compareDate() {
			var selDate = $("#fromdatepicker").val();

			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
			var yyyy = today.getFullYear();
			today = dd + '-' + mm + '-' + yyyy;

			var from_date = selDate;
			var to_date = today;
			var x = 0;
			//alert("Date---"+to_date+"*******++**** "+from_date);

			var fromdate = from_date.split('-');
			from_date = new Date();
			from_date.setFullYear(fromdate[2], fromdate[1] - 1, fromdate[0]);
			var todate = to_date.split('-');
			to_date = new Date();
			to_date.setFullYear(todate[2], todate[1] - 1, todate[0]);
			if (from_date > to_date) {
				// alert("buttn Disabled")
				document.getElementById("btnsub").disabled = true;
				alert("Invalid Date");
			} else {
				document.getElementById("btnsub").disabled = false;
			}
		}

		function calClosingAmt() {

			var cashAmt = parseFloat($("#cash_amt").val());
			var openAmt = parseFloat($("#opening_amt").val());
			var withdrawAmt = parseFloat($("#withdrawal_amt").val());

			//alert(withdrawAmt);

			if (Number.isNaN(cashAmt)) {
				cashAmt = 0;
				document.getElementById("cash_amt").value = 0.0;
			}

			if (Number.isNaN(withdrawAmt)) {
				withdrawAmt = 0;
				document.getElementById("withdrawal_amt").value = 0.0;
			}

			var closeAmt = openAmt + cashAmt - withdrawAmt;

			document.getElementById("closing_amt").value = parseFloat(closeAmt)
					.toFixed(0);
		}
	</script>

	<!-- Select Only Month and Year -->
	<script>
		function getData() {
			$('#loader').show();
			$('#table_grid td').remove();
			var isValid = validate();

			if (isValid) {

				var fromDate = document.getElementById("fromDate").value;
				var toDate = document.getElementById("toDate").value;
				$
						.getJSON(
								'${getPettyCashHandOverData}',

								{

									fromDate : fromDate,
									toDate : toDate,
									ajax : 'true'

								},
								function(data) {
									$('#loader').hide();

									//$('#table_grid tbody').remove(); 

									$
											.each(
													data,
													function(key, cashHndOvr) {
														//alert(JSON.stringify(cashHndOvr));
														$('#loader').hide();

														/* document.getElementById("expExcel").disabled = false;
														document.getElementById("PDFButton").disabled = false;

														if (data == "") {
															alert("No records found !!");
															document.getElementById("expExcel").disabled = true;
															document.getElementById("PDFButton").disabled = true;
														
														} */

														var tr = $('<tr  ></tr>');

														tr.append($(
																'<td  ></td>')
																.html(key + 1));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.transactionDate));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.fromUsername));
														tr
																.append($(
																		'<td  ></td>')
																		.html(
																				cashHndOvr.toUsername));

														tr
																.append($(
																		'<td style="text-align:right"></td>')
																		.html(
																				cashHndOvr.openingAmt));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.sellingAmt));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.actualAmtHandover));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.amtHandover));

														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.actualAmtHandover
																						- cashHndOvr.amtHandover));
														tr
																.append($(
																		'<td style="text-align:right;"></td>')
																		.html(
																				cashHndOvr.exVar1));

														//	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+key+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+key+')" class="fa fa-trash"></i></abbr>'));
														$('#table_grid tbody')
																.append(tr);

													})
								});
			}

		}
	</script>
	<script type="text/javascript">
		function validate() {

			var fromDate = $("#fromDate").val();
			var toDate = $("#toDate").val();

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
	</script>
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("table_grid");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
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

	<script type="text/javascript">
		function genPdf() {
			/* alert("hiii"); */
			/* var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			alert(fromDate);
			alert(toDate); */

			var selectRate = document.getElementById('select_rate').value;

			window
					.open('${pageContext.request.contextPath}/showStockDetailsPdf/'
							+ selectRate);
			/* document.getElementById("expExcel").disabled = true; */

		}

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		}
	</script>



</body>

</html>