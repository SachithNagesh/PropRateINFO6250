<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>PropRate</title>
</head>

<script type="text/javascript">
    var xmlHttp;
    xmlHttp = GetXmlHttpObject();
    function AddReservation(id,id2){
    	
    	console.log("id2 is" +id2);
    	
    	if (xmlHttp == null) {
            alert("Your browser does not support AJAX");
            return;
        }
    	
    	
    	
    	
    	
      	
    	var query= "action=AddReservation&buyerID="+id+"&propertyID="+id2;
    	
    	xmlHttp.onreadystatechange = function stateChanged() {

            if (xmlHttp.readyState == 4) {
                
                //document.getElementById("row" + id).style.backgroundColor = "#00FF00";
                
                
            }
        };
        xmlHttp.open("POST", "AddReservation.htm", true);
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlHttp.send(query);
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
    
    
<body>




            
             <table border="1" cellpadding="5" cellspacing="5" class="table1 table-condensed" align="center">
            <tr>
            	<td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Property ID</b>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>First Name</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Last Name</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Email ID</b></td>
                <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;"><b>Phone Number</b></td>
               
                
            </tr>
           <c:forEach var="cust" items="${customers}" begin ="0" varStatus="counter">
                <tr id="row${counter.index}">
                	<td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyID${counter.index}" align="center">${cust.getBuyerId()}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="location${counter.index}" align="center">${cust.getUser().getFirstName()}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyType${counter.index}" align="center">${cust.getUser().getLastName()}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="propertyArea${counter.index}" align="center">${cust.getUser().getEmailID()}</td>
                    <td style="text-align:center;font-size: 20px;font-family: 'Exo', sans-serif;" id="description${counter.index}" align="center">${cust.getUser().getPhoneNumber()}</td>
                     
           
   
                 
                  </tr>
            </c:forEach>
        </table>
</body>
</html>