
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
    String query = "select * from user where (uname like '"+name+"%')";
    PreparedStatement ps=con.prepareStatement(query);  
    ResultSet rs=ps.executeQuery();  
  
    if(!rs.isBeforeFirst()) {%>      
        <p>No Record Found!</p>
    <%}else{%>  
            <table class="table table-hover table-bordered">
                        
                        <tr>
                            <th>User ID</th>
                            <th>User Email</th>
                            <th>User Name</th>
                            <th>Mobile</th>
                            <th>User City</th>
                            <th>ZIP</th>
                            
                        </tr>
                        <% while(rs.next()) { %>
                        <tr>
                            <td><%=rs.getString("uid") %></td>
                            <td><%=rs.getString("email") %></td>
                            <td><%=rs.getString("uname") %></td>
                            <td><%=rs.getString("mobile") %></td>
                            <td><%=rs.getString("city") %></td>
                            <td><%=rs.getString("zip") %></td>
                            <td>
                            	<a class="btn btn-success btn-sm" href="update_user.jsp?id=<%=rs.getInt("uid")%>">Update</a>
                                <a class="btn btn-danger btn-sm" onclick="return confirm_delete()" href="delete_user.jsp?id=<%=rs.getInt("uid")%>">delete</a>
                                
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
