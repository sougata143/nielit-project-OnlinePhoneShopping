
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Phonekart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script>
            function authenticate() {

                var email = document.getElementById("email").value;
                var password = document.getElementById("password").value;
                
                if(email==0 || email==null){
                alert("Enter Valid Login Email");
                return false;
            }
            
                if(password==0 || password==null){
                alert("Enter Valid Login Password");
                return false;
            }
            }    
        </script>
    
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="images/logo.png"></h1>
               
        <nav class="navbar" style="background-color: #633974;">
            <div class="container">
                <div class="navbar-header">
                    <a href="home.jsp" class="navbar-brand">Home</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="help.jsp">Help</a></li>
                </ul>
                
            </div>
        </nav>

        <div class="container">
            <div class="row">
                
                
                <div class="col-lg-4">
                    <h2 class="page-header text-center">Dashboard</h2>
                    <ul class="list-group">
                        
                        
                        
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Signin Here</h2>
                    
                        <form action="login.jsp" method="post">
                        
                    	<div class="form-group">
                            <label>Email</label>
                            <input id="email" type="text" name="email" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label>Password</label>
                            <input id="password" type="password" name="password" class="form-control">
                        </div>
                        
                            <input type="submit" onclick="authenticate()" class="btn btn-primary" value="Submit">   
                        <input type="reset" class="btn btn-warning" value="reset">
            
                    </form>
                    
                </div>                
            </div>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Sougata Roy
        </div>
    </body>
</html>
