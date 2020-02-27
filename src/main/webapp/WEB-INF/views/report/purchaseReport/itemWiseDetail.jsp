<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.monginis.ops.constant.Constant"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
.chosen-single{
text-align: left;
}
table, th, td {
	border: 1px solid #9da88d;
}
</style>

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


</head>
<body> --%>


<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">
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




<c:url var="getItemWiseDetailReport" value="/findItemWiseDetailReport" />
<c:url var="getItemListBycatId" value="/getItemListBycatId" />
<c:url var="getSpcakeList" value="/getSpcakeList" />
<c:url var="getGroup2ByCatId" value="/getSubCatListByCatId"></c:url>
<div class="sidebarOuter"></div>
<c:url var="getItemsByCatIdAndSubCatId" value="/getItemsByCatIdAndSubCatId"></c:url>
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
						<h2 class="pageTitle">Itemwise-Billwise-Datewise Purchase
							Report</h2>
					</div>
				</div>



				<div class="row">
					<br>

					<div class="col-md-1 pull-left">
						<h4 class="pull-left">Category:-</h4>
					</div>

					<div class="col-md-4">
						<select name="catId" id="catId" class="form-control chosen"
							required onchange="getSubCategoriesByCatId()">
							<option value="" selected>Select Category</option>
							<option value="-1">All</option>
							<c:forEach items="${catList}" var="catList">
								<option value="${catList.catId}">${catList.catName}</option>
							</c:forEach>
						</select>
					</div>


					<div class="col-md-1 pull-left">
						<h4 class="pull-left">Sub-Cat:-</h4>
					</div>
					<div class="col-md-4">
						<select name="item_grp2" id="item_grp2" style="text-align:left;"
							data-placeholder="Select Sub Category" class="chosen-select"
							style="text-align: left;" required onchange="getItemList()">

						</select>
					</div>

					
				</div>
				
				<div class="row">
					<br>
					<div class="col-md-1 pull-left">
						<h4 class="pull-left">Items:-</h4>
					</div>
					<div class="col-md-9">
						<select name="itemId" id="itemId"
							data-placeholder="Select Items" class="chosen-select"
							style="text-align: left;" required multiple="multiple">

						</select>
					</div>
				</div>

				<br>



				<div class="row">
					<input type="hidden" name="frId" id="frId" value="${frId}">
					<input type="hidden" name="factoryName" id="factoryName"
						value="${Constant.FACTORYNAME}">

					<div class="col-md-1 from_date">
						<h4 class="pull-left">From Date</h4>
					</div>
					<div class="col-md-3 ">
						<input id="fromdatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="From Date" name="fromDate"
							type="text">
					</div>
					<div class="col-md-1">
						<h4 class="pull-left">To Date</h4>
					</div>
					<div class="col-md-3 ">
						<input id="todatepicker" class="texboxitemcode texboxcal"
							autocomplete="off" placeholder="To Date" name="toDate"
							type="text">
					</div>
					<div class="col-md-2">
						<button class="buttonsaveorder" onclick="itemWiseTaxReport()">Search</button>
						<%-- 		   &nbsp;&nbsp;&nbsp; <a href='${pageContext.request.contextPath}/pdf?reportURL=showPurchaseItemwiseDetailPdf' id="btn_pdf" class="btn search_btn" style="display: none">PDF</a>
 --%>
						<button class="btn btn-primary" value="PDF" id="PDFButton"
							onclick="genPdf()">PDF</button>
					</div>
					
					<div class="form-group"  class="col-md-1"  style="display: none;" id="range">
						<input type="button" id="expExcel" class="btn btn-primary"
							value="EXPORT TO Excel" onclick="exportToExcel();"
							disabled="disabled">							
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

				<div class="row">
					<div class="col-md-12">
						<!--table-->
						<div class="clearfix"></div>


						<div id="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"
								style="display: none;"></div>
							<div class="table-wrap">
								<table id="table_grid" class="responsive-table">
									<thead>
										<tr class="bgpink">



											<th class="col-md-1" style="text-align: center;">Sr.No.</th>
											<th class="col-md-1" style="text-align: center;">Bill
												Date</th>
											<th class="col-md-1" style="text-align: center;">Bill No</th>
											<!-- <th class="col-md-1" style="text-align: center;">Party
												Name</th> -->
											<th class="col-md-2" style="text-align: center;">Item
												Name</th>
											<th class="col-md-1" style="text-align: center;">Expiry
												Date</th>
											<th class="col-md-1" style="text-align: center;">Qty</th>
											<th class="col-md-1" style="text-align: center;">Rate</th>
											<th class="col-md-1" style="text-align: center;">Discount</th>
											<th class="col-md-1" style="text-align: center;">Amount</th>
											<th class="col-md-1" style="text-align: center;">GRN
												TYPE</th>

										</tr>

									</thead>
									<tbody>
								</table>


							</div>
						</div>
						<!--table end-->
						<br>
						<!-- <div class="form-group" style="display: none;" id="range">



							<div class="col-sm-3  controls">
								<input type="button" id="expExcel" class="btn btn-primary"
									value="EXPORT TO Excel" onclick="exportToExcel();"
									disabled="disabled">
							</div>
						</div> -->


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
<script
	src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>
