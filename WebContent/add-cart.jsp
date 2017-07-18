
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" import="com.phonekart.dao.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="c" class="com.phonekart.bean.cartInfo"></jsp:useBean>
<jsp:setProperty property="*" name="c" />

<%
    
    String product = request.getParameter("pname");
    String number = request.getParameter("number");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String location = request.getParameter("location");
    
    Connection con = userDao.getConnection();
    String url = "insert into orders(name,email,product,address) values('"+name+"','"+email+"','"+product+"','"+address+"')";
    String url1 = "insert into cart(product,email,name,address,number,location) values('"+product+"','"+email+"','"+name+"','"+address+"','"+number+"','"+location+"');";
    
    PreparedStatement ps = con.prepareStatement(url1);
    ps.executeUpdate();
    
    PreparedStatement ps1 = con.prepareStatement(url);
    ps1.executeUpdate();
    
    con.close();
    ps.close();
    ps1.close();
    
    response.sendRedirect("view-cart.jsp");
    
        %>