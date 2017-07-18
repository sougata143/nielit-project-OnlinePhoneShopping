 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*" %>
<%

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/shopping";
String sql = "SELECT * FROM inventory";

int flag= 0;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "student");

pst = con.prepareStatement(sql);
rs = pst.executeQuery();

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Phonekart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
       
        
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="../images/logo.png"></h1>
        <h2 class="page-header text-center">Add Products In Inventory</h2>
               
        <nav class="navbar" style="background-color: #633974;">
            <div class="container">
                <div class="navbar-header">
                    <a href="admin_home.jsp" class="navbar-brand">Home</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="../about.jsp">About Us</a></li>
                    <li><a href="../contact.jsp">Contact Us</a></li>
                    <li><a href="../help.jsp">Help</a></li>
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
                        <li class="list-group-item text-center"><a href="../logout.jsp">Logout</a></li>
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Inventory</h2>
                    
                        <form action="add-inventory.jsp" method="post">
                            
                            <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" name="product_name" class="form-control">
                        </div>
                            <div class="form-group">
                            <label>Quantity</label>
                            <input type="text" name="qnty" class="form-control">
                        </div>
                            <div class="form-group">
                            <label>Brand</label>
                            <input type="text" name="brand" class="form-control">
                        </div>
                        
                    	<div class="form-group">
                            <label>Price</label>
                            <input type="text" name="price" class="form-control">
                        </div>
                            
                         <div class="form-group">
                            <input type="submit" value="ADD" class="btn-danger">
                        </div>   
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
