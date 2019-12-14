package com.monginis.ops.model.posdash;

import java.sql.Date;

public class DashAdvanceOrderCounts {

	private String uid;

	private String orderDate;

	private float total;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "DashAdvanceOrderCounts [uid=" + uid + ", orderDate=" + orderDate + ", total=" + total + "]";
	}

}
