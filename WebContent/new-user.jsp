
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
                var name = document.getElementById("name").value;
                var password = document.getElementById("password").value;
                var mobile = document.getElementById("mobile").value;
                
                if(password.length<6){
                alert("Password must be at least 6 characters long");
                return false;
            }else if(name==null || name=""){
                alert("name can't be blank");
                return false;
            }else if(isNaN(mobile)){
                document.getElementById("numloc").innerHTML="Enter Numeric Value Only";
            }
            
            }    
        </script>
    
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="images/logo.png"></h1>
               
        <nav class="navbar" style="background-color: #633974;">
            <div class="container">
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">Home</a>
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
                        
                        <li class="list-group-item text-center"><a href="login-form.jsp">LOGIN</a></li>
                        
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Register Here</h2>
                    
                        <form action="signup.jsp" method="post">
                            <div class="form-group">
                            <label>Email</label>
                            <input id="email" type="text" name="email" class="form-control">
                        </div>
                            <div class="form-group">
                            <label>Password</label>
                            <input id="password" type="password" name="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input id="name" type="text" name="uname" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Mobile</label>
                            <input id="mobile" type="text" name="mobile" class="form-control">
                        </div>
                        
                    	<div class="form-group">
                            <label>Select Location</label>
                            <select id="city" name="city" class="form-control">
                               <option value="">--select city--</option>
                               <option value="kolkata">KOLKATA</option>
                               <option value="delhi">DELHI</option>
                               <option value="mumbai">MUMBAI</option>
                               <option value="chennai">CHENNAI</option>
                               <option value="dhaka">PUNE</option>
                               <option value="port blair">PORT BLAIR</option>
                               
                            </select>
                        </div>
                         <div class="form-group">
                            <label>Zip</label>
                            <input id="zip" type="text" name="zip" class="form-control">
                        </div>
                           
                            
                        
                        <input onsubmit="authenticate()" type="submit" class="btn btn-primary" value="Submit">   
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
