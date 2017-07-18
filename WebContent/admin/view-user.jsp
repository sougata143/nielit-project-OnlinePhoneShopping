
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
if(session.getAttribute("id") == "" || session.getAttribute("id") == null) {
	session.setAttribute("flash_msg", "Please Signin to view content!");
	response.sendRedirect("index.jsp");
} 
%>
<%@page import="com.phonekart.dao.userDao,com.phonekart.bean.userInfo,java.util.*,java.sql.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

List<userInfo> list = userDao.getAllRecords();
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
            function searchUser(){  
                var name=document.sform.name.value;  
                var url="search-user.jsp?val="+name;  
  
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
        <h1 class="text-center"><img src="../images/logo.png"></h1>
        <h2 class="page-header text-center">View User</h2>
               
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
                        
                        
                    </div>
        
                </div>                
                <div class="col-lg-10">
                    <h2 class="page-header text-center">Users</h2>
                    <div class="col-lg-10">
                            <form name="sform">
                                <input type="text" id="name" value="Search User by Name" name="name">
                                <input type="button" class="btn btn-toolbar" value="&#x1f50e" onclick="searchUser()">
                                </form>
                            <span id="search"></span>
                        </div>
                        <table class="table table-hover table-bordered">
                        <tr>
                            <th>User ID</th>
                            <th>User Email</th>
                            <th>User Name</th>
                            <th>Mobile</th>
                            <th>User City</th>
                            <th>Zip</th>
                            <th>Manage</th>
                        </tr>
                        <c:forEach items="${list}" var="u">
                            <tr>
                            <td>${u.getUid()}</td>
                            <td>${u.getEmail()}</td>
                            <td>${u.getUname()}</td>
                            <td>${u.getMobile()}</td>
                            <td>${u.getCity()}</td>
                            <td>${u.getZip()}</td>
                            <td>
                            	<a class="btn btn-success btn-sm" href="update_user.jsp?id=${u.getUid()}">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm_delete()" href="delete-user.jsp?id=${u.getUid()}">delete</a>
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
