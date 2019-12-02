
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
.form-control {
	text-align: left !important;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<c:url var="editFrSupplier" value="/editFrSupplier"></c:url>

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
				<div class="sidebarright">

					<div class="order-left">
						<h2 class="pageTitle">Advance Order Detail List</h2>

					</div>
					<br>
					<div class="order-right" align="right"></div>
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



						<div>
							<!-- class="table-wrap" -->
							<div id="table-scroll" class="table-scroll">
								<div id="faux-table" class="faux-table" aria="hidden">
									<!-- 					<div class="table-wrap">
 -->
								</div>
								<div class="table-wrap">
									<table id="table_grid" class="main-table">
										<thead>

											<tr class="bgpink">
												<th width="138" style="width: 18px" align="left">No</th>
												<th class="col-md-2">Item Name</th>

												<th class="col-md-2">Category</th>

												<th class="col-md-1">Order Qty</th>

												<th class="col-md-1">MRP</th>
												<th class="col-md-1">Rate</th>


											</tr>
										</thead>


										<tbody>

											<c:forEach items="${orderHistory}" var="orderList"
												varStatus="count">

												<tr>
													<td class="col-md-1">${count.index+1}</td>
													<td class="col-md-2"><c:out
															value="${orderList.itemName}" /></td>
													<td class="col-md-2"><c:out
															value="${orderList.menuTitle}" /></td>
													<td class="col-md-1" style="text-align: right;"><c:out
															value="${orderList.orderQty}" /></td>
													<td style="text-align: center;" class="col-sm-1"><c:out
															value="${orderList.orderMrp}" /></td>
													<td class="col-md-1"><c:out
															value="${orderList.orderRate}" /></td>


												</tr>
											</c:forEach>

										</tbody>

									</table>
								</div>
							</div>

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
