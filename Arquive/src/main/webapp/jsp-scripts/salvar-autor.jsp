<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="classes.models.Autor"%>
<%
	
	Autor novoAutor = new Autor();	
	
	novoAutor.setOlid(request.getParameter("txtOlid"));
	novoAutor.setNome(request.getParameter("txtNome"));
	novoAutor.setSobrenome(request.getParameter("txtSobrenome"));
	novoAutor.setBiografia(request.getParameter("txtBio"));
	novoAutor.setFoto(request.getParameter("txtImgUrl"));
	
	out.print("{\"olid\": \"" + novoAutor.getOlid() + "\", \"nome\": \"" + novoAutor.getNome() + "\", \"sobrenome\": \"" + novoAutor.getSobrenome() + "\", \"imgUrl\": \"" + novoAutor.getFoto() + "\" }");

	novoAutor.salvar();
%>