package com.monginis.ops.model.grngvn;


public class StockForAutoGrnGvn {

	private int id;
	
	private String itemId;

	private String itemName;

	private int regCurrentStock;

	private int spCurrentStock;
	
	private float purchaseQty;

	private float pushQty;

	private float regSellQty;

	private float spSellQty;

	private float grnGvnQty;
	
	
	
	

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getRegCurrentStock() {
		return regCurrentStock;
	}

	public void setRegCurrentStock(int regCurrentStock) {
		this.regCurrentStock = regCurrentStock;
	}

	public int getSpCurrentStock() {
		return spCurrentStock;
	}

	public void setSpCurrentStock(int spCurrentStock) {
		this.spCurrentStock = spCurrentStock;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public float getPurchaseQty() {
		return purchaseQty;
	}

	public void setPurchaseQty(float purchaseQty) {
		this.purchaseQty = purchaseQty;
	}

	public float getPushQty() {
		return pushQty;
	}

	public void setPushQty(float pushQty) {
		this.pushQty = pushQty;
	}

	
	public float getRegSellQty() {
		return regSellQty;
	}

	public void setRegSellQty(float regSellQty) {
		this.regSellQty = regSellQty;
	}

	public float getSpSellQty() {
		return spSellQty;
	}

	public void setSpSellQty(float spSellQty) {
		this.spSellQty = spSellQty;
	}

	public float getGrnGvnQty() {
		return grnGvnQty;
	}

	public void setGrnGvnQty(float grnGvnQty) {
		this.grnGvnQty = grnGvnQty;
	}

	@Override
	public String toString() {
		return "StockForAutoGrnGvn [id=" + id + ", itemId=" + itemId + ", itemName=" + itemName + ", regCurrentStock="
				+ regCurrentStock + ", spCurrentStock=" + spCurrentStock + ", purchaseQty=" + purchaseQty + ", pushQty="
				+ pushQty + ", regSellQty=" + regSellQty + ", spSellQty=" + spSellQty + ", grnGvnQty=" + grnGvnQty
				+ "]";
	}


}
