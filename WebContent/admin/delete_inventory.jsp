
<%@page contentType="text/html" import="com.phonekart.dao.inventoryDao" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="i" class="com.phonekart.bean.inventoryInfo"></jsp:useBean>
<jsp:setProperty property="*" name="i" />
<%
    String id = request.getParameter("id");
    inventoryDao.delete(id);
    
    response.sendRedirect("manage_products.jsp");
    
        %>