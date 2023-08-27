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
  	<link href="style/style-internal.css" rel="stylesheet">
  	
  	<script src="scripts/bootstrap.bundle.min.js"></script>
	<script src="scripts/jquery.min.js"></script>
	<script src="scripts/buscar-livro.js"></script>
	
	<title>ARQUIVE | Cadastrar Livro</title>
</head>
<body>
	
	<header class = "container-fluid fixed-top dark-bg shadow">

		<div class = "container py-2">
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
	
		<div class = "container">
			
			<form action="#" id = "formLivro">
			
				<label for = "txtIsbn" class = "form-label">ISBN</label>
				<input type = "text" name = "txtIsbn" id = "txtIsbn" class = "form-control shadow-sm mb-4">
			
				<label for = "txtTitulo" class = "form-label">Título</label>
				<input type = "text" name = "txtTitulo" id = "txtTitulo" class = "form-control shadow-sm mb-4">
				
				<div class = "row mb-4">
				
					<div class = "col">
						<label for = "txtAutor" class = "form-label">Autor</label>
						<input type = "text" name = "txtAutor" id = "txtAutor" class = "form-control shadow-sm">		
					</div>
					
					<div class = "col">
						<label for = "txtEditora" class = "form-label">Editora</label>
						<input type = "text" name = "txtEditora" id = "txtEditora" class = "form-control shadow-sm">		
					</div>
				</div>
				
				
			</form>
		
		</div>
	
	</main>
</body>
</html>