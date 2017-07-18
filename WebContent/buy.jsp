

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*" %>
<%

String product = request.getParameter("product");

Connection con1 = null;
PreparedStatement pst1 = null;
ResultSet rs1 = null;

String url = "jdbc:mysql://localhost:3306/shopping";

String sql1 = "SELECT * FROM user";

int flag= 0;

Class.forName("com.mysql.jdbc.Driver");

con1 = DriverManager.getConnection(url, "root", "student");

pst1 = con1.prepareStatement(sql1);

rs1 = pst1.executeQuery();

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
        <h1 class="page-header text-center">Buy</h1>
               
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
                    <h2 class="page-header text-center">Enter Your Details</h2>
                    
                        <form action="add-cart.jsp" method="post">
                        <div class="form-group">
                            <label>Product Name</label>
                            
                            <input type="text" name="pname" value="<%=product %>" class="form-control">
                        </div>
                        
                        <div class="form-group">
                            <label>Email</label>
                            <%rs1.next(); %>
                            <input type="text" value="<%=session.getAttribute("email")%>"  name="email" class="form-control">
                        </div>
                        
                    	<div class="form-group">
                            <label>Name</label>
                            
                            <input type="text" value="<%=session.getAttribute("uname")%>" name="name" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <textarea name="address" rows="5"  class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="text" name="number" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Select Delivery Location</label>
                            <select name="location" class="form-control">
                               <option value="">--select city--</option>
                               <option value="kolkata">KOLKATA</option>
                               <option value="delhi">DELHI</option>
                               <option value="mumbai">MUMBAI</option>
                               <option value="chennai">CHENNAI</option>
                               <option value="port blair">PORT BLAIR</option>
                            </select>
                        </div>
                        
                        <input type="submit" class="btn btn-primary" value="Submit">   
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
