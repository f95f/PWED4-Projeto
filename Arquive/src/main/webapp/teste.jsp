<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //apenas utilizar tags transparentes" %>
<% 

	if(request.getMethod().toLowerCase().equals("get")){
		
		String algo = request.getParameter("a");
		String strOut = "{parametro = '" + algo + "'}";
		
		out.print(strOut);

	}

	
%>