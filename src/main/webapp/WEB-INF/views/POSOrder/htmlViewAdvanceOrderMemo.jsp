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
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><img
					src="${pageContext.request.contextPath}/resources/newpos/images/madhvi_logo.jpg"
					alt="madhvi_logo"></td>
			</tr>
			<c:if test="${headDetails.isDailyMart==1}">
				<tr>

					<td colspan="2" align="center"
						style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;">

						<b> Regular Order Memo </b>

					</td>

				</tr>

			</c:if>
			<c:set var="cols" value="3" />
			<c:if test="${headDetails.isDailyMart==2}">
				<c:set var="cols" value="4" />
				<tr>

					<td colspan="2" align="center"
						style="padding: 2px; border-bottom: 1px solid #E7E7E7; font-size: 12px;">

						<b> Advance Order Memo </b>

					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; border-bottom: 1px solid #E7E7E7;"><b>${frDetails.frName}<br />(Madhvi
						Dairy Retail Outlet)
				</b><br /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"
					style="padding: 2px; font-family: verdana; border-bottom: 1px solid #E7E7E7; font-size: 11px;">${frDetails.frAddress}
					<br /> Outlet Ph:<strong>&nbsp;${frDetails.frMob}</strong><br />
					<span style="font-size: 11px; font-family: verdana;"><c:choose>
							<c:when test="${frDetails.frGstType==0}">PAN NO:&nbsp;${frSup.frPanNo}</c:when>
							<c:otherwise>GSTIN:<b>&nbsp;${frDetails.frGstNo}</b>
							</c:otherwise>
						</c:choose><br />FSSAI:&nbsp;&nbsp;${frDetails.fbaLicenseDate}</span>
				</td>
			</tr>
			<tr>
				<c:set var="totalAmt" value="0"></c:set>
				<c:set var="calTotalAmt" value="0"></c:set>
				<td colspan="2">
					<table width="100%" border="0" cellspacing="0" cellpadding="2">
						<tbody>
						<tr>
								<td align="left">Serial No:</td>
								<td align="left" colspan="3">${headDetails.exInt1}</td>

							</tr>
							<tr>
								<td align="left">Customer:</td>
								<td align="left" colspan="3">${cust.custName}</td>

							</tr>
							<tr>
								<td align="left">Order Date:</td>
								<td align="left" colspan="3">${headDetails.orderDate}
									${headDetails.exVar1}</td>

							</tr>
							<tr>
								<fmt:parseDate value="${headDetails.deliveryDate}"
									pattern="yyyy-MM-dd" var="myDate" />
								<fmt:formatDate value="${myDate}" var="startFormat"
									pattern="dd-MM-yyyy" />
								<td align="left">Delivery Date:</td>
								<td align="left" colspan="3">${startFormat} ${delTime}</td>

							</tr>
							<tr>
								<td align="left">Place of Supply:</td>
								<td align="left" colspan="3">Gujarat</td>

							</tr>
							<tr>
								<td align="left">Remark:</td>
								<td align="left" colspan="3">${remark}</td>

							</tr>
							<tr>
								<td colspan="${cols}"><table width="100%" border="0"
										cellspacing="0" cellpadding="4" class="tbl-inner">

										<tbody>

											<tr>
												<th width="43%" align="left" bgcolor="#ECECEC">Item /
													Product Name</th>
												<th width="8%" bgcolor="#ECECEC" align="right"><span
													style="visibility: hidden;">1000</span></th>
												<th width="8%" bgcolor="#ECECEC" align="right">QTY</th>
												<th width="15%" bgcolor="#ECECEC" align="right">Mrp</th>
												<c:if test="${headDetails.isDailyMart==2}">
													<th width="8%" bgcolor="#ECECEC" align="right">Disc(%)</th>
												</c:if>
												<c:if test="${headDetails.isDailyMart==1}">
												<th width="8%" bgcolor="#ECECEC" align="right"><span
													style="visibility: hidden;">1000000</span></th>
													</c:if>

												<th width="29%" align="right" bgcolor="#ECECEC">AMT</th>
											</tr>

											<c:forEach items="${itemList}" var="itemBillList"
												varStatus="count">
												<tr>
													<td>${itemBillList.itemName}<br />
													</td>

													<td><span style="visibility: hidden;">1000</span></td>
													<td align="right"><span style="font-size: 11px">

															${itemBillList.orderQty} </span></td>
													<td align="right"><span style="font-size: 11px">${itemBillList.orderMrp}
													</span></td>
													<c:if test="${headDetails.isDailyMart==2}">
														<td align="right"><span style="font-size: 11px">${itemBillList.isPositive}
														</span></td>

													</c:if>
													
													<c:if test="${headDetails.isDailyMart==1}">
														<td align="right"><span style="visibility: hidden;">100000</span></td>

													</c:if>


													<td align="right"><span style="font-size: 11px">
															<c:if test="${headDetails.isDailyMart==2}">
																<fmt:formatNumber type="number" maxFractionDigits="2"
																	minFractionDigits="2"
																	value="${itemBillList.orderRate*itemBillList.orderQty-((itemBillList.orderRate*itemBillList.orderQty)*itemBillList.isPositive/100)}"
																	groupingUsed="false" />
															</c:if> <c:if test="${headDetails.isDailyMart==1}">	${(itemBillList.orderMrp*itemBillList.orderQty)}	</c:if>
													</span></td>

													<c:if test="${headDetails.isDailyMart==2}">
														<c:set var="totalAmt"
															value="${totalAmt=totalAmt+(itemBillList.orderMrp*itemBillList.orderQty-((itemBillList.orderRate*itemBillList.orderQty)*itemBillList.isPositive/100))}" />
													</c:if>

													<c:if test="${headDetails.isDailyMart==1}">
														<c:set var="totalAmt"
															value="${totalAmt=totalAmt+itemBillList.orderMrp*itemBillList.orderQty}" />
													</c:if>




												</tr>
											</c:forEach>

											<tr>
											
											<c:if test="${headDetails.isDailyMart==1}">
											<td colspan="${cols+2}" align="right"><span
													class="style7">Total:</span></td>
											</c:if>
											
											<c:if test="${headDetails.isDailyMart==2}">
											<td colspan="${cols+1}" align="right"><span
													class="style7">Total:</span></td>
											</c:if>
											
												
												<%-- <td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.total}" groupingUsed="false" /></span></td> --%>

												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${totalAmt}" groupingUsed="false" /></span></td>
											</tr>
											<%-- 	<c:if test="${headDetails.discAmt > 0.00}">
											<tr>
												<td colspan="4" align="right"><span class="style7">Discount
														Amt :</span></td>
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.discAmt}" groupingUsed="false" /></span></td>
											</tr>

                                        </c:if> --%>
											<tr>
											
											<c:if test="${headDetails.isDailyMart==1}">
											<td colspan="${cols+2}" align="right"><span
													class="style7">Advance Amt :</span></td>
											</c:if>
											
											<c:if test="${headDetails.isDailyMart==2}">
											<td colspan="${cols+1}" align="right"><span
													class="style7">Advance Amt :</span></td>
											</c:if>
											
												
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${headDetails.advanceAmt}" groupingUsed="false" /></span></td>
											</tr>

											<tr>
											
											<c:if test="${headDetails.isDailyMart==1}">
											<td colspan="${cols+2}" align="right"><span
													class="style7">Remaining Amt :</span></td>
											</c:if>
											
											<c:if test="${headDetails.isDailyMart==2}">
											<td colspan="${cols+1}" align="right"><span
													class="style7">Remaining Amt :</span></td>
											</c:if>
											
												
												<td align="right"><span class="style7"><fmt:formatNumber
															type="number" maxFractionDigits="2" minFractionDigits="2"
															value="${totalAmt-headDetails.advanceAmt}"
															groupingUsed="false" /></span></td>
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
							<td align="center"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span>
									Customer Care: 9824051188 </span></td>
						</tr>
						<tr>
							<td align="left"
								style="border-top: 1px solid #E7E7E7; padding: 3px;" colspan="6"><span>
									For wholesale inquiry contact DairyMart Team<br> Ph: 82600
									60048/49<br> Visit us on www.madhvi.in<br> Please
									Email us your feedback/suggestions on<br>
									madhvidairy@gmail.com<br> This is a computer generated
									invoice <br> Subject to ${frDetails.frCity} Jurisdiction
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
								style="font-weight: bold;">With You @ Your Great Moments!</span></td>
						</tr>

					</table></td>
			</tr>

		</tbody>
	</table>
</body>
<body onload="directPrint()">
	 <script>
		function directPrint() {
			//alert("JJ");
			window.print();
			//window.close();
		}
	</script> 
</body>

</html>