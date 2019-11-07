<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/tableSearch.css">

<!--rightNav
<script type="text/javascript">
jQuery(document).ready(function(){
	
	
	
});
</script>-->



<style>

<!--  MODAL CSS   -->
.btn {
  background: #428bca;
  border: #357ebd solid 0px;
  border-radius: 3px;
  color: #fff;
  display: inline-block;
  font-size: 14px;
  padding: 8px 15px;
  text-decoration: none;
  text-align: center;
  min-width: 60px;
  position: relative;
  transition: color .1s ease;
}
.btn:hover {
  background: #357ebd;
}
.btn.btn-big {
  font-size: 18px;
  padding: 15px 20px;
  min-width: 100px;
}
.btn-close {
  color: #aaaaaa;
  font-size: 20px;
  text-decoration: none;
  padding:10px;
  position: absolute;
  right: 7px;
  top: 0;
}
.btn-close:hover {
  color: #919191;
}
.modale:before {
  content: "";
  display: none;
  background: rgba(0, 0, 0, 0.6);
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 10;
}
.opened:before {
  display: block;
}
.opened .modal-dialog {
  -webkit-transform: translate(0, 0);
  -ms-transform: translate(0, 0);
  transform: translate(0, 0);
  top: 20%;
}
.modal-dialog {
  background: #fefefe;
  border: #333333 solid 0px;
  border-radius: 5px;
  margin-left: -200px;
  text-align:center;
  position: fixed;
  left: 50%;
  top: -100%;
  z-index: 11;
  width: 360px;
  box-shadow:0 5px 10px rgba(0,0,0,0.3);
  -webkit-transform: translate(0, -500%);
  -ms-transform: translate(0, -500%);
  transform: translate(0, -500%);
  -webkit-transition: -webkit-transform 0.3s ease-out;
  -moz-transition: -moz-transform 0.3s ease-out;
  -o-transition: -o-transform 0.3s ease-out;
  transition: transform 0.3s ease-out;
}
.modal-body {
  padding: 20px;
}
.modal-body input{
  width:200px;
  padding:8px;
  border:1px solid #ddd;
  color:#888;
  outline:0;
  font-size:14px;
  font-weight:bold
}
.modal-header,
.modal-footer {
  padding: 10px 20px;
}
.modal-header {
  border-bottom: #eeeeee solid 1px;
}
.modal-header h2 {
  font-size: 20px;
}

<!--  MODAL CSS END  -->

.myInput1 {
	margin-top: 10px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding: 5px 5px 5px 38px;
	width: 100%;
	background-position: 10px 10px;
	background-repeat: no-repeat;
	font-size: 14px;
}

.main-table tbody>tr:hover {
	background-color: #ffa;
}

.alert {
	padding: 15px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}

a:link {
	color: black;
}

a:hover {
	color: black;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 25px;
	margin-top: 14px;
}

