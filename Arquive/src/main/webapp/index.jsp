<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta lang="pt-br">
	
	<link rel="icon" type = "image/x-icon" href = "img/favicon.ico">
  	<link href="style/bootstrap.min.css" rel="stylesheet">
  	<link href="style/style.css" rel="stylesheet">
  	
  	<script src="scripts/bootstrap.bundle.min.js"></script>
	<script src="scripts/jquery.min.js"></script>
	
	<title>Insert title here</title>
</head>
<body>
	
	<header class = "container-fluid py-3 dark">
		
		
		<div class = "container">
			<div class = "navbar navbar-expand-md">

				<a class = "navbar-brand" href = "index.jsp">
					<img alt="Arquive - Página Inicial" style = "height: 40px;" src="img/logomarca-h.png">
				</a>
	
				<div class = "navbar-collapse justify-content-end">			
					<ul class = "navbar-nav ml-auto">
						<li class = "nav-item mx-4"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
						<li class = "nav-item mx-4"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
						<li class = "nav-item mx-4"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>
	
	
		<!-- 
	<div class = "container-fluid mx-auto dark">
		
		<a id = "escape-logo" class = "text-center" href="index.jsp">
			<img id = "logomarca" class = "py-5" alt="s" src="img/logomarca.png">
		</a>
		 
		<p>
		asdfafdg
		<%
		
			if(request.getMethod().toLowerCase().equals("get")){
				
				String teste = request.getParameter("param");
				String strSaida = "{\n\"param\": \"" + teste + "\"\n}";
				//out.print(request.getMethod());
				out.print(strSaida);

			}
			
		%>
		
		</p>
	</div -->
</body>
</html>