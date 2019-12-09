<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">
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
<title>Monginis</title>
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

</head> --%>
<body onload="calClosingAmt()">	<!-- getData() -->

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
<c:url var="getPettyCashHandOverData" value="/getPettyCashHandOverData"></c:url>


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
				<div class="order-left">
					<h2 class="pageTitle">Petty Cash Management</h2>
					<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->
				</div>
				
				
				
				 <div class="order-right" align="right" style="padding-top:2%; padding-bottom: 2%;">

					<a href="#" class="buttonsaveorder initialism slide_open" id="popbtn" style="display: none;">
					Cash Hand Over Data</a>

					<a href="${pageContext.request.contextPath}/getPettyCashTransactions"><input
						type="button" value="Petty Cash Details" class="buttonsaveorder">
					</a>
				</div> 
		<form action="addPettyCash" method="post">
			<input type="hidden" value="${pettycash.pettycashId}" name="petty_id">
			<input type="hidden" value="${pettycash.cashAmt}" name="cash_edit_amt">
				
				<div class="colOuter">
					<div class="col-md-2">
						<div class="col1title" align="left">Date</div>
					</div>
					<div class="col-md-3">
							<input id="fromdate" class="form-control" readonly="readonly"
							autocomplete="off" placeholder="Date" name="cash_date"
							type="text" value="${pettycash.date}" onchange="compareDate()">
					</div>
					
					<div class="col-md-1"></div>
					
					<div class="col-sm-2">
						<div class="col1title" align="left">Opening Amt</div>
					</div>
					<div class="col-md-3">
							<input id="opening_amt"  class="form-control" readonly="readonly" value="${pettycash.openingAmt}"
							autocomplete="off" placeholder="Opening Amt" name="opening_amt"  
							type="text">
					</div>
					
					
				</div>
				
				<div class="colOuter">
					<div class="col-md-2">
						<div class="col1title" align="left">Cash Amt</div>
					</div>
					<div class="col-md-3">
							<input id="cash_amt"  class="form-control" value="${pettycash.cashAmt}"
							autocomplete="off" placeholder="Cash Amt" name="cash_amt" onchange="calClosingAmt()"
							type="text">
					</div>					
					
					<div class="col-md-1"></div>
					
					<div class="col-md-2">
						<div class="col1title" align="left">Withdrawal Amt</div>
					</div>
					<div class="col-md-3">
							<input id="withdrawal_amt"  class="form-control" value="${pettycash.withdrawalAmt}"
							autocomplete="off" placeholder="Withdrawal Amt" name="withdrawal_amt"
							type="text" onblur="calClosingAmt()">
					</div>
					
					
				</div>

				<!-- <div class="colOuter">
					<div class="col-md-2">
						<div class="col1title" align="left">Card Amt</div>
					</div>
					<div class="col-md-3">
							<input id="card_Amt"  class="form-control"
							autocomplete="off" placeholder="Card Amt" name="card_Amt"
							type="text">
					</div>	
					
					<div class="col-md-1"></div>			
					
					<div class="col-md-2">
						<div class="col1title" align="left">Other Amt</div>
					</div>
					<div class="col-md-3">
							<input id="other_amt"  class="form-control"
							autocomplete="off" placeholder="Other Amt" name="other_amt"
							type="text">
					</div>
				</div> -->
				
				<div class="colOuter">				
				<div class="col-md-2">
						<div class="col1title" align="left">Closing Amt</div>
					</div>
					
					<div class="col-md-3">
							<input id="closing_amt"  class="form-control" readonly="readonly"
							autocomplete="off" placeholder="Closing Amt" name="closing_amt"
							type="text">
					</div>
						
						
						<%-- <c:if test="${isEdit==1}">
					<div class="col-md-3">
							<input id="closing_amt2"  class="form-control" disabled value="${pettycash.closingAmt}"
							autocomplete="off" placeholder="Other Amt" name="closing_amt"
							type="text">
					</div>
						</c:if> --%>							
					
					<div class="col-md-1"></div>
					
					<!-- <div class="col-md-2">
						<div class="col1title" align="left">Total Amt</div>
					</div>
					<div class="col-md-3">
							<input id="total_amt"  class="form-control" disabled value="00"
							autocomplete="off" placeholder="Total Amt" name="total_amt"
							type="text">
					</div>	 -->				
					
				</div>	

				<div class="colOuter">
					<div class="col1">
						<div class="col1title"></div>
					</div>
					<div class="col2">
						<input class="buttonsaveorder" value="Day End"
							type="submit" id="btnsub">

						<!-- <div align="center" id="loader" style="display: none">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div> -->
					</div>
					
					<div class="col-md-1">
						<input class="buttonsaveorder" value="Cash Hand Over"
							type="button" id="show">					
					</div>
					



				</div>
				
				</form>
				
				<!-- <div class="col2">
						<input class="buttonsaveorder" value="Cash Hand Over"
							type="button" id="btnsub" onclick="showDiv()">

						<div align="center" id="loader" style="display: none">

							<span>
								<h4>
									<font color="#343690">Loading</font>
								</h4>
							</span> <span class="l-1"></span> <span class="l-2"></span> <span
								class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
							<span class="l-6"></span>
						</div>
					</div> -->

			<!-- Petti Cash Hand Over Div -->
				<div class="row" id="pc_div" style="display: none;">
				<h2 class="pageTitle">Petty Cash Hand Over</h2>
					<div class="col-md-12">
						<!--table-->
						<form action="insertPettyCashHandOver" method="POST"
							id="petty_cash_hand" name="petty_cash_hand">
							<div class="colOuter">
								<div class="col-md-2">
									<div class="col1title" align="left">Opening Amt</div>
								</div>
								<div class="col-md-3">
										<input id="open_amt"  class="form-control" value="${openAmt}"
										autocomplete="off" placeholder="Opening Amt" name="open_amt"
										readonly="readonly" type="text">
								</div>
								
								<div class="col-md-1"></div>
								
								<div class="col-md-2">
									<div class="col1title" align="left">Selling Amt</div>
								</div>
								<div class="col-md-3">
										<input id="sell_amt"  class="form-control" value="${sellAmt}"
										autocomplete="off" placeholder="Selling Amt" name="sell_amt"
										readonly="readonly"type="text">
								</div>
						 </div>
						 
						 
						 
						  <div class="colOuter">
								<div class="col-md-2">
									<div class="col1title" align="left">Total Cash Hand Over Amt</div>
								</div>
								<div class="col-md-3">
										<input id="total_cash_amt"  class="form-control" value="${totalCash}"
										autocomplete="off" placeholder="Total Cash Amt" name="total_cash_amt" 
										readonly="readonly" type="text">
								</div>
								
								<div class="col-md-1"></div>
								<div class="col-md-2">
									<div class="col1title" align="left">Actual Cash Hand Over Amt</div>
								</div>
								<div class="col-md-3">
										<input id="actual_cash_amt"  class="form-control" value="${totalCash}"
										autocomplete="off" placeholder="Actual Cash Amt" name="actual_cash_amt"
										type="text">
								</div>
						 </div>
						 
						 
						  <div class="colOuter">
					<div class="col-md-2">
						<div class="col1title" align="left">From Employee</div>
					</div>
					<div class="col-md-3">
							<select name="from_emp" id="from_emp" class="form-control" required>
								<option style="text-align:left;" value="0">Select Employee</option>
								<c:forEach items="${empList}" var="empList" >
								<c:if test="${frId == empList.frEmpId}"></c:if>
								<option selected="selected" value="${empList.frEmpId}-${empList.frEmpName}" style="text-align:left;">${empList.frEmpName}</option>
								</c:forEach>
							</select>
					</div>					
					
					<div class="col-md-1"></div>
					
					<div class="col-md-2">
						<div class="col1title" align="left">To Employee</div>
					</div>
					<div class="col-md-3">
							<select name="to_emp" id="to_emp" class="form-control" required>
								<option style="text-align:left;" value="0">Select Employee</option>
								<c:forEach items="${empList}" var="empList" >
								<option value="${empList.frEmpId}-${empList.frEmpName}" style="text-align:left;">${empList.frEmpName}</option>
								</c:forEach>

							</select>
					</div>
					
					
				</div>
						<div class="colOuter">
							<div class="col1">
								<div class="col1title"></div>
							</div>
							<div class="col2">
								<input class="buttonsaveorder" value="Submit"
									type="submit" id="btnsub2">
		
								<!-- <div align="center" id="loader" style="display: none">
		
									<span>
										<h4>
											<font color="#343690">Loading</font>
										</h4>
									</span> <span class="l-1"></span> <span class="l-2"></span> <span
										class="l-3"></span> <span class="l-4"></span> <span class="l-5"></span>
									<span class="l-6"></span>
								</div> -->
							</div>	
							
							<div class="col-md-1">
								<input class="buttonsaveorder" value="Close"
									type="button" id="hide">
							</div>	
					</div>
					
					
							
							</form>
						</div>
						<!-- </div> -->


