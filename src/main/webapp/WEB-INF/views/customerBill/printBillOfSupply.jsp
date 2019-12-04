<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.monginis.ops.constant.Constant"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Bill</title>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title></title>

</head>
<style type="text/css">
.style2 {
	font-size: 14px
}

.style5 {
	font-size: 10px
}

.style6 {
	font-size: 9px
}

.style7 {
	font-size: 12px;
	font-weight: bold;
}

.style8 {
	font-size: 11px;
	font-weight: bold;
}
-->
</style>
</head>

</head>
<body>

	<table width="250" border="0" cellspacing="0" cellpadding="0"
		style="padding: 2px; font-family: verdana; font-size: 11px; border: 1px solid #E7E7E7;">
		<tbody>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;"><b>BILL
						OF SUPPLY</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><img
					src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg"
					alt="madhvi_logo"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><b>${frDetails.frName}</b><br />
					<span style="font-size: 10px; font-family: Arial;"><c:choose>
							<c:when test="${frDetails.frGstType==0}">PAN NO. : ${frSup.frPanNo}</c:when>
							<c:otherwise>GSTIN:${frDetails.frGstNo}</c:otherwise>
						</c:choose> </span></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; font-family: Arial; border-bottom: 1px solid #E7E7E7; font-size: 8px;">${frDetails.frAddress}
					<br /> Phone:<strong>${frDetails.frMob}</strong>
				</td>
			</tr>
			<tr>
				<c:set var="totalAmt" value="0"></c:set>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>
							<tr>
								<td align="left">Inv No:</td>
								<td align="left" colspan="3">${sellBillHeaderAndDetail.invoiceNo}</td>
							</tr>
							<tr>
								<td align="left">Date:</td>
								<td align="left" colspan="3">${sellBillHeaderAndDetail.timestamp}</td>

							</tr>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="4" class="tbl-inner">

										<tbody>

											<tr>
												<th width="43%" align="left" bgcolor="#ECECEC">Item<span
													style="font-size: 8"> (HSN Code)</span></th>
												<th width="8%" bgcolor="#ECECEC" align="right">QTY</th>
												<th width="13%" bgcolor="#ECECEC" align="right">Rate</th>
												<th width="29%" align="right" bgcolor="#ECECEC">AMT</th>
											</tr>

											<c:forEach items="${sellBillHeaderAndDetail.list}"
												var="itemBillList" varStatus="count">
												<tr>
													<td><span style="font-size: 11px">${itemBillList.itemName}<br />
															<span style="font-size: 8px">HSN-
																${itemBillList.itemHsncd}</span></span></td>
													<td align="right"><span style="font-size: 11px"><fmt:formatNumber
																type="number" groupingUsed="false"
																value="${itemBillList.qty}" maxFractionDigits="3"
																minFractionDigits="3" /> </span></td>
													<td align="right"><span style="font-size: 11px"><fmt:formatNumber
																type="number" groupingUsed="false"
																value="${itemBillList.mrp}" maxFractionDigits="0"
																minFractionDigits="0" /> </span></td>
													<td align="right"><span style="font-size: 11px">
															<fmt:formatNumber type="number" groupingUsed="false"
																value="${itemBillList.grandTotal}" maxFractionDigits="2"
																minFractionDigits="2" />
													</span></td>
													<c:set var="totalAmt"
														value="${totalAmt+itemBillList.grandTotal}"></c:set>
												</tr>
											</c:forEach>


											<tr>
												<td colspan="3" align="right"><span class="style7">Bill
														Total:</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${totalAmt}" groupingUsed="false" /></span></td>
											</tr>
										</tbody>
									</table></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">
						<tr>
							<td align="left"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span
								>With You @ Your Great Moments <br>
								 For wholesale inquiry contact DairyMart Team 82600 60049/50<br>
								 visit us on  www.madhvi.in<br>
								 Email feedback/suggestions on madhvidairy<br>
								 This is a computer generated invoice </span></td>
						</tr>

					</table></td>
			</tr>
			<c:choose>
							<c:when test="${frDetails.frGstType!=0}">
			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">
						<tr>
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span
								>Composition Taxable Person,Not eligible to collect Tax on Supplies</span></td>
						</tr>

					</table></td>
			</tr>
			</c:when>
			</c:choose>
			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">
						<tr>
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span
								style="font-weight: bold;">Thank You, Visit Again !!! </span></td>
						</tr>

					</table></td>
			</tr>

		</tbody>
	</table>
</body>
<body onload="directPrint()">
	<!-- <script>
		function directPrint() {
			//alert("JJ");
			window.print();
			//window.close();
		}
	</script> -->
</body>

</html>