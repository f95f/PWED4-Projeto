<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">

		let fillData = function(){
			
			let user = JSON.parse(sessionStorage.getItem('user'));
			$("#txtNome").val( user.nome );
			$("#txtEmail").val( user.email );
			$("#txtTelefone").val( user.telefone );
			$("#acesso").html( user.acesso );	
			
		}
		
		$(document).ready(function(){
		
			$("#formUser").submit(function(event){ 
				
				event.preventDefault();
				let user = JSON.parse(sessionStorage.getItem('user'));
				
				let dataForm = $("#formUser").serialize();
				let url = "usuarios?userId=" + user.id + "&" + dataForm;
				
				$.ajax({
				    url: url,
				    type: 'PUT',
				    cache: false,
				    contentType: 'application/json',
				    success: function(response) {
				    	if(response){
							
							$("#submitUsuarioStatus").html("<ion-icon name = 'checkmark'></ion-icon>Dados atualizados com sucesso.");

						}
						else{
							
							$("#submitUsuarioStatus").html("<ion-icon name = 'close'></ion-icon>Erro ao atualizar. Por favor, tente novamente.");							
						}	
												
						let timerId = 0;
						if(timerId){
							clearInterval(timer);
						}
						
						$("#submitUsuarioStatus").fadeIn(1);
						timerId = setTimeout(function(){
						
							$("#submitUsuarioStatus").fadeOut(200);

						}, 3000);
						
				    },
				    error: function(xhr, status, error) {
						alert(error)		        
				    }
				});
				
				$("#txtNome").val(null);
				$("#txtSobrenome").val(null);
				$("#txtEmail").val(null);
				$("#txtTelefone").val(null);
				
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
				<form method = "put" id = "formUser">
					   
					<div class = "row my-4">
						<div class = "col-md-8 mx-auto">
							<label for = "txtNome" class = "form-label">Nome</label>
							<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do usuário" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>

					<div class = "row my-4">	

						<div class = "col-md-8 mx-auto">
							<label for = "txtEmail" class = "form-label">Email</label>
							<input type = "email" name = "txtEmail" id = "txtEmail" placeholder = "Email do usuário" class = "form-control shadow-sm mb-4 py-2">
					    </div>
				    </div>
					
					<div class = "row my-4">
					    <div class = "col-md-8 mx-auto">
							<label for = "txtTelefone" class = "form-label">Telefone</label>
							<input type = "text" name = "txtTelefone" id = "txtTelefone" placeholder = "Telefone do usuário..." class = "form-control shadow-sm mb-4 py-2">
					    </div>
					</div>
				
					<div class = "row my-4">	
						<div class = "col-md-8 mx-auto">
							<label for = "txtAcesso" class = "form-label">Nível de Acesso</label>
							<select class="form-select form-control shadow-sm py-2" id = "txtAcesso" name = "txtAcesso" aria-label="Selecionar Nível de acesso" required>
								<option selected value = "Funcionário"> Funcionário </option>
								<option value = "Administrador"> Administrador </option>
								<option value = "visitante"> Visitante </option>
							</select>
						</div>
					</div>
				
					<div class = "row my-4">
						<div class = "col-md-8 mx-auto">
							<div class="form-check form-switch my-4" id = "chkStatusContainer">
							    <input class="form-check-input" type="checkbox" id="chkStatus" name = "chkStatus" checked>
							    <label class="form-label" for="chkStatus">Conta ativa</label>
							</div>
						</div>
					</div>
						    
					<div class = "row mb-5 ml-5 px-5">
						<div class = "col-md mx-auto">	
							<input type = "submit" id = "btnSalvarUsuario" value = "Atualizar" class = "btn-gravar shadow my-4">
							<span class = "notify submit-status" id = "submitUsuarioStatus"></span>									
						</div>
					</div>
				</form>
				
			</div>
		</div>	
	</div>
						
	