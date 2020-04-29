
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<jsp:useBean id="dateValue" class="java.util.Date" />
<%-- <jsp:setProperty name="dateValue" property="time" value="${h.time}" /> --%>

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/newpos/images/favicon.png"
	type="images/png" sizes="32x32">
<style>
.form-control {
	text-align: left !important;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<c:url var="editFrSupplier" value="/editFrSupplier"></c:url>
	<c:url var="getBillReceiptDetailListForOpsByExpId"
		value="/getBillReceiptDetailListForOpsByExpId"></c:url>

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

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<jsp:include page="/WEB-INF/views/include/logo.jsp"></jsp:include>

		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">

				<!--leftNav-->

				<jsp:include page="/WEB-INF/views/include/left.jsp">
					<jsp:param name="myMenu" value="${menuList}" />
				</jsp:include>

				<br>
				<div class="sidebarright">

					<div class="order-left">
						<h2 class="pageTitle">Expense List</h2>

						<c:if test="${not empty sessionScope.passMsg}">

							<h4 class="pageTitle"
								style="text-align: center; float: none; border: 1px solid #ed1c24; color: #ed1c24;">${sessionScope.passMsg}</h4>
							<br>
							<br>
						</c:if>
						<%
							session.removeAttribute("passMsg");
						%>

					</div>

					<div class="order-right" align="right">
						<a href="${pageContext.request.contextPath}/showAddExpense"><button
								class="buttonsaveorder">Add Expense</button></a>
					</div>
					<br> <br>

					<form name="frm_search" id="frm_search" method="get"
						action="${pageContext.request.contextPath}/showExpenseList">

						<div class="col-md -3">
							<%-- 	<c:choose>
						<c:when test="${isEdit==1}">
						<div class="col1title" align="left"><h3>Edit Other Item</h3></div>
						</c:when>
						<c:otherwise>
						<div class="col1title" align="left"><h3>Add Other Item</h3></div>
						</c:otherwise>
						</c:choose>
							<input id="itemId" class="form-control"	  name="itemId" value="${itemSup.id}" type="hidden" >
							<input id="id" class="form-control"	  name="id"  value="${item.id}" type="hidden" >	 --%>

						</div>

						<div class="colOuter">
							<div class="col-md-1">
								<div class="col1title">From Date</div>
							</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal"
									required name="fromDate" autocomplete="off" value="${fromDate}"
									type="text">

							</div>

							<div class="col-md-1"></div>
							<div class="col-md-1">
								<div class="col1title">To Date</div>
							</div>
							<div class="col-md-2">
								<input id="todatepicker" class="texboxitemcode texboxcal"
									required name="toDate" autocomplete="off" value="${toDate}"
									type="text">

							</div>
							<div class="col-md-1"></div>
							<div class="col-md-1">
								<div class="col1title">Type</div>
							</div>
							<div class="col-md-2">
								<select name="type" id="isActive" class="form-control"
									data-rule-required="true">
									<option value="1">Regular</option>
									<option value="2">Payment Chalan</option>

								</select>
							</div>


						</div>

						<div class="colOuter">
							<div align="center">
								<input name="submit" class="buttonsaveorder" value="Submit"
									type="submit" align="center" id="submtbtn">
							</div>

						</div>


						<div>
							<!-- class="table-wrap" -->
							<table id="table_grid" class="responsive-table">

								<thead>
									<tr class="bgpink">
										<th class="col-sm-1" style="text-align: center;">Sr No</th>
										<th class="col-md-1" style="text-align: center;">Chalan
											No.</th>
										<th class="col-md-1" style="text-align: center;">Date</th>
										<th class="col-md-1" style="text-align: center;">Amount</th>
										<th class="col-md-1" style="text-align: center;">Remark</th>
										<th class="col-md-1" style="text-align: center;">Attachment</th>
										<th class="col-md-1" style="text-align: center;">User</th>
										<th class="col-md-1" style="text-align: center;">Status</th>
										<th class="col-md-1" style="text-align: center;">Action</th>

									</tr>
								</thead>
								<tbody>

									<c:forEach items="${expList}" var="expList" varStatus="count">

										<tr>
											<td class="col-sm-1" style="text-align: center;"><c:out
													value="${count.index+1}" /></td>
											<td class="col-md-2" style="text-align: center;"><c:out
													value="${expList.chalanNo}" /></td>

											<td class="col-md-2" style="text-align: center;"><c:out
													value="${expList.expDate}" /></td>
											<td class="col-md-1"><c:out value="${expList.chAmt}" /></td>

											<td class="col-md-1" style="text-align: left;"><c:out
													value="${expList.remark}" /></td>

											<td class="col-md-1" style="text-align: left;"><a
												href="${imageUrl}${expList.imgName}" download><img
													src="${imageUrl}${expList.imgName}"
													style="width: 80px; height: 80px;"
													onerror="this.src='${pageContext.request.contextPath}/resources/images/No_Image_Available.jpg';"></a>

											</td>

											<td class="col-md-1" style="text-align: left;"><c:out
													value="${expList.exVar2}" /></td>

											<td class="col-md-2" style="text-align: center;"><c:choose>
													<c:when test="${expList.expType==1}">
 														Regular						
 												    </c:when>
													<c:otherwise>
												         Payment Chalan
												    </c:otherwise>
												</c:choose></td>



											<td class="col-md-2" style="text-align: center;"><div>

													<c:if
														test="${expList.expType==1 && sessionScope.frEmpDetails.frEmpId==expList.exInt2 && (currDate == expList.expDate)}">
														<a
															href="${pageContext.request.contextPath}/showEditExpense/${expList.expId}">
															<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
														</a> &nbsp;&nbsp; <a
															href="${pageContext.request.contextPath}/deleteExpense/${expList.expId}"
															onClick="return confirm('Are you sure want to delete this record');">
															<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
														</a>
													</c:if>

													<c:if
														test="${expList.expType==2 && sessionScope.frEmpDetails.frEmpId==expList.exInt2 && (currDate == expList.expDate)}">
														<c:if test="${expList.status==2}">

															<a
																href="${pageContext.request.contextPath}/showEditExpense/${expList.expId}">
																<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
															</a> &nbsp;&nbsp; <a
																href="${pageContext.request.contextPath}/deleteExpense/${expList.expId}"
																onClick="return confirm('Are you sure want to delete this record');">
																<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
															</a>
														</c:if>

													</c:if>


													<c:if test="${expList.expType==2 && expList.exInt3==1}">
														&nbsp;&nbsp;
														<a href=""
															onclick="showDetailsForBillReceipt(${expList.expId})">
															<abbr title='Bill Receipt Details' class="slide_open"><i
																class='fa fa-bars'></i></abbr>
														</a>
													</c:if>

												</div></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>


					</form>


				</div>
				<!--tabNavigation-->


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
				<h2 class="page_title" id="add_cust_head_name">Bill Receipt
					Details</h2>
				<div class="clr"></div>
			</div>

			<br>


			<div class="row">
				<div class="col-md-12">
					<!--table-->
					<div class="clearfix"></div>

					<div class="pending_tab" style="overflow-x: auto; height: 75%;">
						<table class="pending_tab1" id="table_grid1">
							<thead>
								<tr>
									<th>Sr. No</th>
									<th>Receipt Date</th>
									<th>Bill Invoice</th>
									<th>Bill Amount</th>
									<th>Paid Amount</th>

								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br>



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


	<script type="text/javascript">
		function showDetailsForBillReceipt(expId) {
			//alert("hi");
			
			//document.getElementById("expAmt").innerHTML = expAmt;
			
			$('#table_grid1 td').remove();

			$.getJSON('${getBillReceiptDetailListForOpsByExpId}', {

				expId : expId,
				ajax : 'true',
			}, function(data) {

				if (data == "") {
					alert("No Record Found!");
				}

				$('#table_grid1 td').remove();

				$.each(data, function(key, data1) {

					var tr = $('<tr></tr>');

					tr.append($('<td></td>').html(key + 1));
					
					tr.append($('<td></td style="text_align:center;">').html(
							data1.exVar2));

					tr.append($('<td></td style="text_align:center;">').html(
							data1.invoiceNo));
					tr.append($('<td></td style="text_align:right;">').html(
							data1.billAmt));
					tr.append($('<td></td style="text_align:right;">').html(
							data1.paidAmt));

					$('#table_grid1 tbody').append(tr);

				});

			});
		}
	</script>


	<!--easyTabs-->
	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!--easyTabs-->
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

		$(function() {
			$("#popdatepicker").datepicker({
				dateFormat : 'dd-mm-yy'
			});
		});
	</script>

</body>
</html>