.switch input {
	display: none;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: -2px;
	left: 0px;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 19px;
	width: 21px;
	left: 5px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .3s;
	transition: .3s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
/* Rounded sliders */
.slider.round {
	border-radius: 52px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>



<c:url var="qtyValidation" value="/quantityValidation"></c:url>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->


<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->

	<jsp:include page="/WEB-INF/views/include/logo.jsp">
		<jsp:param name="frDetails" value="${frDetails}" />

	</jsp:include>

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
			<div class="sidebarright">

				<div class="order-left">
					<h2 class="pageTitle">Place Order</h2>

				</div>

				<div class="order-right"></div>

				<div class="colOuter">
					 
				 
					<div class="col-md-1">
						<div class="col1title">Select Customer</div>
					</div>
					<div class="col-md-2">
						<select name="select_cust" class="form-control chosen"
							tabindex="4" id="select_cust" required>

							<option value="-1">Select Customer</option>
							<c:forEach items="${custList}" var="custList" varStatus="count">

								<option value="${custList.custId}"><c:out
										value="${custList.custName}-${custList.phoneNumber}" /></option>
							</c:forEach>

						</select>

					</div>

					<div class="col-md-1">
						<div class="col1title">
							<img src="images/userimg.jpg" onclick="openMod()">
						</div>

					</div>

					<div class="col-md-2">
						<div class="col1title">Delivery Date</div>
					</div>
					<div class="col-md-2">
						<input id="fromdatepicker" class="texboxitemcode texboxcal"
							placeholder="From Date" name="from_datepicker" autocomplete="off"
							type="text"">

					</div>
					<div class="col-md-1">
						<div class="col1title">Dailymart</div>
					</div>
					<div class="col-md-1">
						<label class="switch"> <input type="checkbox" id="id">
							<span class="slider round"></span>
					</div>
					</label>

				</div>


				<form action="${pageContext.request.contextPath}/saveOrder"
					name="form1" method="post">

					<input type="hidden" name="menuTitle" value="${menuTitle}">


					<!--tabNavigation-->
					<div class="cd-tabs" style="margin-top: 2px;">
						<!--tabMenu-->
						<nav>
							<ul class="cd-tabs-navigation">

								<c:forEach var="tab" items="${subCatListTitle}" varStatus="loop">


									<c:choose>
										<c:when test='${loop.index==0}'>
											<li><a data-content='${tab.name}' href="#0"
												class="selected"
												onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>

										</c:when>
										<c:otherwise>
											<li><a data-content='${tab.name}' href="#0"
												onClick="javascript:se_tab_id('${loop.index}')">${tab.header}</a></li>

										</c:otherwise>
									</c:choose>


								</c:forEach>

							</ul>
						</nav>
						<!--tabMenu-->
						<ul class="cd-tabs-content">
							<!--tab1-->

							<c:forEach var="tabs" items="${subCatListTitle}" varStatus="loop">

								<c:choose>
									<c:when test='${loop.index==0}'>
										<li data-content='${tabs.name}' class="selected">
									</c:when>
									<c:otherwise>
										<li data-content='${tabs.name}'>
									</c:otherwise>
								</c:choose>





								<div class="col-md-9"></div>
								<label for="search" class="col-md-3" id="search"> <i
									class="fa fa-search" style="font-size: 20px"></i> <input
									class="myInput1" type="text" id="myInput${loop.index}"
									onkeyup="myFunction1(${loop.index})"
									style="border-radius: 25px;" placeholder="Search items by name"
									title="Type item name">
								</label>
								<div id="table-scroll" class="table-scroll responsive-table-one">
									<!-- class="table-scroll" -->

									<div id="faux-table" class="faux-table" aria="hidden">
										<!-- style="display:none" -->
										<table id="table_grid" class="main-table">
											<thead>
												<tr class="bgpink">
													<th class="col-md-2">Item Name</th>
													<th class="col-md-1">Min Quantity</th>
													<th class="col-md-1">Quantity</th>
													<th class="col-md-1">MRP</th>
													<th class="col-md-1">Rate</th>
													<th class="col-md-1">Total</th>
													<c:choose>
														<c:when test="${menuIdFc eq menuIdShow}">
															<th class="col-md-1">Order1</th>
														</c:when>
													</c:choose>
												</tr>
											</thead>
										</table>

									</div>
									<div class="table-wrap">

										<table id="table_grid${loop.index}" class="responsive-table"
											style="margin: 0px;">
											<!--   class="main-table" -->
											<thead>
												<tr class="bgpink">
													<th class="col-md-2">Item Name</th>
													<th class="col-md-1">Min Quantity</th>
													<th class="col-md-1">Quantity</th>
													<th class="col-md-1">MRP</th>
													<th class="col-md-1">Rate</th>
													<th class="col-md-1">Total</th>
													<c:choose>
														<c:when test="${menuIdFc eq menuIdShow}">
															<th class="col-md-1">Order1</th>
														</c:when>
													</c:choose>
												</tr>
											</thead>
											<tbody>
												<c:set var="menuTime" value="${menu.timing}" />

												<c:forEach var="items" items="${itemList}" varStatus="loop">
													<c:if test="${items.subCatName eq tabs.name}">

														<c:choose>
															<c:when test="${frDetails.frRateCat=='1'}">
																<tr>

																	<td class="col-md-2">${items.itemName}<a
																		href="${url}${items.itemImage}"
																		data-lightbox="image-1" tabindex="-1"><i
																			class="fa fa-file-image-o"
																			style="font-size: 16px; color: green"></i></a></td>
																	<td class="col-md-1"><c:out
																			value='${items.minQty}' /></td>

																	<td class="col-md-1"><input name='${items.id}'
																		id='${items.id}' value='${items.itemQty}'
																		class="tableInput" type="text"
																		onkeydown="myFunction()"
																		onchange="onChange('${items.itemRate1}',${items.id})">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1"><c:out
																			value='${items.itemMrp1}' /></td>


																	<td class="col-md-1"><c:out
																			value='${items.itemRate1}' /></td>
																	<c:set var="rate" value="${items.itemRate1}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td class="col-md-1" id="total${items.id}"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>


																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">

																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>

																</tr>
															</c:when>

															<c:when test="${frDetails.frRateCat=='2'}">
																<tr>

																	<td class="col-md-1">${items.itemName}<a
																		href="${url}${items.itemImage}"
																		data-lightbox="image-1" tabindex="-1"><i
																			class="fa fa-file-image-o"
																			style="font-size: 16px; color: green"></i></a></td>
																	<td class="col-md-1"><c:out
																			value='${items.minQty}' /></td>
																	<td class="col-md-1"><input name='${items.id}'
																		id='${items.id}' value='${items.itemQty}'
																		class="tableInput" type="text"
																		onchange="onChange('${items.itemRate2}',${items.id})">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1"><c:out
																			value='${items.itemMrp2}' /></td>

																	<td class="col-md-1"><c:out
																			value='${items.itemRate2}' /></td>
																	<c:set var="rate" value="${items.itemRate2}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td id="total${items.id}"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>
																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">
																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>

																</tr>
															</c:when>

															<c:when test="${frDetails.frRateCat=='3'}">
																<tr>

																	<td class="col-md-1">${items.itemName}<a
																		href="${url}${items.itemImage}"
																		data-lightbox="image-1" tabindex="-1"><i
																			class="fa fa-file-image-o"
																			style="font-size: 16px; color: green"></i></a></td>
																	<td class="col-md-1"><c:out
																			value='${items.minQty}' /></td>
																	<td class="col-md-1"><input name='${items.id}'
																		id='${items.id}' value='${items.itemQty}'
																		class="tableInput" type="text"
																		onchange="onChange('${items.itemRate3}',${items.id})">

																		<input type="hidden" value="${items.minQty}"
																		id="minqty${items.id}" /></td>
																	<td class="col-md-1"><c:out
																			value='${items.itemMrp3}' /></td>

																	<td class="col-md-1"><c:out
																			value='${items.itemRate3}' /></td>
																	<c:set var="rate" value="${items.itemRate3}" />
																	<c:set var="qty" value="${items.itemQty}" />
																	<td class="col-md-1" id="total${items.id}"><fmt:formatNumber
																			type="number" minFractionDigits="2"
																			maxFractionDigits="2" value="${rate * qty}" /></td>

																	<c:choose>
																		<c:when test="${menuIdFc eq menuIdShow}">
																			<c:choose>
																				<c:when test="${flagRes==1}">
																					<c:set var="orderQty" value="0" />
																					<c:forEach var="orderListRes" items="${orderList}"
																						varStatus="cnt">
																						<c:choose>
																							<c:when test="${orderListRes.id==items.id}">
																								<c:set var="orderQty"
																									value="${orderListRes.orderQty}" />
																							</c:when>

																						</c:choose>

																					</c:forEach>
																					<td class="col-md-1">${orderQty}</td>
																				</c:when>
																				<c:otherwise>
																					<td class="col-md-1">0</td>
																				</c:otherwise>
																			</c:choose>
																		</c:when>
																	</c:choose>
																</tr>
															</c:when>
														</c:choose>

													</c:if>
												</c:forEach>

											</tbody>

										</table>
									</div>
								</div>






							</c:forEach>


						</ul>
					</div>
					<!--tabNavigation-->

					<!--<div class="order-btn"><a href="#" class="saveOrder">SAVE ORDER</a></div>-->
					<div class="order-btn textcenter">

						<input name="" id="subm" class="buttonsaveorder"
							value="SAVE ORDER" type="button" ONCLICK="button1()">
					</div>



				</form>

			</div>
			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->
<!--  MODAL DIV  -->
<div class="modale" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-header">
      <h2>Please Login</h2>
      <a href="#" class="btn-close closemodale" aria-hidden="true">&times;</a>
    </div>
    <div class="modal-body">
      <input type="text" name="u" placeholder="User" size="20" /><br>
      <input type="text" name="p" placeholder="&bull;&bull;&bull;&bull;" size="20" /></div>
    <div class="modal-footer">
  

      <a href="#" class="btn" id="btn_ingresar">Login</a>
    </div>
  </div>
</div>

<div class="order-btn textcenter">
<a href="#" class="btn btn-big openmodale">Open Modal</a>
</div>
<!-- MODAL END -->


<!--wrapper-end-->

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
});


	</script>
