package com.monginis.ops.model.spadvreport;

public class GetDeliveryBoyWiseReport {

	private int id;
	private String deliveryBoyName;
	private int noOfKm;
	private int noOfOrders;
	private float amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeliveryBoyName() {
		return deliveryBoyName;
	}
	public void setDeliveryBoyName(String deliveryBoyName) {
		this.deliveryBoyName = deliveryBoyName;
	}
	public int getNoOfKm() {
		return noOfKm;
	}
	public void setNoOfKm(int noOfKm) {
		this.noOfKm = noOfKm;
	}
	
	public int getNoOfOrders() {
		return noOfOrders;
	}
	public void setNoOfOrders(int noOfOrders) {
		this.noOfOrders = noOfOrders;
	}
	public float getAmount() {
		return amount;
	}
	public void setAmount(float amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "GetDeliveryBoyWiseReport [id=" + id + ", deliveryBoyName=" + deliveryBoyName + ", noOfKm=" + noOfKm
				+ ", noOfOrders=" + noOfOrders + ", amount=" + amount + "]";
	}

}
