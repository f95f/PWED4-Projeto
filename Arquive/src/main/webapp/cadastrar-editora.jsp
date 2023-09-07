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
	
	<title>ARQUIVE | Cadastrar Editoras</title>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			$("#formEditora").submit(function(event){
				
				event.preventDefault();
				let dataForm = $("#formEditora").serialize();
				let url = "salvar-editora.jsp";
				
				$.post(url, dataForm, function(data, status){
					
					alert("Nome: " + data.nome);
					
				}, "json");
				
			});
			
		});
	
	</script>
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
						
							<div class="dropdown">
							
								<button type="button" class = "btn dropdown-toggle header-dropdown" data-bs-toggle = "dropdown">
								    Cadastrar
								</button>
								<ul class="dropdown-menu">
								    <li> <a class="dropdown-item" href = "cadastrar-livro.jsp">Livros</a> </li> 
									<li> <a class="dropdown-item" href = "cadastrar-autor.jsp">Autores</a> </li> 
									<li> <a class="dropdown-item" href = "cadastrar-genero.jsp">Gêneros</a> </li> 
									<li> <a class="dropdown-item" href = "cadastrar-editora.jsp">Editoras</a> </li> 
								</ul>
								  
							</div>
						
						</li>

						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "#">Sair</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>
	<main class = "container-fluid px-0">
	
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Editoras</h1>
				<p>Use este formulário para adicionar uma nova editora.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formEditora">
				
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da editora..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtBio" class = "form-label">Descrição:</label>
						<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Informação adicional sobre a editora..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<input type = "submit" id = "btn-salvar-livro" value = "Adicionar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
			
		</div>
	</main>
	<footer class = "mt-5 py-4 text-center dark-bg">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
</body>
</html>