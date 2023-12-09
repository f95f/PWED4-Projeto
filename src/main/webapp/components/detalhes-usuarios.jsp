<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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
			<h1 class = "mt-2">Detalhes</h1>
		</div>
	</div>

	<div class = "container px-5 mx-5 details-container">
		<div class = "row">
			
			<div class = "col-md-7 mx-auto">
			
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Nome:</span>
						<span class = "info-value" id = "nome"></span>
					</p>
				</div>
				
				<div class = "row my-4 debug">
					<p class = "info-container">						
						<span class = "info-label">Email:</span>
						<span class = "info-value" id = "email"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Telefone:</span>
						<span class = "info-value" id = "telefone"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Nível:</span>
						<span class = "info-value" id = "nivel"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">					
						<span class = "info-label">Status de acesso:</span>
						<span class = "info-value" id = "acesso"></span>
					</p>
				</div>
			</div>
		</div>
		
	</div>
						
	