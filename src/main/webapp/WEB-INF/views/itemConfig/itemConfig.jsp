<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:include page="/WEB-INF/views/include/header.jsp" />

<html>
<head>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>


<!-- -----------------------------------------CODE FOR MULTIPLE DROPDOWN (CSS)------------------------------------------------------------ -->

<!-- chosen CSS ============================================ -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dropdownmultiple/bootstrap-chosen.css">

<!-- ----------------------------------------------------END------------------------------------------------------------ -->

<!-- </head>
<body> -->

<!--datepicker-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker2").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker3").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker4").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
	$(function() {
		$("#datepicker5").datepicker({
			dateFormat : 'dd-mm-yy'
		});
	});
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/loader.css">

</head>
<body onload="hideShowCat()">



	<c:url var="getItemListForConfiguration"
		value="/getItemListForConfiguration"></c:url>

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">


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
				<br>
				<div class="sidebarright">
					<div class="order-left" style="width: 100%">
						<br>


						<div class="row">

							<div class="col-md-2">
								<h2 class="pageTitle">Item Configuration</h2>
							</div>
							<div class="col-md-6"></div>

							<div class="col-md-4">

								<div class="row">
									<div class="col-md-1">
										<div class="col1title">
											<b>Type</b>
										</div>
									</div>
									<div class="col-md-6">
										<select name="orderType" id="orderType" class="form-control"
											required>

											<option value="0">Select Type</option>
											<option value="1">POS</option>
											<option value="2">Online</option>

										</select>
									</div>



									<div class="col-md-1">
										<input name="" class="buttonsaveorder" value="Search"
											type="button" onclick="getItems();">
									</div>
								</div>

							</div>


						</div>
						<br>
						<div align="center" id="loader" style="display: none;">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>

					</div>


					<form
						action="${pageContext.request.contextPath}/saveItemConfiguration"
						method="post">


						<div id="table-scroll" class="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"></div>
							<div class="table-wrap"
								style="max-height: none; min-height: none;">
								<table id="itemTable" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr No</th>
											<th class="col-md-2" style="text-align: center;">Item
												Name</th>
											<th class="col-md-1" style="text-align: center;">MRP</th>
											<th class="col-md-1" style="text-align: center;">HSN
												CODE</th>
											<th class="col-sm-1" style="text-align: center;">Tax %</th>

											<th class="col-md-1" style="text-align: center;">CGST %</th>
											<th class="col-md-1" style="text-align: center;">SGST %</th>
											<th class="col-md-1" style="text-align: center;">Status</th>

										</tr>
									</thead>
									<tbody>

										<%-- <c:forEach var="i" begin="1" end="5">

											<tr>
												<td class="col-md-1">${i}</td>
												<td class="col-md-1">Madhvi Penda</td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" type="text"
													style="width: 60%; display: inline; text-align: left;"
													class="form-control"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" id="tax${i}" type="text"
													oninput="setTaxPer(${i})"
													style="width: 60%; display: inline; text-align: left;"
													class="form-control"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" id="cgst${i}" type="text"
													style="width: 60%; display: inline; text-align: left;"
													class="form-control"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" id="sgst${i}" type="text"
													style="width: 60%; display: inline; text-align: left;"
													class="form-control"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
												<td class="col-md-1" style="text-align: center;"><select
													class="form-control">

														<option value="0">Select Status</option>
														<option value="1">Active</option>
														<option value="2">In-Active</option>


												</select></td>
											</tr>

										</c:forEach> --%>


									</tbody>

								</table>
							</div>
						</div>
						<br> <input name="" class="buttonsaveorder" value="Save"
							type="submit"> <br /> <br>

					</form>

				</div>

				<br> <br>



			</div>
			<!--tabNavigation-->


			<!--fullGrid-->
		</div>
		<!--rightContainer-->

	</div>
	<!--wrapper-end-->

	<script type="text/javascript">
		function setTaxPer(id) {

			var tax = document.getElementById("tax" + id).value;

			var taxper = tax / 2;
			if (isNaN(taxper)) {
				taxper = 0;
			}
			document.getElementById("cgst" + id).value = taxper;
			document.getElementById("sgst" + id).value = taxper;

		}
	</script>



	<!-- chosen JS
		============================================ -->
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>






	<script type="text/javascript">
		function getItems() {

			var selectType = document.getElementById("orderType").value;

			if (selectType == 0) {

				alert("Please Select Configuration Type");

			} else {

				$('#loader').show();
				$('#itemTable td').remove();

				$
						.getJSON(
								'${getItemListForConfiguration}',
								{
									configType : selectType,
									ajax : 'true'

								},
								function(data) {

									//alert(JSON.stringify(data));

									$('#itemTable td').remove();
									$('#loader').hide();

									$
											.each(
													data,
													function(key, item) {

														if (item.checked == 1) {

															var tr = $('<tr></tr>');

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					key + 1));

															tr
																	.append($(
																			'<td></td>')
																			.html(
																					item.itemName));

															var mrp = "<input type=text value='"
																	+ item.mrpAmt
																	+ "' id='mrp"
																	+ item.itemId
																	+ "'  name='mrp"
																	+ item.itemId
																	+ "' class=mrp style='width:80%;text-align:right;' readonly >";

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					mrp));

															var hsncd = "<input type=text value='"
																+ item.hsncd
																+ "' id='hsncd"
																+ item.itemId
																+ "'  name='hsncd"
																+ item.itemId
																+ "' class=hsncd style='text-align:center;'>";

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					hsncd));

															var tax = "<input type=text value='"
																	+ (item.tax1 + item.tax2)
																	+ "' id='tax"
																	+ item.itemId
																	+ "'  name='tax"
																	+ item.itemId
																	+ "' class=tax style='width:80%;text-align:right;' oninput=setTaxPer('"
																	+ item.itemId
																	+ "');checkNumber('"
																	+ item.itemId
																	+ "','3'); >";

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					tax));

															var cgst = "<input type=text value='"
																	+ item.tax1
																	+ "' id='cgst"
																	+ item.itemId
																	+ "'  name='cgst"
																	+ item.itemId
																	+ "' class=cgst style='width:80%;text-align:right;' oninput=checkNumber('"
																	+ item.itemId
																	+ "','4')>";

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					cgst));

															var sgst = "<input type=text value='"
																	+ item.tax2
																	+ "' id='sgst"
																	+ item.itemId
																	+ "'  name='sgst"
																	+ item.itemId
																	+ "' class=sgst style='width:80%;text-align:right;' oninput=checkNumber('"
																	+ item.itemId
																	+ "','5')>";

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					sgst));

															var select = "";
															if (item.status == 0) {
																var select = "<select  id='status"+item.itemId+"' name='status"+item.itemId+"'><option value=0 selected>Active</option><option value=1>InActive</option><option value=2>InActive For Day</option></select>";
															} else if (item.status == 1) {
																var select = "<select  id='status"+item.itemId+"' name='status"+item.itemId+"'><option value=0>Active</option><option value=1 selected>InActive</option><option value=2>InActive For Day</option></select>";
															} else if (item.status == 2) {
																var select = "<select  id='status"+item.itemId+"' name='status"+item.itemId+"'><option value=0>Active</option><option value=1>InActive</option><option value=2 selected>InActive For Day</option></select>";
															}

															tr
																	.append($(
																			'<td style="text-align:center;"></td>')
																			.html(
																					select));

															$(
																	'#itemTable tbody')
																	.append(tr);

														}

													});

								});

			}

		}
	</script>


	<script type="text/javascript">
		function checkNumber(id, type) {
			if (type == 1) {
				var mrp = document.getElementById("mrp" + id);

				mrp.value = mrp.value.replace(/[^0-9.]/g, '').replace(
						/(\..*)\./g, '$1');

			} else if (type == 2) {
				var sp = document.getElementById("spRate" + id);

				sp.value = sp.value.replace(/[^0-9.]/g, '').replace(
						/(\..*)\./g, '$1');

			} else if (type == 3) {
				var tax = document.getElementById("tax" + id);

				tax.value = tax.value.replace(/[^0-9.]/g, '').replace(
						/(\..*)\./g, '$1');

			} else if (type == 4) {
				var cgst = document.getElementById("cgst" + id);

				cgst.value = cgst.value.replace(/[^0-9.]/g, '').replace(
						/(\..*)\./g, '$1');

			} else if (sgst == 5) {
				var sgst = document.getElementById("sgst" + id);

				sgst.value = sgst.value.replace(/[^0-9.]/g, '').replace(
						/(\..*)\./g, '$1');

			}

		}
	</script>



</body>
</html>
