
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*" %>
<%

String brand = request.getParameter("brand");

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/shopping";
String sql = "SELECT * FROM products where brand=?";

int flag= 0;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "student");

pst = con.prepareStatement(sql);
pst.setString(1, brand);
rs = pst.executeQuery();



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
        <h1 class="page-header text-center">Products</h1>
               
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
                <div class="col-lg-2">
                    <h2 class="page-header text-center">Dashboard</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="logout.jsp">Logout</a></li>
                    </ul>
                </div>
                <div class="col-lg-10">
                    
                    
                        <form action="buy.jsp" method="post">
                        <table class="table table-hover table-bordered">
                        <tr>
                            <th>Image</th>
                            <th>Model Name</th>
                            <th>Brand</th>
                            <th>Display</th>
                            <th>CPU</th>
                            <th>Memory</th>
                            <th>Camera</th>
                            <th>Price</th>
                            <th>Buy</th>
                        </tr>
                        <% while(rs.next()) { %>
                        <tr>
                            <td><img src="<%=rs.getString("image")%>" style="width: 304px; height: 240px;"></td>
                            <td><%=rs.getString("product_name") %></td>
                            <td><%=rs.getString("brand") %></td>
                            <td><%=rs.getString("display") %></td>
                            <td><%=rs.getString("cpu") %></td>
                            <td><%=rs.getString("memory") %></td>
                            <td><%=rs.getString("Camera") %></td>
                            <td><%=rs.getString("price") %></td>
                            <td><button name="product" value="<%=rs.getString("product_name") %>" type="submit"><img src="images/buy.png" style="width: 100px; height: 80px;"></button></td>
                        </tr>
                        <% } %>
                    </table>
                    	
                        <% rs.next();%>
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
