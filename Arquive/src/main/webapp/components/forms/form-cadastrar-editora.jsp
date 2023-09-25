<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$("#formEditora").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formEditora").serialize();
					let url = "jsp-scripts/salvar-editora.jsp";
					
					$.post(url, dataForm, function(data, status){
						
						if(data){
							
							$("ion-icon").attr("name", "checkmark");
							$("ion-icon").css("color", "var(--ACCENT2)");
							sessionStorage.setItem("novaEditora", JSON.stringify(data));	

							$("#submitEditoraStatus").text("Editora " + data.nome + " adicionada.");

						}
						else{
							$("ion-icon").attr("name", "close");
							$("ion-icon").css("color", "var(--DANGER)");
							$("#submitEditoraStatus").text("Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
						}	
						
						
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#submitEditoraStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitEditoraStatus").fadeOut(200);
	
						}, 3000);
						
						
					}, "JSON");
					
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
		
		<div class = "container w-75">
			
			<form method = "post" id = "formEditora">
				<div class = "row">
					<div class = "col">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da editora..." class = "form-control shadow-sm mb-4 py-2" required>
		
						<label for = "txtBio" class = "form-label">Descrição:</label>
						<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Informação adicional sobre a editora..." class = "form-control shadow-sm mb-4 py-2"  maxlength = 300></textarea>
						
												
					</div>
				</div>
				<div class = "row mb-5">

					<div class = "col-sm">	
						<input type = "submit" id = "btnSalvarEditora" value = "Adicionar" class = "btn-gravar shadow mt-2">
						<span class = "alert submit-status" id = "submitEditoraStatus">
							<ion-icon></ion-icon>
						</span>									
					</div>

				</div>
			</form>
			
		</div>
		