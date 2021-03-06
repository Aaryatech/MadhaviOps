<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>


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
<

</head>
<body> --%>

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


<c:url var="getB2BSellReport" value="/getB2BSellReport" />

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
					<div class="col-md-12">
						<h2 class="pageTitle">View B2B Sales Report</h2>
					</div>
				</div>

				<div class="colOuter">
					<div align="center">
						<div class="col1">
							<div class="col1title">
								<b><span class="frm_txt">From</span></b> <input
									id="fromdatepicker" autocomplete="off" class="texboxitemcode texboxcal float_l"
									placeholder="From Date" name="from_Date" type="text"
									size="35">
							</div>
						</div>
						<div class="col2">
							<div class="col1title">
								<b><span class="frm_txt">To</span></b> <input id="todatepicker" class="texboxitemcode texboxcal float_l"
									autocomplete="off" placeholder="To Date" name="to_Date"
									type="text" size="35">
							</div>
						</div>
						<input type="hidden" name="frId" id="frId" value="${frId}">

					</div>


					<div align="center" class="right_btn">
						<button class="buttonsaveorder" onclick="searchSellBill()">HTML
							View</button>
					
						<button class="btn btn-primary" value="PDF" id="PDFButton"
							onclick="genPdf()">PDF</button>
						<br>
					</div>
				</div>
				<div class="row" id="table">
					<div class="col-md-12">
						<!--table-->
						<div class="clearfix"></div>


						<div id="table-scroll" >							
							<div>
								<table id="table_grid"  class="responsive-table" border="1">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr.No.</th>
											<th class="col-md-1" style="text-align: center;">Bill No.</th>
											<th class="col-md-1" style="text-align: center;">Bill Date</th>
											<th class="col-md-1" style="text-align: center;">Bill Amt.</th>
											<!-- <th class="col-md-1" style="text-align: center;">Pending Amt.</th> -->
											<th class="col-md-1" style="text-align: center;">Payment Mode</th>
											<th class="col-md-1" style="text-align: center;">Customer Name</th>
											<th class="col-md-1" style="text-align: center;">Contact No.</th>
											<th class="col-md-1" style="text-align: center;">GST No.</th>
										</tr>
									</thead>

									<tbody>
									</tbody>

								</table>

							</div>
							<div class="form-group" style="display: none;" id="range">



								<div class="col-sm-3  controls">
									<input type="button" id="expExcel" class="btn btn-primary"
										value="EXPORT TO Excel" onclick="exportToExcel();"
										disabled="disabled">
								</div>
							</div>
						</div>
						<!--table end-->

					</div>
				</div>

				<div id="chart">
					<br> <br> <br>
					<hr>


					<div id="chart_div" style="width: 100%; height: 500px;"></div>


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
	function searchSellBill() {
		document.getElementById('table').style.display = "block";
		document.getElementById('chart').style = "display:none";
		// document.getElementById('showchart').style.display = "block";
		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {
			//	document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;

			$
					.getJSON(
							'${getB2BSellReport}',
							{

								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true',

							},
							function(data) {

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
								}
								var ttlBillAmt = 0;
								var ttlPending = 0;
								var payMode;
								$
										.each(
												data,
												function(key, sellTaxData) {
													
													payMode="Other";
													if(sellTaxData.paymentMode==1){
														payMode="Cash";
													}else if(sellTaxData.paymentMode==2){
														payMode="Card";
													}

													document
															.getElementById("expExcel").disabled = false;
													document
															.getElementById('range').style.display = 'block';

													var tr = $('<tr></tr>');

													tr.append($('<td style="text-align:center;"></td>')
															.html(key + 1));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			sellTaxData.invoiceNo));

													tr
															.append($(
																	'<td class="col-md-1" style="text-align:right;"></td>')
																	.html(
																			sellTaxData.billDate));

													tr
															.append($(
																	'<td class="col-md-1"  style="text-align:right;"></td>')
																	.html(addCommas(
																			(sellTaxData.grandTotal)
																					.toFixed(2))));
													ttlBillAmt = ttlBillAmt
															+ sellTaxData.grandTotal;

												/* 	tr
															.append($(
																	'<td class="col-md-1"  style="text-align:right;"></td>')
																	.html(addCommas(
																			(sellTaxData.remainingAmt)
																					.toFixed(2)))); */
													ttlPending = ttlPending
															+ sellTaxData.remainingAmt;

													tr
															.append($(
																	'<td class="col-md-1"  style="text-align:center;"></td>')
																	.html(payMode));
												

													tr
															.append($(
																	'<td class="col-md-1"  style="text-align:left;"></td>')
																	.html(sellTaxData.userName));
													tr
													.append($(
															'<td class="col-md-1"  style="text-align:center;"></td>')
															.html(sellTaxData.userPhone));
													tr
													.append($(
															'<td class="col-md-1"  style="text-align:center;"></td>')
															.html(sellTaxData.userGstNo));												

													$('#table_grid tbody')
															.append(tr);

												})

								var tr = "<tr>";
								var total = "<td colspan='1'><b> Total</b></td>";
								var col1 = "<td colspan='1'></td>";
								var col2 = "<td colspan='1'></td>";

								var totalTax = "<td style='text-align:right'>&nbsp;&nbsp;&nbsp;<b>"
										+ addCommas(ttlBillAmt.toFixed(2));
								+"</b></td>";

								var igst = "<td style='text-align:right'><b>&nbsp;&nbsp;&nbsp;"
										+ addCommas(ttlPending.toFixed(2));
								+"</b></td>";
								var cgst = "<td colspan='1'></td>";
								var sgst = "<td colspan='1'></td>";
								var cess = "<td colspan='1'></td>";								
								var ttlBill = "<td colspan='1'></td>";
								var trclosed = "</tr>";

								$('#table_grid tbody').append(tr);
								$('#table_grid tbody').append(total);
								$('#table_grid tbody').append(col1);
								$('#table_grid tbody').append(col2);								
								$('#table_grid tbody').append(totalTax)
								/* $('#table_grid tbody').append(igst); */
								$('#table_grid tbody').append(cgst);
								$('#table_grid tbody').append(sgst);
								$('#table_grid tbody').append(cess);
								$('#table_grid tbody').append(ttlBill);
								$('#table_grid tbody').append(trclosed);

							});

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
</script>
<script type="text/javascript">
	function showChart() {

		//$("#PieChart_div").empty();
		$("#chart_div").empty();

		document.getElementById('chart').style.display = "block";
		document.getElementById("table").style = "display:none";

		var fromDate = document.getElementById("fromdatepicker").value;
		var toDate = document.getElementById("todatepicker").value;

		var isValid = validate();

		if (isValid) {
			//document.getElementById('btn_pdf').style.display = "block";
			$
					.getJSON(
							'${getDatewiseTaxSellReport}',
							{

								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true',

							},
							function(data) {
								//alert(data);
								if (data == "") {
									alert("No records found !!");

								}
								var i = 0;

								google.charts.load('current', {
									'packages' : [ 'corechart', 'bar' ]
								});
								google.charts.setOnLoadCallback(drawStuff);

								function drawStuff() {

									var chartDiv = document
											.getElementById('chart_div');
									document.getElementById("chart_div").style.border = "thin dotted red";
									var dataTable = new google.visualization.DataTable();

									dataTable.addColumn('string',
											'Date & Tax %'); // Implicit domain column.
									dataTable.addColumn('number', 'Total Tax'); // Implicit data column.
									dataTable.addColumn({
										type : 'string',
										role : 'interval'
									});
									dataTable.addColumn({
										type : 'string',
										role : 'interval'
									});
									dataTable.addColumn('number',
											'Taxable Amount');
									$.each(data, function(key, item) {

										var tax = item.cgst + item.sgst;
										var date = item.billDate + '\nTax : '
												+ item.tax_per + '%';

										dataTable.addRows([

										[ date, tax, "cgst : " + item.cgst,
												"sgst : " + item.sgst,
												item.tax_amount, ]

										]);
									})

									var materialOptions = {
										width : 700,
										chart : {
											title : 'Date wise Tax Graph',
											subtitle : 'Total tax & Taxable Amount per day'
										},
										series : {
											0 : {
												axis : 'distance'
											}, // Bind series 0 to an axis named 'distance'.
											1 : {
												axis : 'brightness'
											}
										// Bind series 1 to an axis named 'brightness'.
										},
										axes : {
											y : {
												distance : {
													label : 'Total Tax'
												}, // Left y-axis.
												brightness : {
													side : 'right',
													label : 'Taxable Amount'
												}
											// Right y-axis.
											}
										}
									};

									function drawMaterialChart() {
										var materialChart = new google.charts.Bar(
												chartDiv);
										materialChart
												.draw(
														dataTable,
														google.charts.Bar
																.convertOptions(materialOptions));
										// button.innerText = 'Change to Classic';
										// button.onclick = drawClassicChart;
									}

									/*  var chart = new google.visualization.ColumnChart(
									          document.getElementById('chart_div'));
									 chart.draw(dataTable,
									    {width: 800, height: 600, title: 'Tax Summary Chart'}); */
									drawMaterialChart();
								}
								;

							});
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
			window
					.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showB2BSalesReportpPdf/'
							+ fromDate + '/' + toDate + '/' + frId + '/');
		}
	}
</script>
</body>
</html>
