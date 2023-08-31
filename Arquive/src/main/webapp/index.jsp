<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Autor"%>
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
	
	<title>ARQUIVE | Home</title>
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
							<a class = "nav-link" href = "index.jsp">Início</a>
						</li>
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Sobre</a>
						</li>
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Contato</a>
						</li>
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Login</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>
	<main class = "container-fluid px-0" style = "min-height: 800px">		
		
		<div id = "banner">
			<div class = "row mx-0 px-0 text-center banner-mask">
				<!-- 
				<img alt="Arquive - Logo" style = "width: 280px;" class = "mx-auto mb-5" src="img/vendor/logomarca.svg">
				 -->
			
				<form action="#" method="" id = "search-form" class = "my-5">
					<h1>Reserve um Livro:</h1>
					<input type = "text" class = "form-control form-control-lg mt-4 w-50 p-3 mx-auto" placeholder = "Buscar...">
				</form>
				
			</div>
			
		</div>	
		
		<div class = "container">
		
			<a class = "button" href = "cadastrar-livro.jsp">cadastrar</a>		 <br>
		
			<%
			
				if(request.getMethod().toLowerCase().equals("get")){
					
					String teste = request.getParameter("param");
					String strSaida = "{\n\"param\": \"" + teste + "\"\n}";
					//out.print(request.getMethod());
					out.print(strSaida);
	
				}
				
			%>
			<hr>
			<%
			
				Autor autores = new Autor();
				ArrayList<Autor> listAutores = autores.listAutores();
			
				for(int i = 0; i < listAutores.size(); i++){
					//out.print(listAutores.get(i).toString());
					
					out.print(listAutores.get(i).getIdAutor() + " - " + listAutores.get(i).getNome() + " " + listAutores.get(i).getSobrenome());
					out.print("<hr>");
				}
				
			%>
		
		</div>	
		
	</main>

	<footer class = "mt-5 py-4 text-center dark-bg">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
</body>
</html>