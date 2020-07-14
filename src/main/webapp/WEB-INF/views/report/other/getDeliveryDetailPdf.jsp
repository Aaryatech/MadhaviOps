<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer List</title>

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
	<h4 align="center">Delivery Details</h4>
	<h4 align="center">Delivery Boy : Amit</h4>
	<h4 align="center">Delivery Between  : 01-07-2020 to 20-07-2020</h4>
	<h4 align="center">Order Total : 3600.00</h4>
	<table align="center" border="1" cellspacing="0" cellpadding="1"
		cellpadding="0" id="table_grid" class="table table-bordered">
		<thead>
			<tr class="bgpink">
				<th style="text-align: center;">Sr.No.</th>
				<th style="text-align: center;">Invoice No.</th>
				<th style="text-align: left;  width: 40px;">Customer Details</th>
				<th style="text-align: center;  width: 40px;">Delivery Details</th>
				<th style="text-align: center;">No. Of Kilometers</th>		
				<th style="text-align: right;">Amounts</th> 
				<th style="text-align: center;">Mode Of Payment</th>
			</tr>
		</thead>

		<tbody>
		<tbody>
			

			<c:forEach items="${list}" var="list" varStatus="count">
				<tr>
					<td align="center"><c:out value="${count.index+1}" /></td>
					<td style="text-align: center;"><c:out value="${list.invoiceNo}" /></td>
					<td style="text-align: left; width: 20%;"><c:out
							value="${list.customer} - ${list.mobNo}" /></td>
					<td style="text-align: center; width: 15%;"><c:out
							value="${list.deliveryDate} - ${list.deliveryTime}" /></td>
					<td style="text-align: right;"><c:out
							value="${list.noOfKm}" /></td>
					<td style="text-align: right;"><c:out
							value="${list.amount}" /></td>
					<td style="text-align: center;"><c:out
							value="${list.modeOfPayment}" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table> 


</body>
</html>