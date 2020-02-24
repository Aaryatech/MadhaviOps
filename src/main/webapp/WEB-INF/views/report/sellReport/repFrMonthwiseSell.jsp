<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
<style>
table, th, td {
    border: 1px solid #9da88d;
}
.hide-calendar .ui-datepicker-calendar {
    display: none;
}
</style>
<%-- 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

<title>Madhvi</title>


<link
	href="${pageContext.request.contextPath}/resources/css/monginis.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/resources/css/custom.css" rel="stylesheet" type="text/css"/>	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/feviconicon.png"
	type="image/x-icon" />
	
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>	
	
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.min.js"></script>

<!--rightNav-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/menuzord.js"></script>
	
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery("#menuzord").menuzord({
		align:"left"
	});
});
</script>
<!--rightNav-->



<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
 --%>
<%-- 
</head>
<body> --%>
<!--datepicker-->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>

<script>
  $( function() {
    $( "#todatepicker" ).datepicker({ dateFormat: 'dd-mm-yy' 
    	
    
    });
  } );
  $( function() {
    $( "#fromdatepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
  } );
 
  </script> --%>

<body onload="showGraph()"> 
<c:url var="getMonthwiselReport" value="/getMonthwiselReport" />
	
	<div class="sidebarOuter"></div>
	
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
				
				<!-- Place Actual content of page inside this div -->
				<div class="sidebarright">
				

<div class="row">
	    <div class="col-md-12"><h2 class="pageTitle">Monthwise Sale Report</h2></div>
	</div>
	
	<div class="colOuter">
		<div align="center" >
		<div class="col1"><div class="col1title"><b>	<span class="frm_txt">From</span> </b>
		<input id="fromdatepicker"  placeholder="Delivery Date" autocomplete="off" class="texboxitemcode texboxcal float_l" name="from_Date" type="text" size="35" value="${frommonth}">
		</div></div>
		<div class="col2"><div class="col1title"><b>	<span class="frm_txt">To</span> </b>
		<input id="todatepicker"  placeholder="Delivery Date" autocomplete="off"  name="to_Date"  class="texboxitemcode texboxcal float_l" type="text" size="35" value="${tomonth}">
		</div></div>
				<input type="hidden" name="frId" id="frId" value="${frId}">
		
	</div>
 
	
 	<div align="center"class="right_btn"> 
		    <button class="buttonsaveorder" onclick="searchSellBill()" >HTML View </button>
		    <button class="buttonsaveorder" onclick="showChart()" >Graph</button>
<%-- 		    	    <a href='${pageContext.request.contextPath}/pdf?reportURL=showSellMonthwiseReportpPdf' id="btn_pdf" class="btn search_btn" style="display: none">PDF</a>
 --%>		 		 												<button class="btn btn-primary" value="PDF" id="PDFButton" onclick="genPdf()">PDF</button>
 
		 
		<br>
    </div>
	</div>
	
	<div class="row" id="table">
		<div class="col-md-12">
		<!--table-->
			<div class="clearfix"></div>


				<div id="table-scroll" >
					<div id="faux-table" class="faux-table" aria="hidden" style="display: none;">
						<div >
						<table id="table_grid" class="main-table">
							<thead>
								<tr class="bgpink">

									<th class="col-md-1"style="text-align:center;">Sr.No.</th>

									<!-- <th class="col-md-1">Bill No</th> -->
									<th class="col-md-1" style="text-align:center;">Month</th>
									<th class="col-md-1" style="text-align:center;">Amount</th>
									<th class="col-md-1" style="text-align:center;">Cash</th>
								 	<th class="col-md-1" style="text-align:center;">Card</th>
									<!-- <th class="col-md-1" style="text-align:center;">Other</th>  -->
									
									<th class="col-md-1" style="text-align:center;">Disc Amt</th>
									<th class="col-md-1" style="text-align:center;">Pending</th>
									<th class="col-md-1" style="text-align:center;">Advance</th>
									<th class="col-md-1" style="text-align:center;">Regular</th>
									<th class="col-md-1" style="text-align:center;">Challan</th>
									
								  </tr>
								</thead>
								
								 <tbody >
								 </tbody>
								  
								</table>
					
				</div>
					</div>
					<div >
						<table id="table_grid" class="responsive-table">
							<thead>
								<tr class="bgpink">

									<th class="col-md-1"style="text-align:center;">Sr.No.</th>

									<!-- <th class="col-md-1">Bill No</th> -->
									<th class="col-md-1"style="text-align:center;">Month</th>
									<th class="col-md-1" style="text-align:center;">Amount</th>
									<th class="col-md-1" style="text-align:center;">Cash</th>
								 	<th class="col-md-1" style="text-align:center;">Card</th>
									 <th class="col-md-1" style="text-align:center;">Other</th>  
									 
									 
									 <th class="col-md-1" style="text-align:center;">Disc Amt</th>
									<th class="col-md-1" style="text-align:center;">Pending</th>
									<th class="col-md-1" style="text-align:center;">Advance</th>
									<th class="col-md-1" style="text-align:center;">Regular</th>
									<th class="col-md-1" style="text-align:center;">Challan</th>
								  </tr>
								</thead>
								
								 <tbody >
								 </tbody>
								  
								</table>
					
				</div>	</div><br>
				 <div class="form-group" style="display: none;" id="range">
								 
											 
											 
											<div class="col-sm-3  controls">
											 <input type="button" id="expExcel" class="btn btn-primary" value="EXPORT TO Excel" onclick="exportToExcel();" disabled="disabled">
											</div>
											</div>
		
		<!--table end-->
		 
		</div>	
    </div>

	<div id="chart" style="display: none"><br><br><br>
	<hr><div  >
	 
			<div  id="chart_div" style="width:60%; height:300; float:left;" ></div> 
		 
			<div   id="Piechart" style="width:40%%; height:300; float: right;" ></div> 
			</div>
			 
			<div class="colOuter" align="center" >
			 <br>
				<div   id="PieChart_div" style="width:50%; height:400;" align="center" ></div>
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

	<!--easyTabs-->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<!--easyTabs-->

	
	<script type="text/javascript">
	function searchSellBill()
	{ 
		document.getElementById('table').style.display = "block";
		   document.getElementById('chart').style="display:none";
		 //  document.getElementById('showchart').style.display = "block";
		$('#table_grid td').remove();
		
		
		var isValid = validate();
		
		if (isValid) {

			//document.getElementById('btn_pdf').style.display = "block";
			var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			   
			
			$.getJSON('${getMonthwiselReport}',{
				
								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true',

							},
							function(data) {

								 
								
								

								if (data == "") {
									alert("No records found !!");
									  document.getElementById("expExcel").disabled=true;
								}
								 

							 	var cashTotal=0;
								var cardTotal=0;
								var amtTotal=0;
								var otherTotal=0;
								
								var ttlDisc = 0;
								var ttlPending = 0;
								var ttlAdv = 0;
								var ttlReg = 0;
								var ttlChalan = 0;
								$.each(data,function(key, sellBillData) {

									
									  document.getElementById("expExcel").disabled=false;
										document.getElementById('range').style.display = 'block';
									
									var tr = $('<tr></tr>');

								  	tr.append($('<td <th class="col-md-1" style=text-align:center;></td>').html(key+1));

								  	var monthNumber = sellBillData.month;
								    
								    var monthNames = ['0','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

									 tr.append($('<td class="col-md-1"style="text-align:left;"></td>').html(monthNumber));
								  	
								  	var amt=sellBillData.cash + sellBillData.card + sellBillData.other;
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((amt).toFixed(2))));
								  	
								  	amtTotal=amtTotal + sellBillData.cash + sellBillData.card + sellBillData.other;
									
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.cash).toFixed(2))));
								  	cashTotal=cashTotal + sellBillData.cash;

								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.card).toFixed(2))));
								  	cardTotal=cardTotal + sellBillData.card;
								  	
									tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.other).toFixed(2))));
								  	otherTotal=otherTotal + sellBillData.other; 
								  	
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.discountAmt).toFixed(2))));
								  	ttlDisc=ttlDisc + sellBillData.discountAmt; 
								  	
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.pendingAmt).toFixed(2))));
								  	ttlPending=ttlPending + sellBillData.pendingAmt; 
								  	
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.advAmt).toFixed(2))));
								  	ttlAdv=ttlAdv + sellBillData.advAmt; 
								  	
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.regular).toFixed(2))));
								  	ttlReg=ttlReg + sellBillData.regular; 
								  	
								  	tr.append($('<td class="col-md-1" style="text-align:right;"></td>').html(addCommas((sellBillData.other).toFixed(2))));
								  	ttlChalan=ttlChalan + sellBillData.chalan; 
								  	
								  	
								  	

								  	

									$('#table_grid tbody').append(tr);

									
									
													

												})
												
							var tr = "<tr>";
							 var non = "<td colspan='1'></td>";
								 var total = "<td colspan='1' style=text-align:left;>&nbsp;&nbsp;&nbsp;<b> Total</b></td>";
								 
								var totalAmt = "<td style=text-align:right;>&nbsp;&nbsp;&nbsp;<b>"
									+ addCommas((amtTotal).toFixed(2))
									+ "</b></td>";
								 var cash = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
									+  addCommas((cashTotal).toFixed(2))
									+ "</b></td>";
								var card = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
									+ addCommas((cardTotal).toFixed(2))
									+ "</b></td>";
								var other = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
									+ addCommas((otherTotal).toFixed(2))
									+ "</b></td>"; 
									
								var disc = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
										+ addCommas((ttlDisc).toFixed(2))
										+ "</b></td>"; 
										
								var pending = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
											+ addCommas((ttlPending).toFixed(2))
											+ "</b></td>"; 
											
								var adv = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
												+ addCommas((ttlAdv).toFixed(2))
												+ "</b></td>"; 
												
								var reg = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
													+ addCommas((ttlReg).toFixed(2))
													+ "</b></td>"; 
													
													
								var chlalan = "<td style=text-align:right;><b>&nbsp;&nbsp;&nbsp;"
														+ addCommas((ttlChalan).toFixed(2))
														+ "</b></td>"; 
									
								
								var trclosed = "</tr>";
								
								
								$('#table_grid tbody')
								.append(tr);
								$('#table_grid tbody')
								.append(total);
								$('#table_grid tbody')
								.append(non);
								$('#table_grid tbody')
								.append(totalAmt);
								 $('#table_grid tbody')
									.append(cash);
								 $('#table_grid tbody')
								.append(card);
						 	$('#table_grid tbody')
								.append(other); 
						 	
						 	$('#table_grid tbody')
							.append(disc); 
						 	$('#table_grid tbody')
							.append(pending); 
						 	$('#table_grid tbody')
							.append(adv); 
						 	
						 	$('#table_grid tbody')
							.append(reg); 
						 	$('#table_grid tbody')
							.append(chlalan); 
						 	
								$('#table_grid tbody')
								.append(trclosed); 
								 
							});

		}
	}
	</script>
	<script type="text/javascript">
	function validate() {
	
	
		var fromDate =$("#fromdatepicker").val();
		var toDate =$("#todatepicker").val();
		

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
	
<script type="text/javascript">
	 
function showChart(){
	$("#PieChart_div").empty();
	$("#chart_div").empty();
	$("#Piechart").empty();
	
		document.getElementById('chart').style.display = "block";
		   document.getElementById("table").style="display:none";
		   
		   var fromDate = document.getElementById("fromdatepicker").value;
			var toDate = document.getElementById("todatepicker").value;
			   
			var isValid = validate();
			
			if (isValid) {
				//document.getElementById('btn_pdf').style.display = "block";
			$.getJSON('${getMonthwiselReport}',{
				
								fromDate : fromDate,
								toDate : toDate,
								ajax : 'true',

							},
							function(data) {
								  
							 if (data == "") {
									alert("No records found !!");

								}
							 var i=0;
							 
							 //google.charts.load('current', {'packages':['corechart']});
							  google.charts.load('current', {'packages':['corechart', 'bar']});
							  google.charts.setOnLoadCallback(drawStuff);
							 google.charts.setOnLoadCallback(drawPie1Chart);
							 
							 
							  
							 function drawStuff() {
								 
								   var chartDiv = document.getElementById('chart_div');
								   document.getElementById("chart_div").style.border = "thin dotted red";
							       var dataTable = new google.visualization.DataTable();
							       
							       dataTable.addColumn('string', 'Month'); // Implicit domain column.
							       dataTable.addColumn('number', 'Amount'); // Implicit data column.
							      // dataTable.addColumn({type:'string', role:'interval'});
							     //  dataTable.addColumn({type:'string', role:'interval'});
							      // dataTable.addColumn('number', 'Total Tax');
								 $.each(data,function(key, item) {
									   
									   var monthNumber = item.month;
									    
									    var monthNames = ['0','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

									    //alert(monthNumber);
										var amt=item.cash + item.card + item.other;

									   dataTable.addRows([

									             [item.month, amt]

									           ]);
									   

									   }) 
							    
	 var materialOptions = {
	          width: 600,
	          height:450,
	          chart: {
	            title: 'Sell Amount per Month ',
	            subtitle: ' '
	          },
	          series: {
	            0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
	            1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
	          },
	          axes: {
	            y: {
	              distance: {label: 'Paid Amount'}, // Left y-axis.
	              brightness: {side: 'right', label: 'Total Tax'} // Right y-axis.
	            }
	          }
	        };
							       var materialChart = new google.charts.Bar(chartDiv);
							       
							        function selectHandler() {
						          var selectedItem = materialChart.getSelection()[0];
						          if (selectedItem) {
						            var topping = dataTable.getValue(selectedItem.row, 0);
						            //alert('The user selected ' + selectedItem.row,0);
						            i=selectedItem.row,0;
						            google.charts.setOnLoadCallback(drawBarChart);
						          }
						        }
							       
							       function drawMaterialChart() {
							          // var materialChart = new google.charts.Bar(chartDiv);
							           google.visualization.events.addListener(materialChart, 'select', selectHandler);    
							           materialChart.draw(dataTable, google.charts.Bar.convertOptions(materialOptions));
							          // button.innerText = 'Change to Classic';
							          // button.onclick = drawClassicChart;
							         }
							         
							       drawMaterialChart();
							 
								 };
							 function drawPie1Chart() {
								 var dataTable = new google.visualization.DataTable();
								 dataTable.addColumn('string', 'Topping');
								 dataTable.addColumn('number', 'Slices');
							        
						 
								   $.each(data,function(key, item) {
									   
									   var monthNumber = item.month;
									    
									    var monthNames = ['0','Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

								 
										var amt=item.cash + item.card + item.other;

									   dataTable.addRows([

									             [monthNames[monthNumber], amt]

									           ]);
									   

									   }) 
							 var options = {'title':'Sell Amount per Month',
				                       'width':400,
				                       'height':250};
							 var chart = new google.visualization.PieChart(document.getElementById('Piechart'));
							 document.getElementById("Piechart").style.border = "thin dotted red";
							      function selectHandler() {
						          var selectedItem = chart.getSelection()[0];
						          if (selectedItem) {
						            var topping = dataTable.getValue(selectedItem.row, 0);
						            //alert('The user selected ' + selectedItem.row,0);
						            i=selectedItem.row,0;
						            google.charts.setOnLoadCallback(drawBarChart);
						          }
						        }

						        google.visualization.events.addListener(chart, 'select', selectHandler);    
						        chart.draw(dataTable, options);
						         
						      }
							 
							 function drawBarChart() {
								 var dataTable = new google.visualization.DataTable();
								 dataTable.addColumn('string', 'Topping');
								 dataTable.addColumn('number', 'Slices');
							        
							       
						 
							 
									   dataTable.addRows([

									             ['Cash', data[i].cash],
									             ['Card', data[i].card],
									             ['Other', data[i].other],

									           ]);

									//   }) 
							 var options = {'title':'Total Amount: Cash, Card and Other',
				                       'width':500,
				                       'height':350};
							 var chart = new google.visualization.PieChart(document.getElementById('PieChart_div'));
							 document.getElementById("PieChart_div").style.border = "thin dotted red";
						        function selectHandler() {
						          var selectedItem = chart.getSelection()[0];
						          if (selectedItem) {
						            var topping = dataTable.getValue(selectedItem.row, 0);
						          //  alert('The user selected ' + selectedItem.row,0);
						           
						          }
						        }

						        google.visualization.events.addListener(chart, 'select', selectHandler);    
						        chart.draw(dataTable, options);
				
							 }
										
							  	});
			}
			}
</script>
 <script>
 function addCommas(x) {

		x = String(x).toString();
		var afterPoint = '';
		if (x.indexOf('.') > 0)
			afterPoint = x.substring(x.indexOf('.'), x.length);
		x = Math.floor(x);
		x = x.toString();
		var lastThree = x.substring(x.length - 3);
		var otherNumbers = x.substring(0, x.length - 3);
		if (otherNumbers != '')
			lastThree = ',' + lastThree;
		return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree
				+ afterPoint;
	}
 
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

function exportToExcel()
{
	 
	window.open("${pageContext.request.contextPath}/exportToExcel");
			document.getElementById("expExcel").disabled=true;
}
	</script>
<script type="text/javascript">
function genPdf()
{
	var isValid=validate();
	if(isValid==true)
		{
	var fromDate = document.getElementById("fromdatepicker").value;
	var toDate = document.getElementById("todatepicker").value;
	var frId=document.getElementById("frId").value;
	window.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/showSellMonthwiseReportpPdf/'+fromDate+'/'+toDate+'/'+frId);
		}
	}

</script>
<script>

$(document).ready(function() {
   $('#fromdatepicker').datepicker({
     changeMonth: true,
     changeYear: true,
     dateFormat: 'mm-yy',
       
     
     onClose: function() {
        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
     },
       
     beforeShow: function() {
        $('#ui-datepicker-div').addClass('hide-calendar');

    	 
      /*  if ((selDate = $(this).val()).length > 0) 
       {
          iYear = selDate.substring(selDate.length - 4, selDate.length);
          iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
          $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
           $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
       } */
    }
  });
});
</script>

<script>

$(document).ready(function() {
   $('#todatepicker').datepicker({
     changeMonth: true,
     changeYear: true,
     dateFormat: 'mm-yy',
       
     onClose: function() {
        var iMonth = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
        var iYear = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
        $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
     },
       
     beforeShow: function() {
        $('#ui-datepicker-div').addClass('hide-calendar');

     /*   if ((selDate = $(this).val()).length > 0) 
       {
          iYear = selDate.substring(selDate.length - 4, selDate.length);
          iMonth = jQuery.inArray(selDate.substring(0, selDate.length - 5), $(this).datepicker('option', 'monthNames'));
          $(this).datepicker('option', 'defaultDate', new Date(iYear, iMonth, 1));
          $(this).datepicker('setDate', new Date(iYear, iMonth, 1));
       } */
    }
  });
});
</script>
<script type="text/javascript">
function showGraph()
{

	showChart();

}

</script>
</body>
</html>
