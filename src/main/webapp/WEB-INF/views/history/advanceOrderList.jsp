<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script> --%>
<jsp:include page="/WEB-INF/views/include/header.jsp" />
<html>
<head>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>

<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Madhvi</title>
<link href="${pageContext.request.contextPath}/resources/css/monginis.css" rel="stylesheet" type="text/css"/>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/feviconicon.png" type="image/x-icon"/> 
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#menuzord").menuzord({
		align:"left"
	});
});
</script> --%>
<!--rightNav-->

<!--selectlistbox-->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.selectlistbox.js"></script> --%>
<script>
	function createByJson() {
		var jsonData = [
				{
					description : 'Choos your payment gateway',
					value : '',
					text : 'Payment Gateway'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Amex-56.png',
					description : 'My life. My card...',
					value : 'amex',
					text : 'Amex'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Discover-56.png',
					description : 'It pays to Discover...',
					value : 'Discover',
					text : 'Discover'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Mastercard-56.png',
					title : 'For everything else...',
					description : 'For everything else...',
					value : 'Mastercard',
					text : 'Mastercard'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Cash-56.png',
					description : 'Sorry not available...',
					value : 'cash',
					text : 'Cash on devlivery',
					disabled : true
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Visa-56.png',
					description : 'All you need...',
					value : 'Visa',
					text : 'Visa'
				},
				{
					image : '${pageContext.request.contextPath}/resources/images/msdropdown/icons/Paypal-56.png',
					description : 'Pay and get paid...',
					value : 'Paypal',
					text : 'Paypal'
				} ];
		$("#byjson").msDropDown({
			byJson : {
				data : jsonData,
				name : 'payments2'
			}
		}).data("dd");
	}
	$(document).ready(function(e) {
		//no use
		try {
			var pages = $("#pages").msDropdown({
				on : {
					change : function(data, ui) {
						var val = data.value;
						if (val != "")
							window.location = val;
					}
				}
			}).data("dd");

			var pagename = document.location.pathname.toString();
			pagename = pagename.split("/");
			pages.setIndexByValue(pagename[pagename.length - 1]);
			$("#ver").html(msBeautify.version.msDropdown);
		} catch (e) {
			//console.log(e);	
		}

		$("#ver").html(msBeautify.version.msDropdown);

		//convert
		$("select").msDropdown({
			roundedBorder : false
		});
		createByJson();
		$("#tech").data("dd");
	});
	function showValue(h) {
		console.log(h.name, h.value);
	}
	$("#tech").change(function() {
		console.log("by jquery: ", this.value);
	})
	//
