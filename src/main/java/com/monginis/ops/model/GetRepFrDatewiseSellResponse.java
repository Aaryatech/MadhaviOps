package com.monginis.ops.model;



public class GetRepFrDatewiseSellResponse {

	
private int sellBillNo;
	
 	private String billDate;
	
 	private int frId;
	
 	private String month;
 	private String day;
	private float cash;
	private float card;
	private float other;
	
 	private String frName;

	private float discountAmt;
	private float pendingAmt;
	private float advAmt;
	private float regular;
	private float chalan;
	private float creditNoteTotalAmt;
	private float withdrawalAmt;

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public int getSellBillNo() {
		return sellBillNo;
	}

	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public float getCash() {
		return cash;
	}

	public void setCash(float cash) {
		this.cash = cash;
	}

	public float getCard() {
		return card;
	}

	public void setCard(float card) {
		this.card = card;
	}

	public float getOther() {
		return other;
	}

	public void setOther(float other) {
		this.other = other;
	}

	public String getFrName() {
		return frName;
	}

	public void setFrName(String frName) {
		this.frName = frName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public float getDiscountAmt() {
		return discountAmt;
	}

	public void setDiscountAmt(float discountAmt) {
		this.discountAmt = discountAmt;
	}

	public float getPendingAmt() {
		return pendingAmt;
	}

	public void setPendingAmt(float pendingAmt) {
		this.pendingAmt = pendingAmt;
	}

	public float getAdvAmt() {
		return advAmt;
	}

	public void setAdvAmt(float advAmt) {
		this.advAmt = advAmt;
	}

	public float getRegular() {
		return regular;
	}

	public void setRegular(float regular) {
		this.regular = regular;
	}

	public float getChalan() {
		return chalan;
	}

	public void setChalan(float chalan) {
		this.chalan = chalan;
	}

	public float getCreditNoteTotalAmt() {
		return creditNoteTotalAmt;
	}

	public void setCreditNoteTotalAmt(float creditNoteTotalAmt) {
		this.creditNoteTotalAmt = creditNoteTotalAmt;
	}

	public float getWithdrawalAmt() {
		return withdrawalAmt;
	}

	public void setWithdrawalAmt(float withdrawalAmt) {
		this.withdrawalAmt = withdrawalAmt;
	}

	@Override
	public String toString() {
		return "GetRepFrDatewiseSellResponse [sellBillNo=" + sellBillNo + ", billDate=" + billDate + ", frId=" + frId
				+ ", month=" + month + ", day=" + day + ", cash=" + cash + ", card=" + card + ", other=" + other
				+ ", frName=" + frName + ", discountAmt=" + discountAmt + ", pendingAmt=" + pendingAmt + ", advAmt="
				+ advAmt + ", regular=" + regular + ", chalan=" + chalan + ", creditNoteTotalAmt=" + creditNoteTotalAmt
				+ ", withdrawalAmt=" + withdrawalAmt + "]";
	}

}
