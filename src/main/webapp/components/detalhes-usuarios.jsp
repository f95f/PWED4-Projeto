<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<script type="text/javascript">

		let loadData = function(){
			
			let user = JSON.parse(sessionStorage.getItem('user'));
			$("#nome").html( user.nome );
			$("#email").html( user.email );
			$("#telefone").html( user.telefone );
			$("#nivel").html( user.nivel );
			$("#acesso").html( user.acesso );
			
		}
	</script>
	
	<div class = "container-fluid header-bg mb-5 shadow">
		<div class = "container py-4">
			<h1 class = "mt-2">Detalhes do Usuário</h1>
		</div>
	</div>

	<div class = "container px-5 mx-5 details-container">
		<div class = "row">
			
			<div class = "col-md-10 mx-auto">
			
				<div class = "row my-4">
					<h2 id = "nome"></h2>
				</div>
				<hr>
				<div class = "row my-4">
					<h3 class = "mb-3">Contato:</h3>
					<p class = "info-container">						
						<span class = "info-label">Email:</span>
						<span class = "info-value" id = "email"></span>
					</p>
					<p class = "info-container">						
						<span class = "info-label">Telefone:</span>
						<span class = "info-value" id = "telefone"></span>
					</p>
				</div>
				<hr>
				<div class = "row my-4">
					<h3 class = "mb-3">Conta:</h3>
					<p class = "info-container">						
						<span class = "info-label">Nível:</span>
						<span class = "info-value" id = "nivel"></span>
					</p>
					<p class = "info-container">					
						<span class = "info-label">Status de acesso:</span>
						<span class = "info-value" id = "acesso"></span>
					</p>
				</div>
			</div>
		</div>
		
	</div>
						
	