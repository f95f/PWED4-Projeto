<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Cadastrar Autor</title>
	
	<script>
	
		$(document).ready(function(){
	
			$("#formAutor").submit(function(event){ 
				
				event.preventDefault();
				
				let dataForm = $("#formAutor").serialize();
				let url = "jsp-scripts/salvar-autor.jsp";
				
				$.post(url, dataForm, function(data, status){
					
					alert("Nome: " + data.nome + "\nSobrenome: " + data.sobrenome); 
					
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
				<h1 class = "mt-3">Cadastrar Autor</h1>
				<p>Use este formulário para adicionar um novo autor.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formAutor">
				
				<div class = "row">
				
					<div class = "col-md-8">	
				
						<label for = "txtOlid" class = "form-label">OLID</label>
						<input type = "text" name = "txtOlid" id = "txtOlid" placeholder = "Código OLID do autor..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do autor..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtSobrenome" class = "form-label">Sobrenome</label>
						<input type = "text" name = "txtSobrenome" id = "txtSobrenome" placeholder = "Sobrenome do autor..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtBio" class = "form-label">Biografia:</label>
						<textarea rows = "8" name = "txtBio" id = "txtBio" placeholder = "Fale um pouco sobre o autor e seus trabalhos, gêneros etc..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<input type = "submit" id = "btn-salvar-autor" value = "Adicionar" class = "btn-gravar shadow my-4">
					</div>
			
					<div class = "col-md-4">
						
						<label for = "txtImgUrl" class = "form-label">Foto:</label>
						<input type = "text" name = "txtImgUrl" id = "txtImgUrl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da foto..." value = "img/vendor/sem-capa.png">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
					</div>	
					
				</div>
			
			</form>
			
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>