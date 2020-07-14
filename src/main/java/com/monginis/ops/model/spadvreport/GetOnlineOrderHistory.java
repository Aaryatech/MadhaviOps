package com.monginis.ops.model.spadvreport;

public class GetOnlineOrderHistory {

	private int orderId;
	private String invoiceNo;
	private String customer;
	private String mobNo;
	private String deliveryDate;
	private String deliveryTime;
	private String deliveryBoy;
	private String modeOfPayment;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getMobNo() {
		return mobNo;
	}
	public void setMobNo(String mobNo) {
		this.mobNo = mobNo;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getDeliveryTime() {
		return deliveryTime;
	}
	public void setDeliveryTime(String deliveryTime) {
		this.deliveryTime = deliveryTime;
	}
	public String getDeliveryBoy() {
		return deliveryBoy;
	}
	public void setDeliveryBoy(String deliveryBoy) {
		this.deliveryBoy = deliveryBoy;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	@Override
	public String toString() {
		return "GetOnlineOrderHistory [orderId=" + orderId + ", invoiceNo=" + invoiceNo + ", customer=" + customer
				+ ", mobNo=" + mobNo + ", deliveryDate=" + deliveryDate + ", deliveryTime=" + deliveryTime
				+ ", deliveryBoy=" + deliveryBoy + ", modeOfPayment=" + modeOfPayment + "]";
	}
	
	
}
