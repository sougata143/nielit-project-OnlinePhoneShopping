
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="java.sql.*,com.phonekart.dao.userDao,com.phonekart.bean.userInfo" %>
<%

String id = request.getParameter("id");
userInfo u = userDao.getRecordById(Integer.parseInt(id));



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
        <h2 class="page-header text-center">Update User</h2>
               
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
                    <h2 class="page-header text-center">Update User Information</h2>
                    
                        <form action="update-user.jsp" method="post">
                    	
                            <input type="hidden" name="id" value="<%=u.getUid() %>">
                            
                        <div class="form-group">
                            <label>User Email</label>
                            <input type="text" name="email" value="<%=u.getEmail() %>" class="form-control">
                        </div>
                            
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="uname" value="<%=u.getUname() %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Mobile</label>
                            <input type="text" name="mobile" value="<%=u.getMobile() %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>City</label>
                            <input type="text" name="city" value="<%=u.getCity() %>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Zip</label>
                            <input type="text" name="zip" value="<%=u.getZip() %>" class="form-control">
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

