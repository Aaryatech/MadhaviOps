<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

</head>--%>
<body onload="getData()">


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
	<c:url var="editPettyCashData" value="/editPettyCashData"></c:url>
	<c:url var="updateWithdrawAmt" value="/updateWithdrawAmt"></c:url>


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
				<div class="sidebarright">
					<br>
					<div class="order-left">
						<h2 class="pageTitle">Petty Cash Management</h2>
						<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->
					</div>
					<div class="order-right" align="right">

						<a href="${pageContext.request.contextPath}/showPattyCashMgmnt"><input
							type="button" value="Petty Cash" class="buttonsaveorder">
						</a>
					</div>
					<!-- <form action="addPettyCash" method="post"> -->

					<br>

					<div class="colOuter">
						<div class="col-md-2">
							<div class="col1title" align="left">From Date</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal"
								autocomplete="off" value="${firstDate}" name="from_Date"
								type="text">
						</div>


						<div class="col-sm-2">
							<div class="col1title" align="left">To Date</div>
						</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal"
								autocomplete="off" value="${currentDate}" name="to_Date"
								type="text">
						</div>

						<div class="col-sm-4">
							<input class="buttonsaveorder" value="Submit" type="submit"
								onclick="getData()">

							<button type="button" class="buttonsaveorder" onclick="genPdf()"
								disabled id="pdf">PDF</button>

						</div>


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

					<!-- </form> -->



					<div class="row">
						<div class="col-md-12">
							<!--table-->
							<form action="monthEndProcess" method="POST"
								onsubmit="substk.disabled = true; return confirm('Do you want to Month End ?');">
								<div class="clearfix"></div>
								<div class="col-md-9"></div>
								<!-- <label for="search" class="col-md-3" id="search"> <i
								class="fa fa-search" style="font-size: 20px"></i> <input
								type="text" id="myInput" onkeyup="myFunction()"
								style="border-radius: 25px;" placeholder="Search items by name"
								title="Type item name">
							</label>
 -->

								<div id="table-scroll" class="table-scroll responsive-table-one">
									<br>
									<!-- class="table-scroll" -->
									<div>
										<!--  class="table-wrap" -->
										<table id="table_grid" class="responsive-table">
											<!-- class="main-table" -->
											<thead>
												<tr class="bgpink">
													<th style="text-align: center;">Sr. No</th>
													<th style="text-align: center;">Date & Time</th>
														<th style="text-align: center;">Day End By</th>
													<th style="text-align: center;">Opening Amt</th>
													<th style="text-align: center;">Cash Amt</th>
													<th style="text-align: center;">Withdrawal Amt</th>
													<th style="text-align: center;">Closing Amt</th>
													
													<th style="text-align: center;">Action</th>
												</tr>

											</thead>
											<tbody>


											</tbody>
											<%--  <tbody>
										<c:forEach items="${pettyList}" var="pettyList"
														varStatus="count">
											<tr>
												<td >${count.index+1}</td>
												<td>${pettyList.date}</td>
												<td>${pettyList.openingAmt}</td>
												<td>${pettyList.cashAmt}</td>
												<td>${pettyList.withdrawalAmt}</td>
												<td>${pettyList.closingAmt}</td>
												<!-- pettycashId -->
												<td>
														<a href="${pageContext.request.contextPath}/editPettyCash?pettyCashIdId=${pettyList.pettycashId}" title="Edit">
														<i class="fa fa-edit"></i></a>
		
													<abbr title="Delete"><i class="fa fa-trash"><a href="${pageContext.request.contextPath}/editPettyCash?pettyCashIdId=${pettyList.pettycashId}"></a></i></abbr>
												</td>
											</tr>
											</c:forEach>
										</tbody>  --%>
										</table>
									</div>

								</div>


								<!-- <div class="col-md-2">

								<button type="button" class="btn btn-primary"
									onclick="exportToExcel();" id="expExcel">
									Export To Excel</button>
						 	</div> -->


								<!-- <div class="col-md-3">
 
								<button type="button" class="btn btn-primary" onclick="genPdf()" disabled
									id="pdf"
									>
									PDF</button>
							</div> -->

							</form>
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
	<div id="slide" class="pending_pop" id="edt_petty"
		style="height: 300px;">
		<button class="slide_close" id="btnCloseModal">
			<i class="fa fa-times" aria-hidden="true"></i>
		</button>
		<!-- <h3 class="pop_head" id="add_cust_head_name">Edit Petty Cash <label>Date</label></h3> -->

		<h3 class="pop_head" id="add_cust_head_name">

			<div class="row">

				<div class="col-md-6">
					<b>Edit Petty Cash</b>
				</div>
				<div class="col-md-6" style="text-align: right;">
					Date : <input type="text" name="edit_date" id="edit_date"
						style="border: transparent;" readonly="readonly" />
				</div>

			</div>

		</h3>



		<div class="add_frm">

			<input type="text" style="display: none;" name="pettyId" id="pettyId" />

			<div class="row">

				<div class="col-md-2">Opening Amount</div>

				<div class="col-md-4">
					<input type="text" class="input_add" name="opening_amt"
						readonly="readonly" onchange="trim(this)" id="opening_amt" />
				</div>

				<div class="col-md-2">Cash Amount</div>

				<div class="col-md-4">
					<input type="text" class="input_add" name="cash_amt"
						readonly="readonly" onchange="trim(this)" id="cash_amt" />
				</div>

			</div>

			<br>

			<div class="row">

				<div class="col-md-2">Withdrawl Amount</div>

				<div class="col-md-4">
					<input type="text" class="input_add"
						placeholder="Enter Withdrawal Amt" name="withdrawal_amt"
						onkeyup="calClosingAmt()" id="withdrawal_amt" />
				</div>

				<div class="col-md-2">Closing Amount</div>

				<div class="col-md-4">
					<input type="text" class="input_add" readonly="readonly"
						name="closing_amt" onchange="trim(this)" id="closing_amt" />
				</div>

			</div>



		</div>

		<div class="pop_btns">

			<div class="close_r">
				<a href="#" onclick="savePettyCash()" id="savePettyCash">Update</a>
			</div>
			<div class="clr"></div>
		</div>


	</div>



	<!--easyTabs-->
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->
	<script type="text/javascript">
		$(document).ready(function() {
			$('#slide').popup({
				focusdelay : 400,
				outline : true,
				vertical : 'top'
			});
		});
	</script>
	<script>
		function calClosingAmt() {

			var cashAmt = parseFloat($("#cash_amt").val());
			var openAmt = parseFloat($("#opening_amt").val());
			var withdrawAmt = parseFloat($("#withdrawal_amt").val());

			var closeAmt = openAmt + cashAmt - withdrawAmt;

			document.getElementById("closing_amt").value = parseFloat(closeAmt);
		}

		function editPettyCash(pettyCashId) {

			$
					.get(
							'${editPettyCashData}',

							{
								pettyCashId : pettyCashId,
								ajax : 'true',

							},
							function(data) {

								//alert(JSON.stringify(data));

								if (data != "") {
									$('#loader').hide();
								}

								document.getElementById("edit_date").value = data.date;

								document.getElementById("opening_amt").value = parseFloat(data.openingAmt);
								document.getElementById("withdrawal_amt").value = parseFloat(data.withdrawalAmt);
								document.getElementById("closing_amt").value = parseFloat(data.closingAmt);
								document.getElementById("cash_amt").value = parseFloat(data.cashAmt);
								document.getElementById("pettyId").value = data.pettycashId;

							});
		}

		function savePettyCash() {
			var closeAmt = $("#closing_amt").val();
			var withdrawl = $("#withdrawal_amt").val();
			var id = $("#pettyId").val();

			//alert(closeAmt + " " + withdrawl + " " + id);

			if (withdrawl == "") {

				alert("Please Enter Withdrawl Amount");

			} else {

				$.get('${updateWithdrawAmt}',

				{
					closeAmt : closeAmt,
					withdrawl : withdrawl,
					id : id,
					ajax : 'true',

				}, function(data) {

					//alert(data);

					if (data != "") {
						$('#loader').hide();
					}

					if (data == 1) {
						alert("Record Updated successfully.");
						getData();
						document.getElementById("btnCloseModal").click();
					}

				});

			}

		}

		function clearAddCustomerpopup() {

			/* document.getElementById("myBtn").disabled = false; 

			document.getElementById("customerName").value = "";
			document.getElementById("mobileNo").value = "";
			document.getElementById("kms").value = "";
			document.getElementById("dateOfBirth").value = "";
			document.getElementById("n-option").checked = true;
			document.getElementById("companyName").value = "";
			document.getElementById("gstNo").value = "";
			document.getElementById("custAdd").value = "";
			document.getElementById("custId").value = 0;
			document.getElementById("moption").checked = true;
			document.getElementById("custType").value ="0";
			$("#custType").trigger("chosen:updated");	
			document.getElementById("ageRange").value ="0";
			$("#ageRange").trigger("chosen:updated");
			$('.chosen-select').trigger('chosen:updated');
			document.getElementById("add_cust_head_name").innerHTML = "Add Customer"; */
			$('#edt_petty').popup('hide');
		}
	</script>

	<!-- Select Only Month and Year -->
	<script>
		function getData() {
			$('#loader').show();

			var from_date = $("#datepicker").val();
			var to_date = $("#datepicker2").val();
			$
					.getJSON(
							'${getPettyCashData}',

							{

								from_date : from_date,
								to_date : to_date,
								ajax : 'true'

							},
							function(data) {
								if (data != null) {
									document.getElementById("pdf").disabled = false;
									$('#loader').hide();
								}
								//alert("Petty Info1----"+JSON.stringify(data));
								$('#table_grid td').remove();

								var cashTotal = 0;
								var withdrawlTotal = 0;

								$
										.each(
												data,
												function(i, v) {

													//alert(JSON.stringify(v));

													var acButton = '&nbsp;&nbsp;<a href="#" class="slide_open" onclick="editPettyCash('
															+ v.pettycashId
															+ ')"><i class="fa fa-edit" style="color: black;"></i></a>';
															
															var deleteButton = '<a href="${pageContext.request.contextPath}/deletePettyCashData/'+v.pettycashId+'" onClick="return confirm("Are you sure want to delete this record");"> <abbr title="Delete"><i class="fa fa-trash"></i></abbr> </a>';

													var tr = $('<tr></tr>');

													tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(i + 1));
												
													
													tr
													.append($(
															'<td style="text-align:center;"></td>')
															.html(
																	v.exVar1));
													
													tr
													.append($(
															'<td style="text-align:left;"></td>')
															.html(
																	v.exVar2));
													
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.openingAmt));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.cashAmt));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.withdrawalAmt));
													tr
															.append($(
																	'<td style="text-align:right;"></td>')
																	.html(
																			v.closingAmt));

													if ( i==0) {
														
														if(v.del=="1"){
															tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(
																			acButton+" "+deleteButton ));
															
														}else{
															tr
															.append($(
																	'<td style="text-align:center;"></td>')
																	.html(
																			acButton ));
															
														}
													} else {
														tr
																.append($(
																		'<td></td>')
																		.html(
																				" "));
													}

													cashTotal = cashTotal
															+ v.cashAmt;
													withdrawlTotal = withdrawlTotal
															+ v.withdrawalAmt;

													$('#table_grid tbody')
															.append(tr);

												})

								var tr = $('<tr></tr>');

								tr.append($('<td colspan="2"></td>').html(
										"TOTAL"));
								tr.append($('<td></td>').html(" "));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html("" + cashTotal));
								tr.append($(
										'<td style="text-align:right;"></td>')
										.html("" + withdrawlTotal));
								tr.append($('<td></td>').html(" "));
								tr.append($('<td></td>').html(" "));

								$('#table_grid tbody').append(tr);

							});

		}
	</script>

	<script type="text/javascript">
		function genPdf() {
			var fromDate = $("#datepicker").val();
			var toDate = $("#datepicker2").val();
			window
					.open('${pageContext.request.contextPath}/getPettyCashDetailPdf/'
							+ fromDate + '/' + toDate);
		}

		/* function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		} */
	</script>

	<script type="text/javascript">
		function deleteData(id) {
			window
					.open('${pageContext.request.contextPath}/deletePettyCashData/'+ id);
		}

		/* function exportToExcel() {

			window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled = true;
		} */
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






</body>

</html>