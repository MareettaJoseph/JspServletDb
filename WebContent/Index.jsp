<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="https://code.jquery.com/jquery-1.12.0.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script src="jExpand.js" type="text/javascript"></script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>

	function myFunction() {
		//alert("hi");
		var divitem = document.getElementById("item");
		divitem.style.display = 'none';
		var divitem1 = document.getElementById("item1");
		divitem1.style.display='none';
	}
	
	function togglediv(id) {
		var div = document.getElementById(id);
		div.style.display = div.style.display == "none" ? "block" : "none";
	}
	
    $(document).ready(function() {

        function getChildren($row) {
            var children = [];
            while($row.next().hasClass('child')) {
                 children.push($row.next());
                 $row = $row.next();
            }            
            return children;
        }        

        $('.parent').on('click', function() {
       
            var children = getChildren($(this));
            $.each(children, function() {
                $(this).toggle();
            })
        });
        
    });
	 
	   

	$(document).ready(function() {
		$("table#mytable td").click(function(e) {
			var currentCellText = $(this).text();
			alert(currentCellText);
			if (currentCellText == "India")
				{
				$("#item").toggle();
				
				}
			
			else if (currentCellText == "America")
				{
				//divitem.style.display = 'none';
				$("#item1").toggle();
				
			
				}
				
		})
	});

	
</script>
</head>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.symantec.jspservletdb.model.Country"%>
<%@ page import="com.symantec.jspservletdb.model.State"%>
<%@ page import="com.symantec.jspservletdb.model.City"%>

<body onload="myFunction()">
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


				<td style="cursor: pointer; color: red;"><%=country.getCountry_name()%></td>


				<%
					}
				%>
			</tr>
		</tbody>
		</thead>
	</table>
	<div id="item" style="margin-top: 40px">
		<table id="xyz" align="center" width="75%" class="zui-table">
			<tbody>
				<%
					for (int i = 0; i < Istates.size(); i++) {
						State indiState = Istates.get(i);
				%>
				<tr class="parent">
					<td style="cursor: pointer; color: green;"><%= indiState.getState_name()%></td>

				</tr>
					

				<%
	                for(int j=0;j<Tncities.size();j++)
	                {
	                    City iCity= Tncities.get(j);

	                %>
	                <tr class="child" style="display: none;">
					<td><%= iCity.getCity_name() %></td>
				</tr>
				<%   
	                }
			 }
	             
            
        %>
			</tbody>
		</table>
	</div>
	<div id="item1" style="margin-top: 40px">
		<table id="myTable2" align="center" width="75%" class="zui-table">
			<tbody>
				<%
					for (int i = 0; i < Ustates.size(); i++) {
						State ustate = Ustates.get(i);
										%>
				<tr class="parent">
					<td style="cursor: pointer; color: green;"><%=ustate.getState_name()%></td>

				</tr>

				<%
			
	                for(int j=0;j<U1cities.size();j++)
	                {
	                    City uCity= U1cities.get(j);

	                %>

				<tr class="child" style="display: none;">
					<td><%= uCity.getCity_name() %></td>
				</tr>

				<%
	                
	                }
				}
			%>
			</tbody>
		</table>
	</div>
</body>
</html>