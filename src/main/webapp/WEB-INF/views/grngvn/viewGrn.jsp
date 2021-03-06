<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
table, th, td {
	border: 1px solid #9da88d;
}
</style>

<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>

<!--topLeft-nav-->
<div class="sidebarOuter"></div>
<!--topLeft-nav-->

<!--wrapper-start-->
<div class="wrapper">

	<!--topHeader-->
	<c:url var="getGrnList" value="/getGrnHeaderList" />
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

				<div class="order-left" style="width: 100%">



					<div class="colOuter">
						<div class="col-md-8">
							<h2 class="pageTitle">GRN Headers</h2>
						</div>

						<div class="col-md-4" style="text-align: right;">

							<br>
						</div>
						<br>
					</div>
					<br>
				</div>
				<br>
				<form id="validation-form">
					<input type="hidden" value="${gstType}" name="type" id="type" />

					<div class="colOuter">
						<!-- copy div kalpesh -->


						<div class="col-md-2" style="float: none;">
							<h4 class="pull-left">From Date:-</h4>
						</div>
						<div class="col-md-2">
							<input id="datepicker" class="texboxitemcode texboxcal"
								autocomplete="off" value="${cDate}" name="from_Date" type="text">
						</div>

						<div class="col-md-1">
							<h4 class="pull-left" style="text-align: center;">To Date:-</h4>
						</div>
						<div class="col-md-2">
							<input id="datepicker2" class="texboxitemcode texboxcal"
								autocomplete="off" value="${cDate}" name="to_Date" type="text">
						</div>


						<div class="col-md-2" style="display: none;">
							<div class="col1title">
								<b>OR Grn Sr No</b>
							</div>
						</div>
						<div class="col-md-2" style="display: none;">
							<input type="text" class="form-control" id="headeIdText"
								style="width: 120px" name="headeIdText" value="0" />
						</div>




						<div class="col-md-2">

							<button type="button" class="btn  buttonsaveorder"
								onclick="searchGRN()">Search</button>
						</div>




					</div>




					<!--tabNavigation-->
					<div class="cd-tabs">
						<!--tabMenu-->

						<!--tabMenu-->


						<div id="table-scroll">
							<!-- class="table-scroll" -->
							<div class="table-wrap">
								<table id="table_grid" class="responsive-table">
									<!-- class="main-table"  -->
									<thead>
										<tr class="bgpink">
											<th class="col-md-3" style="text-align: center;">GrnSr
												No</th>
											<th class="col-md-3" style="text-align: center;">E-Way Bill No</th>
											<th class="col-md-2" style="text-align: center;">Date</th>
											<th class="col-md-2" style="text-align: center;">Taxable
												Amt</th>
											<th class="col-md-2" style="text-align: center;">Tax Amt</th>
											<th class="col-md-2" style="text-align: center;">Amount</th>
											<th class="col-md-2" style="text-align: center;">Approved
												Amt</th>
											<th class="col-md-2" style="text-align: center;">Status</th>
											<th class="col-md-1" style="text-align: center;">Credited?</th>
											<th class="col-md-2" style="text-align: center;">Credit
												Number</th>
											<th class="col-md-3" style="text-align: center;">Action</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${grnList}" var="grnList" varStatus="count">
									
										
											<tr>
												<td class="col-md-3" style="text-align: center;"><c:out
														value="${grnList.grngvnSrno}" /> <input type="hidden"
													name="headerId" id="headerId"
													value="${grnList.grnGvnHeaderId}"></td>
													
												<td class="col-md-3" style="text-align: center;"><c:out
														value="${grnList.approvedDatetime}" /></td>
													
												<td class="col-md-2" style="text-align: center;"><c:out
														value="${grnList.grngvnDate}" /></td>
												<td class="col-md-2" style="text-align: right;"><c:out
														value="${grnList.taxableAmt}" /></td>
												<td class="col-md-2" style="text-align: right;"><c:out
														value="${grnList.taxAmt}" /></td>
												<td class="col-md-2" style="text-align: right;"><c:out
														value="${grnList.totalAmt}" /></td>

												<td class="col-md-2" style="text-align: right;"><fmt:formatNumber
														type="number" minFractionDigits="2" maxFractionDigits="2"
														value="${grnList.aprGrandTotal}" /> <%-- <c:out value="${grnList.taxableAmt}" /> --%></td>
												<c:set var="status" value="a"></c:set>
												<%-- <c:choose>
													

													<c:when test="${grnList.grngvnStatus==6}">
														<c:set var="status" value="Approved From Account"></c:set>
													</c:when>

													<c:when test="${grnList.grngvnStatus==7}">
														<c:set var="status" value="Reject From Account"></c:set>
													</c:when>

													<c:when test="${grnList.grngvnStatus==8}">
														<c:set var="status" value="Partially Approved"></c:set>
													</c:when>
													<c:otherwise>
														<c:set var="status" value="Pending"></c:set>
													</c:otherwise>

												</c:choose> --%>



												<c:choose>


													<c:when test="${grnList.grngvnStatus==6}">
														<c:set var="status" value="Approved From Account"></c:set>
													</c:when>

													<c:when test="${grnList.grngvnStatus==7}">
														<c:set var="status" value="Reject From Account"></c:set>
													</c:when>
													<c:otherwise>
														<c:set var="status" value="Pending"></c:set>
													</c:otherwise>

												</c:choose>

												<td class="col-md-3" style="text-align: center;"><c:out
														value="${status}"></c:out></td>
												<c:set var="isCredit" value="a"></c:set>

												<c:choose>
													<c:when test="${grnList.isCreditNote==1}">
														<c:set var="isCredit" value="Yes"></c:set>
													</c:when>
													<c:otherwise>
														<c:set var="isCredit" value="No"></c:set>
													</c:otherwise>
												</c:choose>

												<td class="col-md-1" style="text-align: center;"><c:out
														value="${isCredit}"></c:out></td>

												<td class="col-md-2" style="text-align: center;"><c:out
														value="${grnList.creditNoteId}"></c:out></td>

												<c:choose>
													<c:when test="${grnList.isCreditNote==1}">

														<td class="col-md-2" style="text-align: center;"><a
															href='#' class='action_btn'
															onclick="getGrnDetail(${grnList.grnGvnHeaderId})"><abbr
																title='Detail'><i class='fa fa-list'></i></abbr></a> &nbsp;<a
															href='#' class='action_btn'
															onclick="genPdf(${grnList.grnGvnHeaderId})"><abbr
																title='Pdf'><i class='fa fa-file-pdf-o'
																	style="color: red;"></i></abbr></a> &nbsp;<a href='#'
															class='action_btn'
															onclick="genCrnPdf(${grnList.grnGvnHeaderId})"><abbr
																title='Pdf'>CRN</abbr></a></td>

													</c:when>
													<c:otherwise>
														<td class="col-md-2" style="text-align: center;"><a
															href='#' class='action_btn'
															onclick="getGrnDetail(${grnList.grnGvnHeaderId})"><abbr
																title='Detail'><i class='fa fa-list'></i></abbr></a> &nbsp;<a
															href='#' class='action_btn'
															onclick="genPdf(${grnList.grnGvnHeaderId})"><abbr
																title='Pdf'><i class='fa fa-file-pdf-o'
																	style="color: red;"></i></abbr></a></td>
													</c:otherwise>
												</c:choose>


												<%-- <td class="col-md-1"><a href='#' class='action_btn'
													onclick="genPdf(${grnList.grnGvnHeaderId})"><abbr
														title='Pdf'><i class='fa fa-list'></i></abbr></a></td> --%>

												<%-- <input type="button" onclick="getGrnDetail(${grnList.grnGvnHeaderId})" id="grnDetailButton" value="Detail"></td> --%>

											</tr>
										</c:forEach>



									</tbody>

								</table>
							</div>
						</div>



					</div>
					<!--tabNavigation-->


				</form>
			</div>

			<!--rightSidebar-->

		</div>
		<!--fullGrid-->
	</div>
	<!--rightContainer-->

