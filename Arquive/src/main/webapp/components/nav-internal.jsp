<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
								<li> <a class="dropdown-item" href = "cadastrar-section.jsp">Seções</a> </li> 
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