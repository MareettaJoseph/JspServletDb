package com.symantec.jspservletdb.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.symantec.jspservletdb.Services.DbServices;
import com.symantec.jspservletdb.model.City;
import com.symantec.jspservletdb.model.Country;
import com.symantec.jspservletdb.model.State;

/**
 * Servlet implementation class DataController
 */
@WebServlet("/DataController")
public class DataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DbServices services;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DataController() {
        super();
        services=new DbServices();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Country> countries = services.getCountryList();
		List<State> Indiastates=services.getIndiaStateList();
		List<State> UsStates=services.getUsStateList();
		List<City> IndiaTncities=services.getIndiaTnCityList();
		List<City> IndiaKrlcities=services.getIndiaKrlCityList();
		List<City> Us1cities=services.getUS1CityList();
		List<City> Us2cities=services.getUS2CityList();
		request.setAttribute("countries", countries);
		request.setAttribute("Indiastates",Indiastates );
		request.setAttribute("UsStates", UsStates);
	    request.setAttribute("IndiaTncities", IndiaTncities);
	    request.setAttribute("IndiaKrlcities",  IndiaKrlcities);
	    request.setAttribute("Us1cities", Us1cities);
	    request.setAttribute("Us2cities", Us2cities);
		request.getRequestDispatcher("test.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


}
