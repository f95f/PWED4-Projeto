<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<script type="text/javascript">

		let fillData = function(){
		    let storedSection = sessionStorage.getItem('genero');
		    
		    if (storedSection) {
				let autor = JSON.parse(sessionStorage.getItem('autor'));
				$("#txtNome").val( autor.nome );
				$("#txtOlid").val( autor.olid );
				$("#txtBiografia").val( autor.biografia);
				$("#txtFoto").html( autor.imgUrl );	
		    } 
	    }

		$(document).ready(function(){
		
			$("#formAutor").submit(function(event){ 
				
				event.preventDefault();
				let autor = JSON.parse(sessionStorage.getItem('autor'));
				
				let dataForm = $("#formAutor").serialize();
				let url = "autores?authorId=" + autor.id + "&" + dataForm;
				
				$.ajax({
				    url: url,
				    type: 'PUT',
				    cache: false,
				    contentType: 'application/json',
				    success: function(response) {
				    	if(response){
							
							$("#submitAutorStatus").html("<ion-icon name = 'checkmark'></ion-icon>Dados atualizados com sucesso.");

						}
						else{
							
							$("#submitAutorStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao atualizar. Por favor, tente novamente.");							
						}	
												
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#submitAutorStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitAutorStatus").fadeOut(200);

						}, 3000);
						
				    },
				    error: function(xhr, status, error) {
						alert(error)		        
				    }
				});
				
				$("#txtNome").val(null);
				$("#txtOlid").val(null);
				$("#txtFoto").val(null);
				$("#txtBiografia").val(null);
				
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
				<form method = "put" id = "formAutor">
					   
					<div class = "row my-4">	
						<div class = "col-md-8 mx-auto">
							<label for = "txtOlid" class = "form-label">Código OLID</label>
							<input type = "text" name = "txtOlid" id = "txtOlid" placeholder = "Código OLID" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>

					<div class = "row my-4">
						<div class = "col-md-8 mx-auto">
							<label for = "txtNome" class = "form-label">Nome</label>
							<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do Autor" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>
					
					<div class = "row my-4">
					    <div class = "col-md-8 mx-auto">
							<label for = "txtBiografia" class = "form-label">Biografia</label>
							<textarea name = "txtBiografia" id = "txtBiografia" placeholder = "Biografia..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					    </div>
					</div>
						    
					<div class = "row mb-5 ml-5 px-5">
						<div class = "col-md mx-auto">	
							<input type = "submit" id = "btnSalvarAutor" value = "Atualizar" class = "btn-gravar shadow my-4">
							<span class = "notify submit-status" id = "submitAutorStatus"></span>									
						</div>
					</div>
				</form>
				
			</div>
		</div>	
	</div>
						
	