<script>
	function openMod() {
		
		alert("hii");
	$('#modal_small').modal('show'); 
	}
	</script>


<!--easyTabs-->
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<!--easyTabs-->

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
           
            function button1()
            {
                var isSubmit=confirm("Do you want to save Order?");
                if(isSubmit==true){    
                	document.getElementById("subm").disabled = true;

                       form1.submit();
                }
                
    		/* 	if(isSameDayApplicable!=2)
    				{
    				   form1.submit();
    				}
    		else if(isSameDayApplicable==2)
    				{
   			   
    				  $.getJSON(
    							'${qtyValidation}',
    							{
    								
    								ajax : 'true'
    							},
    							function(data) {
    							
    							//	alert(data.error);
        							
   								if (data.error) {
   								//	alert("hii");
    									alert(data.message);
    									 window.location.reload();
    								
    								}
    								else
    								{
    									 form1.submit();
    								
    								}	
    							});
    				}   
 */
            }    
           
        </script>

<script type="text/javascript">
		function onChange(rate,id) {

			//calculate total value  
			var qty = $('#'+id).val();
			
			
			var minqty = $('#minqty'+id).val();
			
			if(qty % minqty==0){
			    var total = rate * qty;
			
			   $('#total'+id).html(total.toFixed(2));
			}else
			{
				 var total =0;
				 
				alert("Please Enter Qty Multiple of Minimum Qty");
				$('#'+id).val('0');
				
				$('#total'+id).html(total);
				$('#'+id).focus();
			}
		}
	</script>


