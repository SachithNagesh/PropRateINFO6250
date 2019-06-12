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
<  <link rel="stylesheet" href="resources/css/added.css" type="text/css">
  <script type="text/javascript" src="script/registration_validator.js"></script>

 


  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>



</head>


<body>


            <div class = "container">
                    <h1>PropRate </h1><br>
                    <p>Find the best property management company for you!<p>
                    <div class = "login">
                            
                        <div class = "content"> 
        
                           <h3>  New Manager Admin Created Successfully:</h3>
                            <br>
                            ${seller.user.userName}
                            <hr class="hr-1">
                         
                            <h3>Sign In to start managing!</h3>
                            <a href="loginseller.htm"><button>Sign in</button></a>
                        </div>
                       
                   
                    </div>
                    
                   
              
                    </div>


</body>
</html>