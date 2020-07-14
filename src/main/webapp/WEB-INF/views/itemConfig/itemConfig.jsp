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
</head>
<body onload="hideShowCat()">
	<!--datepicker-->
	<c:url var="getMenus" value="/getMenus" />

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<c:url var="findAddOnRate" value="/getAddOnRate" />




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
											required onchange="getMenus(this.value)">

											<option value="0">Select Type</option>
											<option value="1">POS</option>
											<option value="1">Online</option>
											<option value="1">Both</option>

										</select>
									</div>



									<div class="col-md-1">
										<input name="" class="buttonsaveorder" value="Search"
											type="submit">
									</div>
								</div>

							</div>


						</div>

					</div>


					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->

						<c:set var="selectedMenu" scope="session" value="${selectedMenu}" />

						<div class="clearfix"></div>

						<div id="table-scroll" class="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"></div>
							<div class="table-wrap"
								style="max-height: none; min-height: none;">
								<table id="table_grid" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr No</th>
											<th class="col-md-2" style="text-align: center;">Item
												Name</th>
											<th class="col-md-1" style="text-align: center;">MRP</th>
											<th class="col-sm-1" style="text-align: center;">Tax %</th>

											<th class="col-md-1" style="text-align: center;">CGST %</th>
											<th class="col-md-1" style="text-align: center;">SGST %</th>
											<th class="col-md-1" style="text-align: center;">Status</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach var="i" begin="1" end="5">

											<tr>
												<td class="col-md-1">${i}</td>
												<td class="col-md-1">Madhvi Penda</td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" type="text"
													style="width: 60%; display: inline; text-align: left;"
													class="form-control"
													oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"></td>
												<td class="col-md-1" style="text-align: center;"><input
													placeholder="0" id="tax${i}" type="text" oninput="setTaxPer(${i})"
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

										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
						<input name="" class="buttonsaveorder" value="Save" type="submit">
						<br />


					</div>

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

</body>
</html>
