
<%@page contentType="text/html" import="com.phonekart.dao.userDao" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="u" class="com.phonekart.bean.userInfo"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
    String id = request.getParameter("id");
    
    int i = userDao.update(id, u);
    
    response.sendRedirect("view-user.jsp");
    
        %>