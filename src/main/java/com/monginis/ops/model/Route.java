package com.monginis.ops.model;

public class Route {

	private int routeId;
	private String routeName;
	private int delStatus;

	public int getRouteId() {
		return routeId;
	}

	public void setRouteId(int routeId) {
		this.routeId = routeId;
	}

	public String getRouteName() {
		return routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	@Override
	public String toString() {
		return "Route [routeId=" + routeId + ", routeName=" + routeName + ", delStatus=" + delStatus + "]";
	}

}
