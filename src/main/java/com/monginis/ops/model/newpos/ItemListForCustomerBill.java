package com.monginis.ops.model.newpos;

public class ItemListForCustomerBill {
	
	private int itemId;
	private float orignalMrp;
	private float Qty; 
	private String itemName;
	private float taxPer;
	private float taxableAmt;
	private float taxAmt;
	private float total;
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public float getOrignalMrp() {
		return orignalMrp;
	}
	public void setOrignalMrp(float orignalMrp) {
		this.orignalMrp = orignalMrp;
	}
	public float getQty() {
		return Qty;
	}
	public void setQty(float qty) {
		Qty = qty;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public float getTaxPer() {
		return taxPer;
	}
	public void setTaxPer(float taxPer) {
		this.taxPer = taxPer;
	}
	public float getTaxableAmt() {
		return taxableAmt;
	}
	public void setTaxableAmt(float taxableAmt) {
		this.taxableAmt = taxableAmt;
	}
	public float getTaxAmt() {
		return taxAmt;
	}
	public void setTaxAmt(float taxAmt) {
		this.taxAmt = taxAmt;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "ItemListForCustomerBill [itemId=" + itemId + ", orignalMrp=" + orignalMrp + ", Qty=" + Qty
				+ ", itemName=" + itemName + ", taxPer=" + taxPer + ", taxableAmt=" + taxableAmt + ", taxAmt=" + taxAmt
				+ ", total=" + total + "]";
	}
	
	

}