<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%

	String nome = request.getParameter("txtNome");

	out.print("{\"nome\": \"" + nome + "\"}");
	
%>