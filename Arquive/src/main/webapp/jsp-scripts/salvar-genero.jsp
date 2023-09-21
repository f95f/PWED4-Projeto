<%@page import="classes.models.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%
	
	Genero novoGenero = new Genero();
	novoGenero.setNome(request.getParameter("txtNome"));
	novoGenero.setDescription(request.getParameter("txtBio"));
	
	novoGenero.salvar();
	
	out.print("{\"id\": \"" + novoGenero.getIdGenero() + "\", \"nome\": \"" + novoGenero.getNome() + "\", \"descr\": \"" + novoGenero.getDescription() + "\"}");
	
	
%>
