
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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">
       
    </head>
    <body>
        <h1 class="text-center jumbotron"><img src="../images/logo.png"></h1>
        <h1 class="page-header text-center">Admin Home</h1>
               
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
                    <ul class="list-group">
                        <li class="list-group-item text-center"><a href="../admin/view-user.jsp"><h4>View Users</h4></a></li>
                        <li class="list-group-item text-center"><a href="../admin/view_order.jsp"><h4>View Orders</h4></a></li>
                        <li class="list-group-item text-center"><a href="../admin/add_product.jsp"><h4>Add Products To Inventory</h4></a></li>
                        <li class="list-group-item text-center"><a href="../admin/view_product.jsp"><h4>View Products</h4></a></li>
                        <li class="list-group-item text-center"><a href="../admin/manage_products.jsp"><h4>Manage Products</h4></a></li>
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
