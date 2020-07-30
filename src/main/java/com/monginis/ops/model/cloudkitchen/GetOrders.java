package com.monginis.ops.model.cloudkitchen;

public class GetOrders {

	private int orderId;

	private String orderNo;
	private String orderDate;
	private int frId;
	private int custId;
	private String custName;
	private int status;
	private int orderStatus;
	private int orderPlatform;
	private String deliveryDate;
	private String deliveryTime;
	private String whatsappNo;
	private float totalAmt;
	private float km;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public int getCustId() {
		return custId;
	}

	public void setCustId(int custId) {
		this.custId = custId;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(int orderStatus) {
		this.orderStatus = orderStatus;
	}

	public int getOrderPlatform() {
		return orderPlatform;
	}

	public void setOrderPlatform(int orderPlatform) {
		this.orderPlatform = orderPlatform;
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

	public String getWhatsappNo() {
		return whatsappNo;
	}

	public void setWhatsappNo(String whatsappNo) {
		this.whatsappNo = whatsappNo;
	}

	public float getTotalAmt() {
		return totalAmt;
	}

	public void setTotalAmt(float totalAmt) {
		this.totalAmt = totalAmt;
	}

	public float getKm() {
		return km;
	}

	public void setKm(float km) {
		this.km = km;
	}

	@Override
	public String toString() {
		return "GetOrders [orderId=" + orderId + ", orderNo=" + orderNo + ", orderDate=" + orderDate + ", frId=" + frId
				+ ", custId=" + custId + ", custName=" + custName + ", status=" + status + ", orderStatus="
				+ orderStatus + ", orderPlatform=" + orderPlatform + ", deliveryDate=" + deliveryDate
				+ ", deliveryTime=" + deliveryTime + ", whatsappNo=" + whatsappNo + ", totalAmt=" + totalAmt + "]";
	}

}
