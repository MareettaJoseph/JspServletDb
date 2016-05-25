<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script>
	function hideCountry(thisId) {
		var hideId = thisId == "India_states" ? "America_states" : "India_states";
		var divitem = document.getElementById(hideId);
		divitem.style.display = 'none';
	}
	
	function togglediv(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
	}
</script>
</head>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.symantec.jspservletdb.model.Country"%>
<%@ page import="com.symantec.jspservletdb.model.State"%>
<%@ page import="com.symantec.jspservletdb.model.City"%>

<body>
	<%
		Object obj = request.getAttribute("countries");
		List<Country> countries = (List<Country>) obj;
		Object obj1 = request.getAttribute("Indiastates");
		 List<State> Istates = (List<State>) obj1;
		
		Object obj2 = request.getAttribute("UsStates");
		List<State> Ustates = (List<State>) obj2;
		
		Object obj3 = request.getAttribute("IndiaTncities");
		List<City> Tncities = (List<City>) obj3;
		Object obj4 = request.getAttribute("IndiaKrlcities");
		List<City> Krlcities = (List<City>) obj4;
		Object obj5 = request.getAttribute("Us1cities");
		List<City> U1cities = (List<City>) obj5;
		Object obj6 = request.getAttribute("Us2cities");
		List<City> U2cities = (List<City>) obj6;
		 
	%>
	<table id="mytable" align="center" width="100%" class="zui-table">
		<thead>
			<tr>
				<th colspan="2">Country</th>
			</tr>
		<tbody>
		<tr>
	      <%
	        for (int i = 0; i < countries.size(); i++) {
		      Country country = countries.get(i);
          %>
	      <td onclick="togglediv('<%=country.getCountry_name()%>_states');hideCountry('<%=country.getCountry_name()%>_states')" style="cursor: pointer; color: red;"><%=country.getCountry_name()%></td>
	      <%
	        }
	      %>
	     </tr>
	  </tbody>
	  <thead>
	</table>
	
	<div id="India_states" style="display:none;">
	  <table id="xyz" align="center" width="75%" class="zui-table">
	  <thead>
			<tr><br>
				<th colspan="1">India</th>
			</tr>
	  
		<tbody>
		   <%
		     for (int i = 0; i < Istates.size(); i++) {
			   State indiState = Istates.get(i);
		   %>
		   <tr class="parent">
		     <td onclick="togglediv('<%=indiState.getState_name()%>_cities')" style="cursor: pointer; color: green;"><%= indiState.getState_name()%>
		       <table align="center" width="75%" class="zui-table">
			    <tbody>
				   <% 
				     if(indiState.getState_name().equalsIgnoreCase("Tamil Nadu")) {
				   %>
				   <tr id="Tamil Nadu_cities" class="child" style="display:none;">
				  
				       
				       <%
				         for(int j=0;j<Tncities.size();j++) {
				           City iCity= Tncities.get(j);
				        %>
				     <td > <%= iCity.getCity_name() %></td>
						<%   
				          }
			            %>
			            
			         </tr>
				   <%   
				     } else if(indiState.getState_name().equalsIgnoreCase("Kerala")) {
			       %>
				   
				   <tr id="Kerala_cities" class="child" style="display:none;">
				       <%
				         for(int j=0;j<Krlcities.size();j++) {
				           City iCity= Krlcities.get(j);
				        %>
						  <td><%= iCity.getCity_name() %></td>
						<%   
				          }
			            %>
				   </tr>
				   <%} %>
				 </tbody>
		       </table>	
		       </td>
		     </tr>	 
		   <%
		     }
		   %>
	   </tbody>
	  </table>
	</div>
	<div id="America_states" style="display:none;">
	  <table id="xyz" align="center" width="75%" class="zui-table">
	  <tr><br>
				<th colspan="1">America</th>
			</tr>
		<tbody>
		   <%
		     for (int i = 0; i < Ustates.size(); i++) {
			   State ustate = Ustates.get(i);
		   %>
		   <tr class="parent">
		     <td onclick="togglediv('<%=ustate.getState_name()%>_cities')"  style="cursor: pointer; color: green;"><%=ustate.getState_name()%>
		       <table align="center" width="75%" class="zui-table">
			    <tbody>
				   <% 
				     if(ustate.getState_name().equalsIgnoreCase("Washington")) {
				   %>
				   <tr id="Washington_cities" class="child" style="display:none;">
				       <%
				         for(int j=0;j<U1cities.size();j++) {
				           City U1city= U1cities.get(j);
				        %>
				        <td><%= U1city.getCity_name() %></td>
						<%   
				          }
			            %>
				   </tr>
				   <%   
				     } else if(ustate.getState_name().equalsIgnoreCase("New Jersy")) {
			       %>
				   
				   <tr id="New Jersy_cities" class="child" style="display:none;">
				       <%
				         for(int j=0;j<U2cities.size();j++) {
				           City U2city= U2cities.get(j);
				        %>
				        <td><%= U2city.getCity_name() %></td>
						<%   
				          }
			            %>
				   </tr>
				   <%} %>
				  </tbody>
		       </table>	
		       </td>
		     </tr>	
		   <%
		     }
		   %>
		   </tbody>
	  </table>
	</div>  
  </body>
</html>