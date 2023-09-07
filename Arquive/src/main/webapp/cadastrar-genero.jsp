<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Cadastrar Gêneros</title>
	
	<script>
	
		$(document).ready(function(){
	
			$("#formGenero").submit(function(event){ 
				
				event.preventDefault();
				
				let dataForm = $("#formGenero").serialize();
				let url = "jsp-scripts/salvar-genero.jsp";
				
				$.post(url, dataForm, function(data, status){
					
					alert("Nome: " + data.nome); 
					
				}, "json");
				
			});
		});
	
	</script>
</head>
<body>
	
	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">
	
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Gêneros</h1>
				<p>Use este formulário para adicionar um novo gênero ou uma nova categoria de livros.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formGenero">
				
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do gênero ou categoria" class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtBio" class = "form-label">Descrição:</label>
						<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Fale um pouco sobre este gênero ou categoria..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<input type = "submit" id = "btn-salvar-livro" value = "Adicionar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
			
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>