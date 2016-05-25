package com.symantec.jspservletdb.model;

public class State {
	private String Country_code;
	private String state_code;
	private String state_name;
	public String getCountry_code() {
		return Country_code;
	}
	public void setCountry_code(String country_code) {
		Country_code = country_code;
	}
	public String getState_code() {
		return state_code;
	}
	public void setState_code(String state_code) {
		this.state_code = state_code;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	@Override
	public String toString() {
		return "State [Country_code=" + Country_code + ", state_code="
				+ state_code + ", state_name=" + state_name + "]";
	}

}
