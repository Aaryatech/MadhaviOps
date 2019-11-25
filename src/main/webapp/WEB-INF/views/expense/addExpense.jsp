
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

					<form name="frm_search" id="frm_search" method="post"
						action="${pageContext.request.contextPath}/addSubmitExpense">

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
							<div class="col1title" align="right">


								<div class="col1title" align="left">
									<h3>Add Expense</h3>
								</div>

							</div>
						</div>

						<div class="colOuter">
							<div class="col-md-2">
								<div class="col1title" align="left">Chalan No *:</div>
							</div>
							<div class="col-md-3">
								<input id="itemCode" class="form-control"
									placeholder="Chalan No" name="chalanNo" autocomplete="off"
									type="text" required>

							</div>
							<div class="col-md-1"></div>
							<div class="col-md-2">
								<div class="col1title" align="left">Date*:</div>
							</div>
							<div class="col-md-3">
								<input id="expDate" class="form-control" placeholder="Date"
									name="expDate" autocomplete="off" type="text" required>
							</div>

						</div>



						<div class="colOuter">
							<div class="col-md-2">
								<div class="col1title" align="left">Amount*:</div>
							</div>
							<div class="col-md-3">
								<input id="amount" class="form-control" placeholder="Amount"
									autocomplete="off" name="amount" type="text" required>

							</div>
							<div class="col-md-1"></div>

							<div class="col-md-2">
								<div class="col1title" align="left">Type *:</div>
							</div>
							<div class="col-md-3">
								<select name="isActive" id="isActive" class="form-control"
									data-rule-required="true">
									<option value="1">Regular</option>
									<option value="2">Payment Chalan</option>

								</select>
							</div>

						</div>

						<div class="colOuter">

							<div class="col-md-2">
								<div class="col1title" align="left">Image*:</div>
							</div>
							<div class="col-md-1">
								<div class="form-group">
									<div class="fileUpload">
										<input class="upload upld" type='file' name="photo" id="photo"
											data-rule-required="true" /> <img style="width: 45px"
											src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
											alt="" />
									</div>
								</div>
							</div>


							<div class="col-md-1"></div>

							<div class="col-md-2">
								<div class="col1title" align="left">Remark</div>
							</div>
							<div class="col-md-3">
								<textarea id="remark" class="form-control" autocomplete="off"
									name="cgstPer" onkeyup="changeTax()"></textarea>

							</div>

						</div>


						<div class="colOuter">
							<div align="center">
								<input name="submit" class="buttonsaveorder" value="Submit"
									type="submit" align="center" id="submtbtn">
							</div>

						</div>
						<div id="table-scroll">
							<!-- class="table-scroll"> -->
							<div id="faux-table" class="faux-table" aria="hidden"
								style="display: none;"></div>
							<div>
								<!-- class="table-wrap" -->
								<table id="table_grid" class="responsive-table">

									<thead>
										<tr class="bgpink">
											<th class="col-sm-1">Sr No</th>
											<th class="col-md-1">Item Code</th>
											<th class="col-md-1">Name</th>
											<th class="col-md-1">Purchase Rate</th>
											<th class="col-md-1">Sale Rate</th>
											<th class="col-md-1">SGST Per</th>
											<th class="col-md-1">CGST Per</th>
											<th class="col-md-1">IGST Per</th>
											<th class="col-md-1">Is Active</th>
											<th class="col-md-1">Action</th>
										</tr>
									</thead>
									<tbody>
										<%-- 
										<c:forEach items="${itemList}" var="itemList"
											varStatus="count">
											<c:set var="color" value=""></c:set>
											<c:if test="${isEdit==1}">
												<c:choose>
													<c:when test="${itemList.itemId==otherItem.itemId}">
														<c:set var="color" value="color: red;"></c:set>
													</c:when>

												</c:choose>
											</c:if>
											<tr style="${color}">
												<td class="col-sm-1"><c:out value="${count.index+1}" /></td>
												<td class="col-md-1"><c:out value="${itemList.itemId}" /></td>
												<td class="col-md-2"><c:out
														value="${itemList.itemName}" /></td>

												<td class="col-md-1"><c:out
														value="${itemList.itemRate1}" /></td>
												<td class="col-md-1"><c:out
														value="${itemList.itemMrp1}" /></td>
												<td class="col-md-1"><c:out
														value="${itemList.itemTax1}" /></td>
												<td class="col-md-1"><c:out
														value="${itemList.itemTax2}" /></td>
												<td class="col-md-1"><c:out
														value="${itemList.itemTax3}" /></td>
												<td class="col-md-1"><c:choose>
														<c:when test="${itemList.itemIsUsed==1}">
 														Yes						
 												    </c:when>
														<c:otherwise>
												         No
												    </c:otherwise>
													</c:choose></td>
												<td class="col-md-1"><div>
														<a
															href="${pageContext.request.contextPath}/updateOtherItem/${itemList.id}">
															<abbr title='Edit'><i class='fa fa-edit'></i></abbr>
														</a> &nbsp;&nbsp; <a
															href="${pageContext.request.contextPath}/deleteOtherItem/${itemList.id}"
															onClick="return confirm('Are you sure want to delete this record');">
															<abbr title='Delete'><i class='fa fa-trash'></i></abbr>
														</a>

													</div></td>
											</tr>
										</c:forEach> --%>
								</table>

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
		$('#amount').on(
				'input',
				function() {
					this.value = this.value.replace(/[^0-9]/g, '').replace(
							/(\..*)\./g, '$1');
				});

		$(document).ready(function($) {

			$("#frm_search").submit(function(e) {
				var isError = false;
				var errMsg = "";

				if (!$("#isActive").val()) {

					isError = true;
				}

				if (!$("#amount").val()) {

					isError = true;
				}
				if (!$("#expDate").val()) {

					isError = true;
				}

				if (!$("#chalanNo").val()) {

					isError = true;
				}

				else {

					isError = false;
				}
				if (!isError) {

					var x = true;
					if (x == true) {

						document.getElementById("submtbtn").disabled = true;

						return true;
					}
					//end ajax send this to php page
				}
				return false;
			});
		});
		//
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
	<script>
		function getSelectedLabel(sel) {
			document.getElementById("selectedUom").value = sel.options[sel.selectedIndex].text;
		}
	</script>
	<script type="text/javascript">
		function changeTax() {
			var cgstPer = document.getElementById("cgstPer").value;
			if (cgstPer.length != "") {
				cgstPer = parseInt(cgstPer);
			} else {
				cgstPer = 0;
			}
			var sgstPer = document.getElementById("sgstPer").value;
			if (sgstPer.length != "") {
				sgstPer = parseInt(sgstPer);
			} else {
				sgstPer = 0;
			}
			document.getElementById("igstPer").value = (cgstPer + sgstPer)
					.toFixed(2);
		}
	</script>
</body>
</html>
