<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){
				
				$("#formEditora").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formEditora").serialize();
					let url = "editoras";
					
					$.post(url, dataForm, function(data, status){
						
						if(data){
							
							sessionStorage.setItem("novaEditora", JSON.stringify(data));	
							$("#submitEditoraStatus").html("<ion-icon name = 'checkmark'></ion-icon>Editora " + data.nome + " adicionada.");
							$("ion-icon").css("color", "var(--ACCENT2)");
							
						}
						else{
							$("#submitEditoraStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
							$("ion-icon").css("color", "var(--DANGER)");
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
						<span class = "notify submit-status" id = "submitEditoraStatus"></span>									
					</div>

				</div>
			</form>
			
		</div>
		