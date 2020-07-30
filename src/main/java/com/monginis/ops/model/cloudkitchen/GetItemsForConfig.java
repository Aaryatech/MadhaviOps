package com.monginis.ops.model.cloudkitchen;

public class GetItemsForConfig {

	private int itemId;

	private String itemName;
	private String hsncd;
	private float rateAmt;
	private float mrpAmt;
	private float spRateAmt;
	private float tax1;
	private float tax2;
	private float tax3;
	private int status;
	private int checked;
	private int itemConfigId;
	private int itemConfigDetailId;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getHsncd() {
		return hsncd;
	}

	public void setHsncd(String hsncd) {
		this.hsncd = hsncd;
	}

	public float getRateAmt() {
		return rateAmt;
	}

	public void setRateAmt(float rateAmt) {
		this.rateAmt = rateAmt;
	}

	public float getMrpAmt() {
		return mrpAmt;
	}

	public void setMrpAmt(float mrpAmt) {
		this.mrpAmt = mrpAmt;
	}

	public float getSpRateAmt() {
		return spRateAmt;
	}

	public void setSpRateAmt(float spRateAmt) {
		this.spRateAmt = spRateAmt;
	}

	public float getTax1() {
		return tax1;
	}

	public void setTax1(float tax1) {
		this.tax1 = tax1;
	}

	public float getTax2() {
		return tax2;
	}

	public void setTax2(float tax2) {
		this.tax2 = tax2;
	}

	public float getTax3() {
		return tax3;
	}

	public void setTax3(float tax3) {
		this.tax3 = tax3;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	public int getItemConfigId() {
		return itemConfigId;
	}

	public void setItemConfigId(int itemConfigId) {
		this.itemConfigId = itemConfigId;
	}

	public int getItemConfigDetailId() {
		return itemConfigDetailId;
	}

	public void setItemConfigDetailId(int itemConfigDetailId) {
		this.itemConfigDetailId = itemConfigDetailId;
	}

	@Override
	public String toString() {
		return "GetItemsForConfig [itemId=" + itemId + ", itemName=" + itemName + ", hsncd=" + hsncd + ", rateAmt="
				+ rateAmt + ", mrpAmt=" + mrpAmt + ", spRateAmt=" + spRateAmt + ", tax1=" + tax1 + ", tax2=" + tax2
				+ ", tax3=" + tax3 + ", status=" + status + ", checked=" + checked + ", itemConfigId=" + itemConfigId
				+ ", itemConfigDetailId=" + itemConfigDetailId + "]";
	}
	
}
