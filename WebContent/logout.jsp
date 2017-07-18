
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

session.removeAttribute("uid");
session.removeAttribute("uname");
session.removeAttribute("email");

response.sendRedirect("index.jsp");

%>