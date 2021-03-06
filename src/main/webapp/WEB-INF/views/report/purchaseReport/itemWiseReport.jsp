<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.monginis.ops.constant.Constant"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>
<link rel="stylesheet"
	href="/ops/resources/dropdownmultiple/bootstrap-chosen.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">
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



<c:url var="getItemWiseReport" value="/findItemWiseReport" />

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
						<h2 class="pageTitle">Itemwise Purchase Report</h2>
					</div>
				</div>



				<div class="row">


					<div class="col-md-1 from_date">
						<h4 class="pull-left">Group:-</h4>
					</div>
					<div class="col-md-3">
						<select name="catId" id="catId" class="form-control chosen"
							required>
							<option value="" selected>Select Group</option>

							<c:forEach items="${catList}" var="catList">
								<option value="${catList.catId}" selected>${catList.catName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-1 from_date">
						<h4 class="pull-left">Select:-</h4>
					</div>

					<div class="col-md-3 ">
						<select id="typeId" name="typeId" class="form-control">
							<option value="">Select</option>
							<option value="1">Purchase</option>
							<option value="2">GRN</option>
							<option value="3">Cumulative</option>
						</select>
					</div>
				</div>

				<br>


				<div class="row">
					<input type="hidden" name="frId" id="frId" value="${frId}">
					<input type="hidden" name="factoryName" id="factoryName"
						value="${Constant.FACTORYNAME}">

					<div class="col-md-1 from_date">
						<h4 class="pull-left">From Date:-</h4>
					</div>
					<div class="col-md-3 ">
						<input id="fromdatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="DD-MM-YYYY" name="fromDate"
							type="text">
					</div>
					<div class="col-md-1">
						<h4 class="pull-left">To Date:-</h4>
					</div>
					<div class="col-md-3 ">
						<input id="todatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="DD-MM-YYYY" name="toDate"
							type="text">
					</div>
					<div class="col-md-2">
						<button class="buttonsaveorder"
							onclick="itemWiseReport()">Search</button>
						<%-- 		   &nbsp;&nbsp;&nbsp; <a href='${pageContext.request.contextPath}/pdf?reportURL=showPurchaseItemwiseReportpPdf' id="btn_pdf" class="btn search_btn" style="display: none">PDF</a>
 --%>
						<button class="btn btn-primary" value="PDF" id="PDFButton"
							onclick="genPdf()">PDF</button>
							
						
					</div>
					
						
						<!-- <div class="form-group col-md-2" style="display: none;" id="range">
							
								<input type="button" id="expExcel" class="btn btn-primary"
									value="EXPORT TO Excel" onclick="exportToExcel();"
									disabled="disabled">
							
						</div> -->

				</div>

				<div class="row">
					<div class="col-md-12">
						<!--table-->
						<div class="clearfix"></div>
						<div class="responsive-table">
						<div id="table-scroll" class="table-scroll responsive-table-one">						
						<table id="table_grid" class="responsive-table">
									<thead>
										<tr class="bgpink">
											<th class="col-sm-1" style="text-align: center;">Sr.No.</th>
												<!-- <th class="col-md-1" style="text-align: center;">Party
													Name</th> -->
												<th style="text-align: center;">Item Name</th>
												<!-- <th class="col-md-1" style="text-align: center;">GRN
													Type</th> -->
												<th class="col-md-1" style="text-align: center;">Qty.</th>
												<th class="col-md-1" style="text-align: center;">Rate</th>
												<th class="col-md-1" style="text-align: center;">Discount Amt</th>
												<!-- <th class="col-md-1" style="text-align: center;">Rate</th> -->
												<th class="col-md-1" style="text-align: center;">Amount</th>
									</tr>
									</thead>
									<tbody>
								</table>
						</div>
						</div>
						<!--table end-->
						 <div class="form-group" style="display: none;" id="range">
								 
											 
											 
											<div class="col-sm-3  controls">
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
											</div>
											</div>


					</div>
				</div>
				<!-- <br>
						<div class="form-group" style="display: none;" id="range">



							<div class="col-sm-3  controls">
								<input type="button" id="expExcel" class="btn btn-primary"
									value="EXPORT TO Excel" onclick="exportToExcel();"
									disabled="disabled">
							</div>
						</div>
 -->



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
	function itemWiseReport() {
		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {

			//document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var catId = document.getElementById("catId").value;
			var factoryName = document.getElementById("factoryName").value;
			var typeId = document.getElementById("typeId").value;

			$.getJSON('${getItemWiseReport}', {

				fromDate : fromDate,
				toDate : toDate,
				catId : catId,
				typeId : typeId,
				ajax : 'true',

			}, function(data) {

				var qtyTotal = 0;
				var amtTotal = 0;
				var discTotal = 0;
				var rateTotal = 0;
				$('#loader').hide();
				var len = data.length;
				if (data == "") {
					alert("No records found !!");
					document.getElementById("expExcel").disabled = true;
				}

				$('#table_grid td').remove();

				$.each(data, function(key, itemWiseTaxData) {

					document.getElementById("expExcel").disabled = false;
					document.getElementById('range').style.display = 'block';

					var partyname = factoryName;

					var tr = $('<tr></tr>');

					tr.append($('<td style="text-align:center;"></td>').html(key + 1));

					tr.append($('<td style="text-align:left;"></td>').html(
							itemWiseTaxData.itemName));					
					tr.append($('<td style="text-align:right;"></td>').html(addCommas(
									(itemWiseTaxData.qty).toFixed(2))));
					tr.append($('<td style="text-align:right;"></td>').html(addCommas(
							(itemWiseTaxData.rate).toFixed(2))));
					tr.append($('<td style="text-align:right;"></td>').html(addCommas(
							(itemWiseTaxData.discAmt).toFixed(2))));
					
					tr.append($('<td style="text-align:right;"></td>').html(addCommas(
							(itemWiseTaxData.total).toFixed(2))));

					qtyTotal = qtyTotal + itemWiseTaxData.qty;
					amtTotal = amtTotal + itemWiseTaxData.total;
					discTotal = discTotal + itemWiseTaxData.discAmt;
					rateTotal = rateTotal + itemWiseTaxData.rate;
					$('#table_grid tbody').append(tr);

				});

				var tr = $('<tr></tr>');

				tr.append($('<td   style="font-weight:bold;"></td>').html(
						"Total"));				
				tr.append($('<td  ></td>').html(""));
				tr.append($('<td    style="text-align:right;"></td>').html(addCommas(
						qtyTotal.toFixed(2))));
				tr.append($('<td    style="text-align:right;"></td>').html(addCommas(
						rateTotal.toFixed(2))));
				tr.append($('<td    style="text-align:right;"></td>').html(addCommas(
						discTotal.toFixed(2))));

				tr.append($('<td    style="text-align:right;"></td>').html(addCommas(
						amtTotal.toFixed(2))));

				$('#table_grid tbody').append(tr);
			}

			);
		}
	}
</script>
<script type="text/javascript">

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

	function validate() {

		var fromDate = $("#fromdatepicker").val();
		var toDate = $("#todatepicker").val();
		var typeId = $("#typeId").val();

		var isValid = true;

		if (fromDate == "" || fromDate == null) {

			isValid = false;
			alert("Please select From Date");
		} else if (toDate == "" || toDate == null) {

			isValid = false;
			alert("Please select To Date");
		} else if (typeId == "") {

			isValid = false;
			alert("Please select ");
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
	function genPdf() {
		var isValid = validate();
		if (isValid == true) {
			var catId = document.getElementById("catId").value;
			var typeId = document.getElementById("typeId").value;
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var frId = document.getElementById("frId").value;
			window
					.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showPurchaseItemwiseReportpPdf/'
							+ fromDate
							+ '/'
							+ toDate
							+ '/'
							+ frId
							+ '/'
							+ catId + '/' + typeId);
		}
	}
</script>

</body>
</html>
