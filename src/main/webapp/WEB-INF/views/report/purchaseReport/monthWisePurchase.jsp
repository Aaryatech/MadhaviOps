<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table, th, td {
	border: 1px solid #9da88d;
}

.hide-calendar .ui-datepicker-calendar {
	display: none;
}
</style>

<c:url var="monthWisePurchaseReport" value="/getMonthWisePurchaseReport" />

<body onload="monthWisePurchase()">
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

					<br>
					<div class="row">
						<div class="col-md-12">
							<h2 class="pageTitle">Month wise Purchase Report</h2>
						</div>
						<br>
					</div>
					<br>
					<div class="row">
						<input type="hidden" name="frId" id="frId" value="${frId}">

						<div class="col-md-1">
							<h4 class="pull-left">From Month:-</h4>
						</div>
						<div class="col-md-2 ">
							<input type='text' placeholder="Select From Month" id='txtDate'
								value="${fromDate}" class="texboxitemcode texboxcal"
								autocomplete="off" name="from_stockdate" required size="25" />
						</div>
						<div class="col-md-1">
							<h4 class="pull-left">To Month:-</h4>
						</div>
						<div class="col-md-2 ">
							<input type='text' placeholder="Select To Month" id='txtDateto'
								value="${toDate}" class="texboxitemcode texboxcal"
								autocomplete="off" name="to_stockdate" required size="25" />
						</div>
						<div class="col-md-1 ">Select :</div>
						<div class="col-md-2 ">
							<select id="typeId" name="typeId" class="form-control">
								<option value="">Select</option>
								<option value="1" selected="selected">Purchase</option>
								<option value="2">GRN</option>
								<option value="3">Cumulative</option>
							</select>
						</div>
						<!-- <div class="col-md-2">
		    <button class="btn search_btn pull-left" onclick="monthWisePurchase()">Search </button>
		</div> -->
						<div align="center" style="margin-top: 3px;">
							<button class="buttonsaveorder" onclick="monthWisePurchase()">HTML
								View</button>
							<button class="buttonsaveorder" onclick="showChart()">Graph</button>

							<%-- 		   &nbsp;&nbsp;&nbsp; <a href='${pageContext.request.contextPath}/pdf?reportURL=showPurchaseMonthwiseReportPdf' id="btn_pdf" class="btn search_btn" style="display: none">PDF</a>
 --%>
							<button class="btn btn-primary" value="PDF" id="PDFButton"
								onclick="genPdf()">PDF</button>
						</div>

					</div>

					<div class="row" id="table">
						<div class="col-md-12">
							<!--table-->
							<div class="clearfix"></div>


							<div id="table-scroll">
								<div id="faux-table" class="faux-table" aria="hidden"
									style="display: none;">
									<div>
										<!-- class="table-wrap" -->
										<table id="table_grid" class="main-table">
											<thead>
												<tr class="bgpink">



													<th class="col-md-1" style="text-align: center;">Sr.No.</th>
													<th class="col-md-1" style="text-align: center;">Month</th>
													<th class="col-md-1" style="text-align: center;">Taxable
														Amt</th>
													<th class="col-md-1" style="text-align: center;">IGST</th>
													<th class="col-md-1" style="text-align: center;">CGST</th>
													<th class="col-md-1" style="text-align: center;">SGST</th>
													<th class="col-md-1" style="text-align: center;">CESS</th>
													<!-- 	<th class="col-md-1" style="text-align: center;">ROFF</th> -->
													<th class="col-md-1" style="text-align: center;">Total</th>

												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>

									</div>
								</div>
								<div>
									<table id="table_grid" class="responsive-table">
										<thead>
											<tr class="bgpink">



												<th class="col-md-1" style="text-align: center;">Sr.No.</th>
												<th class="col-md-1" style="text-align: center;">Month</th>
												<th class="col-md-1" style="text-align: center;">Taxable
													Amt</th>
												<th class="col-md-1" style="text-align: center;">IGST</th>
												<th class="col-md-1" style="text-align: center;">CGST</th>
												<th class="col-md-1" style="text-align: center;">SGST</th>
												<th class="col-md-1" style="text-align: center;">CESS</th>
												<!-- <th class="col-md-1" style="text-align: center;">ROFF</th> -->
												<th class="col-md-1" style="text-align: center;">Total</th>

											</tr>
										</thead>
										<tbody>
									</table>

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

					<div id="chart">
						<hr>
						<div class="row">
							<div class="col-md-12">
								<div id="chart_div" style="overflow-y: scroll;"></div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div id="pieChart_div"
									style="width: 10%%; height: 300; float: right;"></div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div id="Piechart"
									style="width: 40%%; height: 300; float: right;"></div>

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
		function monthWisePurchase() {
			$('#table_grid td').remove();

			//document.getElementById('btn_pdf').style.display = "block";
			document.getElementById('table').style.display = "block";
			document.getElementById('chart').style = "display:none";

			var fromDate = document.getElementById("txtDate").value;
			var toDate = document.getElementById("txtDateto").value;
			var typeId = document.getElementById("typeId").value;

			if (typeId != "") {

				$
						.getJSON(
								'${monthWisePurchaseReport}',
								{

									fromDate : fromDate,
									toDate : toDate,
									typeId : typeId,
									ajax : 'true',

								},
								function(data) {

									var taxTotal = 0;
									var igstTotal = 0;
									var cgstTotal = 0;
									var cessTotal = 0;
									var sgstTotal = 0;
									var roundOffTotal = 0;
									var billTotal = 0;

									$('#loader').hide();
									var len = data.length;

									if (data == "") {
										alert("No records found !!");
										document.getElementById("expExcel").disabled = true;
									}
									$('#table_grid td').remove();

									$
											.each(
													data,
													function(key,
															monthWisePurchaseData) {

														document
																.getElementById("expExcel").disabled = false;
														document
																.getElementById('range').style.display = 'block';

														var index = key + 1;

														var monthNumber = monthWisePurchaseData.month;

														var monthNames = [ '0',
																'Jan', 'Feb',
																'Mar', 'Apr',
																'May', 'Jun',
																'Jul', 'Aug',
																'Sep', 'Oct',
																'Nov', 'Dec' ];

														var tr = $('<tr></tr>');

														tr
																.append($(
																		'<td class="col-md-1" style="text-align:center;"></td>')
																		.html(
																				index));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:left;"></td>')
																		.html(
																				monthNumber));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas((monthWisePurchaseData.taxableAmt)
																						.toFixed(2))));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas((monthWisePurchaseData.igstRs)
																						.toFixed(2))));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas(parseFloat(
																						Math
																								.round(monthWisePurchaseData.cgstRs * 100) / 100)
																						.toFixed(
																								2))));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas(parseFloat(
																						Math
																								.round(monthWisePurchaseData.sgstRs * 100) / 100)
																						.toFixed(
																								2))));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas((monthWisePurchaseData.sess)
																						.toFixed(2))));

														tr
																.append($(
																		'<td class="col-md-1"style="text-align:right;"></td>')
																		.html(
																				addCommas((monthWisePurchaseData.grandTotal)
																						.toFixed(2))));

														taxTotal = taxTotal
																+ monthWisePurchaseData.taxableAmt;
														cgstTotal = cgstTotal
																+ monthWisePurchaseData.cgstRs;
														sgstTotal = sgstTotal
																+ monthWisePurchaseData.sgstRs;
														igstTotal = igstTotal
																+ monthWisePurchaseData.igstRs;

														roundOffTotal = roundOffTotal
																+ monthWisePurchaseData.roundOff;
														cessTotal = cessTotal
																+ monthWisePurchaseData.sess;

														billTotal = billTotal
																+ monthWisePurchaseData.grandTotal;

														$('#table_grid tbody')
																.append(tr);

													});

									var tr = $('<tr></tr>');									

									tr
											.append($(
													'<td class="col-md-1" style="font-weight:bold;"></td>')
													.html("Total"));
									
									tr.append($('<td class="col-md-1"></td>')
											.html(""));
									

									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas((taxTotal)
																	.toFixed(2))));
									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas(igstTotal
																	.toFixed(2))));

									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas(cgstTotal
																	.toFixed(2))));

									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas(sgstTotal
																	.toFixed(2))));

									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas(cessTotal
																	.toFixed(2))));

									/* 	tr
												.append($(
														'<td class="col-md-1" style="text-align:right"></td>')
														.html(roundOffTotal.toFixed(2)));
									 */
									tr
											.append($(
													'<td class="col-md-1" style="text-align:right"></td>')
													.html(
															addCommas(billTotal
																	.toFixed(2))));

									$('#table_grid tbody').append(tr);
								}

						);
			} else {
				alert("Select Type ");

			}
		}
	</script>
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
	<!-- 	Select Only Month and Year 
 -->
	<script>
		$(document)
				.ready(
						function() {
							$('#txtDate')
									.datepicker(
											{
												changeMonth : true,
												changeYear : true,
												dateFormat : 'mm-yy',

												onClose : function() {
													var iMonth = $(
															"#ui-datepicker-div .ui-datepicker-month :selected")
															.val();
													var iYear = $(
															"#ui-datepicker-div .ui-datepicker-year :selected")
															.val();
													$(this).datepicker(
															'setDate',
															new Date(iYear,
																	iMonth, 1));
												},

												beforeShow : function() {
													$('#ui-datepicker-div')
															.addClass(
																	'hide-calendar');

													/*  if ((selDate = $(this).val()).length > 0) 
													 {
													    iYear = selDate.substring(selDate.length - 4, selDate.length);
													    iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
													    $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
													     $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
													 } */
												}
											});
						});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							$('#txtDateto')
									.datepicker(
											{
												changeMonth : true,
												changeYear : true,
												dateFormat : 'mm-yy',

												onClose : function() {
													var iMonth = $(
															"#ui-datepicker-div .ui-datepicker-month :selected")
															.val();
													var iYear = $(
															"#ui-datepicker-div .ui-datepicker-year :selected")
															.val();
													$(this).datepicker(
															'setDate',
															new Date(iYear,
																	iMonth, 1));
												},

												beforeShow : function() {
													$('#ui-datepicker-div')
															.addClass(
																	'hide-calendar');

													/*   if ((selDate = $(this).val()).length > 0) 
													  {
													     iYear = selDate.substring(selDate.length - 4, selDate.length);
													     iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
													     $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
													     $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
													  } */
												}
											});
						});
	</script>

	<script type="text/javascript">
		function showChart() {

			//alert("hi");

			//document.getElementById('btn_pdf').style.display = "block";
			//$("#PieChart_div").empty();
			$("#chart_div").empty();
			document.getElementById('chart').style.display = "block";
			document.getElementById("table").style = "display:none";

			var fromDate = document.getElementById("txtDate").value;
			var toDate = document.getElementById("txtDateto").value;
			var typeId = document.getElementById("typeId").value;

			//alert(fromDate + " ---- " + toDate);
			$.getJSON('${monthWisePurchaseReport}', {

				fromDate : fromDate,
				toDate : toDate,
				typeId : typeId,
				ajax : 'true',

			}, function(data) {

				$('#loader').hide();
				//alert(JSON.stringify(data));
				if (data == "") {
					alert("No records found !!");

				}
				var i = 0;

				google.charts.load('current', {
					'packages' : [ 'corechart', 'bar' ]
				});
				google.charts.setOnLoadCallback(drawStuff);
				google.charts.setOnLoadCallback(drawAmtPieChart);
				google.charts.setOnLoadCallback(drawTaxPieChart);

				function drawStuff() {

					var chartDiv = document.getElementById('chart_div');
					//document.getElementById("chart_div").style.border = "thin dotted red";
					var dataTable = new google.visualization.DataTable();

					dataTable.addColumn('string', 'Month'); // Implicit domain column.
					dataTable.addColumn('number', 'Total Tax'); // Implicit data column.
					// dataTable.addColumn({type:'string', role:'interval'});
					//  dataTable.addColumn({type:'string', role:'interval'});
					dataTable.addColumn('number', 'Grand Total');
					$.each(data, function(key, item) {

						var monthNumber = item.month;

						var monthNames = [ '0', 'Jan', 'Feb', 'Mar', 'Apr',
								'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct',
								'Nov', 'Dec' ];

						var totalTax = item.cgstRs + item.sgstRs;
						dataTable.addRows([

						[item.month, totalTax,item.grandTotal]
						//[ monthNames[item.month], item.taxableAmt, totalTax, ]

						]);
					})

					var materialOptions = {
						width : 500,
						height : 500,
						chart : {
							title : ' Total Tax Amount & Grand Total Amount'
							//subtitle : 'Tax percent wise & Total Amount '
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
									label : 'Total Tax Amount'
								}, // Left y-axis.
								brightness : {
									side : 'right',
									label : 'Grand Total'
								}
							// Right y-axis.
							}
						}
					};
					//  var materialChart = new google.charts.Bar(chartDiv);

					function drawMaterialChart() {
						var materialChart = new google.charts.Bar(chartDiv);
						//  google.visualization.events.addListener(materialChart, 'select', selectHandler);    
						materialChart.draw(dataTable, google.charts.Bar
								.convertOptions(materialOptions));
						// button.innerText = 'Change to Classic';
						// button.onclick = drawClassicChart;
					}

					drawMaterialChart();

				}
				;

				function drawAmtPieChart() {

					var chartDiv = document.getElementById('pieChart_div');
					//document.getElementById("pieChart_div").style.border = "thin dotted red";
					var dataTable = new google.visualization.DataTable();

					dataTable.addColumn('string', 'Month'); // Implicit domain column.
					dataTable.addColumn('number', 'Total Tax Amount'); // Implicit data column.
					//  dataTable.addColumn({type:'string', role:'interval'});
					//  dataTable.addColumn({type:'string', role:'interval'});
					//dataTable.addColumn('number', 'TaxableAmt');
					$.each(data, function(key, item) {

						var monthNumber = item.month;

						var monthNames = [ '0', 'Jan', 'Feb', 'Mar', 'Apr',
								'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct',
								'Nov', 'Dec' ];

						var totalTax = item.cgstRs + item.sgstRs;
						dataTable.addRows([

						[ item.month, totalTax ]

						]);
					})

					var chart = new google.visualization.PieChart(document
							.getElementById('pieChart_div'));
					chart.draw(dataTable, {
						width : 550,
						height : 500,
						title : 'Total Tax Amount'
					});

				}
				;

				function drawTaxPieChart() {

					var chartDiv = document.getElementById('Piechart');
					//document.getElementById("Piechart").style.border = "thin dotted red";
					var dataTable = new google.visualization.DataTable();

					dataTable.addColumn('string', 'Month'); // Implicit domain column.
					dataTable.addColumn('number', 'Grand Total'); // Implicit data column.
					//  dataTable.addColumn({type:'string', role:'interval'});
					//  dataTable.addColumn({type:'string', role:'interval'});
					//dataTable.addColumn('number', 'TaxableAmt');
					$.each(data, function(key, item) {

						var monthNumber = item.month;

						var monthNames = [ '0', 'Jan', 'Feb', 'Mar', 'Apr',
								'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct',
								'Nov', 'Dec' ];

						var totalTax = item.cgstRs + item.sgstRs;
						dataTable.addRows([

						[ item.month, item.grandTotal ]

						]);
					})

					var chart = new google.visualization.PieChart(document
							.getElementById('Piechart'));
					chart.draw(dataTable, {
						width : 550,
						height : 500,
						title : 'Grand Total'
					});

				}
				;

			});
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
		function genPdf() {
			var isValid = validate();
			if (isValid == true) {
				var fromDate = document.getElementById("txtDate").value;
				var toDate = document.getElementById("txtDateto").value;
				var frId = document.getElementById("frId").value;
				var typeId = document.getElementById("typeId").value;
				window
						.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showPurchaseMonthwiseReportPdf/'
								+ fromDate
								+ '/'
								+ toDate
								+ '/'
								+ frId
								+ '/'
								+ typeId);
			}
		}
	</script>

	<script type="text/javascript">
		/* function addCommas(nStr) {
			nStr += '';
			x = nStr.split('.');
			x1 = x[0];
			x2 = x.length > 1 ? '.' + x[1] : '';
			var rgx = /(\d+)(\d{3})/;
			while (rgx.test(x1)) {
				x1 = x1.replace(rgx, '$1' + ',' + '$2');
			}
			return x1 + x2;
		} */

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

</body>
</html>
