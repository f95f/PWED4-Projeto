<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
  	<link href="style/bootstrap.min.css" rel="stylesheet">
  	<script src="scripts/bootstrap.bundle.min.js"></script>
	<script src="scripts/jquery.min.js"></script>
</head>
<body>
	<div class = "container-fluid mx-auto py-5 bg-success">
		<h1 class = "display-5 text-center text-muted"> testeh </h1>
		<p>
		
		<%
		
			if(request.getMethod().toLowerCase().equals("get")){
				
				String teste = request.getParameter("param");
				String strSaida = "{\n\"param\" = \"" + teste + "\"\n}";
				//out.print(request.getMethod());
				out.print(strSaida);

			}
			
		%>
		
		</p>
	</div>
</body>
</html>