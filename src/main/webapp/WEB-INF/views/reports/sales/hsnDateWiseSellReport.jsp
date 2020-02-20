<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style type="text/css">
.hide-calendar .ui-datepicker-calendar {
	display: none;
}

.table-scroll {
	position: relative;
	margin: auto;
	overflow: hidden;
}

.table-wrap {
	width: 100%;
	overflow: auto;
}

.table-scroll table {
	width: 100%;
	margin: auto;
	border-collapse: collapse;
	border-spacing: 0;
}

.table-scroll th, .table-scroll td {
	padding: 5px 10px;
	border: 1px solid #000;
	background: #fff;
	white-space: nowrap;
	vertical-align: top;
	font-weight: normal;
}

.table-scroll thead, .table-scroll tfoot {
	background: #f9f9f9;
}

.clone {
	position: absolute;
	top: 0;
	left: 0;
	pointer-events: none;
}

.clone th, .clone td {
	visibility: hidden
}

.clone td, .clone th {
	border-color: transparent
}

.clone tbody th {
	visibility: visible;
	color: red;
}

.clone .fixed-side {
	border: 1px solid #000;
	background: #eee;
	visibility: visible;
}

.clone thead, .clone tfoot {
	background: transparent;
}
</style>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>

<!DOCTYPE html>
<html>

