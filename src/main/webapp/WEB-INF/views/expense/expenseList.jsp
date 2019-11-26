
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
						<h2 class="pageTitle">Add Expense</h2>

					</div>
					<br>
					<div class="order-right" align="right">
						<a href="${pageContext.request.contextPath}/showAddExpense"><button
								class="btn btn-success">Add Expense</button></a>
					</div>
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
								<div class="col1title"> From Date</div>
							</div>
							<div class="col-md-2">
								<input id="fromdatepicker" class="texboxitemcode texboxcal" required
								  name="fromDate" autocomplete="off" value="${fromDate}"
									type="text">

							</div>

							<div class="col-md-1"></div>
							<div class="col-md-1">
								<div class="col1title"> To Date</div>
							</div>
							<div class="col-md-2">
								<input id="todatepicker" class="texboxitemcode texboxcal" required
								  name="toDate" autocomplete="off" value="${toDate}"
									type="text">

							</div>
							<div class="col-md-1"></div>
							<div class="col-md-1">
								<div class="col1title" >Type *:</div>
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
											<th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Chalan No.</th>
											<th class="col-md-1">Date</th>
											<th class="col-md-1">Amount</th>
											<th class="col-md-1">Status</th>
											<th class="col-md-1">Action</th>
											 
										</tr>
									</thead>
									<tbody>
										
										<c:forEach items="${expList}" var="expList"
											varStatus="count">
											 
											<tr>
												<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
 												<td class="col-md-2"><c:out
														value="${expList.chalanNo}" /></td>

												<td class="col-md-2"><c:out
														value="${expList.expDate}" /></td>
												<td class="col-md-1"><c:out
														value="${expList.chAmt}" /></td>
										 												 
												<td class="col-md-2"><c:choose>
														<c:when test="${expList.expType==1}">
 														Regular						
 												    </c:when>
														<c:otherwise>
												         Payment Chalan
												    </c:otherwise>
													</c:choose></td>
												<td class="col-md-2"><div>
												
												<c:if test="${expList.expType==1}">
														<a
															href="${pageContext.request.contextPath}/showEditExpense/${expList.expId}">
															<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
														</a> &nbsp;&nbsp; <a
															href="${pageContext.request.contextPath}/deleteExpense/${expList.expId}"
															onClick="return confirm('Are you sure want to delete this record');">
															<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
														</a>
														</c:if>
														
														<c:if test="${expList.expType==2}">
																<c:if test="${expList.status==1}">
														
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
