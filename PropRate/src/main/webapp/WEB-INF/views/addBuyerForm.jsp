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

<link rel="stylesheet" href="resources/css/addbuyer.css" type="text/css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
 
  <script type="text/javascript" src="script/registration_validator.js"></script>

  <script type="text/javascript" src="script/registration_validator.js"></script>



  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>


  <script>
  
  function myFunction() {

	    var name = document.getElementById("name").innerText;
	    var firstName = document.getElementById("firstName").innerText;
	    var lastName = document.getElementById("lastName").innerText;
	    var emailId = document.getElementById("emailId").innerText;
	    var phoneNumber = document.getElementById("phoneNumber").innerText;
	    
	    if (name == "" || firstName == "" || lastName == "" || emailId == "" || phoneNumber == "" )
	    {
	        alert("Enter left out fields");
	        if (name == "") {
	            document.getElementById("name").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("name").style.backgroundColor = 'white';
	        }
	        
	       if (firstName == "") {
	            document.getElementById("firstName").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("firstName").style.backgroundColor = 'white';
	        }
	        
	        if (lastName == "") {
	            document.getElementById("lastName").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("lastName").style.backgroundColor = 'white';
	        }
	        
	        if (emailId == "") {
	            document.getElementById("emailId").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("emailId").style.backgroundColor = 'white';
	        }
	        
	        if (phoneNumber == "") {
	            document.getElementById("phoneNumber").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("phoneNumber").style.backgroundColor = 'white';
	        }
	       
	    } else {
	        return true;
	    }
	    if (!(/^([a-zA-Z]{2,})$/.test(name)) || !(/^([a-zA-Z]{2,})$/.test(firstName)) ||
	    		!(/^([a-zA-Z]{2,})$/.test(lastName)) || !(/\S+@\S+\.\S+/.test(emailId)) ||
	    		!(/^([0-9]){10,}$/.test(phoneNumber))){
	    	
	    	alert("Invalid format of fields");
	        if (!(/^([a-zA-Z]{2,})$/.test(name))) {
	            document.getElementById("name").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("name").style.backgroundColor = 'white';
	        }
	       
	        if (!(/^([a-zA-Z]{2,})$/.test(firstName))) {
	            document.getElementById("firstName").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("firstName").style.backgroundColor = 'white';

	        }
	        
	        if (!(/^([a-zA-Z]{2,})$/.test(lastName))) {
	            document.getElementById("lastName").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("lastName").style.backgroundColor = 'white';
	        }
	        
	        if (!(/\S+@\S+\.\S+/.test(emailId))) {
	            document.getElementById("emailId").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("emailId").style.backgroundColor = 'white';
	        }
	        if (!(/^([0-9]){10,}$/.test(phoneNumber)))
	        {
	            document.getElementById("phoneNumber").style.backgroundColor = 'red';
	        } else {
	            document.getElementById("phoneNumber").style.backgroundColor = 'white';
	        } 
	    }
	    else {
	        return true;
	    }
  }
  </script> 
</head>
<body><div class = "container">
            <h1>Register as User</h1>
            <form:form action="addBuyer.htm" commandName="buyer" method="post">
            <div class = "login">
                    
                <div class = "content"> 

                   <h3>User Registration</h3>
               

                   
                    
                    User name:
                    <br>
                    <form:input path="user.userName"  />
                    <form:errors path="user.userName"/>
                    <br>
                    
                    Password:
                    <br>
                    <form:password path="user.password"  />
                    <form:errors path="user.password"/>
					<br>
					
					First Name:
					<br>
					<form:input path="user.firstName" id="firstName" />
					<form:errors path="user.firstName"/>
					<br>
					
					Last Name:
					<br>
					<form:input path="user.lastName" id="lastName"/>
					<form:errors path="user.lastName"/>
					<br>
					
					
					Email ID:
					<br>
					<form:input path="user.emailID" id="emailId"/>
					<form:errors path="user.emailID"/>
					<br>
					
					Phone Number:
					<br>
					<form:input path="user.phoneNumber" size="30" id="phoneNumber"/>
					<form:errors path="user.phoneNumber"/>
					<br>
                    <input type="submit" value="Register User" />
                </div>
               
           
            </div>
            
           
        </form:form>
            </div>

</body>
</html>