<script type="text/javascript">
		function onKeyDown(id) {
			alert("alert");
			var e = $('#'+id).val();
			
			if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
		             // Allow: Ctrl/cmd+A
		            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+C
		            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: Ctrl/cmd+X
		            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
		             // Allow: home, end, left, right
		            (e.keyCode >= 35 && e.keyCode <= 39)) {
		                 // let it happen, don't do anything
		                 return;
		        }
		        // Ensure that it is a number and stop the keypress
		        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
		            e.preventDefault();
		        }
		   
			
		}
</script>
<script type="text/javascript">
$(document).ready(function() {
    $("#5").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl/cmd+A
            (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+C
            (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: Ctrl/cmd+X
            (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105))) {
            e.preventDefault();
        }
    });
});
</script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script>
function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("table_grid1");
  switching = true;
  /*Make a loop that will continue until
  no switching has been done:*/
  while (switching) {
    //start by saying: no switching is done:
    switching = false;
    rows = table.getElementsByTagName("TR");
    /*Loop through all table rows (except the
    first, which contains table headers):*/
    for (i = 1; i < (rows.length - 1); i++) {
      //start by saying there should be no switching:
      shouldSwitch = false;
      /*Get the two elements you want to compare,
      one from current row and one from the next:*/
      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];
      //check if the two rows should switch place:
      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
        //if so, mark as a switch and break the loop:
        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {
      /*If a switch has been marked, make the switch
      and mark that a switch has been done:*/
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
    }
  }
}
</script>
<script>
function reload() {
    location.reload();
}
</script>
<script>
	function myFunction1(index) {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput"+index);
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid"+index);
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
	
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("table_grid1");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
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
<!-- MODAL SCRIPT -->
<script>
$('.openmodale').click(function (e) {
         e.preventDefault();
         $('.modale').addClass('opened');
    });
$('.closemodale').click(function (e) {
         e.preventDefault();
         $('.modale').removeClass('opened');
    });
</script>
<!-- MODAL SCRIPT END-->

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
</body>
</html>
