<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">
		let loadData = function(){
					
			let autor = JSON.parse(sessionStorage.getItem('autor'));
			if(autor){
				$("#olid").html( autor.olid );
				$("#nome").html( autor.nome );
				$("#biografia").html( autor.biografia);
				$("#foto").html( autor.foto );				
			}
		}
	</script>
	
	<div class = "container-fluid header-bg mb-5 shadow">
		<div class = "container py-4">
			<h1 class = "mt-2">Detalhes</h1>
		</div>
	</div>

	<div class = "container px-5 mx-5 details-container">
		<div class = "row">
		
			
			<div class = "col-md-5 mb-5">
				
				<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "foto">
				
			</div>
			
			<div class = "col-md-7 mx-auto">
			
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Olid:</span>
						<span class = "info-value" id = "olid"></span>
					</p>
				</div>
				
				<div class = "row my-4 debug">
					<p class = "info-container">						
						<span class = "info-label">Nome:</span>
						<span class = "info-value" id = "nome"></span>
					</p>
				</div>
				
				<div class = "row my-4 debug">
					<p class = "info-container">						
						<span class = "info-label">Biografia:</span>
						<span class = "info-value" id = "biografia"></span>
					</p>
				</div>
			</div>
		</div>
	</div>
						
	