</div>
<!--wrapper-end-->


<script>

/* function addCommas(nStr)
{
nStr += '';
x = nStr.split('.');
x1 = x[0];
x2 = x.length > 1 ? '.' + x[1] : '';
var rgx = /(\d+)(\d{3})/;
while (rgx.test(x1)) {
x1 = x1.replace(rgx, '$1' + ',' + '$2');
}
return x1 + x2;
} */

 function addCommas(x){

x=String(x).toString();
 var afterPoint = '';
 if(x.indexOf('.') > 0)
    afterPoint = x.substring(x.indexOf('.'),x.length);
 x = Math.floor(x);
 x=x.toString();
 var lastThree = x.substring(x.length-3);
 var otherNumbers = x.substring(0,x.length-3);
 if(otherNumbers != '')
     lastThree = ',' + lastThree;
 return otherNumbers.replace(/\B(?=(\d{2})+(?!\d))/g, ",") + lastThree + afterPoint;
} 

</script>


<script type="text/javascript">
		function searchGRN() {

			$('#table_grid td').remove();
			var headeIdText=$("#headeIdText").val();
			
			//if(!headeIdText==null || headeIdText=="")
			//var isValid = validate();

			//if (isValid) {

				var fromDate = document.getElementById("datepicker").value;
				var toDate = document.getElementById("datepicker2").value;
				//var headeIdText=$("#headeIdText").val();
				
				
				//var headerCheckBox = document.getElementById("headerCheckBox").value;
				//alert("CHK "+headerCheckBox);

				$.getJSON('${getGrnList}', {

					fromDate : fromDate,
					toDate : toDate,
					headerId : headeIdText,
					ajax : 'true'

				}, function(data) {
					
					//alert(JSON.stringify(data));

					//$('#table_grid td').remove();
document.getElementById("headeIdText").value=0;
					if (data == "") {
						alert("No records found !!");

					}

					$.each(data, function(key, grndata) {
						
						var tr = $('<tr></tr>');
						
						var grnStatus;
								
								/* if(grndata.grngvnStatus==1)
									grnStatus="Pending";
								else if(grndata.grngvnStatus==2)
									grnStatus="Approved  From Dispatch";
								else if(grndata.grngvnStatus==3)
									grnStatus="Reject From Dispatch";
								else if(grndata.grngvnStatus==4)
									grnStatus="Approved From Sales";
								else if(grndata.grngvnStatus==5)
									grnStatus="Reject From Sales";
								else if(grndata.grngvnStatus==6)
									grnStatus="Approved From Account";
								else if(grndata.grngvnStatus==7)
									grnStatus="Reject From Account";
								
								else if(grndata.grngvnStatus==8)
									grnStatus="Partially Approved"; */
									
									
									if(grndata.grngvnStatus==6)
										grnStatus="Approved from Account";
									if(grndata.grngvnStatus==7)
										grnStatus="Rejected from Account";
									else 
										grnStatus="Pending";
								
								var isCredit;
								if(grndata.isCreditNote==1)
									isCredit="Yes";
								if(grndata.isCreditNote==0)
									isCredit="No";
								
						tr.append($('<td class="col-md-3" style="text-align: center;"></td>').html(grndata.grngvnSrno));
						tr.append($('<td class="col-md-3" style="text-align: center;"></td>').html(grndata.approvedDatetime));
						tr.append($('<td class="col-md-2" style="text-align: center;"></td>').html(grndata.grngvnDate));
						tr.append($('<td class="col-md-2" style="text-align: center;"></td>').html(grndata.taxableAmt));
						tr.append($('<td class="col-md-2" style="text-align: center;"></td>').html(grndata.taxAmt));
						tr.append($('<td class="col-md-2" style="text-align: center;"></td>').html(grndata.totalAmt));
						tr.append($('<td class="col-md-2" style="text-align: center;"></td>').html(grndata.aprGrandTotal));
						tr.append($('<td class="col-md-3" style="text-align: center;"></td>').html(grnStatus));
						
						tr.append($('<td class="col-md-1" style="text-align: center;"></td>').html(isCredit));

						tr.append($('<td class="col-md-1" style="text-align: center;"></td>').html(grndata.creditNoteId));	


						//tr.append($('<td class="col-md-2"></td>').html("<input type='button' onclick='getGrnDetail("+grndata.grnGvnHeaderId+")' id='grnDetailButton' value='Detail'>"));
						if(grndata.isCreditNote==1)
							{
						  tr.append($('<td class="col-md-3" style="text-align: center;" ><a href="#" class="action_btn" onclick="getGrnDetail('+grndata.grnGvnHeaderId+')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a>&nbsp; <a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><i class="fa fa-file-pdf-o" style="color:red"></i></a>&nbsp; <a href="#" class="action_btn" onclick="genCrnPdf('+grndata.grnGvnHeaderId+')">CRN</a></td>'));
							}else{
					    tr.append($('<td class="col-md-3" style="text-align: center;" ><a href="#" class="action_btn" onclick="getGrnDetail('+grndata.grnGvnHeaderId+')"><abbr title="Detail"><i class="fa fa-list"></i></abbr></a>&nbsp; <a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><i class="fa fa-file-pdf-o" style="color:red"></i></a></td>'));
							}
							//tr.append($('<td ><a href="#" class="action_btn" onclick="genPdf('+grndata.grnGvnHeaderId+')"><abbr title="Pdf"><i class="far fa-file-pdf"></i></abbr></a></td>'));

						//tr.append($('<td class="col-md-2"><a href=''#' class='action_btn' onclick='getGrnDetail("+grndata.grnGvnHeaderId+")'> <abbr title='Detail'><i class="fa fa-trash"></i></abbr></a></td>'));
$('#table_grid tbody')
	.append(
			tr);
			
})

});
				

			
//}//if block
}
		
	
	</script>


