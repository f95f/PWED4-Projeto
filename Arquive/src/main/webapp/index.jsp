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
	<script src="scripts/get-all-requests.js"></script>
	
	<script type="text/javascript">
			
			$(document).ready(function(){
				
				getAllItems("livros", function(livrosList){
					
					let livrosContainer = $("#list-book-container");
					let responseElement;
					
					if(livrosList.length > 0){
						
						responseElement = "<div class = 'row'>";
						for(let i = 0; i < livrosList.length; i++){
							
							responseElement += buildLivroCard(livrosList[i]);
							
							if(!((i + 1) % 4)){
								responseElement += "<hr class = 'my-5'></div>";
								livrosContainer.append(responseElement);
								responseElement = "<div class = 'row'>";
							}
						}
					}
					else{
						responseElement = 
								"<span class = 'sem-livros-notice'>" 
								+ "Não há livros para mostrar aqui."
							  + "</span>";
						livrosContainer.append(responseElement);
					}
					
				});
				
				let buildLivroCard = function(livro){
					
					let card = 
						  "<div class = 'col-md'>"
						+   "<div class='card' style='width: 18rem;'>"
						+ 	  "<img src=" + livro.imagemCapa + " class='card-img-top' alt='Capa: " + livro.titulo + "'>"
						+ 	  "<div class='card-body'>"
						+ 	 	"<h3 class='card-text'>" + livro.titulo + "</h3>"
						+		"<p class='card-text'>" + livro.subtitulo + "</p>"
						+		"<p class='card-text'>" + livro.anoPublication + "</p>"
						+ 	  "</div>"
						+   "</div>"
						+ "</div>";
					return card;
					
				}
				
			});
			
			</script>
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
			
				<form action="#" method="" id = "search-form" class = "my-5">
					<h1>Reserve um Livro:</h1>
					<input type = "text" class = "form-control form-control-lg mt-4 w-50 p-3 mx-auto" placeholder = "Buscar...">
				</form>
				
			</div>
			
		</div>	
		
		<div class = "container" id = "list-book-container">
		
			<div class = "row my-4">
				<h2>Seções</h2>
			</div>
			<div class = "row">
				<h3>Todos</h3>
			<!-- 
				<button>Ver todos</button>
			 -->
			</div>
			
			
		
		</div>	
		
		
		<div class = "container-fluid py-5 ribbon-section">
			<div class = "container text-center">
					
				<h2>Encontre livros por</h2>
				
				<div class = "row">
					
					<div class = "col-sm">
					
						<div class="card" style="width: 18rem;">
						    <ion-icon name="person-outline"></ion-icon>
						    <div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card" style="width: 18rem;">
						    <ion-icon name="book-outline"></ion-icon>
						    <div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card" style="width: 18rem;">
						    <ion-icon name="person-outline"></ion-icon>
						    <div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card" style="width: 18rem;">
						    <ion-icon name="person-outline"></ion-icon>
						    <div class="card-body">
						    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    </div>
						</div>
							
					</div>
				
				</div>
				
			</div>
		</div>
		

		
	</main>

	<footer class = "mt-5 py-4 text-center dark-bg">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
</body>
</html>