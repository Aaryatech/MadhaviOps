package com.monginis.ops.model.reportv2;


public class B2BSalesReport {
	private int sellBillNo;
	private String invoiceNo;
	private String billDate;
	private float grandTotal;
	private float remainingAmt;
	private int paymentMode;
	private String userPhone;
	private String userName;
	private String userGstNo;
	
	public int getSellBillNo() {
		return sellBillNo;
	}
	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public float getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(float grandTotal) {
		this.grandTotal = grandTotal;
	}
	public float getRemainingAmt() {
		return remainingAmt;
	}
	public void setRemainingAmt(float remainingAmt) {
		this.remainingAmt = remainingAmt;
	}
	public int getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(int paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGstNo() {
		return userGstNo;
	}
	public void setUserGstNo(String userGstNo) {
		this.userGstNo = userGstNo;
	}
	@Override
	public String toString() {
		return "B2BSalesReport [sellBillNo=" + sellBillNo + ", invoiceNo=" + invoiceNo + ", billDate=" + billDate
				+ ", grandTotal=" + grandTotal + ", remainingAmt=" + remainingAmt + ", paymentMode=" + paymentMode
				+ ", userPhone=" + userPhone + ", userName=" + userName + ", userGstNo=" + userGstNo + "]";
	}
	

}