<script type="text/javascript">

function getGrnDetail(headerId){
			//alert("HIII");
			//alert("header ID "+headerId)
			
			var fromDate =$("#datepicker").val();
			var toDate =$("#datepicker2").val();
		    var form = document.getElementById("validation-form");
		    form.action ="getGrnDetailList/"+headerId;
		    form.submit();
		}
</script>

<script type="text/javascript">
		function validate() {
		
			var fromDate =$("#datepicker").val();
			var toDate =$("#datepicker2").val();
			
			var headeIdText=$("#headeIdText").val();
			alert(headeIdText);
			
			var isValid = true;
			if(headeIdText =="" || headeIdText == null){
				 isValid = false;
			}
			else if (fromDate == "" || fromDate == null) {

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
	/*
//  jquery equivalent
jQuery(document).ready(function() {
   jQuery(".main-table").clone(true).appendTo('#table-scroll .faux-table').addClass('clone');
   jQuery(".main-table.clone").clone(true).appendTo('#table-scroll .faux-table').addClass('clone2'); 
 });
*/
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

function genPdf(headerId) {
		//alert("Inside Gen Pdf ");

		var fromDate =$("#datepicker").val();
		var toDate =$("#datepicker2").val();
		var type =$("#type").val();

	// window.open('${pageContext.request.contextPath}/pdf?reportURL=pdf/getGrnPdf/'+fromDate+'/'+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		    
		    //window.open('${pageContext.request.contextPath}/billPdf?url=pdf/getGrnPdf/'+fromDate+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		    window.open('${pageContext.request.contextPath}/pdf/getGrnPdf/'+fromDate+'/'+toDate+'/'+headerId+'/'+1+'/'+type);
		   
			
	}
	</script>
<script>

function genCrnPdf(headerId) {
	   
		    window.open('${pageContext.request.contextPath}/pdf/getCrnCheckedHeaders/'+headerId);
			
	}
	</script>
</body>
</html>