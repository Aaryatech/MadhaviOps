<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Madhvi</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0" />
<meta name="keywords" content="Madhvi" />
<meta name="description" content="Madhvi" />
<meta name="author" content="Madhvi">
<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<!--Here Previous Block of Code, Commented at End -->
</head>
<c:url var="getCatSellList" value="/getCatSellList" />
<c:url var="getItemSellBill" value="/getItemSellBill" />


<body onload="drawDonutChart()">
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



					<!-- <div class="page_bread">
						<ul>
							<li><a href="#"><i class="fa fa-home" aria-hidden="true"></i>
									Home</a></li>
							<li class="active">Dashboard</li>
						</ul>
					</div> -->
					
					<div class="custom_right">
					<form action="${pageContext.request.contextPath}/home" method="get">

						<input type="hidden" name="tod" id="tod" value="${tod}"> <input
							type="hidden" name="frmd" id="frmd" value="${frmd}"> <input
							type="hidden" name="catId" id="catId" value="${tod}">
						<div class="colOuter">


							<c:choose>
								<c:when test="${type==1}">
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="1" class="radio-align"
											checked onclick="showDiv(this.value)"> Toady
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="2" class="radio-align"
											onclick="showDiv(this.value)"> Week
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="3" class="radio-align"
											onclick="showDiv(this.value)"> Month
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="4" class="radio-align"
											onclick="showDiv(this.value)">
										Custom
									</div>
								</c:when>
								<c:when test="${type==2}">
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="1"  class="radio-align"
											onclick="showDiv(this.value)"> Toady
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="2" class="radio-align"
											checked onclick="showDiv(this.value)"> Week
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="3" class="radio-align"
											onclick="showDiv(this.value)"> Month
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="4" class="radio-align"
											onclick="showDiv(this.value)" >
										Custom
									</div>
								</c:when>

								<c:when test="${type==3}">
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="1"  class="radio-align"
											onclick="showDiv(this.value)"> Toady
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="2" class="radio-align" 
											onclick="showDiv(this.value)"> Week
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="3" class="radio-align"
											checked onclick="showDiv(this.value)"> Month
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="4" class="radio-align"
											onclick="showDiv(this.value)" >
										Custom
									</div>
								</c:when>

								<c:when test="${type==4}">
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="1"  class="radio-align"
											onclick="showDiv(this.value)"> Toady
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="2" class="radio-align" 
											onclick="showDiv(this.value)"> Week
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="3" class="radio-align" 
											onclick="showDiv(this.value)"> Month
									</div>
									<div class="col-md-1 radio_align_1">
										<input type="radio" name="type" value="4" class="radio-align" checked
											onclick="showDiv(this.value)">
										Custom
									</div>
								</c:when>
							</c:choose>
							<div id="ihide" style="display: none;">
								<div class="col-md-1">
									<div class="col1title">From Date</div>
								</div>
								<div class="col-md-2">
									<input id="fromdatepicker" class="texboxitemcode texboxcal"
										required="required" placeholder="From Date" name="fromDate"
										value="${fromDate}" autocomplete="off" type="text">

								</div>
								<div class="col-md-1">
									<div class="col1title">To Date</div>
								</div>
								<div class="col-md-2">
									<input id="todatepicker" class="texboxitemcode texboxcal"
										required="required" placeholder="To Date" name="toDate"
										value="${toDate}" autocomplete="off" type="text">

								</div>

							</div>

							<div class="sub_right">
								<input name="submit" class="buttonsaveorder" value="Submit"
									type="submit" id="submtbtn">
							</div>
						</div>
					</form>
					</div>
					<div class="clr"></div>
				</div>


				<%-- <div class="quick_links">
					<h3 class="bx_title">Quick Links</h3>
					<ul>
						<li><a href="#"><i class="fa fa-list-ul"
								aria-hidden="true"></i> Sell:${countDetails.saleAmt} </a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Discount:${countDetails.discountAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Purchase:${countDetails.purchaseAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> No. of
								Bill:${countDetails.noOfBillGenerated}</a></li>
						<li><a href="#"><i class="fa fa-line-chart"
								aria-hidden="true"></i> Profit:${countDetails.profitAmt} </a></li>
						<li><a href="#"><i class="fa fa-file-pdf-o"
								aria-hidden="true"></i> Advance Amt:${countDetails.advanceAmt}</a></li>
						<li><a href="#"><i class="fa fa-refresh"
								aria-hidden="true"></i> Credit Bill
								Amt:${countDetails.creditAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-word-o"
								aria-hidden="true"></i> Cash Amt:${countDetails.cashAmt}</a></li>
						<li><a href="#"><i class="fa fa-money" aria-hidden="true"></i>
								Card Amount:${countDetails.cardAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-o"
								aria-hidden="true"></i> e-pay Amt:${countDetails.epayAmt}</a></li>
						<li><a href="#"><i class="fa fa-file-o"
								aria-hidden="true"></i> Expense:${countDetails.expenseAmt}</a></li>
					</ul>
				</div> --%>
				
				<div class="sales_list">
					<ul>
						<!-- first li box -->
						<li>
							<div class="sale_one bg_one">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Today Sales</h3>
									<div class="range"><span class="percen_one"></span></div>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- second li box -->
						<li>
							<div class="sale_one bg_two">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">This Week Sales</h3>
									<div class="range"><span class="percen_two"></span></div>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- third li box -->
						<li>
							<div class="sale_one bg_three">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">This Month Sales</h3>
									<div class="range"><span class="percen_three"></span></div>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- fourth li box -->
						<li>
							<div class="sale_one bg_fourth">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Today's Expenses</h3>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- fifth li box -->
						<li>
							<div class="sale_one bg_fifth">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Today's Discount</h3>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- six li box -->
						<li>
							<div class="sale_one bg_sixth">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Today's Customer Visited</h3>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- seventh li box -->
						<li>
							<div class="sale_one bg_two">
								<div class="sale_l"><i class="fa fa-address-book" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Total Profile</h3>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
						
						<!-- eighth li box -->
						<li>
							<div class="sale_one bg_three">
								<div class="sale-list">
									<div class="sale_epay">EPAY <span>Rs.0.00</span></div>
									<div class="sale_epay">Cash <span>Rs.0.00</span></div>
									<div class="sale_epay">Card <span>Rs.0.00</span></div>
									<div class="clr"></div>
								</div>
							</div>
						</li>
						
						<!-- nine li box -->
						<li>
							<div class="sale_one bg_one">
								<div class="sale_l"><i class="fa fa-calendar" aria-hidden="true"></i></div>
								<div class="sale_r">
									<h3 class="sale_head">Advance Amount</h3>
									<h5 class="price_sale">Rs. 0.00</h5>
								</div>
								<div class="clr"></div>
							</div>
						</li>
					</ul>
					<div class="clr"></div>
				</div>

				<div class="charts_bx">
					<div class="chart_l">
						<h3 class="bx_title">Categorywise Sell harts</h3>
						<!-- <div class="a">Map Put Here</div>
 -->
						<div id="donutchart"></div><!-- style="width: 900px; height: 500px;" -->
						

					</div>
					<div class="chart_r">
						<h3 class="bx_title">Top Products</h3>
						<div class="right_btns">
							<input name="submit" class="sub_btn" value="All" type="submit" id="submtbtn">
							<button type="reset" class="sub_btn" value="Reset"><i class="fa fa-arrow-down" aria-hidden="true"></i></button>
							<button type="reset" class="sub_btn" value="Reset"><i class="fa fa-arrow-up" aria-hidden="true"></i></button>
							
							
							
						</div>

					

						<div class="scrollbars" id="scrollbarsmodaldiv">
							<table id="custCreditTable">

								<thead>
									<tr>
										<th style="text-align: center;">Sr</th>
										<th style="text-align: center;">Item Name</th>
										<th style="text-align: center;">Amount</th>
									</tr>
								</thead>
								<tbody>

								</tbody>
							</table>
						</div>


					</div>
					<div class="clr"></div>
				</div>
			</section>
		</div>
		<!--wrapper-end-->
	</form>





	<!--  trial -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>

	<script type="text/javascript">
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawDonutChart);
		function drawDonutChart() {
			var chart;
			var datag = '';
			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var a = "";
			var dataSale = [];
			var Header = [ 'Category', 'Amount', 'ID' ];
			dataSale.push(Header);
			$.post('${getCatSellList}', {
				frmd : frmd,
				tod : tod,
				ajax : 'true'
			}, function(chartsdata) {
				//alert(JSON.stringify(data));
				console.log('data ' + JSON.stringify(chartsdata));
				var len = chartsdata.length;
				datag = datag + '[';
				$.each(chartsdata, function(key, chartsdata) {
					var temp = [];
					temp.push(chartsdata.catName,
							parseInt(chartsdata.catTotal),
							parseInt(chartsdata.catId));
					dataSale.push(temp);

				});

				//console.log(dataSale);
				var data1 = google.visualization.arrayToDataTable(dataSale);

				var options = {
					title : 'My Daily Activities',
					pieHole : 0.4,
				};
				//  alert(222);
				chart = new google.visualization.PieChart(document
						.getElementById('donutchart'));

				function selectQtyHandler() {
					// alert("hii");
					var selectedItem = chart.getSelection()[0];
					if (selectedItem) {
						// alert("hii selectedItem");
						i = selectedItem.row, 0;

						//alert("hii selectedItem" + chartsdata[i].catId);
						itemSellBillCal(chartsdata[i].catId);

					}
				}

				google.visualization.events.addListener(chart, 'select',
						selectQtyHandler);
				chart.draw(data1, options);

			});

		}
	</script>

	<script type="text/javascript">
		function itemSellBillCal(id) {

			var frmd = document.getElementById("frmd").value;
			var tod = document.getElementById("tod").value;
			var flag = 1;
			$.post('${getItemSellBill}', {
				id : id,
				frmd : frmd,
				tod : tod,
				flag : flag,
				ajax : 'true'
			}, function(data) {

				//alert(JSON.stringify(data));
				$('#custCreditTable td').remove();

				$.each(data, function(key, data) {

					var tr = $('<tr></tr>');

					tr.append($('<td ></td>').html(key + 1));
					tr.append($('<td ></td>').html(data.itemName));
					tr.append($('<td ></td>').html(data.itemTotal));

					$('#custCreditTable tbody').append(tr);
				});

			});
			document.getElementById("catId").value = id;
		}
	</script>

	<script type="text/javascript">
		function itemSellBillCal2() {

			var flag = document.getElementById("typeSort").value;
			var tod = document.getElementById("tod").value;
			var frmd = document.getElementById("frmd").value;
			var id = document.getElementById("catId").value;
			$.post('${getItemSellBill}', {
				id : id,
				frmd : frmd,
				tod : tod,
				flag : flag,
				ajax : 'true'
			}, function(data) {

			//	alert(JSON.stringify(data));
				$('#custCreditTable td').remove();

				$.each(data, function(key, data) {

					var tr = $('<tr></tr>');

					tr.append($('<td ></td>').html(key + 1));
					tr.append($('<td ></td>').html(data.itemName));
					tr.append($('<td ></td>').html(data.itemTotal));

					$('#custCreditTable tbody').append(tr);
				});

			});

		}
	</script>

	<!-- <script type="text/javascript">
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawDonutChart1()  {
		 
			var data = google.visualization.arrayToDataTable([
					[ 'Task', 'Hours per Day' ], [ 'Work', 11 ], [ 'Eat', 2 ],
					[ 'Commute', 2 ], [ 'Watch TV', 2 ], [ 'Sleep', 7 ] ]);

			var options = {
				title : 'My Daily Activities',
				pieHole : 0.4,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('donutchart'));
			chart.draw(data, options);
		}
	</script> -->


	<script type="text/javascript">
		function showDiv(typdId) {
			//alert("Id="+typdId);
			if (typdId == 4) {
				document.getElementById("ihide").style = "visible"
				document.getElementById("fromdatepicker").required = true;
				document.getElementById("todatepicker").required = true;
			} else {
				document.getElementById("ihide").style = "display:none"
				document.getElementById("fromdatepicker").required = false;
				document.getElementById("todatepicker").required = false;
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