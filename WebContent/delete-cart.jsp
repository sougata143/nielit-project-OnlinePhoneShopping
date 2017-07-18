
<%@page contentType="text/html" import="com.phonekart.dao.cartDao" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="u" class="com.phonekart.bean.cartInfo"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
    String id = request.getParameter("id");
    cartDao.delete(id);
    
    response.sendRedirect("view-cart.jsp");
    
        %>