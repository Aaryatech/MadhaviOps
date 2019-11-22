package com.monginis.ops.model.newpos;

import java.util.List;

public class CustomerBillOnHold {
	
	private int custId;
	private List<ItemListForCustomerBill> itemList;
	public int getCustId() {
		return custId;
	}
	public void setCustId(int custId) {
		this.custId = custId;
	}
	public List<ItemListForCustomerBill> getItemList() {
		return itemList;
	}
	public void setItemList(List<ItemListForCustomerBill> itemList) {
		this.itemList = itemList;
	}
	@Override
	public String toString() {
		return "CustomerBillOnHold [custId=" + custId + ", itemList=" + itemList + "]";
	}
	
	

}
