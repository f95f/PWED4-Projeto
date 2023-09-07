<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$("#formEditora").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formEditora").serialize();
					let url = "jsp-scripts/salvar-editora.jsp";
					
					$.post(url, dataForm, function(data, status){
						
						console.log("Nome: " + data.nome);
						
					}, "json");
					
				});
				
			});
		
		</script>
		
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Editoras</h1>
				<p>Use este formul�rio para adicionar uma nova editora.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formEditora">
				
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da editora..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtBio" class = "form-label">Descri��o:</label>
						<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Informa��o adicional sobre a editora..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<input type = "submit" id = "btnSalvarEditora" value = "Adicionar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
			
		</div>