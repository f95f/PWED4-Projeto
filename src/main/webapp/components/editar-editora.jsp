<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">

		let fillData = function(){
			
			let section = JSON.parse(sessionStorage.getItem('editora'));
			$("#txtNome").val( editora.nome );
			$("#txtDescription").val( editora.description );
			
		}
		
		$(document).ready(function(){
		
			$("#formDescription").submit(function(event){ 
				
				event.preventDefault();
				let section = JSON.parse(sessionStorage.getItem('editora')); // <-- que?
				
				let dataForm = $("#formDescription").serialize();
				let url = "editora?idEditora=" + editora.id + "&" + dataForm;
				
				$.ajax({
				    url: url,
				    type: 'PUT',
				    cache: false,
				    contentType: 'application/json',
				    success: function(response) {
				    	if(response){
							
							$("#submitEditoraStatus").html("<ion-icon name = 'checkmark'></ion-icon>Dados atualizados com sucesso.");

						}
						else{
							
							$("#submitEditoraStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao atualizar. Por favor, tente novamente.");							
						}	
												
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#submitEditoraStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitEditoraStatus").fadeOut(200);

						}, 3000);
						
				    },
				    error: function(xhr, status, error) {
						alert(error)		        
				    }
				});
				
				$("#txtNome").val(null);
				$("#txtDescription").val(null);
				
			});
			
		})
		
	</script>
	
	<div class = "container-fluid header-bg mb-5 shadow">
		<div class = "container py-4">
			<h1 class = "mt-2">Editar Dados</h1>
		</div>
	</div>

	<div class = "container px-5 details-container">
		<div class = "row">
			
			<div class = "col-md mx-auto">
				<form method = "put" id = "formDescription">

					<div class = "row my-4">
						<div class = "col-md-8 mx-auto">
							<label for = "txtNome" class = "form-label">Nome</label>
							<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do editora" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>
					
					<div class = "row my-4">
					    <div class = "col-md-8 mx-auto">
							<label for = "txtDescription" class = "form-label">Descri��o</label>
							<textarea name = "txtDescription" id = "txtDescription" placeholder = "Descri��o da editora" class = "form-control shadow-sm mb-4 py-2"></textarea>
					    </div>
					</div>
						    
					<div class = "row mb-5 ml-5 px-5">
						<div class = "col-md mx-auto">	
							<input type = "submit" id = "btnSalvarEditora" value = "Atualizar" class = "btn-gravar shadow my-4">
							<span class = "notify submit-status" id = "submitEditoraStatus"></span>									
						</div>
					</div>
				</form>
				
			</div>
		</div>	
	</div>
						
	