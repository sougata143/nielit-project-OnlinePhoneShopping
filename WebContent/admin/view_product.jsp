
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*,com.phonekart.dao.productDao,com.phonekart.bean.productInfo,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

List<productInfo> list = productDao.getAllRecords();
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
            var request=new XMLHttpRequest();  
            function searchProduct(){  
                var name=document.sform.name.value;  
                var url="search-product.jsp?val="+name;  
  
                    try{  
                        request.onreadystatechange=function(){  
                        if(request.readyState==4){  
                            var val=request.responseText;  
                            document.getElementById('search').innerHTML=val;  
                            }  
                        }//end of function  
            request.open("GET",url,true);  
            request.send();  
            }catch(e){alert("Unable to connect to server");}  
            }  
            function confirm_delete() {
                return confirm("Are you sure want to delete?");
            }
        </script>
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="../images/logo.png"></h1>
        <h2 class="page-header text-center">View Products</h2>
               
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
                
                
                <div class="col-lg-2">
                    <h2 class="page-header text-center">Dashboard</h2>
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="../logout.jsp">Logout</a></li>
                    </ul>
                    <div class="row">
                        
                        <div class="col-lg-10">
                            <form name="sform">
                                <input type="text" id="name" value="Search Product by Name" name="name">
                                <input type="button" class="btn btn-toolbar" value="&#x1f50e" onclick="searchProduct()">
                                </form>
                            <span id="search"></span>
                        </div>
                    </div>
                </div>                
                <div class="col-lg-10">
                    <h2 class="page-header text-center">Products</h2>
                    
                        <table class="table table-hover table-bordered">
                        <tr>
                            <th>product Id</th>
                            <th>product Image</th>
                            <th>product Name</th>
                            <th>Brand</th>
                            <th>Price</th>
                            
                        </tr>
                        <c:forEach items="${list}" var="u">
                            <tr>
                            
                            <td>${u.getProduct_id()}</td>
                            <td><img src="${u.getImage()}" width="200px"></td>
                            <td>${u.getProduct_name()}</td>
                            <td>${u.getBrand()}</td>
                            <td>${u.getPrice()}</td>
                            <td>
                            	<a class="btn btn-success btn-sm" href="update_user.jsp?id=${u.getProduct_id()}">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm_delete()" href="delete-user.jsp?id=${u.getProduct_id()}">delete</a>
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