<!-- Table Div Close -->
				<%-- <div class="row">
					<div class="col-md-12">
						<!--table-->
						<form action="" method="POST"
							onsubmit="substk.disabled = true; return confirm('Do you want to Month End ?');">
							<div class="clearfix"></div>
							<div class="col-md-9"></div>
							<label for="search" class="col-md-3" id="search"> <i
								class="fa fa-search" style="font-size: 20px"></i> <input
								type="text" id="myInput" onkeyup="myFunction()"
								style="border-radius: 25px;" placeholder="Search items by name"
								title="Type item name">
							</label>
							
							<div id="table-scroll"  class="table-scroll responsive-table-one" style="display: none;"><!-- class="table-scroll" -->								
								<div><!--  class="table-wrap" -->
									<table id="table_grid" class="responsive-table"><!-- class="main-table" -->
										<thead>
											<tr class="bgpink">
												<th class="col-md-1">Sr. No</th>
												<th class="col-md-1">Transaction Date</th>
												<th class="col-md-1">Opening Amt</th>
												<th class="col-md-1">Selling Amt</th>
												<th class="col-md-1">Total Cash Amt</th>
												<th class="col-md-1">Actual Cash Hand Over</th>
												<th class="col-md-1">From Employee</th>
												<th class="col-md-1">To Employee</th>
												<!-- <th class="col-md-1">Action</th> -->

											</tr>
										</thead>
										<tbody>
										<c:forEach items="${cashHndOvrList}" var="list"
														varStatus="count">
											<tr>
												<td >${count.index+1}</td>
												<td>${list.transactionDate}</td>
												<td>${list.openingAmt}</td>
												<td>${list.sellingAmt}</td>
												<td>${list.actualAmtHandover}</td>
												<td>${list.amtHandover}</td>
												<td>${list.fromUsername}</td>
												<td>${list.toUsername}</td>
												<!-- pettycashId -->
												<td>
														<a href="${pageContext.request.contextPath}/editPettyCash?pettyCashIdId=${pettyList.pettycashId}" title="Edit">
														<i class="fa fa-edit"></i></a>
		
													<abbr title="Delete"><i class="fa fa-trash"><a href="${pageContext.request.contextPath}/editPettyCash?pettyCashIdId=${pettyList.pettycashId}"></a></i></abbr>
												</td>
											</tr>
											</c:forEach>
										</tbody>										
									</table>
								</div>

							</div>


							<!-- <div class="col-md-2">

								<button type="button" class="btn btn-primary"
									onclick="exportToExcel();" id="expExcel">
									Export To Excel</button>
						 	</div> 


							<div class="col-md-3">
 
								<button type="button" class="btn btn-primary" onclick="genPdf()"
									id="PDFButton">
									PDF</button>
							</div>-->

						</form>
					</div>
				</div> --%>
				<!-- Table Div Close -->
				</div>
				<!-- Petti Cash Hand Over Div Close -->
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
<div>
<div id="slide" class="pending_pop">

