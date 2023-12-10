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
				
				$("#txtSearchBooks").keyup(function(){
					doSearch();	
				});
				
				getAllBooks();
				getAllItems("autores", function(autoresList){
					
					let autoresContainer = $("#list-author-container");
					let responseElement;
					
					if(autoresList.length > 0){
						
						responseElement = "<div class = 'row'>";
						for(let i = 0; i < autoresList.length; i++){
							
							responseElement += buildAutorCard(autoresList[i]);
							
							if(!((i + 1) % 4)){
								responseElement += "</div><div class='row'>";
							}
						}
						responseElement += "</div>";
						autoresContainer.append(responseElement);
					}
					else{
						responseElement = 
								"<span class = 'no-data-notice'>" 
								+ "Nï¿½o hï¿½ autores para mostrar aqui."
							  + "</span>";
						autoresContainer.append(responseElement);
					}
				});
				getAllItems("sections", function(sectionsList){
					
					let sectionsContainer = $("#list-section-container");
					let responseElement;
					
					if(sectionsList.length > 0){
						
						responseElement = "<div class = 'row'>";
						for(let i = 0; i < sectionsList.length; i++){
							
							responseElement += buildSectionCard(sectionsList[i]);
							
							if(!((i + 1) % 4)){
								responseElement += "</div><div class='row'>";
							}
						}
						responseElement += "</div>";
						sectionsContainer.append(responseElement);
					}
					else{
						responseElement = 
							"<span class = 'sem-info-notice'>" 
							+ "Nï¿½o hï¿½ categorias para mostrar aqui."
						  + "</span>";
					  sectionsContainer.append(responseElement);
					}
				});
				
			});

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
							"<span class = 'sem-info-notice'>" 
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
			let buildAutorCard = function(autor){
				
				let card = 
					  "<div class = 'col-md mx-0 px-0' onclick='goto(`livros-por-autores.jsp?autor=" + autor.nome+ "`)'>"
					+   "<div class='card p-4' style='width: 18rem;'>"
					+ 	  "<img src='" + autor.imgUrl + "' class='card-img-top' alt='Foto: " + autor.nome + "'>"
					+ 	  "<div class='card-body p-0 mt-3'>"
					+ 	 	"<h3 class='card-text'>" + autor.nome + "</h3>"
					+		"<p class='card-text description'>" + autor.biografia + "</p>"
					+		"</div>"
					+   "</div>"
					+ "</div>";
				return card;
			}
			let buildSectionCard = function(section){
				
				let card = 
					  "<div class = 'col-md mx-0 px-0' onclick='goto(`livros-por-categoria.jsp?section=" + section.nome+ "&id=" + section.id + "`)'>"
					+   "<div class='card p-4' style='width: 18rem;'>"
					+ 	  "<img alt='ï¿½cone - generos' src='img/icons/section.svg' class='ribbon-icon'>"
					+ 	  "<div class='card-body p-0 mt-3'>"
					+		"<p class='card-text '>" + section.nome + "</p>"
					+		"<p class='card-text description'>" + section.descr + "</p>"
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
			$("#detailsModal").on("hidden.bs.modal", (function(){
				sessionStorage.removeItem("livro");
			}));
			
			let doSearch = function(){

				let queryValue = $("#txtSearchBooks").val();
				$("#list-book-container").empty();
				$(".sem-info-notice").empty();
				
				if(queryValue.trim() != ""){
					getSomeBooks("bookTitle", queryValue);
				}
				else{
					getAllBooks();
				}	
			}
			
			let getSomeBooks = function(key, value){
				$(".sem-info-notice").remove();
				
				getSomeItems("livros", key, value, function(booksList){
					renderBook(booksList);				
				});
			}
			let getAllBooks = function(){
				getAllItems("livros", function(livrosList){
					renderBook(livrosList);						
				});
			}
		</script>
	<title>ARQUIVE | Home</title>
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
	<main class = "container-fluid px-0" style = "min-height: 800px">		
		
		<div id = "banner">
			<div class = "row mx-0 px-0 text-center banner-mask">
			
				<form id = "search-form" class = "my-5">
					<h1>Procure um Livro:</h1>
					<input type = "text" id="txtSearchBooks" class = "form-control form-control-lg mt-4 w-50 p-3 mx-auto" placeholder = "Buscar...">
				</form>
				
			</div>
			
		</div>	
		
		<div class = "container-fluid py-2 mb-3 ribbon-section">
			<div class = "container py-4">
				<div class = "row my-4">
					<div class="col" style="max-width: 70px">
						<svg xmlns="http://www.w3.org/2000/svg" id="book-icon" class="ionicon" viewBox="0 0 512 512"><path d="M256 160c16-63.16 76.43-95.41 208-96a15.94 15.94 0 0116 16v288a16 16 0 01-16 16c-128 0-177.45 25.81-208 64-30.37-38-80-64-208-64-9.88 0-16-8.05-16-17.93V80a15.94 15.94 0 0116-16c131.57.59 192 32.84 208 96zM256 160v288" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32"/></svg>					
					</div>
					<div class = "col mx-4">
						<h2 class = "h2-light">Livros</h2>
						<p class = "text-muted">Livros recentemente adicionados.</p>
					</div>
				</div>
			</div>
		</div>	
		<div class = "container" id = "list-book-container">
			<div class = "row">
				<h3 class="h4-like my-4">Todas os Livros</h3>
			</div>
		</div>	
		
		<div class = "container-fluid py-2 mb-3 ribbon-section">
			<div class = "container py-4">
				<div class = "row my-4">
					<div class="col" style="max-width: 70px">
						<img alt="ï¿½cone - autores" src="img/icons/autor.svg" class="ribbon-icon">
					</div>
					<div class = "col mx-4">
						<h2 class = "h2-light">Autores</h2>
						<p class = "text-muted">Autores recentemente adicionados.</p>
					</div>
				</div>
			</div>
		</div>	
		<div class = "container" id = "list-author-container">
			<div class = "row">
				<h3 class="h4-like my-4">Todas os Autores</h3>
			</div>
		</div>	
		
		<div class = "container-fluid py-2 mb-3 ribbon-section">
			<div class = "container py-4">
				<div class = "row my-4">
					<div class="col" style="max-width: 70px">
						<img alt="ï¿½cone - generos" src="img/icons/section.svg" class="ribbon-icon">
					</div>
					<div class = "col mx-4">
						<h2 class = "h2-light">Seï¿½ï¿½es</h2>
						<p class = "text-muted">Categorias de livros.</p>
					</div>
				</div>
			</div>
		</div>	
		<div class = "container" id = "list-section-container">
			<div class = "row">
				<h3 class="h4-like my-4">Todas as categorias</h3>
			</div>
		</div>	
		
	</main>

	<footer class = "container-fluid dark-bg pt-4">
		
		<div class = "container">
			<div class = "row">
				<div class = "col-sm-3 text-center mx-auto">
					<a class = "footer-brand" href = "index.jsp">
						<img class = "footer-logo" alt="Arquive - Pï¿½gina Inicial" src="img/vendor/logomarca.png">
					</a><br>
					<div class = "social-logos text-center my-4">
						<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M480 257.35c0-123.7-100.3-224-224-224s-224 100.3-224 224c0 111.8 81.9 204.47 189 221.29V322.12h-56.89v-64.77H221V208c0-56.13 33.45-87.16 84.61-87.16 24.51 0 50.15 4.38 50.15 4.38v55.13H327.5c-27.81 0-36.51 17.26-36.51 35v42h62.12l-9.92 64.77H291v156.54c107.1-16.81 189-109.48 189-221.31z" fill-rule="evenodd"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M349.33 69.33a93.62 93.62 0 0193.34 93.34v186.66a93.62 93.62 0 01-93.34 93.34H162.67a93.62 93.62 0 01-93.34-93.34V162.67a93.62 93.62 0 0193.34-93.34h186.66m0-37.33H162.67C90.8 32 32 90.8 32 162.67v186.66C32 421.2 90.8 480 162.67 480h186.66C421.2 480 480 421.2 480 349.33V162.67C480 90.8 421.2 32 349.33 32z"/><path d="M377.33 162.67a28 28 0 1128-28 27.94 27.94 0 01-28 28zM256 181.33A74.67 74.67 0 11181.33 256 74.75 74.75 0 01256 181.33m0-37.33a112 112 0 10112 112 112 112 0 00-112-112z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M496 109.5a201.8 201.8 0 01-56.55 15.3 97.51 97.51 0 0043.33-53.6 197.74 197.74 0 01-62.56 23.5A99.14 99.14 0 00348.31 64c-54.42 0-98.46 43.4-98.46 96.9a93.21 93.21 0 002.54 22.1 280.7 280.7 0 01-203-101.3A95.69 95.69 0 0036 130.4c0 33.6 17.53 63.3 44 80.7A97.5 97.5 0 0135.22 199v1.2c0 47 34 86.1 79 95a100.76 100.76 0 01-25.94 3.4 94.38 94.38 0 01-18.51-1.8c12.51 38.5 48.92 66.5 92.05 67.3A199.59 199.59 0 0139.5 405.6a203 203 0 01-23.5-1.4A278.68 278.68 0 00166.74 448c181.36 0 280.44-147.7 280.44-275.8 0-4.2-.11-8.4-.31-12.5A198.48 198.48 0 00496 109.5z"/></svg>
						<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M508.64 148.79c0-45-33.1-81.2-74-81.2C379.24 65 322.74 64 265 64h-18c-57.6 0-114.2 1-169.6 3.6C36.6 67.6 3.5 104 3.5 149 1 184.59-.06 220.19 0 255.79q-.15 53.4 3.4 106.9c0 45 33.1 81.5 73.9 81.5 58.2 2.7 117.9 3.9 178.6 3.8q91.2.3 178.6-3.8c40.9 0 74-36.5 74-81.5 2.4-35.7 3.5-71.3 3.4-107q.34-53.4-3.26-106.9zM207 353.89v-196.5l145 98.2z"/></svg>
					</div>	
				</div>
			</div>
				
		</div>
		
		<div class = "mt-5 pb-4 text-center dark-bg">
			<hr style="width: 90%">
			<p class = "mb-0 mt-4">&copy; 3026965, 2023</p>
		</div>
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
	
</body>
</html>