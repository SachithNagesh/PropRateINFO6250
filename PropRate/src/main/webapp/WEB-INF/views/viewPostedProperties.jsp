<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>PropRate</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	    integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<!-- Optional theme -->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <link rel="stylesheet" href="resources/css/style.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="script/registration_validator.js"></script>

 <style>

table.table1.table-condensed {
    border: 1px solid white;
	width: 600px;
	height:250px;
	align: center;
	
}
</style>
  


  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>



</head>
<script type="text/javascript">
    var xmlHttp;
    xmlHttp = GetXmlHttpObject();
    function viewCustomers(id){
    	
    	if (xmlHttp == null) {
            alert("Your browser does not support AJAX");
            return;
        }
    	
    	var propertyID=document.getElementById("propertyID"+id).innerText;
    	document.getElementById("view" + id).disabled = true;
    	
    	var query= "action=viewBuyers&propertyID=" + propertyID;
    	
    	xmlHttp.onreadystatechange = function stateChanged() {

            if (xmlHttp.readyState == 4) {
                
            	document.getElementById("view" + id).disabled = true;
            	// document.getElementById("view" + id).innerText="Viewed";
            	 document.getElementById("results").innerHTML = "";
            	 var json = JSON.parse(xmlHttp.responseText);
            	 
            	 
            	     if (json.buyerList.length != 0) {
            		 
            		 var x = document.createElement("TABLE");
            		 x.setAttribute("id","myTable");
            		 document.getElementById("results").appendChild(x);
            		 
            		 var y = document.createElement("TR");
                     y.setAttribute("id", "myTr");
                     document.getElementById("myTable").appendChild(y);
                     
                     var a = document.createElement("TH");
                     var b = document.createTextNode("Buyer ID");
                     a.appendChild(b);
                     document.getElementById("myTr").appendChild(a);
                     
                     var a = document.createElement("TH");
                     var b = document.createTextNode("First Name");
                     a.appendChild(b);
                     document.getElementById("myTr").appendChild(a);
                     
                     var a = document.createElement("TH");
                     var b = document.createTextNode("Last Name");
                     a.appendChild(b);
                     document.getElementById("myTr").appendChild(a);
                     
                     var a = document.createElement("TH");
                     var b = document.createTextNode("Email ID");
                     a.appendChild(b);
                     document.getElementById("myTr").appendChild(a);
                     
                     var a = document.createElement("TH");
                     var b = document.createTextNode("Phone Number");
                     a.appendChild(b);
                     document.getElementById("myTr").appendChild(a);
                     
                     for (var count = 0; count < json.buyerList.length; count=count+2) {                    	 
                     
                     var y = document.createElement("TR");
                     y.setAttribute("id", "myTr"+count);
                     document.getElementById("myTable").appendChild(y);
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].buyerId);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].firstName);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].lastName);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].emailId);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].phoneNumber);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     
                     
                     var a = document.createElement("TD");
                     var b = document.createTextNode(json.buyerList[count].propId);
                     a.appendChild(b);
                     document.getElementById("myTr"+count).appendChild(a);
                     
                     
            	 }   
                     
            	 }
               
            	 else {
                     document.getElementById("results").innerHTML = "No customers interested in this property";
                 }
               
                
            }
        };
        xmlHttp.open("POST", "viewBuyers.htm", true);
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send(query);
        return false;
    }
    
    
    var xmlHttp1;
    xmlHttp1 = GetXmlHttpObject();
    function applydelte(id){
    	
    	if (xmlHttp1 == null) {
            alert("Your browser does not support AJAX");
            return;
        }
    	
    	
      	
    	var query= "action=delProp&propertyID=" + id;
    	
    	xmlHttp1.onreadystatechange = function stateChanged() {

            if (xmlHttp1.readyState == 4) {
                
                //document.getElementById("row" + id).style.backgroundColor = "#00FF00";
               // document.getElementById("apply" + id).innerText="Liked";
                document.getElementById("applydelte" + id).disabled = true;
                
                
            }
        };
        xmlHttp1.open("POST", "delProp.htm", true);
        xmlHttp1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp1.send(query);
        window.location.reload(true); 
        return false;
    }
    
    function GetXmlHttpObject()
    {
        var xmlHttp = null;
        try
        {

            xmlHttp = new XMLHttpRequest();
        } catch (e)
        {

            try
            {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e)
            {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        return xmlHttp;
    }
    </script>



<body style="background-color: black">
  <div class="body"></div>
		<div class="header">
			<div>PropRate</div>
			<h3 class="h4">Find Property!</h3>
			<br>
			<h3 class="h4">Properties details</h3>
		</div>
		<br>
		<br>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>


<div class="container col-md-12">
<br>
<br>
<br>
<br>
<br>
<br>

<br>
<br>
        <table border="1" cellpadding="5" cellspacing="5" class="table1 table-condensed" align="center">
            <tr>
            	<td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Property ID</b>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Location</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Property Type</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Property Area</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Description</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Price</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>View Customers</b></td>   
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Delete</b></td>             
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Review liked customers</b></td> 
            </tr>
            <c:forEach var="property" items="${properties}" begin ="0" varStatus="counter">
                <tr id="row${counter.index}">
                	<td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyID${counter.index}" align="center">${property.propertyId}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="location${counter.index}" align="center">${property.location}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyType${counter.index}" align="center">${property.propertyType}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyArea${counter.index}" align="center">${property.propertyArea}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="description${counter.index}" align="center">${property.description}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="status${counter.index}" align="center">${property.status}</td>
                     
               
                    <td><button style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" onclick="return viewCustomers(${counter.index})" id="view${counter.index}">View</button>  
       
                    <td><button onclick="return applydelte(${property.propertyId})" id="applydelte${property.propertyId}" align="center">delete</button> 

                 </td>
           

     		  <td><a href="<c:url value='viewCustomers.htm?propId=${property.propertyId}' />" ><button>Review</button></a></td>

                 
                 
                  </tr>
            </c:forEach>
        </table>
        </div>
        <div id="results" class="container col-md-12" align="center" style="font-size: 20px;font-family: 'Exo', sans-serif;">

            </div>
            <div class="container col-md-12" style="margin-left: 650px">
            <br>
            
       
</table>
<form:form action="logoutSeller.htm" method="POST" commandName="seller">

      <button style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;align-content:center" type="submit">Logout</button>

</form:form>
</div>
</body>
</html>