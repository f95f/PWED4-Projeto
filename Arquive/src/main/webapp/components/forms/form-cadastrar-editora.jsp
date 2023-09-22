<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$("#formEditora").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formEditora").serialize();
					let url = "jsp-scripts/salvar-editora.jsp";
					
					$.post(url, dataForm, function(data, status){

						$("#submitEditoraStatus").text("Editora " + data.nome + " adicionada.");
						$("#submitEditoraStatus").fadeIn();
						
						$("#submitEditoraStatus").fadeOut(3000);
												
						sessionStorage.setItem("novaEditora", JSON.stringify(data));	
						
					}, "json");
					
					
					$("#txtNome").val(null);
					$("#txtBio").val(null);

				});
				
			});
		
		</script>
		
		<div class = "container-fluid header-bg mb-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Editoras</h1>
				<p>Use este formulário para adicionar uma nova editora.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form method = "post" id = "formEditora">
				<div class = "row">
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da editora..." class = "form-control shadow-sm mb-4 py-2" required>
		
						<label for = "txtBio" class = "form-label">Descrição:</label>
						<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Informação adicional sobre a editora..." class = "form-control shadow-sm mb-4 py-2"  maxlength = 300></textarea>
						
						<input type = "submit" id = "btnSalvarEditora" value = "Adicionar" class = "btn-gravar shadow my-4">
												
					</div>
				</div>
				<div class = row>
					<span class = "alert submit-status" id = "submitEditoraStatus"></span>									
				</div>
			</form>
			
		</div>
		