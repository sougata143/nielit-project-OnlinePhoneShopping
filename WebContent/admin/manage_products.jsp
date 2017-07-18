
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="com.phonekart.dao.inventoryDao,com.phonekart.bean.inventoryInfo,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

List<inventoryInfo> list = inventoryDao.getAllRecords();
request.setAttribute("list", list);

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Phonekart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
       <script>
            function confirm_delete() {
                return confirm("Are you sure want to delete?");
            }
        </script>
        
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="../images/logo.png"></h1>
        <h2 class="page-header text-center">Manage Inventory</h2>
               
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
                    
                        <table class="table table-hover table-bordered">
                        <tr>
                            <th>product ID</th>
                            <th>product Name</th>
                            <th>Quantity</th>
                            <th>Brand</th>
                            <th>Price</th>
                            
                        </tr>
                        <c:forEach items="${list}" var="u">
                            <tr>
                            <td>${u.getIid()}</td>
                            <td>${u.getProduct_name()}</td>
                            <td>${u.getQnty()}</td>
                            <td>${u.getBrand()}</td>
                            <td>${u.getPrice()}</td>
                            <td>
                            	<a class="btn btn-success btn-sm" href="update.jsp?id=${u.getIid()}">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm_delete()" href="delete_inventory.jsp?id=${u.getIid()}">delete</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>

                    
                </div>                
            </div>
        </div>
        
        
        <div style="height: 30px;"></div>
        <div class="text-center footer" style="">
            &copy;  2016 Sougata Roy
        </div>
    </body>
</html>
