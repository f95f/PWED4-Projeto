<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$("#formSection").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formSection").serialize();
					let url = "Section";
					
					$.post(url, dataForm, function(data, status){
						
						sessionStorage.setItem("novaSection", JSON.stringify(data));	
						
					}, "json");
					
				});
				
			});
		
		</script>
		
		<div class = "container-fluid header-bg mb-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Se��es</h1>
				<p>Use este formul�rio para adicionar uma nova se��o.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formEditora">
				
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da se��o..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtBio" class = "form-label">Descri��o:</label>
						<textarea rows = "5" name = "txtDesc" id = "txtDesc" placeholder = "Descreva brevemente sobre a se��o..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<input type = "submit" id = "btnSalvarSection" value = "Adicionar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
			
		</div>