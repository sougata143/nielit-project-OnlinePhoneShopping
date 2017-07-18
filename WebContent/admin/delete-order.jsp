
<%@page contentType="text/html" import="com.phonekart.dao.orderDao" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="u" class="com.phonekart.bean.orderInfo"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
    String id = request.getParameter("id");
    orderDao.delete(id);
    
    response.sendRedirect("view_order.jsp");
    
        %>