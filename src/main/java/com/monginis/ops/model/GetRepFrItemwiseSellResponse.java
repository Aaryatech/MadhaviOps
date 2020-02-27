package com.monginis.ops.model;

public class GetRepFrItemwiseSellResponse {

    private int sellBillNo;

    private int frId;
	
	private String frName;
	
	private int itemId;
	
	private String billDate;
	
	private String itemName;
	
	private int catId;
	
	private String catName;
	
	private float qty;
	
	private float amount;
	
	private float rate;
	
	private float mrp;	

	public int getSellBillNo() {
		return sellBillNo;
	}

	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public String getFrName() {
		return frName;
	}

	public void setFrName(String frName) {
		this.frName = frName;
	}

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

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatName() {
		return catName;
	}

	public void setCatName(String catName) {
		this.catName = catName;
	}

	public float getQty() {
		return qty;
	}

	public void setQty(float qty) {
		this.qty = qty;
	}

	public float getAmount() {
		return amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public float getRate() {
		return rate;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public float getMrp() {
		return mrp;
	}

	public void setMrp(float mrp) {
		this.mrp = mrp;
	}

	@Override
	public String toString() {
		return "GetRepFrItemwiseSellResponse [sellBillNo=" + sellBillNo + ", frId=" + frId + ", frName=" + frName
				+ ", itemId=" + itemId + ", billDate=" + billDate + ", itemName=" + itemName + ", catId=" + catId
				+ ", catName=" + catName + ", qty=" + qty + ", amount=" + amount + ", rate=" + rate + ", mrp=" + mrp
				+ "]";
	}

	

}