<div class="row">
	<button class="slide_close"><i class="fa fa-times" aria-hidden="true"></i></button>
	<h3 class="pop_head" id="add_cust_head_name">Petty Cash Hand Over Transaction</h3>
		<div class="col-md-2 from_date">
		    <h4 class="pull-left">From Date:-</h4>
		</div>
		<div class="col-md-2 ">
			<input autocomplete="off" placeholder="dd-mm-yyy"
							name="fromDate" id="fromDate" type="date" class="input_add" />
		</div>
		<div class="col-md-2">
		    <h4 class="pull-left">To Date:-</h4>
		</div>
		<div class="col-md-2 ">
			<input autocomplete="off" placeholder="dd-mm-yyy"
							name="toDate" id="toDate" type="date" class="input_add" />
		</div>
		<div class="col-md-2">
		    <button class="btn search_btn pull-left" onclick="getData()">Search </button>
		</div>
		
    </div>
<div class="row">
		<div class="col-md-12">
		<!--table-->
			<div class="clearfix"></div>
				
					<div class="pending_tab" style="overflow-x:auto;">
					  <table class="pending_tab1" id="table_grid">
					    <thead>
						    <tr>
							     <th>Sr. No</th>
								 <th>Transaction Date</th>
								 <th>Opening Amt</th>
								 <th>Selling Amt</th>
								 <th>Total Cash Amt</th>
								 <th>Actual Cash Hand Over</th>
								 <th>Expenses</th>
								 <th>From Employee</th>
								 <th>To Employee</th>
						    </tr>
					    </thead>
						    <tbody>
									
							</tbody>
					  </table>
					</div>
				</div>
			</div>
		</div>
	</div>
			
			<script type="text/javascript">
			$(document).ready(function () {
			    $('#slide').popup({
			        focusdelay: 400,
			        outline: true,
			        vertical: 'top'
			    });
			});
			</script>
