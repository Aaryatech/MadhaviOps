package com.monginis.ops.model;

public class ItemWiseReport {
	
		
		private int itemId;
		
		private int billDetailNo;
		
		private float rate;
		
		private float qty;
		
		private float total;
		private float discAmt;
		
		private String itemName;
		private String grnType;
		public int getItemId() {
			return itemId;
		}

		public void setItemId(int itemId) {
			this.itemId = itemId;
		}

		public int getBillDetailNo() {
			return billDetailNo;
		}

		public void setBillDetailNo(int billDetailNo) {
			this.billDetailNo = billDetailNo;
		}

		public float getRate() {
			return rate;
		}

		public void setRate(float rate) {
			this.rate = rate;
		}

		public float getQty() {
			return qty;
		}

		public void setQty(float qty) {
			this.qty = qty;
		}

		public float getTotal() {
			return total;
		}

		public void setTotal(float total) {
			this.total = total;
		}

		public String getItemName() {
			return itemName;
		}

		public void setItemName(String itemName) {
			this.itemName = itemName;
		}

		public String getGrnType() {
			return grnType;
		}

		public void setGrnType(String grnType) {
			this.grnType = grnType;
		}

		public float getDiscAmt() {
			return discAmt;
		}

		public void setDiscAmt(float discAmt) {
			this.discAmt = discAmt;
		}

		@Override
		public String toString() {
			return "ItemWiseReport [itemId=" + itemId + ", billDetailNo=" + billDetailNo + ", rate=" + rate + ", qty="
					+ qty + ", total=" + total + ", discAmt=" + discAmt + ", itemName=" + itemName + ", grnType="
					+ grnType + "]";
		}

		
}
