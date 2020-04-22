<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill wise Sell Report</title>
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
	background-color: #ed1c24;
	color: white;
}
</style>
</head>
<body>
	<h3 align="center">Billwise Sale Report</h3>
	<div align="center">
		<h3>${frName}&nbsp;&nbsp;&nbsp;&nbsp;From&nbsp;${fromDate}
			&nbsp;To &nbsp; ${toDate}</h3>
	</div>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">


				<th style="text-align: center; width: 60px">Sr no.</th>
				<th style="text-align: center; width: 100px">Invoice No</th>
				<th style="text-align: center; width: 100px">Bill Date</th>
				<th style="text-align: center; width: 100px">Customer</th>
				<th style="text-align: center; width: 100px">Disc%</th>
				<th style="text-align: center; width: 100px">Disc Amt</th>
				<th style="text-align: center; width: 100px">Taxable</th>
				<th style="text-align: center; width: 100px">Total Tax</th>
				<th style="text-align: center; width: 100px">Grand Total</th>
				<th style="text-align: center; width: 100px">Payable Amt</th>
				<th style="text-align: center; width: 100px">Paid Amt</th>
				<th style="text-align: center; width: 100px">Remaining Amt</th>
				<th style="text-align: center; width: 100px">Round Off</th>
				<th style="text-align: center; width: 100px">Payment Mode</th>



			</tr>
		</thead>

		<tbody>
			<c:set var="totalAmount" value="${0}" />
			<c:set var="totalTaxable" value="${0}" />
			<c:set var="totalTax" value="${0}" />
			<c:set var="totalTPayable" value="${0}" />
			<c:set var="totalPaid" value="${0}" />
			<c:set var="totalRemaining" value="${0}" />
			<c:set var="totalDicsAmt" value="${0}" />

			<c:set var="totalCash" value="${0}" />
			<c:set var="totalCard" value="${0}" />
			<c:set var="totalEPay" value="${0}" />
			
			<c:set var="totalRound" value="${0}" />

			<c:forEach items="${reportList}" var="reportList" varStatus="count">
				<tr>
					<td style="text-align: center;"><c:out value="${count.index+1}" /></td>

					<td style="text-align: center;"><c:out value="${reportList.invoiceNo}" /></td>

					<td style="text-align: center;"><c:out value="${reportList.billDate}" /></td>

					<td style="text-align: left;"><c:out
							value="${reportList.custName}-${reportList.phoneNumber}" /></td>

					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.discountPer}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.discountAmt}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.taxableAmt}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.totalTax}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.grandTotal}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.payableAmt}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.paidAmt}" /></td>
					<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.remainingAmt}" /></td>
							
							<td style="text-align: right;"><fmt:formatNumber type="number"
							minFractionDigits="2" maxFractionDigits="2"
							value="${reportList.roundOff}" /></td>


					<c:set var="totalAmount"
						value="${totalAmount + reportList.grandTotal}" />
					<c:set var="totalTaxable"
						value="${totalTaxable + reportList.taxableAmt}" />
					<c:set var="totalTax" value="${totalTax + reportList.totalTax}" />
					<c:set var="totalTPayable"
						value="${totalTPayable + reportList.payableAmt}" />
					<c:set var="totalPaid" value="${totalPaid + reportList.paidAmt}" />
					<c:set var="totalRemaining"
						value="${totalRemaining + reportList.remainingAmt}" />
					<c:set var="totalDicsAmt"
						value="${totalDicsAmt + reportList.discountAmt}" />

					<td style="text-align: center;"><c:out
							value="${reportList.paymentMode}" /></td>


					<c:set var="totalCash" value="${totalCash + reportList.cash}" />
					<c:set var="totalCard" value="${totalCard + reportList.card}" />
					<c:set var="totalEPay" value="${totalEPay + reportList.ePay}" />
					
					<c:set var="totalRound" value="${totalRound + reportList.roundOff}" />



				</tr>
			</c:forEach>
			<tr>
				<td colspan='5'><b>Total</b></td>
				
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalDicsAmt}" /></b></td>

				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalTaxable}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalTax}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalAmount}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalTPayable}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalPaid}" /></b></td>
				<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalRemaining}" /></b></td>
							
							<td style="text-align: right;"><b><fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalRound}" /></b></td>
							
							
				 <td style="text-align: right;"><b>
				 <fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalCash}" />-Cash,
				<fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalCard}" />-Card,
				<fmt:formatNumber
							type="number" minFractionDigits="2" maxFractionDigits="2"
							value="${totalEPay}" />-E-Pay
							  </b></td> 

			</tr>
		</tbody>
	</table>


	<!-- <script>
	function print()
	{
		alert("JJ");
		window.print();
		//window.close();
	}
	
	</script> -->
</body>
</html>