<!--easyTabs-->
<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--easyTabs-->

<script>

$(document).ready(function($){
	
	$("#petty_cash_hand").submit(function(e) {
	
		var isError=false;
		 var errMsg="";
			
		 var e1 = $("#from_emp").val();
		 if(e1 == 0){			 
			 alert("Select From Employee");
			 return false;
		 }
		 
		 var e2 = $("#to_emp").val();
		 if(e2 == 0){
			 
			 alert("Select To Employee");
			 return false;
		 }
			
				 
		});
});

$(document).ready(function(){
	  $("#hide").click(function(){
	    $("#pc_div").hide();
	  });
	  $("#show").click(function(){
	    $("#pc_div").show();
	  });
	  
	 	 $("#hide").click(function(){
		    $("#popbtn").hide();
		  });
		  $("#show").click(function(){
		    $("#popbtn").show();
		  });
	  
	  
});
	
	


function compareDate(){
	var selDate = $("#fromdatepicker").val();
	
	var today = new Date();
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
	var yyyy = today.getFullYear();
	today = dd + '-' + mm + '-' + yyyy;
	
	
	var from_date = selDate;
    var to_date = today;
    var x=0;
    //alert("Date---"+to_date+"*******++**** "+from_date);
    
           var fromdate = from_date.split('-');
           from_date = new Date();
           from_date.setFullYear(fromdate[2],fromdate[1]-1,fromdate[0]);
           var todate = to_date.split('-');
           to_date = new Date();
           to_date.setFullYear(todate[2],todate[1]-1,todate[0]);
           if (from_date > to_date) 
           {
        	  // alert("buttn Disabled")
        	   document.getElementById("btnsub").disabled = true;
        	  alert("Invalid Date");
		   }else {
				document.getElementById("btnsub").disabled = false;
		   }
}

