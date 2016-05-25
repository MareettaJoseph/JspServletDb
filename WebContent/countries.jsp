<%@page import="com.symantec.jspservletdb.model.State"%>
<%@page import="com.symantec.jspservletdb.model.City"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expand</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="jExpand.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script>
        function togglediv(id) {
        	
            var div = document.getElementById(id);
            
            div.style.display = div.style.display == "none" ? "block" : "none";
            var myStyle = document.getElementById("item").offsetLeft;
            if(myStyle < 0){
            	var divcity = document.getElementById("city");
            	divcity.style.display = 'none'; 
            }
        }
        
        function myFunction() {
        	//alert("hi");
        	var divitem = document.getElementById("item");
        	//var divcity = document.querySelectorAll('tr.child');
        	divitem.style.display = 'none'; 
        	//divcity.style.display = 'none'; 
        	
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
</script>
</head>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.symantec.jspservletdb.model.Country"%>
<body onload="myFunction()">
	<%
       Object obj  = request.getAttribute("countries");
        List<Country> countries = (List<Country>)obj;
        Object obj1 = request.getAttribute("states");
        List<State> states=(List<State>)obj1;
        Object obj2 = request.getAttribute("cities");
        List<City> cities =(List<City>)obj2;
        %>
	<table align="center" width="100%" class="zui-table">
		<thead>
			<tr>
				<th colspan="2">Country</th>
			</tr>
        <%
        for(int i=0;i<countries.size();i++)
        {
            Country country = countries.get(i);
        %>
		
		<tbody>
			<tr>
				<td  style="cursor:pointer; color: red;" onclick="togglediv('item(i)')"><%= country.getCountry_name()%></td>
			</tr>
		</tbody>
		</thead>
		<%   
        }
        %>
		<%for(int i=0;i<states.size();i++)
        {
            State state = states.get(i);
		%>
		
		<div id="item" style="margin-top: 40px">
	<table  align="center" width="75%" class="zui-table">
		<thead>
			<tbody>
				<tr class="parent">
					<td  style="cursor:pointer; color: green;"><%= state.getState_name() %></td></tr>
				
	                <%
	                }
	                %>
	                
	                <%
	                for(int i=0;i<cities.size();i++)
	                {
	                    City city= cities.get(i);

	                %>
	                <tr class="child" style="display: none;"><%= city.getCity_name() %>
	                </tr>
	                </tbody>
	                </thead>
	                </table>
	                
		<%   
	                
            }
        %>
	</table>
</body>
</html>