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

<link rel="stylesheet" href="resources/css/login.css" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 
  <script type="text/javascript" src="script/registration_validator.js"></script>



</head>
<body>

        <div class = "container">
            <h1>Sign In as User</h1>
            <form:form action="login.htm" commandName="buyer" method="post">
            <div class = "login">
                    
                <div class = "content"> 

                   <h3>Sign In!</h3>
                    <br>
                    <br>
                   
                    
                    User name:
                    <br>
                    
                    <form:input path="user.userName"  />
                    <form:errors path="user.userName"/>
                    <br>
					<br>
                    Password:
                    <br>

                    <form:password path="user.password"  />
                    <form:errors path="user.password"/>
                
					<br>
                    <input type="submit" value="Login" />
                </div>
               
           
            </div>
            
           
        </form:form>
            </div>
	
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

  
</body>
</html>