function calClosingAmt(){
	
	var cashAmt = parseFloat($("#cash_amt").val());
	var openAmt = parseFloat($("#opening_amt").val());
	var withdrawAmt = parseFloat($("#withdrawal_amt").val());
	
	var closeAmt = openAmt+cashAmt-withdrawAmt;

	document.getElementById("closing_amt").value = parseFloat(closeAmt);	
}
</script>

<!-- Select Only Month and Year -->
<script>
 function getData(){
	 $('#table_grid td').remove();
		var isValid = validate();
		
		if (isValid) {
			
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;
	$
	.getJSON(
			'${getPettyCashHandOverData}',

			{
				 
				fromDate : fromDate,
				toDate : toDate,
				ajax : 'true'

			},
			function(data) {
				
				//$('#table_grid tbody').remove(); 
				

			  $.each(
							data,
							function(key, cashHndOvr) {								
								//alert(JSON.stringify(cashHndOvr));
								$('#loader').hide();

								/* document.getElementById("expExcel").disabled = false;
								document.getElementById("PDFButton").disabled = false;

								if (data == "") {
									alert("No records found !!");
									document.getElementById("expExcel").disabled = true;
									document.getElementById("PDFButton").disabled = true;
								
								} */

								var tr = $('<tr  ></tr>');
								 
								tr.append($('<td  ></td>').html(key+1));
								tr.append($('<td  ></td>').html(cashHndOvr.transactionDate));
								tr.append($('<td style="text-align:right"></td>').html(cashHndOvr.openingAmt));
							  	tr.append($('<td style="text-align:right;"></td>').html(cashHndOvr.sellingAmt));
							  	tr.append($('<td style="text-align:right;"></td>').html(cashHndOvr.actualAmtHandover));
							  	tr.append($('<td style="text-align:right;"></td>').html(cashHndOvr.amtHandover));
							  	
							  	tr.append($('<td style="text-align:right;"></td>').html(cashHndOvr.amtHandover-cashHndOvr.actualAmtHandover));
							  	
							  	tr.append($('<td  ></td>').html(cashHndOvr.fromUsername));
							  	tr.append($('<td  ></td>').html(cashHndOvr.toUsername));
							  //	tr.append($('<td></td>').html('<abbr title="Edit"><i id="edit'+key+'" onclick="edit('+key+')" class="fa fa-edit"></i> </abbr><span style="visibility: hidden;" class="glyphicon glyphicon-ok" onclick="submit('+key+');" id="ok'+key+'"></span><abbr title="Delete"><i onclick="del('+key+')" class="fa fa-trash"></i></abbr>'));
							  	$('#table_grid tbody').append(tr);

							})  
			});
		}
	
}
</script>
<script type="text/javascript">
	function validate() {
	
	
		var fromDate =$("#fromDate").val();
		var toDate =$("#toDate").val();
		

		var isValid = true;

	 if (fromDate == "" || fromDate == null) {

			isValid = false;
			alert("Please select From Date");
		}
	 else if (toDate == "" || toDate == null) {

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
</script>
<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[1];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>

<script type="text/javascript">
	function genPdf() {
		/* alert("hiii"); */
		/* var fromDate = document.getElementById("fromdatepicker").value;
		var toDate = document.getElementById("todatepicker").value;
		alert(fromDate);
		alert(toDate); */

		var selectRate = document.getElementById('select_rate').value;

		window.open('${pageContext.request.contextPath}/showStockDetailsPdf/'
				+ selectRate);
		/* document.getElementById("expExcel").disabled = true; */

	}

	function exportToExcel() {

		window.open("${pageContext.request.contextPath}/exportToExcel");
		document.getElementById("expExcel").disabled = true;
	}
</script>



</body>

</html>