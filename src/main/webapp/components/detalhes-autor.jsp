<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
			<h1 class = "mt-2">Detalhes do Autor</h1>
		</div>
	</div>

	<div class = "container px-5 mx-5 details-container">
		<div class = "row">
		
			
			<div class = "col-md-5 mb-5">
				<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "foto">
			</div>
			
			<div class = "col-md-7 mx-auto">
			
				<div class = "row mb-4">
					<h2 id = "nome"></h2>
					<span class = "info-label" id = "olid"></span>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container" id = "biografia">	
					</p>
				</div>
				
			</div>
		</div>
	</div>
						
	