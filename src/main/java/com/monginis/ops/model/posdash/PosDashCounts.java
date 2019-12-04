package com.monginis.ops.model.posdash;
 
public class PosDashCounts {
	 
	private String saleAmt;
	
	private String purchaseAmt;
	
	private String discountAmt;

	private String creditAmt;
	
	private String expenseAmt;
	
	private String advanceAmt;
	
	private String profitAmt;
	
	private String cashAmt;
	
	private String cardAmt;
	
	private String epayAmt;
	
	private String noOfBillGenerated;

 

	public String getSaleAmt() {
		return saleAmt;
	}

	public void setSaleAmt(String saleAmt) {
		this.saleAmt = saleAmt;
	}

	public String getPurchaseAmt() {
		return purchaseAmt;
	}

	public void setPurchaseAmt(String purchaseAmt) {
		this.purchaseAmt = purchaseAmt;
	}

	public String getDiscountAmt() {
		return discountAmt;
	}

	public void setDiscountAmt(String discountAmt) {
		this.discountAmt = discountAmt;
	}

	public String getCreditAmt() {
		return creditAmt;
	}

	public void setCreditAmt(String creditAmt) {
		this.creditAmt = creditAmt;
	}

	public String getExpenseAmt() {
		return expenseAmt;
	}

	public void setExpenseAmt(String expenseAmt) {
		this.expenseAmt = expenseAmt;
	}

	public String getAdvanceAmt() {
		return advanceAmt;
	}

	public void setAdvanceAmt(String advanceAmt) {
		this.advanceAmt = advanceAmt;
	}

	public String getProfitAmt() {
		return profitAmt;
	}

	public void setProfitAmt(String profitAmt) {
		this.profitAmt = profitAmt;
	}

	public String getCashAmt() {
		return cashAmt;
	}

	public void setCashAmt(String cashAmt) {
		this.cashAmt = cashAmt;
	}

	public String getCardAmt() {
		return cardAmt;
	}

	public void setCardAmt(String cardAmt) {
		this.cardAmt = cardAmt;
	}

	public String getEpayAmt() {
		return epayAmt;
	}

	public void setEpayAmt(String epayAmt) {
		this.epayAmt = epayAmt;
	}

	public String getNoOfBillGenerated() {
		return noOfBillGenerated;
	}

	public void setNoOfBillGenerated(String noOfBillGenerated) {
		this.noOfBillGenerated = noOfBillGenerated;
	}

	@Override
	public String toString() {
		return "PosDashCounts [saleAmt=" + saleAmt + ", purchaseAmt=" + purchaseAmt + ", discountAmt=" + discountAmt
				+ ", creditAmt=" + creditAmt + ", expenseAmt=" + expenseAmt + ", advanceAmt=" + advanceAmt
				+ ", profitAmt=" + profitAmt + ", cashAmt=" + cashAmt + ", cardAmt=" + cardAmt + ", epayAmt=" + epayAmt
				+ ", noOfBillGenerated=" + noOfBillGenerated + "]";
	}

	 

}
