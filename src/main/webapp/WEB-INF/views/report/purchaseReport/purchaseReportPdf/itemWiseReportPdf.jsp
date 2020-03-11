<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.monginis.ops.constant.Constant"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item wise Purchase Report</title>

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
	<h3 align="center">Itemwise Purchase Report</h3>
	<div align="center">
		<h3>${frName}&nbsp;&nbsp;&nbsp;&nbsp;From&nbsp;${fromDate}
			&nbsp;To &nbsp; ${toDate}</h3>
	</div>
	<table width="100%" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th style="text-align: center;">Sr.No.</th>
				<!-- <th style="text-align: center;">Party Name</th> -->
				<th style="text-align: center;">Item Name</th>
				<!-- <th style="text-align: center;">GRN Type</th> -->
				<th style="text-align: center;">Qty.</th>
				<th style="text-align:center;">Rate</th> 
				<th style="text-align:center;">Discount Amt</th> 
				<th style="text-align: center;">Amount</th>

			</tr>
		</thead>

		<tbody>
		<tbody>

			<c:set var="totalQty" value="${0 }" />
			<c:set var="grandTotal" value="${0 }" />
			<c:set var="rateTotal" value="${0 }" />
			<c:set var="discTotal" value="${0 }" />
			<c:forEach items="${reportList}" var="reportList" varStatus="count">
				<tr>
					<td style="text-align: center;"><c:out value="${count.index+1}" /></td>

					<%-- <td>${Constant.FACTORYNAME}</td> --%>
					<td><c:out value="${reportList.itemName}" /></td>
					<%-- <td><c:out value="${reportList.grnType}" /></td> --%>
					<td style="text-align: right;"><c:out
							value="${reportList.qty}" /></td>
					<c:set var="totalQty" value="${totalQty+reportList.qty}" />
					
					<td style="text-align:right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" 
					value = "${reportList.rate}"/></td>
						<c:set var="rateTotal" value="${rateTotal+reportList.rate}" />
						
					<td style="text-align:right;"><fmt:formatNumber type = "number" minFractionDigits = "2" maxFractionDigits = "2" 
					value = "${reportList.discAmt}"/></td>
						<c:set var="discTotal" value="${discTotal+reportList.discAmt}" />
						
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.total}" /></td>
					<c:set var="grandTotal" value="${grandTotal+reportList.total}" />

				</tr>
			</c:forEach>
			<tr>
				<td colspan='1'><b>Total</b></td>
				<!-- <td colspan='1'></td> -->
				<td colspan='1'></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalQty}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${rateTotal}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${discTotal}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${grandTotal}" /></b></td>

			</tr>
		</tbody>
	</table>


</body>
</html>