
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Phonekart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
       
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
                        <li class="list-group-item text-center"><a href="new-user.jsp">CREATE NEW ACCOUNT</a></li>
                        <li class="list-group-item text-center"><a href="login-form.jsp">LOGIN</a></li>
                        
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Brands</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center">
                            <button><img class="img-thumbnail" src="logo/htc.png" width="200px"></button>
                            <button><img class="img-thumbnail" src="logo/huawei.jpe" width="200px"></button>
                            <button><img src="logo/lenovo.jpg" width="200px"></button>
                            <button><img src="logo/motorola.jpg" width="200px"></button>
                            <button><img src="logo/oneplus.png" width="200px"></button>
                            <button><img src="logo/oppo.jpg" width="200px"></button>
                            <button><img src="logo/samsung.jpeg" width="200px"></button>
                            <button><img src="logo/sony.jpg" width="200px"></button>
                            <button><img src="logo/vivo.jpg" width="200px"></button>
                            <button><img src="logo/Xiaomi.svg.png" width="200px"></button>
                            
                        </li>
                    </ul>
                </div>                
            </div>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Sougata Roy
        </div>
    </body>
</html>
