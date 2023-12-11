<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<script src="scripts/buscar-livro.js"></script>
	
	<title>ARQUIVE | Entrar</title>
	
	<script type="text/javascript">
	
		$(document).ready(function(){
			sessionObject = sessionStorage.getItem('session');
			if(sessionObject){
				sessionObject = JSON.parse(sessionObject);
				if(sessionObject.canLogin === "true"){
					console.log(sessionObject.canLogin === "true")
					goto("main-menu.jsp");
				}
			}
			
			$("#formLogin").submit(function(event){
				
				event.preventDefault();
				let dataForm = $("#formLogin").serialize();
				let url = "login";
				$.post(url, dataForm, function(data, status){
					console.log(data)
					if(data && data.canLogin === "true"){						
					    let session = {
					    	id: data.id,
				    		nome: data.nome,
							nivel: data.nivel
					    }
					    sessionStorage.setItem('session', JSON.stringify(session));
					    goto("main-menu.jsp");
					}
					else{
						$("#loginStatus").html("Email ou senha incorretos.");	
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#loginStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#loginStatus").fadeOut(200);

						}, 3000);
					}	
					
				}, "JSON");
				
			})
		});
		
	
	</script>
	
</head>
<body>

	<header class = "container-fluid fixed-top dark-bg shadow">
		
		<div id = "nav-fade-control" class = "container py-4">
			<div class = "navbar navbar-expand-md">
	
				<a class = "navbar-brand" href = "index.jsp">
					<img alt="Arquive - Página Inicial" style = "height: 30px;" src="img/vendor/logomarca-h.png">
				</a>
	
				<div class = "navbar-collapse justify-content-end">			
					<ul class = "navbar-nav ml-auto">
						<li class = "nav-item mx-3"> 
							<a class = "nav-link" href = "index.jsp">INÍCIO</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	
	</header>

	<main class = "container-fluid login-background ">
	
		<div class = "container form-container px-5 py-5">
			<form id="formLogin">
				<h2 class ="h2-light">Identifique-se</h2>
				
				<div class = "row my-4">
					<label for="txtUsuario" class="form-label ">Usuário</label>
					<input type = "text" id="txtUsuario" name="txtUsuario" class="form-control mx-2 py-2" placeholder="Email">	
					
				</div>
				
				<div class = "row my-4">
					<label for="txtSenha" class="form-label">Senha</label>
					<input type = "password" id="txtSenha" name="txtSenha" class="form-control mx-2 py-2" placeholder="Informe sua senha">
					
				</div>
				
				<div class = "row my-4">	
					<input type = "submit" id="btnLogin" value="Entrar" class="form-control mx-2 py-2" >
					<span class = "notify submit-status" id = "loginStatus"></span>									
				</div>
				
			</form>
		</div>
	
	</main>

	<footer class = "container-fluid dark-bg pt-4">
		
		<div class = "container">
			<div class = "row py-4 my-5">
				<div class = "col-sm-3 text-center">
					<a class = "footer-brand" href = "index.jsp">
						<img class = "footer-logo" alt="Arquive - Página Inicial" src="img/vendor/logomarca.png">
					</a><br>
					<div class = "social-logos text-center my-4">
					<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M480 257.35c0-123.7-100.3-224-224-224s-224 100.3-224 224c0 111.8 81.9 204.47 189 221.29V322.12h-56.89v-64.77H221V208c0-56.13 33.45-87.16 84.61-87.16 24.51 0 50.15 4.38 50.15 4.38v55.13H327.5c-27.81 0-36.51 17.26-36.51 35v42h62.12l-9.92 64.77H291v156.54c107.1-16.81 189-109.48 189-221.31z" fill-rule="evenodd"/></svg>
					<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M349.33 69.33a93.62 93.62 0 0193.34 93.34v186.66a93.62 93.62 0 01-93.34 93.34H162.67a93.62 93.62 0 01-93.34-93.34V162.67a93.62 93.62 0 0193.34-93.34h186.66m0-37.33H162.67C90.8 32 32 90.8 32 162.67v186.66C32 421.2 90.8 480 162.67 480h186.66C421.2 480 480 421.2 480 349.33V162.67C480 90.8 421.2 32 349.33 32z"/><path d="M377.33 162.67a28 28 0 1128-28 27.94 27.94 0 01-28 28zM256 181.33A74.67 74.67 0 11181.33 256 74.75 74.75 0 01256 181.33m0-37.33a112 112 0 10112 112 112 112 0 00-112-112z"/></svg>
					<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M496 109.5a201.8 201.8 0 01-56.55 15.3 97.51 97.51 0 0043.33-53.6 197.74 197.74 0 01-62.56 23.5A99.14 99.14 0 00348.31 64c-54.42 0-98.46 43.4-98.46 96.9a93.21 93.21 0 002.54 22.1 280.7 280.7 0 01-203-101.3A95.69 95.69 0 0036 130.4c0 33.6 17.53 63.3 44 80.7A97.5 97.5 0 0135.22 199v1.2c0 47 34 86.1 79 95a100.76 100.76 0 01-25.94 3.4 94.38 94.38 0 01-18.51-1.8c12.51 38.5 48.92 66.5 92.05 67.3A199.59 199.59 0 0139.5 405.6a203 203 0 01-23.5-1.4A278.68 278.68 0 00166.74 448c181.36 0 280.44-147.7 280.44-275.8 0-4.2-.11-8.4-.31-12.5A198.48 198.48 0 00496 109.5z"/></svg>
					<svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><path d="M508.64 148.79c0-45-33.1-81.2-74-81.2C379.24 65 322.74 64 265 64h-18c-57.6 0-114.2 1-169.6 3.6C36.6 67.6 3.5 104 3.5 149 1 184.59-.06 220.19 0 255.79q-.15 53.4 3.4 106.9c0 45 33.1 81.5 73.9 81.5 58.2 2.7 117.9 3.9 178.6 3.8q91.2.3 178.6-3.8c40.9 0 74-36.5 74-81.5 2.4-35.7 3.5-71.3 3.4-107q.34-53.4-3.26-106.9zM207 353.89v-196.5l145 98.2z"/></svg>
						
						
					</div>
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