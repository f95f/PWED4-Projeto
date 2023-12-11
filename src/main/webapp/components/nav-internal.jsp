<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    
<header class = "container-fluid fixed-top dark-bg shadow">

	<div class = "container py-2">
		<div class = "navbar navbar-expand-md">

			<a class = "navbar-brand" href = "index.jsp">
				<img alt="Arquive - Página Inicial" style = "height: 30px;" src="img/vendor/logomarca-h.png">
			</a>

			<div class = "navbar-collapse justify-content-end">			
				<ul class = "navbar-nav ml-auto align-items-center">
					
					<li class = "nav-item mx-3"> 
					
						<div class="dropdown">		
							<button type="button" class = "btn dropdown-toggle header-dropdown" data-bs-toggle = "dropdown">
							    Livros
							</button>
							<ul class="dropdown-menu">
							    <li> <a class="dropdown-item" href = "cadastrar-livro.jsp">Novo</a> </li> 
								<li> <a class="dropdown-item" href = "listar-livros.jsp">Pesquisar</a> </li> 
							</ul>
						</div>
					</li>
					
					<li class = "nav-item mx-3">
						<div class="dropdown">		
							<button type="button" class = "btn dropdown-toggle header-dropdown" data-bs-toggle = "dropdown">
							    Autores
							</button>
							<ul class="dropdown-menu">
							    <li> <a class="dropdown-item" href = "cadastrar-autor.jsp">Novo</a> </li> 
								<li> <a class="dropdown-item" href = "listar-autores.jsp">Pesquisar</a> </li> 
							</ul>
						</div>
					</li>
					
					<li class = "nav-item mx-3">
						<div class = "menu-item-container">
						    <a class="menu-item" href = "listar-editoras.jsp">Editoras</a>
						</div>
					</li>
					
					<li class = "nav-item mx-3">
						<div class = "menu-item-container">
						    <a class="menu-item" href = "listar-sections.jsp">Seções</a>
						</div>
					</li>
					
					<li class = "nav-item mx-3">
						<div class = "menu-item-container">
						    <a class="menu-item" href = "listar-generos.jsp">Gêneros</a>
						</div>
					</li>
					
					<li class = "nav-item mx-3">
						<div class="dropdown">		
							<button type="button" class = "btn dropdown-toggle header-dropdown" data-bs-toggle = "dropdown">
							    Usuários
							</button>
							<ul class="dropdown-menu">
							    <li> <a class="dropdown-item" href = "cadastrar-usuario.jsp">Novo</a> </li> 
								<li> <a class="dropdown-item" href = "listar-usuarios.jsp">Pesquisar</a> </li> 
							</ul>
						</div>
					</li>

					<li class = "nav-item mx-3"> 
						<div class = "menu-item-container ">
						    <a class="menu-item" type="button" onclick="logout()">Sair</a>
						</div>
					</li>
				</ul>
			</div>

		</div>
	</div>

</header>
<script>
	
	let logout = function(){
		sessionStorage.removeItem("session");
		goto("index.jsp");
	}

</script>