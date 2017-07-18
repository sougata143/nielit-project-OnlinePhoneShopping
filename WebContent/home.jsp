
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
}
%>

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
        <h1 class="page-header text-center">User Home</h1>
               
        <nav class="navbar" style="background-color: #633974;">
            <div class="container">
                <div class="navbar-header">
                    <a href="home.jsp" class="navbar-brand">Home</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="about.jsp">About Us</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="view-cart.jsp">Cart</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li class="active"><p style="font-weight: bold; color:#fff;" class="navbar-text">
                                Hello, <%=session.getAttribute("uname")%></p></li>
                	
                </ul>
            </div>
</nav>

        <div class="container">
            <div class="row">
                
                
                <div class="col-lg-4">
                    <h2 class="page-header text-center">Dashboard</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Brands</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center">
                            <form action="product.jsp" method="post">
                            <button name="brand" value="htc" type="submit"><img class="img-thumbnail" src="logo/htc.png" width="200px"></button>
                            <button name="brand" value="huawei" type="submit"><img class="img-thumbnail" src="logo/huawei.jpe" width="200px"></button>
                            <button name="brand" value="lenovo" type="submit"><img src="logo/lenovo.jpg" width="200px"></button>
                            <button name="brand" value="moto" type="submit"><img src="logo/motorola.jpg" width="200px"></button>
                            <button name="brand" value="oneplus" type="submit"><img src="logo/oneplus.png" width="200px"></button>
                            <button name="brand" value="oppo" type="submit"><img src="logo/oppo.jpg" width="200px"></button>
                            <button name="brand" value="samsung" type="submit"><img src="logo/samsung.jpeg" width="200px"></button>
                            <button name="brand" value="sony" type="submit"><img src="logo/sony.jpg" width="200px"></button>
                            <button name="brand" value="vivo" type="submit"><img src="logo/vivo.jpg" width="200px"></button>
                            <button name="brand" value="xiaomi" type="submit"><img src="logo/Xiaomi.svg.png" width="200px"></button>
                            </form>
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
