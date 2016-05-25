package com.symantec.jspservletdb.Services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.symantec.jspservletdb.model.City;
import com.symantec.jspservletdb.model.Country;
import com.symantec.jspservletdb.model.ModelDao;
import com.symantec.jspservletdb.model.State;
import com.symantec.jspservletdb.util.Db_Connection;

public class DbServices implements ModelDao {

	Connection con=Db_Connection.getcConnection();	


	@Override
	public List<Country> getCountryList()  {
		// TODO Auto-generated method stub
		List<Country> countries = new ArrayList<Country>();
        try {
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from country");
            while (rs.next()) {
                Country country = new Country();
               // country.setCountry_code(rs.getString("Country_code"));
                country.setCountry_name(rs.getString("country_name"));
                countries.add(country);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
      //  System.out.println("countries are"+countries);


		return countries;
	}


	@Override
	public List<State> getIndiaStateList() {
		// TODO Auto-generated method stub
		List<State> Istates=new ArrayList<State>();
		 try {
	            Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery("select * from State where Country_code='IND'");
	           // ResultSet rs1= statement.executeQuery("select * from State where Country_code='US'");
	            
	            while (rs.next()) {
	                State Istate = new State();
	                Istate.setState_name(rs.getString("state_name"));
	                Istates.add(Istate);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }

			return Istates;
	}
	@Override
	public List<State> getUsStateList() {
		// TODO Auto-generated method stub
		List<State> Ustates=new ArrayList<State>();
		 try {
	            Statement statement = con.createStatement();
	           ResultSet rs= statement.executeQuery("select * from State where Country_code='US'");
	            
	            while (rs.next()) {
	                State Ustate = new State();
	                Ustate.setState_name(rs.getString("state_name"));
	                Ustates.add(Ustate);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
//System.out.println(Ustates);
			return Ustates;
	}


	@Override
	public List<City> getIndiaTnCityList() {
		// TODO Auto-generated method stub
		List<City> IndiaTncities=new ArrayList<City>();
		 try {
	            Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery("select * from city where state_code='TN'");
	            while (rs.next()) {
	                City Indiacity  = new City();
	                Indiacity.setCity_name(rs.getString("city_name"));
	                IndiaTncities.add(Indiacity);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	//	 System.out.println("Citites are"+Indiacities);

			return IndiaTncities;
	}
	@Override
	public List<City> getIndiaKrlCityList() {
		// TODO Auto-generated method stub
		List<City> IndiaKrlcities=new ArrayList<City>();
		 try {
	            Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery("select * from city where state_code='KRL'");
	            while (rs.next()) {
	                City Indiacity  = new City();
	                Indiacity.setCity_name(rs.getString("city_name"));
	                IndiaKrlcities.add(Indiacity);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	//	 System.out.println("Citites are"+Indiacities);

			return IndiaKrlcities;
	}
	@Override
	public List<City> getUS1CityList() {
		// TODO Auto-generated method stub
		List<City> U1cities=new ArrayList<City>();
		 try {
	            Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery("select * from city where state_code='WD'");
	        //    ResultSet rs1 = statement.executeQuery("select * from city where state_code='NJ'");
	            while (rs.next()) {
	                City Ucity  = new City();
	                Ucity.setCity_name(rs.getString("city_name"));
	                U1cities.add(Ucity);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		// System.out.println("Citites are"+Ucities);

			return U1cities;
	}
	public List<City> getUS2CityList() {
		// TODO Auto-generated method stub
		List<City> U2cities=new ArrayList<City>();
		 try {
	            Statement statement = con.createStatement();
	            ResultSet rs = statement.executeQuery("select * from city where state_code='NJ'");
	        //    ResultSet rs1 = statement.executeQuery("select * from city where state_code='NJ'");
	            while (rs.next()) {
	                City Ucity  = new City();
	                Ucity.setCity_name(rs.getString("city_name"));
	                U2cities.add(Ucity);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
		// System.out.println("Citites are"+Ucities);

			return U2cities;
	}


public static void main(String[] args) {
	DbServices services=new DbServices();
	services.getUS2CityList();
}



}


