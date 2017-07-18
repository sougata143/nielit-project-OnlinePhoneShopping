
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product</title>
    </head>
    <body>
        <%  
    String name=request.getParameter("val");  
    if(name==null||name.trim().equals("")){ %> 
        <p>Please enter name!</p>
    <%}else{  
    try{  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping","root","student");
    String query = "select * from products where (product_name like '"+name+"%')";
    PreparedStatement ps=con.prepareStatement(query);  
    ResultSet rs=ps.executeQuery();  
  
    if(!rs.isBeforeFirst()) {%>      
        <p>No Record Found!</p>
    <%}else{%>  
            <table class="table table-hover table-bordered">
                        
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Brand</th>
                            <th>Price</th>
                            
                        </tr>
                        <% while(rs.next()) { %>
                        <tr>
                            <td><%=rs.getString("product_id") %></td>
                            <td><%=rs.getString("product_name") %></td>
                            <td><%=rs.getString("brand") %></td>
                            <td><%=rs.getString("price") %></td>
                            <td>
                            	<a class="btn btn-success btn-sm" href="update_product.jsp?id=<%=rs.getInt("product_id")%>">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm_delete()" href="delete_product.jsp?id=<%=rs.getInt("product_id")%>">delete</a>
                                
                           	</td>
                        </tr>
                        <% } %>
                    </table>
        <%}//end of else for rs.isBeforeFirst  
        con.close();  
    }catch(Exception e){out.print(e);}  
    }//end of else  
%>  
    </body>
</html>
