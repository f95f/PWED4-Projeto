<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta lang="pt-br">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<link rel="icon" type = "image/x-icon" href = "img/vendor/favicon.ico">
  	<link href="style/bootstrap.min.css" rel="stylesheet">
  	<link href="style/style.css" rel="stylesheet">
  	
  	<script src="scripts/bootstrap.bundle.min.js"></script>
	<script src="scripts/jquery.min.js"></script>
	<script src="scripts/styling.js"></script>
	
	<title>Insert title here</title>
</head>
<body>
	
	<header class = "container-fluid fixed-top shadow">
		
		<div id = "nav-fade-control" class = "container py-4">
			<div class = "navbar navbar-expand-md">
	
				<a class = "navbar-brand" href = "index.jsp">
					<img alt="Arquive - Página Inicial" style = "height: 30px;" src="img/vendor/logomarca-h.png">
				</a>
	
				<div class = "navbar-collapse justify-content-end">			
					<ul class = "navbar-nav ml-auto">
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>
	<main class = "container-fluid px-0">
		
		<div id = "banner">
			<div class = "row mx-0 px-0 text-center banner-mask">
				
					<img alt="Arquive - Logo" style = "width: 330px;" class = "mx-auto mb-4" src="img/vendor/logomarca.svg">
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
					<p> A tempore quo nam ipsa facere. Quis consequuntur vel dolorem autem magni?</p>
			</div>
			
		</div>		
		
	</main>

		<%
		
			if(request.getMethod().toLowerCase().equals("get")){
				
				String teste = request.getParameter("param");
				String strSaida = "{\n\"param\": \"" + teste + "\"\n}";
				//out.print(request.getMethod());
				out.print(strSaida);

			}
			
		%>

	<footer class = "mt-5 py-4 text-center dark-bg">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
</body>
</html>