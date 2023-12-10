<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Livros por Seção</title>
	<script>
		
		$(document).ready(function(){	
			let urlParams = new URLSearchParams(window.location.search);

			let sectionName = urlParams.get('section');
			let sectionId = urlParams.get('id');
			
			$("#greeter").text("Exibindo livros em " + sectionName + ":");
			getSomeBooks(sectionId)
		});
		
		let getSomeBooks = function(value){
			$(".sem-info-notice").remove();
			
			getSomeItems("livros", "sectionId", value, function(booksList){
				renderBook(booksList);				
			});
		}
		
		let renderBook = function(livrosList){
			let livrosContainer = $("#list-book-container");
			let responseElement;
					
			if(livrosList.length > 0){
				
				responseElement = "<div class = 'row'>";
				for(let i = 0; i < livrosList.length; i++){
					
					responseElement += buildLivroCard(livrosList[i]);
					
					if(!((i + 1) % 4)){
						responseElement += "</div><div class='row'>";
					}
				}
				responseElement += "</div>";
				livrosContainer.append(responseElement);
			}
			else{
				responseElement = 
						"<span class = 'sem-info-notice' style='margin-bottom:200px'>" 
						+ "Não há livros para mostrar aqui."
						+ "</span>";
				livrosContainer.append(responseElement);
			}
		}
		let buildLivroCard = function(livro){
			
			let card = 
				  "<div class = 'col-md mx-0 px-0'>"
				+   "<div class='card p-4' style='width: 18rem;' onClick = 'displayBookInfo(" + livro.id + ")' " 
				+			" data-bs-toggle = 'modal' data-bs-target='#detailsModal'>"
				+ 	  "<img src=" + livro.imagemCapa + " class='card-img-top' alt='Capa: " + livro.titulo + "'>"
				+ 	  "<div class='card-body p-0 mt-3'>"
				+ 	 	"<h3 class='card-text'>" + livro.titulo + "</h3>"
				+		"<p class='card-text'>" + livro.subtitulo + "</p><hr>"
				+		"<p class='card-text'>" + livro.autores + "</p><hr>"
				+		"<p class='card-text'>" + livro.section + "</p>"
				+ 	  	"<button id = 'card-button' class = 'details-button'>Ver Mais</button>" 
				+		"</div>"
				+   "</div>"
				+ "</div>";
			return card;
		}
		let displayBookInfo = function(bookId){

			$.get('livros?action=id&value=' + bookId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let livro = {
		    		isbn: data[0].isbn,
					titulo: data[0].titulo,
					subtitulo: data[0].subtitulo,
					editora: data[0].editora,
					section: data[0].section,
					edition: data[0].edition,
					generos: data[0].generos,
					autores: data[0].autores,
					quantidadePaginas: data[0].quantidadePaginas,
					quantidadeEstoque: data[0].quantidadeEstoque,
					anoPublication: data[0].anoPublication,
					description: data[0].description,
					imagemCapa: data[0].imagemCapa,
					disponibilidade: data[0].disponibilidade
			    }
			    sessionStorage.setItem('livro', JSON.stringify(livro));
			    loadData();
			});
			
		}
	</script>
</head>
<body>
	
	<header class = "container-fluid fixed-top dark-bg shadow">
		
		<div id = "nav-fade-control" class = "container py-4">
			<div class = "navbar navbar-expand-md">
	
				<a class = "navbar-brand" href = "index.jsp">
					<img alt="Arquive - Pï¿½gina Inicial" style = "height: 30px;" src="img/vendor/logomarca-h.png">
				</a>
	
				<div class = "navbar-collapse justify-content-end">			
					<ul class = "navbar-nav ml-auto">
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "login.jsp">ENTRAR</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>
	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-5" id = "greeter"></h1>
			</div>
		</div>
		
		<div class = "container" id = "list-book-container">

		</div>	
			
	</main>
	
	<footer class = "mt-5 py-4 text-center dark-bg">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
	<div id="detailsModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/detalhes-livro.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
		    </div>
		</div>
	</div>
	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>