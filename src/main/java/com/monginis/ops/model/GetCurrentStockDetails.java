package com.monginis.ops.model;

public class GetCurrentStockDetails {

	private int stockDetailId;

	private String itemId;

	private int id;

	private String itemName;

	private float regOpeningStock;

	private float spOpeningStock;

	private float regTotalPurchase;

	private float spTotalPurchase;

	private float regTotalGrnGvn;

	private float regTotalSell;

	private float spTotalSell;

	private int stockHeaderId;

	private float currentRegStock;

	private float currentSpStock;

	private float reOrderQty;
	
	private int subCatId;
	
	private float sellCreditNote;

	public int getStockDetailId() {
		return stockDetailId;
	}

	public void setStockDetailId(int stockDetailId) {
		this.stockDetailId = stockDetailId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public float getRegOpeningStock() {
		return regOpeningStock;
	}

	public void setRegOpeningStock(float regOpeningStock) {
		this.regOpeningStock = regOpeningStock;
	}

	public float getSpOpeningStock() {
		return spOpeningStock;
	}

	public void setSpOpeningStock(float spOpeningStock) {
		this.spOpeningStock = spOpeningStock;
	}

	public float getRegTotalPurchase() {
		return regTotalPurchase;
	}

	public void setRegTotalPurchase(float regTotalPurchase) {
		this.regTotalPurchase = regTotalPurchase;
	}

	public float getSpTotalPurchase() {
		return spTotalPurchase;
	}

	public void setSpTotalPurchase(float spTotalPurchase) {
		this.spTotalPurchase = spTotalPurchase;
	}

	public float getRegTotalGrnGvn() {
		return regTotalGrnGvn;
	}

	public void setRegTotalGrnGvn(float regTotalGrnGvn) {
		this.regTotalGrnGvn = regTotalGrnGvn;
	}

	public float getRegTotalSell() {
		return regTotalSell;
	}

	public void setRegTotalSell(float regTotalSell) {
		this.regTotalSell = regTotalSell;
	}

	public float getSpTotalSell() {
		return spTotalSell;
	}

	public void setSpTotalSell(float spTotalSell) {
		this.spTotalSell = spTotalSell;
	}

	public int getStockHeaderId() {
		return stockHeaderId;
	}

	public void setStockHeaderId(int stockHeaderId) {
		this.stockHeaderId = stockHeaderId;
	}

	public float getCurrentRegStock() {
		return currentRegStock;
	}

	public void setCurrentRegStock(float currentRegStock) {
		this.currentRegStock = currentRegStock;
	}

	public float getCurrentSpStock() {
		return currentSpStock;
	}

	public void setCurrentSpStock(float currentSpStock) {
		this.currentSpStock = currentSpStock;
	}

	public float getReOrderQty() {
		return reOrderQty;
	}

	public void setReOrderQty(float reOrderQty) {
		this.reOrderQty = reOrderQty;
	}

	public int getSubCatId() {
		return subCatId;
	}

	public void setSubCatId(int subCatId) {
		this.subCatId = subCatId;
	}
	
	

	public float getSellCreditNote() {
		return sellCreditNote;
	}

	public void setSellCreditNote(float sellCreditNote) {
		this.sellCreditNote = sellCreditNote;
	}
	
	

	@Override
	public String toString() {
		return "GetCurrentStockDetails [stockDetailId=" + stockDetailId + ", itemId=" + itemId + ", id=" + id
				+ ", itemName=" + itemName + ", regOpeningStock=" + regOpeningStock + ", spOpeningStock="
				+ spOpeningStock + ", regTotalPurchase=" + regTotalPurchase + ", spTotalPurchase=" + spTotalPurchase
				+ ", regTotalGrnGvn=" + regTotalGrnGvn + ", regTotalSell=" + regTotalSell + ", spTotalSell="
				+ spTotalSell + ", stockHeaderId=" + stockHeaderId + ", currentRegStock=" + currentRegStock
				+ ", currentSpStock=" + currentSpStock + ", reOrderQty=" + reOrderQty + ", subCatId=" + subCatId
				+ ", sellCreditNote=" + sellCreditNote + "]";
	}
    
	

}
