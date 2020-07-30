package com.monginis.ops.model.cloudkitchen;

import java.util.List;



public class ItemConfigHeader {

	private int itemConfigId;
	private int frId;
	private int configType;
	private String createdDatetime;
	private String lastUpdatedDatetime;
	private int compId;
	private int isActive;
	private int delStatus;
	private int exInt1;
	private int exInt2;
	private int exInt3;
	private int exInt4;
	private String exVar1;
	private String exVar2;
	private String exVar3;
	private String exVar4;
	private float exFloat1;
	private float exFloat2;
	private float exFloat3;
	private float exFloat4;
	List<ItemConfigDetail> itemConfigDetailList;
	
	

	public ItemConfigHeader() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public ItemConfigHeader(int itemConfigId, int frId, int configType, String createdDatetime,
			String lastUpdatedDatetime, int compId, int isActive, int delStatus, int exInt1, int exInt2, int exInt3,
			int exInt4, String exVar1, String exVar2, String exVar3, String exVar4, float exFloat1, float exFloat2,
			float exFloat3, float exFloat4) {
		super();
		this.itemConfigId = itemConfigId;
		this.frId = frId;
		this.configType = configType;
		this.createdDatetime = createdDatetime;
		this.lastUpdatedDatetime = lastUpdatedDatetime;
		this.compId = compId;
		this.isActive = isActive;
		this.delStatus = delStatus;
		this.exInt1 = exInt1;
		this.exInt2 = exInt2;
		this.exInt3 = exInt3;
		this.exInt4 = exInt4;
		this.exVar1 = exVar1;
		this.exVar2 = exVar2;
		this.exVar3 = exVar3;
		this.exVar4 = exVar4;
		this.exFloat1 = exFloat1;
		this.exFloat2 = exFloat2;
		this.exFloat3 = exFloat3;
		this.exFloat4 = exFloat4;
	}



	public int getItemConfigId() {
		return itemConfigId;
	}

	public void setItemConfigId(int itemConfigId) {
		this.itemConfigId = itemConfigId;
	}

	public int getFrId() {
		return frId;
	}

	public void setFrId(int frId) {
		this.frId = frId;
	}

	public int getConfigType() {
		return configType;
	}

	public void setConfigType(int configType) {
		this.configType = configType;
	}

	public String getCreatedDatetime() {
		return createdDatetime;
	}

	public void setCreatedDatetime(String createdDatetime) {
		this.createdDatetime = createdDatetime;
	}

	public String getLastUpdatedDatetime() {
		return lastUpdatedDatetime;
	}

	public void setLastUpdatedDatetime(String lastUpdatedDatetime) {
		this.lastUpdatedDatetime = lastUpdatedDatetime;
	}

	public int getCompId() {
		return compId;
	}

	public void setCompId(int compId) {
		this.compId = compId;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getExInt1() {
		return exInt1;
	}

	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}

	public int getExInt2() {
		return exInt2;
	}

	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}

	public int getExInt3() {
		return exInt3;
	}

	public void setExInt3(int exInt3) {
		this.exInt3 = exInt3;
	}

	public int getExInt4() {
		return exInt4;
	}

	public void setExInt4(int exInt4) {
		this.exInt4 = exInt4;
	}

	public String getExVar1() {
		return exVar1;
	}

	public void setExVar1(String exVar1) {
		this.exVar1 = exVar1;
	}

	public String getExVar2() {
		return exVar2;
	}

	public void setExVar2(String exVar2) {
		this.exVar2 = exVar2;
	}

	public String getExVar3() {
		return exVar3;
	}

	public void setExVar3(String exVar3) {
		this.exVar3 = exVar3;
	}

	public String getExVar4() {
		return exVar4;
	}

	public void setExVar4(String exVar4) {
		this.exVar4 = exVar4;
	}

	public float getExFloat1() {
		return exFloat1;
	}

	public void setExFloat1(float exFloat1) {
		this.exFloat1 = exFloat1;
	}

	public float getExFloat2() {
		return exFloat2;
	}

	public void setExFloat2(float exFloat2) {
		this.exFloat2 = exFloat2;
	}

	public float getExFloat3() {
		return exFloat3;
	}

	public void setExFloat3(float exFloat3) {
		this.exFloat3 = exFloat3;
	}

	public float getExFloat4() {
		return exFloat4;
	}

	public void setExFloat4(float exFloat4) {
		this.exFloat4 = exFloat4;
	}

	public List<ItemConfigDetail> getItemConfigDetailList() {
		return itemConfigDetailList;
	}

	public void setItemConfigDetailList(List<ItemConfigDetail> itemConfigDetailList) {
		this.itemConfigDetailList = itemConfigDetailList;
	}

	@Override
	public String toString() {
		return "ItemConfigHeader [itemConfigId=" + itemConfigId + ", frId=" + frId + ", configType=" + configType
				+ ", createdDatetime=" + createdDatetime + ", lastUpdatedDatetime=" + lastUpdatedDatetime + ", compId="
				+ compId + ", isActive=" + isActive + ", delStatus=" + delStatus + ", exInt1=" + exInt1 + ", exInt2="
				+ exInt2 + ", exInt3=" + exInt3 + ", exInt4=" + exInt4 + ", exVar1=" + exVar1 + ", exVar2=" + exVar2
				+ ", exVar3=" + exVar3 + ", exVar4=" + exVar4 + ", exFloat1=" + exFloat1 + ", exFloat2=" + exFloat2
				+ ", exFloat3=" + exFloat3 + ", exFloat4=" + exFloat4 + ", itemConfigDetailList=" + itemConfigDetailList
				+ "]";
	}

}
