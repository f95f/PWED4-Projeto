<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	if(request.getMethod().toLowerCase().equals("post")){
		
		String user = request.getParameter("txtLoginUser");
		String senha = request.getParameter("txtSenhaUser");
		
		out.print("{\"user\": \"" + user + "\", senha\": \"" + senha + "\"}");
	}

%>