<!--easyTabs-->

<script>
	function getItemList() {
		var catId = document.getElementById("catId").value;
		//alert("Cat   "+catId)
		
		var subCat = document.getElementById("item_grp2").value;			
		//alert("Sub Cat*** "+subCat)

			$.getJSON('${getItemsByCatIdAndSubCatId}', {
				subCat : subCat,
				catId:catId,
				ajax : 'true'
			}, function(data) {

				var len = data.length;

				//alert(len);
				$('#itemId').find('option').remove().end()
				
				if(subCat==-1){
					for (var i = 0; i < len; i++) {

						$("#itemId").append(
								$("<option selected style='text-align:left; height:40%;'></option>").attr("value",
										data[i].id).text(data[i].itemName));
					}
				}else{
				$("#itemId").append(
						$("<option style='text-align:left;' selected></option>").attr(
								"value", 0).text("All"));
					for (var i = 0; i < len; i++) {
	
						$("#itemId").append(
								$("<option style='text-align:left;'></option>").attr("value",
										data[i].id).text(data[i].itemName));
					}
				}
				$('.chosen-select').trigger('chosen:updated');

			});

		

	}
</script>
<script type="text/javascript">
	function itemWiseTaxReport() {

		$('#loader').show();

		$('#table_grid td').remove();

		var isValid = validate();

		if (isValid) {

			//document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var catId = document.getElementById("catId").value;
			var subCat = document.getElementById("item_grp2").value;
			var factoryName = document.getElementById("factoryName").value;
			var fld = document.getElementById('itemId');
			var values = -1;
			for (var i = 0; i < fld.options.length; i++) {
				if (fld.options[i].selected) {
					//values.push(fld.options[i].value);
					values = values + ',' + fld.options[i].value;

					if (fld.options[i].value == 0) {

						values = 0;
						break;
					}

				}
			}
			if (values == -1) {
				values = 0;
			}
			//alert(values);

			$
					.getJSON(
							'${getItemWiseDetailReport}',
							{

								fromDate : fromDate,
								toDate : toDate,
								catId : catId,
								values : values,
								subCat : subCat,
								ajax : 'true',

							},
							function(data) {

								var qtyTotal = 0;
								var amtTotal = 0;
								var discTotal = 0;

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
												function(key, itemWiseTaxData) {

													document
															.getElementById("expExcel").disabled = false;
													document
															.getElementById('range').style.display = 'block';

													var partyname = factoryName;
													var grnType;

													if (itemWiseTaxData.grnType == 0)
														grnType = "GRN 1";

													if (itemWiseTaxData.grnType == 1)
														grnType = "GRN 2";

													if (itemWiseTaxData.grnType == 2)
														grnType = "GRN 3";
													if (itemWiseTaxData.grnType == 3)
														grnType = "No GRN";
													if (itemWiseTaxData.grnType == 4)
														grnType = "GRN 4";

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			key + 1));
													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			itemWiseTaxData.billDate));
													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			itemWiseTaxData.billNo));

													/* tr
															.append($(
																	'<td  class="col-md-1"></td>')
																	.html(
																			partyname)); */
													tr
															.append($(
																	'<td  class="col-md-2"  style="text-align:left;"></td>')
																	.html(
																			itemWiseTaxData.itemName));
													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			itemWiseTaxData.expiryDate));

													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:right;"></td>')
																	.html(
																			(itemWiseTaxData.qty)
																					.toFixed(2)));

													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:right;"></td>')
																	.html(
																			addCommas((itemWiseTaxData.rate)
																					.toFixed(2))));
													tr
													.append($(
															'<td  class="col-md-1" style="text-align:right;"></td>')
															.html(
																	addCommas((itemWiseTaxData.discAmt)
																			.toFixed(2))));

													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:right;"></td>')
																	.html(
																			addCommas((itemWiseTaxData.total)
																					.toFixed(2))));

													tr
															.append($(
																	'<td  class="col-md-1" style="text-align:center;"></td>')
																	.html(
																			grnType));

													qtyTotal = qtyTotal
															+ itemWiseTaxData.qty;
													discTotal = discTotal 
															+ itemWiseTaxData.discAmt;
													amtTotal = amtTotal
															+ itemWiseTaxData.total;

													$('#table_grid tbody')
															.append(tr);

												});

								var tr = $('<tr></tr>');

								tr
								.append($(
												'<td class="col-md-1" style="font-weight:bold;"></td>')
												.html("Total"));

								tr.append($('<td  class="col-md-1"></td>')
										.html(""));
								tr.append($('<td  class="col-md-1"></td>')
										.html(""));	
								tr.append($('<td  class="col-md-1"></td>')
										.html(""));
								tr.append($('<td  class="col-md-1"></td>')
										.html(""));
								
								tr
								.append($(
										'<td  class="col-md-1" style="text-align:right; font-weight:700;"></td>')
										.html(addCommas(qtyTotal.toFixed(2))));

								tr.append($('<td  class="col-md-1"></td>')
										.html(""));
								
								tr
								.append($(
										'<td  class="col-md-1" style="text-align:right; font-weight:700;"></td>')
										.html(addCommas(discTotal.toFixed(2))));

								tr
										.append($(
												'<td  class="col-md-1" style="text-align:right; font-weight:700;"></td>')
												.html(addCommas(amtTotal.toFixed(2))));
								tr.append($('<td  class="col-md-1"></td>')
										.html(""));
								$('#table_grid tbody').append(tr);
							}

					);
		}
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
	function getSubCategoriesByCatId() {
		var catId = $("#catId").val();
	//alert("Cat   "+catId)
		$
				.getJSON(
						'${getGroup2ByCatId}',
						{
							catId : JSON.stringify(catId),
							ajax : 'true'
						},
						function(data) {
							var html = '<option multiple="multiple" value="" style="text-align:left;">Sub Category</option>';

							var len = data.length;

							$('#item_grp2').find('option').remove().end()

							/* $("#item_grp2")
									.append(
											$("<option ></option>").attr(
													"value", "").text(
													"Select Sub Category")); */
							/* $("#item_grp2").append(
									$("<option></option>").attr("value", -1)
											.text("ALL")); */
						if(catId>0){
							$("#item_grp2").append(
									$("<option selected style='text-align:left;'></option>").attr("value", -1)
											.text("All"));
							for (var i = 0; i < len; i++) {
								$("#item_grp2").append(
										$("<option style='text-align:left;'></option>").attr("value",
												data[i].subCatId).text(
												data[i].subCatName));
							}
						}else{
							$("#item_grp2").append(
									$("<option selected style='text-align:left;'></option>").attr("value", -1)
											.text("All"));
						}
							$("#item_grp2").trigger("chosen:updated");
							getItemList();
						});
	}
</script>

<script type="text/javascript">
	function genPdf() {
		var isValid = validate();

		var fld = document.getElementById('itemId');
		var values = -1;
		for (var i = 0; i < fld.options.length; i++) {
			if (fld.options[i].selected) {
				//values.push(fld.options[i].value);
				values = values + ',' + fld.options[i].value;

				if (fld.options[i].value == 0) {

					values = 0;
					break;
				}

			}
		}

		if (values == -1) {
			values = 0;
		}

		if (isValid == true) {
			var catId = document.getElementById("catId").value;
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			var frId = document.getElementById("frId").value;
			var subCat = document.getElementById("item_grp2").value;
			window
					.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showPurchaseItemwiseDetailPdf/'
							+ fromDate
							+ '/'
							+ toDate
							+ '/'
							+ frId
							+ '/'
							+ catId + '/' + values + '/' + subCat);
		}
	}
</script>

<script>
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
		return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree
				+ afterPoint;
	}
</script>


</body>
</html>