</script>
<!--selectlistbox-->



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
<body>
	<!--datepicker-->
	<c:url var="getMenus" value="/getMenus" />

	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--topLeft-nav-->

	<!--wrapper-start-->
	<div class="wrapper">

		<!--topHeader-->
		<c:url var="findAddOnRate" value="/getAddOnRate" />
		<c:url var="findItemsByCatId" value="/getFlavourBySpfId" />
		<c:url var="findAllMenus" value="/getAllTypes" />
		<c:url var="getSpBill" value="/getSpBill" />
		<c:url var="deleteSpOrder" value="/deleteSpOrder" />
		<c:url var="getItemOfAdv" value="/getItemOfAdv" />




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
				<br>
				<!--rightSidebar-->
				<div class="sidebarright">
					<div class="order-left">
						<h2 class="pageTitle">Advance Order List</h2>
						<!--<h3 class="pageTitle2">Order Date : 22-02-2017 </h3>-->
					</div>

					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->
						
						<div class="clearfix"></div>

						<div id="table-scroll" class="table-scroll">
							<div id="faux-table" class="faux-table" aria="hidden"></div>
							<div class="table-wrap">
								<table id="table_grid" class="main-table">
									<thead>
										<tr class="bgpink">
											<th class="col-md-1" style="text-align: center;">Sr.</th>
											<th class="col-md-2" style="text-align: center;">Customer</th>
											<th class="col-md-2" style="text-align: center;">Order
												Date</th>
											<th class="col-md-1" style="text-align: center;">Production
												Date</th>
											<th class="col-sm-1" style="text-align: center;">Delivery
												Date</th>
											<th class="col-sm-1" style="text-align: center;">Delivery
												Time</th>
											<th class="col-md-2" style="text-align: center;">Total</th>
											<th class="col-md-2" style="text-align: center;">Disc Amt</th>
											<th class="col-md-1" style="text-align: center;">Advance</th>
											<th class="col-sm-1" style="text-align: center;">Rem
												Amt</th>
											<th class="col-sm-1" style="text-align: right;">Is Dairy
												Mart</th>
											<th class="col-sm-1" style="text-align: center;">Action</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${orderHistory}" var="orderList"
											varStatus="count">

											<tr>
												<td class="col-md-1">${count.index+1}</td>
												<td class="col-md-2" style="text-align: left;"><c:forEach
														items="${customerList}" var="customerList" varStatus="cnt">
														<c:if test="${customerList.custId==orderList.custId}">
														${customerList.custName}
														</c:if>
													</c:forEach></td>
												<td class="col-md-2"><c:out
														value="${orderList.orderDate}" /></td>
												<td class="col-md-1" style="text-align: right;"><c:out
														value="${orderList.prodDate}" /></td>
												<td style="text-align: center;" class="col-sm-1"><c:out
														value="${orderList.deliveryDate}" /></td>
												<td style="text-align: center;" class="col-sm-1"><c:out
														value="${orderList.exVar2}" /></td>
												<td class="col-md-2" style="text-align: right;"><c:out
														value="${orderList.total}" /></td>
														<td class="col-md-2" style="text-align: right;"><c:out
														value="${orderList.discAmt}" /></td>
												<td class="col-md-1" style="text-align: right;"><c:out
														value="${orderList.advanceAmt}" /></td>
												<td style="text-align: center;" class="col-sm-1"><c:out
														value="${orderList.total-orderList.advanceAmt-orderList.discAmt}" /></td>

												<c:choose>
													<c:when test="${orderList.isDailyMart==2}">
														<td style="text-align: center;" class="col-sm-1">Yes</td>
													</c:when>

													<c:otherwise>
														<td style="text-align: center;" class="col-sm-1">No</td>
													</c:otherwise>
												</c:choose>


												<td>
												
												<a
													href="${pageContext.request.contextPath}/showAdvanceOrderDetail/${orderList.advHeaderId}/${orderList.deliveryDate}/${orderList.frId}">
														<abbr title='Advance Order Detail'><i
															class='fa fa-list'></i></abbr>
												</a>&nbsp;&nbsp;&nbsp;&nbsp; <c:choose>
														<c:when test="${orderList.delStatus==1}">

															<c:if test="${orderList.isSellBillGenerated==0}">
																<a href="#"
																	onclick="showCustBillForAdvOrder(${orderList.advHeaderId},${orderList.custId})">
																	<abbr title='Generate Sell Bill'>BILL</abbr>
																</a>
															</c:if>

														</c:when>

														
													</c:choose> 
													<%-- <c:if test="${orderList.delStatus==1}">

														<c:if test="${orderList.isSellBillGenerated==0}">
															<a href="#"
																onclick="showCustBillForAdvOrder(${orderList.advHeaderId},${orderList.custId})">
																<abbr title='Generate Sell Bill'>BILL</abbr>
															</a>
														</c:if>
													</c:if> --%>
													
													</td>

											</tr>
										</c:forEach>


									</tbody>

								</table>
								
								<br><br>
							</div>
						</div>



						<br />


						<div class="clearfix"></div>

						<br />



					</div>

				</div>



			</div>
			<!--tabNavigation-->

			<!--<div class="order-btn"><a href="#" class="saveOrder">SAVE ORDER</a></div>-->
			<!-- <div class="order-btn textcenter">
<a href="http://monginisaurangabad.com/index.php/dashboard/order_export?sel_group=1&sel_date=2017-09-05" class="buttonsaveorder">EXPORT TO EXCEL</a>
<input name="" class="buttonsaveorder" value="EXPORT TO EXCEL" type="button">
</div>  -->


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
	<!--easyTabs-->
	<script type="text/javascript">

function showCustBillForAdvOrder(headId,custId){
	//alert("hii"+custId);
	
	 $.getJSON('${getItemOfAdv}', {
		 headId:headId,
		 custId:custId,
         ajax : 'true'
     }, function(data) {
    	 
    	
  	   if(data.error == false)
  		   {
  		    window.open("${pageContext.request.contextPath}/newcustomerbill/0","_self");

  		   }
  	   
     });
	
}


</script>
	<script>


	function openNav() {
		document.getElementById("mySidenav").style.width = "100%";
	}

	function closeNav() {
		document.getElementById("mySidenav").style.width = "0";
	}
	function openNav1() {
		document.getElementById("mySidenav1").style.width = "100%";
	}

	function closeNav1() {
		document.getElementById("mySidenav1").style.width = "0";
	}
	function openNav3() {
		document.getElementById("mySidenav3").style.width = "100%";
	}

	function closeNav3() {
		document.getElementById("mySidenav3").style.width = "0";
	}
</script>

	<script type="text/javascript">
function genPdf()
{		
	window.open('${pageContext.request.contextPath}/pdf/showOrderHistoryPdf');
}

</script>


	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen.jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/dropdownmultiple/chosen-active.js"></script>

</body>
</html>
