
<%@page contentType="text/html" import="com.phonekart.dao.productDao" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="p" class="com.phonekart.bean.productInfo"></jsp:useBean>
<jsp:setProperty property="*" name="p" />
<%
    String id = request.getParameter("id");
    productDao.delete(id);
    
    response.sendRedirect("view_product.jsp");
    
        %>