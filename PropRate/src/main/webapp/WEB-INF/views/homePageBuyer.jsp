<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>PropRate</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="resources/css/search.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <link href="css/bootstrapex3.css" rel="stylesheet">
  <script type="text/javascript" src="script/registration_validator.js"></script>

 <style>

table.table1.table-condensed {
    border: 0px solid white;
	width: 600px;
	height:250px;
	align: center;
	
}
</style>
  


  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>



</head>

<body>

<div class = "container">
            <h1>PropRate</h1>
            <div class = "login">
                    
                <div class = "content"> 

                   <h3>Search Properties</h3>
				
                    <form:form action="searchProperty.htm" commandName="property" method="POST">
                  	Location:
                    <br>
                    <input type="text" path="location" name="location" />
                    <form:errors path="location"/>
                    <br>
                    <input type="submit" value="Search Restaurants" />
                    
                    </form:form>
                    
                    
                    <form:form action="logout.htm" method="POST" commandName="buyer">
                    
                    <button  type="submit">Logout</button>
					
					</form:form>
				</div>
				</div>
				</div>
				
	
</body>
</html>
