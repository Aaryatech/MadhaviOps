<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>B2B Sales Report</title>

<style type="text/css">
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
      padding: 2px;
    font-size: 10;
}


th {
    background-color: #ed3f3c;
    color: white;
}
</style>
</head>
<body onload="myFunction()">
<h3 align="center">B2B Sales Report</h3>
<div align="center"> <h3>  ${frName} &nbsp;&nbsp;&nbsp;&nbsp;From &nbsp; ${fromDate}  &nbsp;To &nbsp; ${toDate}</h3></div>

	
	<table width="100%" border="1" cellspacing="0"
														cellpadding="1" id="table_grid" class="table table-bordered">
								<thead >
									<tr class="bgpink">
									<th style="text-align:center;" style="width:100px">Sr no.</th>
									<th style="text-align:center;">Bill No.</th>
									<th style="text-align:center">Bill Date</th>
									<th style="text-align:center">Bill Amt.</th>
									<!-- <th style="text-align:center">Pending Amt.</th> -->
								 	<th style="text-align:center">Payment Mode</th>
									<th style="text-align:center">Customer Name</th> 
									<th style="text-align:center">Contact No.</th> 
									<th style="text-align:center">GST No.</th>
								  </tr>
								</thead>
								<tbody >
								
								<c:set var="ttlPending"  value="${0}"/>
								<c:set var="grndTTl"  value="${0}"/>
								  	<c:forEach items="${reportList}" var="reportList" varStatus="count">
												<tr>
													<td style="text-align:center;"><c:out value="${count.index+1}" /></td>
													<td style="text-align:center;"><c:out value="${reportList.invoiceNo}" /></td>													
													<td style="text-align:center;"><c:out value="${reportList.billDate}" /></td>												
													
													
													<td style="text-align:right;">
														<fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.grandTotal}"/>
													</td>
													 <c:set var="grndTTl" value="${grndTTl + reportList.grandTotal}"/>													
													
													<%-- <td style="text-align:right;">
														<fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.remainingAmt}"/>
													</td> --%>
													<c:set var="ttlPending"  value="${ttlPending+reportList.remainingAmt }"/>
												
													<td style="text-align:center;">
														<c:out value="${reportList.paymentMode==1 ? 'Cash' : reportList.paymentMode==2 ? 'Card' : 'Other'}" />
													</td>
														
													<td style="text-align:left;"><c:out value="${reportList.userName}" /></td>
													<td style="text-align:center;"><c:out value="${reportList.userPhone}" /></td>
													<td style="text-align:center;"><c:out value="${reportList.userGstNo}" /></td>
														
												</tr>
												</c:forEach>
								  <tr>
								  <td colspan='3'><b>Total</b></td>								 
								  <td style="text-align:right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${grndTTl}"/></b></td>
								  <%-- <td style="text-align:right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${ttlPending}"/></b></td> --%>
								  <td style="text-align:right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${ttlBill}"/></b></td>
								  <td></td>
								  <td></td>
								   <td></td>
								  </tr>
							 </tbody>
								</table>

	
</body>
</html>