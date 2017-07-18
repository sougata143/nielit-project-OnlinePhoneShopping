
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
String sql = "SELECT * FROM products where product_id=?";

String id = request.getParameter("id");

int flag= 0;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "student");

pst = con.prepareStatement(sql);
pst.setString(1, id);
rs = pst.executeQuery();
rs.next();

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
        <h2 class="page-header text-center">Update Product</h2>
               
        <jsp:include page="adminNav.jsp"></jsp:include>
        <div class="container">
            <div class="row">
                
                
                <div class="col-lg-4">
                    <h2 class="page-header text-center">Dashboard</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="../logout.jsp">Logout</a></li>
                    </ul>
                </div>                
                <div class="col-lg-8">
                    <h2 class="page-header text-center">Update Product</h2>
                    
                        <form action="update-product.jsp" method="post">
                    	
                            <input type="hidden" name="id" value="<%=rs.getString("product_id") %>">
                            
                        <div class="form-group">
                            <label>Product Name</label>
                            <input type="text" name="pname" value="<%=rs.getString("product_name") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text" name="brand" value="<%=rs.getString("brand") %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input type="text" name="price" value="<%=rs.getString("price") %>" class="form-control">
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
