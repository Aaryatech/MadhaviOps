<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Madhvi</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="Madhvi" />
<meta name="description" content="Madhvi" />
<meta name="author" content="Madhvi">
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<!--Here Previous Block of Code, Commented at End -->
</head>
<body>
	<form action="" method="get">
		<!--wrapper-start-->
		<div class="wrapper">
			<jsp:include page="/WEB-INF/views/include/logo.jsp">
				<jsp:param name="fr" value="${frDetails}" />
			</jsp:include>
			<jsp:include page="/WEB-INF/views/include/left.jsp">
				<jsp:param name="fr" value="${frDetails}" />
			</jsp:include>
			<section class="main_container">
				<!--page title-start-->
				<div class="page_head">
					<div class="page_title">Dashboard</div>


<form action="${pageContext.request.contextPath}/getCounts"  method="post">
					<div class="col-md-1">
						<input type="radio" name="gender" id="type" value="1"
							  style="width: 10px;" checked
							onclick="showDiv(this.value)"> Toady
					</div>
					<div class="col-md-1">
						<input type="radio" name="type" id="gender" value="2"
							style="width: 10px;" onclick="showDiv(this.value)"> Week

					</div>
					<div class="col-md-1">
						<input type="radio" name="type" id="gender" value="3"
							style="width: 10px;" onclick="showDiv(this.value)"> Month
					</div>
					<div class="col-md-1">
						<input type="radio" name="type" id="gender" value="4"
							onclick="showDiv(this.value)" style="width: 10px;">
						Custom
					</div>
					<div id="ihide" style="display: none;">
						<div class="col-md-1">
							<div class="col1title">From Date</div>
						</div>
						<div class="col-md-2">
							<input id="fromdatepicker" class="texboxitemcode texboxcal"
								required="required" placeholder="From Date" name="devDate"
								autocomplete="off" type="text">

						</div>
						<div class="col-md-1">
							<div class="col1title">To Date</div>
						</div>
						<div class="col-md-2">
							<input id="todatepicker" class="texboxitemcode texboxcal"
								required="required" placeholder="From Date" name="devDate"
								autocomplete="off" type="text">

						</div>

					</div>
					
								<div ><button type="submit" >&nbsp;Submit</button></div>
					</form>

					<div class="page_bread">
						<ul>
							<li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>
									Home</a></li>
							<li class="active">Dashboard</li>
						</ul>
					</div>
					<div class="clr"></div>
				</div>
				<div class="quick_links">
					<h3 class="bx_title">Quick Links</h3>
					<ul>
						<li><a href="#"><i class="fa fa-list-ul"
								aria-hidden="true"></i> Sell:${countDetails.saleAmt} </a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Discount:${countDetails.discountAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Purchase:${countDetails.purchaseAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> No. of Bill:${countDetails.noOfBillGenerated}</a></li>
						<li><a href="#"><i class="fa fa-line-chart"
								aria-hidden="true"></i> Profit:${countDetails.profitAmt} </a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Advance Amt:${countDetails.advanceAmt}</a></li>
						<li><a href="#"><i class="fa fa-refresh"
								aria-hidden="true"></i> Credit Bill Amt:${countDetails.creditAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-word-o"
								aria-hidden="true"></i> Cash Amt:${countDetails.cashAmt}</a></li>
						<li><a href="#"><i class="fa fa-money" aria-hidden="true"></i>
								Card Amount:${countDetails.cardAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-o"
								aria-hidden="true"></i> e-pay Amt:${countDetails.epayAmt}</a></li>
								<li><a href="#"><i class="fa fa-file-o"
								aria-hidden="true"></i> Expense:${countDetails.expenseAmt}</a></li>
					</ul>
				</div>
				<div class="charts_bx">
					<div class="chart_l">
						<h3 class="bx_title">Sales Charts</h3>
						<div class="a">Map Put Here</div>
					</div>
					<div class="chart_r">
						<h3 class="bx_title">Top Products</h3>

						<div class="a">Map Put Here</div>

					</div>
					<div class="clr"></div>
				</div>
			</section>
		</div>
		<!--wrapper-end-->
	</form>
	<script type="text/javascript">
		function showDiv(typdId) {
			//alert("Id="+typdId);
			if (typdId == 4) {
				document.getElementById("ihide").style = "visible"
			} else {
				document.getElementById("ihide").style = "display:none"
			}
		}
	</script>
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
<%--	<!--topLeft-nav-->
	<div class="sidebarOuter"></div>
	<!--wrapper-start-->
	<div class="wrapper">
		<!--topHeader-->
		<jsp:include page="/WEB-INF/views/include/logo.jsp">
					<jsp:param name="fr" value="${frDetails}"/>
		</jsp:include>
		<!--topHeader-->
		<!--rightContainer-->
		<div class="fullGrid center">
			<!--fullGrid-->
			<div class="wrapperIn2">
				<!--rightSidebar-->
				<div class="sidebarright">
										<h2 class="pageTitle">Hi <span>${frDetails.frOwner},</span> Welcome Back</h2>
					<!--slider-->
					<!--slider thum size : width:850px height:350px-->
						<div class="latestNews">
					
						<h3 class="latestNewsTitle">Latest News</h3>
							<div class="microsoft marquee">
						<c:forEach items="${schedulerLists}" var="schedulerLists"  varStatus="count">
						
					            <c:set var="colors" value=""/>
					            <c:choose>
					            <c:when test="${count.index%2==0}">
					            <c:set var="colors" value="white"/>
					           </c:when>
					           <c:otherwise>
					            <c:set var="colors" value="lightblue"/>
					          </c:otherwise>
					          </c:choose>
								<span style="color:${colors}"> ${schedulerLists.schMessage} </span>
						</c:forEach>
						</div>
					</div>
					<div id="owl-example" class="owl-carousel">
						<c:forEach items="${msgList}" var="msgList">
							<div class="item">
								<div class="screen4plan">
									<div class="homesliderImg">
									 <img src="${url}${msgList.msgImage}"  />
									</div>
									<h3 class="homesliderTitle" style="font-size:15px "><center>${msgList.msgHeader}</center></h3>
	                                <h3 class="homesliderTitle"  >${msgList.msgDetails}</h3>

								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
 --%>