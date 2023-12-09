<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">

		let fillData = function(){
			
			let genero = JSON.parse(sessionStorage.getItem('genero'));
			$("#txtNome").val( genero.nome );
			$("#txtDescription").val( genero.description );
			
		}
		
		$(document).ready(function(){
		
			$("#formDescription").submit(function(event){ 
				
				event.preventDefault();
				let genero = JSON.parse(sessionStorage.getItem('genero')); // <-- que?
				
				let dataForm = $("#formDescription").serialize();
				let url = "generos?generoId=" + genero.id + "&" + dataForm;
				
				$.ajax({
				    url: url,
				    type: 'PUT',
				    cache: false,
				    contentType: 'application/json',
				    success: function(response) {
				    	if(response){
							
							$("#submitGeneroStatus").html("<ion-icon name = 'checkmark'></ion-icon>Dados atualizados com sucesso.");

						}
						else{
							
							$("#submitGeneroStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao atualizar. Por favor, tente novamente.");							
						}	
												
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#submitGeneroStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitGeneroStatus").fadeOut(200);

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
							<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do Gênero" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>
					
					<div class = "row my-4">
					    <div class = "col-md-8 mx-auto">
							<label for = "txtDescription" class = "form-label">Descrição</label>
							<textarea name = "txtDescription" id = "txtDescription" placeholder = "Descrição do gênero" class = "form-control shadow-sm mb-4 py-2"></textarea>
					    </div>
					</div>
						    
					<div class = "row mb-5 ml-5 px-5">
						<div class = "col-md mx-auto">	
							<input type = "submit" id = "btnSalvarGenero" value = "Atualizar" class = "btn-gravar shadow my-4">
							<span class = "notify submit-status" id = "submitGeneroStatus"></span>									
						</div>
					</div>
				</form>
				
			</div>
		</div>	
	</div>
						
	