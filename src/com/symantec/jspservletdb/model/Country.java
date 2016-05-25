package com.symantec.jspservletdb.model;

public class Country {
	private String Country_code;
	private String country_name;
	public String getCountry_code() {
		return Country_code;
	}
	public void setCountry_code(String country_code) {
		Country_code = country_code;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	@Override
	public String toString() {
		return "City [Country_code=" + Country_code + ", country_name="
				+ country_name + "]";
	}
}
