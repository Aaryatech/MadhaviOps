package com.monginis.ops.model.frsetting;

 
public class FrSetting {
	
	private int frSettingId;

	private int frId;
	
	private String frCode;

	private int sellBillNo;
	
	private int grnGvnNo;
	
	private int spNo;
	
 	private int count;
 	private String exVarchar;


	public int getSpNo() {
		return spNo;
	}

	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}

	public int getFrSettingId() {
		return frSettingId;
	}

	public void setFrSettingId(int frSettingId) {
		this.frSettingId = frSettingId;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}


	public String getFrCode() {
		return frCode;
	}

	public void setFrCode(String frCode) {
		this.frCode = frCode;
	}

	public int getSellBillNo() {
		return sellBillNo;
	}

	public void setSellBillNo(int sellBillNo) {
		this.sellBillNo = sellBillNo;
	}

	public int getGrnGvnNo() {
		return grnGvnNo;
	}

	public void setGrnGvnNo(int grnGvnNo) {
		this.grnGvnNo = grnGvnNo;
	}
	
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	
	
	public String getExVarchar() {
		return exVarchar;
	}

	public void setExVarchar(String exVarchar) {
		this.exVarchar = exVarchar;
	}
	
	

	@Override
	public String toString() {
		return "FrSetting [frSettingId=" + frSettingId + ", frId=" + frId + ", frCode=" + frCode + ", sellBillNo="
				+ sellBillNo + ", grnGvnNo=" + grnGvnNo + ", spNo=" + spNo + ", count=" + count + ", exVarchar="
				+ exVarchar + "]";
	}

	 


}
