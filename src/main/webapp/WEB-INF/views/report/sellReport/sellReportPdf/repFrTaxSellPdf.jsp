<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Tax PDF</title>
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
<body>

<h3 align="center">View Sell Tax Report</h3>
<div align="center"> <h3>  ${frName} &nbsp;&nbsp;&nbsp;&nbsp;From &nbsp; ${fromDate}  &nbsp;To &nbsp; ${toDate}</h3></div>
<table  width="100%" border="1" cellspacing="0" cellpadding="1" id="table_grid" class="table table-bordered">
								<thead >
									<tr>
									<th style="text-align: center;">Sr no.</th>
									<th style="text-align: center;">From Bill</th>
									<th style="text-align: center;">To Bill</th>
									<th style="text-align: center;">Tax %</th>
									<th style="text-align: center;">Taxable Amount</th>
								 	<th style="text-align: center;">CGST</th>
									<th style="text-align: center;">SGST</th> 									
									<th style="text-align: center;">IGST</th>
									<th style="text-align: center;">Bill Amt</th> 
									<!-- <th align="center">CESS</th>  -->
								  </tr>
								</thead>
								
								 <tbody >
								 <c:set var="taxAmount"   value="${0}"/>
								<c:set var="igst"  value="${0 }"/>
								<c:set var="cgst"  value="${0 }"/>
								<c:set var="sgst"  value="${0 }"/>
								<c:set var="ttlBill"  value="${0 }"/>
								  	<c:forEach items="${reportList}" var="reportList" varStatus="count">
												<tr>
													<td align="center"><c:out value="${count.index+1}" /></td>
													<td><c:out value="${reportList.fromBill}" /></td>
													<td><c:out value="${reportList.toBill}" /></td>
													<td><c:out value="${reportList.tax_per}" /> %</td>
													<td style="text-align: right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.tax_amount}"/></td>
													 <c:set var="taxAmount" value="${taxAmount + reportList.tax_amount}"/>													
													<td style="text-align: right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.cgst}"/></td>
														<c:set var="cgst"  value="${cgst+reportList.cgst}"/>
													<td style="text-align: right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.sgst}"/></td>
														<c:set var="sgst"  value="${sgst+reportList.sgst}"/>
													<td style="text-align: right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="0"/></td>
														<c:set var="igst"  value="${igst + 0}"/>
													<%-- <td><c:out value="${reportList.sess}" /></td> --%>
													<td style="text-align: right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${reportList.bill_amount}"/></td>
														<c:set var="ttlBill"  value="${ttlBill+reportList.bill_amount}"/>
													
												</tr>
												</c:forEach>
								  <tr>
								  <td colspan='4'><b>Total</b></td>
								  <td style="text-align: right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value ="${taxAmount}"/></b></td>
								  <td style="text-align: right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${cgst}"/></b></td>
								  <td style="text-align: right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${sgst}"/></b></td>
								  <td style="text-align: right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${igst}"/></b></td>
								  <td style="text-align: right;"><b><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" value = "${ttlBill}"/></b></td>
								     <!--  <td><b>Total</b></td> -->
								  </tr>
							 </tbody>
								</table>
						 
			


</body>
</html>