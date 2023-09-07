<%@page import="classes.models.Editora"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	
	Editora novaEditora = new Editora();

	novaEditora.setNome(request.getParameter("txtNome"));
	novaEditora.setDescription(request.getParameter("txtBio"));

	out.print("{\"nome\": \"" + novaEditora.getNome() + "\", \"descr\": \"" + novaEditora.getDescription() + "\" }");
	
	novaEditora.salvar();
	
%>