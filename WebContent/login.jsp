
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

Connection con = null;
PreparedStatement pst = null;
ResultSet rs = null;

String url = "jdbc:mysql://localhost:3306/shopping";
String sql = "SELECT * FROM user WHERE email=? AND password=?";

String email = request.getParameter("email");
String password = request.getParameter("password");

int flag= 0;

Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(url, "root", "student");

pst = con.prepareStatement(sql);
pst.setString(1, email);
pst.setString(2, password);

rs = pst.executeQuery();

while(rs.next()) {
	flag++;
}

if(flag > 0) {
	rs.beforeFirst();
	rs.next();
	session.setAttribute("id", rs.getString("uid"));
	session.setAttribute("role", rs.getString("user_role"));
	session.setAttribute("uname", rs.getString("uname"));
	session.setAttribute("email", rs.getString("email"));
	if(rs.getInt("user_role")==0)
		request.getRequestDispatcher("home.jsp").forward(request, response);
	else
		response.sendRedirect("admin/admin_home.jsp");
}


%>