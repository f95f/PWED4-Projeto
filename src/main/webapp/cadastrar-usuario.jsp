<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<meta charset="UTF-8">
	<title>ARQUIVE | Cadastrar Usuário </title>
	<script>
	
		$(document).ready(function(){
	
			$("#formUser").submit(function(event){ 
				
				event.preventDefault();
				
				let dataForm = $("#formUser").serialize();
				let url = "usuarios";
				console.log(dataForm);
				$.post(url, dataForm, function(data, status){
					
					if(data){
						
						$("#submitUsuarioStatus").html("<ion-icon name = 'checkmark'></ion-icon>Usuário " + data.nome + " " + data.sobrenome + " adicionado.");

					}
					else{
						$("#submitUsuarioStatus").text("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
					}	
											
					let timerId = 0;
					if(timerId){
						clearInterval(timer);
					}
					
					$("#submitUsuarioStatus").fadeIn(1);
					timerId = setTimeout(function(){
					
						$("#submitUsuarioStatus").fadeOut(200);

					}, 3000);
					
					
				}, "json");
				
				$("#txtNome").val(null);
				$("#txtSobrenome").val(null);
				$("#txtEmail").val(null);
				$("#txtTelefone").val(null);
				
			});
		});
	
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>
	
	<main class = "container-fluid px-0">
	
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Usuários</h1>
				<p>Use este formulário para adicionar um novo usuário.</p>
			</div>
		</div>
		
		<div class = "container px-5">
			
			<form method = "post" id = "formUser">
				
				<div class = "row my-4">
				
					<div class = "col-md-10 mx-auto">
						<label for = "txtOlid" class = "form-label md-2 mb-0 h4-like">Informações Básicas</label>
						 <p class="form-text text-muted mb-4" id = "txtOlidDescription">
					    	Informe o nome e o sobrenome do usuário.
					    </p>
					    <div class = "row my-4">	
					    
							<div class = "col-md mx-auto">
								<label for = "txtNome" class = "form-label">Nome</label>
								<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do usuário" class = "form-control shadow-sm mb-4 py-2">
						    </div>
						    
						    <div class = "col-md mx-auto">
								<label for = "txtSobrenome" class = "form-label">Sobrenome</label>
								<input type = "text" name = "txtSobrenome" id = "txtSobrenome" placeholder = "Sobrenome do usuário..." class = "form-control shadow-sm mb-4 py-2">
						    </div>
						    
						</div>
					</div>
					<hr>
				</div>
				
				<div class = "row my-4">	
					
					<div class = "col-md-10 mx-auto">
						<label for = "txtOlid" class = "form-label md-2 mb-0 h4-like">Informações de Contato</label>
						 <p class="form-text text-muted mb-4" id = "txtOlidDescription">
					    	Informe os meios de contato do usuário.
					    </p>
					    <div class = "row my-4">	
					    
							<div class = "col-md-7 mx-auto">
								<label for = "txtEmail" class = "form-label">Email</label>
								<input type = "email" name = "txtEmail" id = "txtEmail" placeholder = "Email do usuário" class = "form-control shadow-sm mb-4 py-2">
						    </div>
						    
						    <div class = "col-md-5 mx-auto">
								<label for = "txtTelefone" class = "form-label">Telefone</label>
								<input type = "text" name = "txtTelefone" id = "txtTelefone" placeholder = "Telefone do usuário..." class = "form-control shadow-sm mb-4 py-2">
						    </div>
							<hr>
						</div>
					</div>
				    
				</div>
				
				<div class = "row my-4">	
					
					<div class = "col-md-10 mx-auto">
						<label for = "txtOlid" class = "form-label md-2 mb-0 h4-like">Informações de Acesso</label>
						 <p class="form-text text-muted mb-4" id = "txtOlidDescription">
					    	Defina o nível de acesso e ativação da conta do usuário.
					    </p>
					    <div class = "row my-4">	
					    
						    <div class = "col-md mx-auto">
						    
								<label for = "txtAcesso" class = "form-label">Nível de Acesso</label>
								<select class="form-select form-control shadow-sm py-2" id = "txtAcesso" name = "txtAcesso" aria-label="Selecionar Nível de acesso" required>
									<option selected value = "Funcionário"> Funcionário </option>
									<option value = "Administrador"> Administrador </option>
									<option value = "visitante"> Visitante </option>
								</select>
		    
							</div>

							<div class = "col-md mx-auto">
								<div class="form-check form-switch my-4" id = "chkStatusContainer">
								    <input class="form-check-input" type="checkbox" id="chkStatus" name = "chkStatus">
								    <label class="form-label" for="chkStatus">Ativar conta</label>
								</div>
							</div>
						    
							<hr>
						</div>
					</div>
				    
				</div>
				
				<div class = "row mb-5">
					<div class = "col-md-10 mx-auto">	
						<input type = "submit" id = "btnSalvarUsuario" value = "Adicionar" class = "btn-gravar shadow my-4">
						<span class = "notify submit-status" id = "submitUsuarioStatus"></span>									
					</div>
				</div>
			
			</form>
			
		</div>
	</main>

	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>