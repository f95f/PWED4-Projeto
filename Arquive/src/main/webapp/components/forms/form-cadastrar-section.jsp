<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

		<script type="text/javascript">
		
			$(document).ready(function(){

				$("#formSection").submit(function(event){
					
					event.preventDefault();
					let dataForm = $("#formSection").serialize();
					let url = "section";
					
					$.post(url, dataForm, function(data, status){

						if(data){
							
							sessionStorage.setItem("newSection", JSON.stringify(data));	

							$("#submitSectionStatus").html("<ion-icon name = 'checkmark'></ion-icon>Seção " + data.nome + " adicionada.");

						}
						else{
							$("ion-icon").attr("name", "close");
							$("ion-icon").css("color", "var(--DANGER)");
							$("#submitSectionStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
						}	
						
						let timerId = 0;
						if(timerId){ clearInterval(timer); }
						
						$("#submitSectionStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitSectionStatus").fadeOut(200);
	
						}, 3000);
						
					}, "JSON");
					
					$("#txtNome").val(null);
					$("#txtDescr").val(null);
					
				});
				
			});
		
		</script>
		
		<div class = "container-fluid header-bg mb-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Seções</h1>
				<p>Use este formulário para adicionar uma nova seção.</p>
			</div>
		</div>
		
		<div class = "container w-75">
			
			<form method = "post" id = "formSection">
				
				<div class = "row">
					<div class = "col">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da seção..." class = "form-control shadow-sm mb-4 py-2" required>
		
						<label for = "txtDescr" class = "form-label">Descrição:</label>
						<textarea rows = "5" name = "txtDescr" id = "txtDescr" placeholder = "Descreva brevemente sobre a seção..." class = "form-control shadow-sm mb-4 py-2"  maxlength = 300></textarea>
					
					</div>
				</div>
				<div class = "row mb-5">
					<div class = "col-sm">	
				
						<input type = "submit" id = "btnSalvarSection" value = "Adicionar" class = "btn-gravar shadow mt-2">
						<span class = "notify submit-status" id = "submitSectionStatus">
						</span>
						
					</div>
				</div>
				
			</form>
			
		</div>