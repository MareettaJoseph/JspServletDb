package com.symantec.jspservletdb.model;

public class City {
	private String state_code;
	private String city_name;
	public String getState_code() {
		return state_code;
	}
	public void setState_code(String state_code) {
		this.state_code = state_code;
	}
	public String getCity_name() {
		return city_name;
	}
	public void setCity_name(String city_name) {
		this.city_name = city_name;
	}
	@Override
	public String toString() {
		return "City [state_code=" + state_code + ", city_name=" + city_name
				+ "]";
	}

}
