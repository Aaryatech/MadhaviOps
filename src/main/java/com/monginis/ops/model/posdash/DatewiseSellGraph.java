package com.monginis.ops.model.posdash;

 
 

 public class DatewiseSellGraph {
	
     private String uid;
	
	private String sellDate;
	
	
	private String  sellAmount;


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getSellDate() {
		return sellDate;
	}


	public void setSellDate(String sellDate) {
		this.sellDate = sellDate;
	}


	public String getSellAmount() {
		return sellAmount;
	}


	public void setSellAmount(String sellAmount) {
		this.sellAmount = sellAmount;
	}


	@Override
	public String toString() {
		return "DatewiseSellGraph [uid=" + uid + ", sellDate=" + sellDate + ", sellAmount=" + sellAmount + "]";
	}
	
	
	

}
