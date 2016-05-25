package com.symantec.jspservletdb.model;

import java.util.List;
import com.symantec.jspservletdb.model.City;
import com.symantec.jspservletdb.model.Country;
import com.symantec.jspservletdb.model.State;


public interface ModelDao {
	
	public List<Country> getCountryList();
	public List<State> getIndiaStateList();
	public List<State> getUsStateList();
	public List<City> getUS1CityList();
	public List<City> getUS2CityList();
	
	public List<City> getIndiaKrlCityList();
	public List<City> getIndiaTnCityList();
}

