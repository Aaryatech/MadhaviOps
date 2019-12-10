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
			<c:if test="${headDetails.isDailyMart==1}">
				<tr>

					<td colspan="2" align="center"
						style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;">

						<b> Regular Order Memo</b>

					</td>

				</tr>

			</c:if>

			<c:if test="${headDetails.isDailyMart==2}">
				<tr>

					<td colspan="2" align="center"
						style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;">

						<b> Advance Order Memo</b>

					</td>
				</tr>
			</c:if>
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
				<c:set var="calTotalAmt" value="0"></c:set>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>

							<tr>
								<td align="left">Date:</td>
								<td align="left" colspan="3">${headDetails.orderDate}</td>

							</tr>
							<tr>
								<td align="left">Place of Supply:</td>
								<td align="left" colspan="3">Gujarat</td>

							</tr>
							<tr>
								<td colspan="4"><table width="100%" border="0"
										cellspacing="0" cellpadding="4" class="tbl-inner">

										<tbody>

											<tr>
												<th width="43%" align="left" bgcolor="#ECECEC">Item</th>
												<th width="8%" bgcolor="#ECECEC" align="right">QTY</th>
												<th width="15%" bgcolor="#ECECEC" align="right">Rate</th>
												<th width="29%" align="right" bgcolor="#ECECEC">AMT</th>
											</tr>

											<c:forEach items="${itemList}" var="itemBillList"
												varStatus="count">
												<tr>
													<td>${itemBillList.itemName}<br />
													</td>
													<td align="right"><span style="font-size: 11px">

															${itemBillList.orderQty} </span></td>

													<td align="right"><span style="font-size: 11px">${itemBillList.orderRate}
													</span></td>


													<td align="right"><span style="font-size: 11px">
															${itemBillList.orderRate*itemBillList.orderQty} </span></td>

												</tr>
											</c:forEach>

											<tr>
												<td colspan="4" align="right"><span class="style7">Total:</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.total}" groupingUsed="false" /></span></td>
											</tr>
											<c:if test="${headDetails.discAmt>0}"></c:if>
											<tr>
												<td colspan="4" align="right"><span class="style7">Discount
														Amt :</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.discAmt}" groupingUsed="false" /></span></td>
											</tr>
											

											<tr>
												<td colspan="4" align="right"><span class="style7">Advance
														Amt :</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.advanceAmt}" groupingUsed="false" /></span></td>
											</tr>

											<tr>
												<td colspan="4" align="right"><span class="style7">Remaining
														Amt :</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.remainingAmt}" groupingUsed="false" /></span></td>
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
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span>With
									You @ Your Great Moments <br> For wholesale inquiry
									contact DairyMart Team 82600 60049/50<br> visit us on
									www.madhvi.in<br> Email feedback/suggestions on
									madhvidairy<br> This is a computer generated invoice
							</span></td>
						</tr>

					</table></td>
			</tr>

			<tr>
				<td colspan="2"><table width="100%" border="0" cellspacing="0"
						cellpadding="7">
						<tr>
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span
								style="font-weight: bold;">With You @ Your Great Moments!
							</span></td>
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