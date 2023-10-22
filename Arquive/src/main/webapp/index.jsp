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
								responseElement += "</div>";
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
						+   "<div class='card p-4' style='width: 18rem;'>"
						+ 	  "<img src=" + livro.imagemCapa + " class='card-img-top' alt='Capa: " + livro.titulo + "'>"
						+ 	  "<div class='card-body p-0 mt-3'>"
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
				
				<div class = "row mt-4">
					
					<div class = "col-sm">
					
						<div class="card filters-card py-5" style="width: 18rem;">
						    <svg
							   viewBox="0 0 99.735054 91.403206"
							   version="1.1"
							   id="svg1"
							   class="custom-icon"
							   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
							   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
							   xmlns="http://www.w3.org/2000/svg"
							   xmlns:svg="http://www.w3.org/2000/svg">
							  <defs
							     id="defs1" />
								  <g
								     inkscape:label="Camada 1"
								     inkscape:groupmode="layer"
								     id="layer1"
								     transform="translate(-48.340203,-78.353323)">
								    <g
								       id="g7"
								       transform="translate(181.01314,-1.5849865)">
								      <circle
								         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
								         id="path1"
								         cx="-82.858177"
								         cy="105.44158"
								         r="22.415094"
								         inkscape:export-filename="autor.svg"
								         inkscape:export-xdpi="35"
								         inkscape:export-ydpi="35" />
								      <path
								         id="circle1"
								         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
								         d="m -82.858388,134.3944 a 50.060375,50.060375 0 0 0 -48.459052,37.91862 h 97.024052 a 50.060375,50.060375 0 0 0 -48.565,-37.91862 z" />
								      <path
								         id="rect2"
								         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11666;stroke-opacity:0"
								         d="m -48.413999,112.70379 c 0,0 -1.473601,3.99513 -1.98024,23.59132 2.723154,1.51628 5.337731,3.21985 7.824845,5.0984 2.845895,2.13404 6.112558,6.40548 8.189883,10.54678 -0.08469,-30.3486 -2.345279,-39.2365 -2.345279,-39.2365 l -2.922302,0.0729 -2.922302,0.0724 z"
								         sodipodi:nodetypes="cccccccc" />
								      <path
								         id="path2"
								         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
								         d="m -43.114989,83.02649 c -1.416099,1.823406 -7.899101,10.221743 -8.01536,11.421828 -0.130004,1.340195 2.523392,16.362822 2.523392,16.362822 l 5.846349,-0.0354 0.198126,-10.44154 c -1.465511,3e-5 -2.653555,-1.136804 -2.653518,-2.539173 0.0037,-1.195912 0.878637,-2.227362 2.101011,-2.476337 z"
								         sodipodi:nodetypes="cccccccc" />
								      <path
								         id="path18"
								         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
								         d="m -42.023463,83.02649 c 1.416111,1.823406 7.899138,10.221743 8.01536,11.421828 0.130016,1.340195 -2.919607,16.362822 -2.919607,16.362822 l -5.846349,-0.0354 0.198126,-10.44154 c 1.465499,3e-5 2.653543,-1.136817 2.653506,-2.539173 -0.0037,-1.195912 -0.878649,-2.227374 -2.101036,-2.476337 z"
								         sodipodi:nodetypes="cccccccc" />
								    </g>
								  </g>
							</svg>
						    <div class="card-body py-0 mt-3 mb-0">
						    	<h3>Autores</h3>	
						     </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card filters-card py-5" style="width: 18rem;">
						    <svg
							   viewBox="0 0 77.395348 133.14886"
							   version="1.1"
							   id="svg1"
							   class="custom-icon"
							   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
							   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
							   xmlns="http://www.w3.org/2000/svg"
							   xmlns:svg="http://www.w3.org/2000/svg">
							  <defs
							     id="defs1" />
							  <g
							     inkscape:label="Camada 1"
							     inkscape:groupmode="layer"
							     id="layer1"
							     transform="translate(-51.577867,-81.956968)">
							    <g
							       id="g11">
							      <path
							         id="rect5"
							         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							         d="m 65.201394,104.59509 c -6.960919,0 -12.565193,5.78677 -12.565193,12.97489 v 94.07042 c 0,0.24077 0.02258,0.47539 0.035,0.71284 l 30.418963,-36.50583 30.418976,36.50583 c 0.0124,-0.23745 0.035,-0.47207 0.035,-0.71284 v -94.07042 c 0,-7.18812 -5.60427,-12.97489 -12.56519,-12.97489 z"
							         sodipodi:nodetypes="ssscccssss" />
							      <path
							         id="path6"
							         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							         d="m 79.572149,83.015301 c -6.960912,0 -12.565193,5.786775 -12.565193,12.97489 v 6.419039 c 0.109889,-0.003 0.21686,-0.0168 0.32745,-0.0168 h 35.777534 c 6.96091,0 12.56519,5.78678 12.56519,12.9749 v 60.76172 l 12.20275,14.6445 c 0.0124,-0.23745 0.035,-0.47208 0.035,-0.71284 V 95.990191 c 0,-7.188115 -5.60429,-12.97489 -12.5652,-12.97489 z" />
							    </g>
							  </g>
							</svg>
						    <div class="card-body">
						    	<h3 class="card-text">Gêneros</h3>
						    </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card filters-card py-5" style="width: 18rem;">    
							<svg
							   viewBox="0 0 107.42278 111.26556"
							   version="1.1"
							   class="custom-icon"
							   id="svg1"
							   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
							   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
							   xmlns="http://www.w3.org/2000/svg"
							   xmlns:svg="http://www.w3.org/2000/svg">
							  <defs
							     id="defs1" />
							  <g
							     inkscape:label="Camada 1"
							     inkscape:groupmode="layer"
							     id="layer1"
							     transform="translate(-48.637361,-61.579188)">
							    <rect
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       id="rect11"
							       width="35.893574"
							       height="90.344879"
							       x="49.695698"
							       y="81.441498"
							       ry="7.2645187" />
							    <path
							       id="rect12"
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       d="m 92.395394,62.63752 c -2.959685,0 -5.34231,2.382625 -5.34231,5.34231 v 6.119523 H 109.36232 V 67.97983 c 0,-2.959685 -2.38263,-5.34231 -5.34231,-5.34231 z m -5.34231,14.23479 v 79.61995 H 109.36232 V 76.87231 Z m 0,82.39394 v 7.17785 c 0,2.95969 2.382625,5.34231 5.34231,5.34231 h 11.624616 c 2.95968,0 5.34231,-2.38262 5.34231,-5.34231 v -7.17785 z" />
							    <rect
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       id="rect13"
							       width="27.063984"
							       height="95.940735"
							       x="90.554787"
							       y="100.04976"
							       ry="5.160306"
							       transform="rotate(-12.057652)" />
							    <rect
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       id="rect15"
							       width="35.893574"
							       height="90.344879"
							       x="49.695698"
							       y="81.441498"
							       ry="7.2645187" />
							    <path
							       id="path15"
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       d="m 92.395394,62.63752 c -2.959685,0 -5.34231,2.382625 -5.34231,5.34231 v 6.119523 H 109.36232 V 67.97983 c 0,-2.959685 -2.38263,-5.34231 -5.34231,-5.34231 z m -5.34231,14.23479 v 79.61995 H 109.36232 V 76.87231 Z m 0,82.39394 v 7.17785 c 0,2.95969 2.382625,5.34231 5.34231,5.34231 h 11.624616 c 2.95968,0 5.34231,-2.38262 5.34231,-5.34231 v -7.17785 z" />
							    <rect
							       style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							       id="rect16"
							       width="27.063984"
							       height="95.940735"
							       x="90.554787"
							       y="100.04976"
							       ry="5.160306"
							       transform="rotate(-12.057652)" />
							  </g>
							</svg>
						    <div class="card-body">
						    	<h3 class="card-text">Categorias</h3>
						    </div>
						</div>
							
					</div>
									
					<div class = "col-sm">
					
						<div class="card filters-card py-5" style="width: 18rem;">
												    
							<svg
							   viewBox="0 0 84.670288 117.18096"
							   version="1.1"
							   id="svg1"
							   class="custom-icon"
							   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
							   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
							   xmlns="http://www.w3.org/2000/svg"
							   xmlns:svg="http://www.w3.org/2000/svg">
							  <defs
							     id="defs1" />
							  <g
							     inkscape:label="Camada 1"
							     inkscape:groupmode="layer"
							     id="layer1"
							     transform="translate(-48.637334,-80.383207)">
							    <g
							       id="g7"
							       transform="translate(181.01314,-1.5849865)">
							      <path
							         id="rect23"
							         style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							         d="m -110.18439,83.026527 c -11.70774,0 -21.13308,9.425337 -21.13308,21.133073 v 72.79814 c 0,11.70775 9.42534,21.13308 21.13308,21.13308 h 6.92206 33.364888 21.133594 V 176.95774 104.1596 83.026527 h -21.133594 -33.364888 z m 20.077329,37.595643 6.514331,13.05398 h 14.446664 l -10.401433,11.32902 5.580538,15.5975 -16.073954,-8.61446 -15.460555,8.43359 5.05964,-15.32413 -10.49187,-11.23652 14.428063,-0.12816 z" />
							      <g
							         id="g23"
							         transform="translate(-195.54309,5.2301887)">
							        <circle
							           style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							           id="path1"
							           cx="-82.858177"
							           cy="105.44158"
							           r="22.415094"
							           inkscape:export-filename="autor.svg"
							           inkscape:export-xdpi="35"
							           inkscape:export-ydpi="35" />
							        <path
							           id="circle1"
							           style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							           d="m -82.858388,134.3944 a 50.060375,50.060375 0 0 0 -48.459052,37.91862 h 97.024052 a 50.060375,50.060375 0 0 0 -48.565,-37.91862 z" />
							        <path
							           id="rect2"
							           style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11666;stroke-opacity:0"
							           d="m -48.413999,112.70379 c 0,0 -1.473601,3.99513 -1.98024,23.59132 2.723154,1.51628 5.337731,3.21985 7.824845,5.0984 2.845895,2.13404 6.112558,6.40548 8.189883,10.54678 -0.08469,-30.3486 -2.345279,-39.2365 -2.345279,-39.2365 l -2.922302,0.0729 -2.922302,0.0724 z"
							           sodipodi:nodetypes="cccccccc" />
							        <path
							           id="path2"
							           style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							           d="m -43.114989,83.02649 c -1.416099,1.823406 -7.899101,10.221743 -8.01536,11.421828 -0.130004,1.340195 2.523392,16.362822 2.523392,16.362822 l 5.846349,-0.0354 0.198126,-10.44154 c -1.465511,3e-5 -2.653555,-1.136804 -2.653518,-2.539173 0.0037,-1.195912 0.878637,-2.227362 2.101011,-2.476337 z"
							           sodipodi:nodetypes="cccccccc" />
							        <path
							           id="path18"
							           style="fill:#362f2a;fill-opacity:1;stroke:#333333;stroke-width:2.11667;stroke-opacity:0"
							           d="m -42.023463,83.02649 c 1.416111,1.823406 7.899138,10.221743 8.01536,11.421828 0.130016,1.340195 -2.919607,16.362822 -2.919607,16.362822 l -5.846349,-0.0354 0.198126,-10.44154 c 1.465499,3e-5 2.653543,-1.136817 2.653506,-2.539173 -0.0037,-1.195912 -0.878649,-2.227374 -2.101036,-2.476337 z"
							           sodipodi:nodetypes="cccccccc" />
							      </g>
							    </g>
							  </g>
							</svg>

						    <div class="card-body">
						    	<h3 class="card-text">Popularidade</h3>
						    </div>
						</div>
							
					</div>
				
				</div>
				
			</div>
		</div>
		

		
	</main>

	<footer class = "container-fluid dark-bg pt-4">
		
		<div class = "container">
			<div class = "row py-4 my-5">
				<div class = "col-sm-3 text-center">
					<a class = "footer-brand" href = "index.jsp">
						<img class = "footer-logo" alt="Arquive - Página Inicial" src="img/vendor/logomarca.png">
					</a>
				</div>
				<div class = "col-sm-3">	
					<div class = "footer-link-container">
						<h2 class = "footer-title mb-4">Links Úteis</h2>	
						<hr>
						<ul class = "footer-links px-0 mt-4">
							<li class = "mb-4"> 
								<a class = "footer-item" href = "index.jsp">Página Inicial</a>
							</li>
							<li class = "my-4">  
								<a class = "footer-item" href = "#">Sobre a Arquive</a>
							</li>
							<li class = "my-4"> 
								<a class = "footer-item" href = "#">Fale Conosco</a>
							</li>
							<li class = "mt-4"> 
								<a class = "footer-item" href = "#">Institucional</a>
							</li>
						</ul>
					</div>	
				</div>
				
				<div class = "col-sm-3">	
					<div class = "footer-link-container">
						<h2 class = "footer-title mb-4">Reserve um Livro</h2>	
						<hr>
						<ul class = "footer-links px-0 mt-4">
							<li class = "mb-4"> 
								<a class = "footer-item" href = "index.jsp">Pesquisar</a>
							</li>
							<li class = "my-4">  
								<a class = "footer-item" href = "#">Ver Arquivo</a>
							</li>
							<li class = "my-4"> 
								<a class = "footer-item" href = "#">Entrar</a>
							</li>
							<li class = "mt-4"> 
								<a class = "footer-item" href = "#">Criar Conta</a>
							</li>
						</ul>
					</div>	
				</div>	
				
				<div class = "col-sm-3">	
					<div class = "footer-link-container">
						<h2 class = "footer-title mb-4">Buscar Livros</h2>	
						<hr>
						<ul class = "footer-links px-0 mt-4">
							<li class = "mb-4"> 
								<a class = "footer-item" href = "index.jsp">Buscar por Autor</a>
							</li>
							<li class = "my-4">  
								<a class = "footer-item" href = "#">Buscar por Gênero</a>
							</li>
							<li class = "my-4"> 
								<a class = "footer-item" href = "#">Buscar por Editora</a>
							</li>
							<li class = "mt-4"> 
								<a class = "footer-item" href = "#">Buscar por Seção</a>
							</li>
						</ul>
					</div>	
				</div>
			</div>
				
		</div>
		
		<div class = "mt-5 pb-4 text-center dark-bg">
			<hr style="width: 90%">
			<p class = "mb-0 mt-4">&copy; 3026965, 2023</p>
		</div>
	</footer>
</body>
</html>