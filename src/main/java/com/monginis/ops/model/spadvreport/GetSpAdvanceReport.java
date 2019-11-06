package com.monginis.ops.model.spadvreport;

import java.util.Date;

public class GetSpAdvanceReport {
	
private int spOrderNo;
	
	private String custName;
	
	private String itemName;
	
	private String orderDate;
	
	private float totalMrp;
	
	private float advAmt;
	
	private float weight;
	
	private String delDate;
	
	private String spCustMobNo;
	
	private float rmAmount;
	
	private String spfName;

	public int getSpOrderNo() {
		return spOrderNo;
	}

	public void setSpOrderNo(int spOrderNo) {
		this.spOrderNo = spOrderNo;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public float getTotalMrp() {
		return totalMrp;
	}

	public void setTotalMrp(float totalMrp) {
		this.totalMrp = totalMrp;
	}

	public float getAdvAmt() {
		return advAmt;
	}

	public void setAdvAmt(float advAmt) {
		this.advAmt = advAmt;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}
 
	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getDelDate() {
		return delDate;
	}

	public void setDelDate(String delDate) {
		this.delDate = delDate;
	}

	public String getSpCustMobNo() {
		return spCustMobNo;
	}

	public void setSpCustMobNo(String spCustMobNo) {
		this.spCustMobNo = spCustMobNo;
	}

	public float getRmAmount() {
		return rmAmount;
	}

	public void setRmAmount(float rmAmount) {
		this.rmAmount = rmAmount;
	}

	public String getSpfName() {
		return spfName;
	}

	public void setSpfName(String spfName) {
		this.spfName = spfName;
	}

	@Override
	public String toString() {
		return "GetSpAdvanceReport [spOrderNo=" + spOrderNo + ", custName=" + custName + ", itemName=" + itemName
				+ ", orderDate=" + orderDate + ", totalMrp=" + totalMrp + ", advAmt=" + advAmt + ", weight=" + weight
				+ ", delDate=" + delDate + ", spCustMobNo=" + spCustMobNo + ", rmAmount=" + rmAmount + ", spfName="
				+ spfName + "]";
	}
	

}
