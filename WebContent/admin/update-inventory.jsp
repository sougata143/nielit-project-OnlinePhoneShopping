
<%@page contentType="text/html" import="com.phonekart.dao.inventoryDao" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="i" class="com.phonekart.bean.inventoryInfo"></jsp:useBean>
<jsp:setProperty property="*" name="i" />
<%
    String id = request.getParameter("id");
    String product_name = request.getParameter("pname");
    String qnty = request.getParameter("qnty");
    String brand = request.getParameter("brand");
    String price = request.getParameter("price");

    inventoryDao.update(product_name, qnty, brand, price, id);
    
    response.sendRedirect("manage_products.jsp");
    
        %>