<body>

	<!--datepicker-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#toDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#fromDate").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>
	<!--datepicker-->


	<c:url var="getBillList" value="/getHsnDateWiseDataAjax"></c:url>


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


					<form id="submitBillForm"
						action="${pageContext.request.contextPath}/displayYearlyReport"
						method="get">

						<div class="row">
							<div class="col-md-12">
								<h2 class="pageTitle">Bill wise HSN Wise Report</h2>
							</div>
						</div>


						<input type="hidden" name="frId" id="frId" value="${frId}">




						<div class="row">


							<div class="form-group">
								<div class="col-sm-3 col-lg-2	">From Date</div>
								<div class="col-sm-6 col-lg-2 controls date_select">
									<input class="texboxitemcode texboxcal"
										placeholder="DD-MM-YYYY" id="fromDate" name="fromDate"
										size="30" type="text" value="${todaysDate}" />
								</div>


								<div class="col-sm-3 col-lg-2	">To Date</div>
								<div class="col-sm-6 col-lg-2 controls date_select">
									<input class="texboxitemcode texboxcal"
										placeholder="DD-MM-YYYY" id="toDate" name="toDate" size="30"
										type="text" value="${todaysDate}" />
								</div>

								<div class="col-md-3"
									style="margin-top: 3px; text-align: right;">
									<input type="button" id="submit" class="buttonsaveorder"
										value="Search" onclick="searchReport()">


									<input
									class="btn btn-primary" value="PDF" id="PDFButton"
									onclick="genPdf()" value="PDF" type="button">

								</div>

							</div>

						</div>



					</form>

					<!-- form -->



					<div class="row">
						<div class="col-md-12">
							<!--table-->
							<div class="clearfix"></div>

							<div class="table-responsive">


								<div id="table-scroll">
									<div>

										<table id="table_grid" class="responsive-table">
											<thead>
												<tr>

													<th class="col-sm-1"
														style="text-align: center; background: #ec268f; color: white;">Sr.No.</th>
													<th class="col-md-3"
														style="text-align: center; background: #ec268f; color: white;">Invoice
														No</th>
													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Invoice
														Date</th>
													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Party
														Name</th>
													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">GST
														No</th>
													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">HSN
														Code</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Billed
														Qty</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">
														Taxable Amt</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Cgst
														%</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Cgst
														Amt</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Sgst
														%</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Sgst
														Amt</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Total</th>

													<th class="col-md-2"
														style="text-align: center; background: #ec268f; color: white;">Bill
														Amt</th>



												</tr>
											</thead>

											<tbody>

											</tbody>

										</table>

									</div>

								</div>
							</div>
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
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<!--easyTabs-->



	<script type="text/javascript">
		function validate() {

			var fromDate = $("#txtDate").val();
			var toDate = $("#txtDateto").val();

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

		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>








	<script type="text/javascript">
		function searchReport() {
			//	var isValid = validate();

			$('#table_grid td').remove();

			var frId = document.getElementById("frId").value;
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			$('#loader').show();

			$
					.getJSON(
							'${getBillList}',

							{
								frId : frId,
								fromDate : from_date,
								toDate : to_date,
								ajax : 'true'

							},
							function(data) {

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}

								var sumQty = 0;
								var sumTotal = 0;
								var sumtaxableAmt = 0;
								var sumCgstPer = 0;
								var sumCgstRs = 0;
								var sumSgstPer = 0;
								var sumSgstRs = 0;
								var sumTotal = 0;
								var sumBillTotal = 0;

								$
										.each(
												data,
												function(key, sellBillData) {

													document
															.getElementById("expExcel").disabled = false;
													document
															.getElementById('range').style.display = 'block';

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td class="col-sm-1"  style=text-align:center;></td>')
																	.html(
																			key + 1));

													tr
															.append($(
																	'<td class="col-md-3" style=text-align:center;></td>')
																	.html(
																			sellBillData.invoiceNo));
													tr
															.append($(
																	'<td class="col-md-2" style=text-align:center;></td>')
																	.html(
																			sellBillData.billDate));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:left;></td>')
																	.html(
																			sellBillData.userName));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:center;></td>')
																	.html(
																			sellBillData.userGstNo));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:center;></td>')
																	.html(
																			sellBillData.hsnCode));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(
																			sellBillData.qty));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(addCommas(
																			sellBillData.taxableAmt)));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(
																			sellBillData.cgstPer));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(addCommas(
																			sellBillData.cgstRs)));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(
																			sellBillData.sgstPer));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(addCommas(
																			sellBillData.sgstRs)));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(addCommas(
																			sellBillData.total)));

													tr
															.append($(
																	'<td class="col-md-2" style=text-align:right;></td>')
																	.html(addCommas(
																			sellBillData.billTotal)));

													sumQty = sumQty
															+ sellBillData.qty;

													sumtaxableAmt = sumtaxableAmt
															+ sellBillData.taxableAmt;

													sumCgstPer = sumCgstPer
															+ sellBillData.cgstPer;

													sumCgstRs = sumCgstRs
															+ sellBillData.cgstRs;

													sumSgstPer = sumSgstPer
															+ sellBillData.sgstPer;

													sumSgstRs = sumSgstRs
															+ sellBillData.sgstRs;

													sumTotal = sumTotal
															+ sellBillData.total;

													sumBillTotal = sumBillTotal
															+ sellBillData.billTotal;

													$('#table_grid tbody')
															.append(tr);

												});

								var tr = $('<tr></tr>');		
								tr
								.append($(
										'<td class="col-md-1" style=text-align:right;></td>')
										.html('Total'));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(''));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(''));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(''));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(''));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(''));
								 tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(sumQty.toFixed(2)));
								
								
								
								 tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(addCommas(sumtaxableAmt.toFixed(2))));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(sumCgstPer));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(addCommas(sumCgstRs.toFixed(2))));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(sumSgstPer));
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(addCommas(sumSgstRs.toFixed(2))));
								 tr
									.append($(
											'<td class="col-md-2" style=text-align:right;></td>')
											.html(addCommas(sumTotal.toFixed(2))));
								 
								tr
								.append($(
										'<td class="col-md-2" style=text-align:right;></td>')
										.html(addCommas(sumBillTotal.toFixed(2))));
								
								
								$('#table_grid tbody')
								.append(tr);
								
							
							}); 
		}
	</script>



	<script>
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
		return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree
				+ afterPoint;
	}
	
		function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcelNew");
			document.getElementById("expExcel").disabled = true;
		}
	</script>








	<script>
		/* $('.datepicker').datepicker({
			format : {

				format : 'mm/dd/yyyy',
				startDate : '-3d'
			}
		}); */

		function genPdf() {
			var frId = document.getElementById("frId").value;
			var from_date = $("#fromDate").val();
			var to_date = $("#toDate").val();

			window
					.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showHsnDateWiseSellReportPdf/'
							+ from_date + '/' + to_date + '/' + frId);

		}
	</script>
</body>
</html>
