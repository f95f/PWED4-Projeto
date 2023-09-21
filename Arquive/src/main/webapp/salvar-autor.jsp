<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String olid = request.getParameter("txtOlid");
	String nome = request.getParameter("txtNome");
	String sobrenome = request.getParameter("txtSobrenome");
	String txtImgUrl = request.getParameter("txtImgUrl");
	
	out.print("{\"olid\": \"" + olid + "\", \"nome\": \"" + nome + "\", \"sobrenome\": \"" + sobrenome + "\", \"imgUrl\": \"" + txtImgUrl + "\" }");
	

%>