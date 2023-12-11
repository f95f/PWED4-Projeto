<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<script type="text/javascript">
		let loadData = function(){
			
			let livro = JSON.parse(sessionStorage.getItem('livro'));
			$("#isbn").html( livro.isbn );
			$("#titulo").html( livro.titulo );
			$("#subtitulo").html( livro.subtitulo );
			$("#editora").html( livro.editora );
			$("#section").html( livro.section );
			$("#edition").html( livro.edition );
			$("#autores").html( livro.autores);
			$("#generos").html( livro.generos );
			$("#quantidadePaginas").html( livro.quantidadePaginas + " páginas");
			$("#quantidadeEstoque").html( livro.quantidadeEstoque );
			$("#anoPublication").html( livro.anoPublication );
			$("#description").html( livro.description );
			$("#imagemCapa").html( livro.imagemCapa );
			$("#disponibilidade").html( livro.disponibilidade === false? "Não" : "Sim");
				
		}
	</script>
	
	<div class = "container-fluid header-bg mb-5 shadow">
		<div class = "container py-4">
			<h1 class = "mt-2">Detalhes do Livro</h1>
		</div>
	</div>

	<div class = "container px-5 mx-5 details-container">
		<div class = "row">
		
			<div class = "col-md-5 mb-5">
				<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
			</div>
			
			<div class = "col-md mx-auto">
			
				<div class = "row mb-4">					
					<h2 id = "titulo"></h2>
					<span id = "subtitulo"></span>
					<span class = "info-name" id = "generos"></span>
				</div>
				<hr class = "info-separator-small">
				
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Por:</span><br>
						<span id = "autores"></span>
					</p>
				</div>
				<hr class = "info-separator-small">
				
				<div class = "col-md mx-auto">
					<p class = "info-container">						
						<span class = "info-label">Editora:</span>
						<span class = "info-value" id = "editora"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">					
						<span class = "info-label">Publicado em:</span>
						<span class = "info-value" id = "anoPublication"></span>
					</p>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class = "col">
				<hr class = "info-separator">
				<div class = "row my-4">
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "info-label">Sinopse:</span><br>
							<p id = "description"></p>
						</p>
					</div>	
				</div>
				<hr class = "info-separator">
				
				<div class = "row my-4">
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "label">Seção:</span>
							<span class = "info-value" id = "section"></span>
						</p>
					</div>
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "label">Edição:</span>
							<span class = "info-value" id = "edition"></span>
						</p>
					</div>
					<div class = "col-md mx-auto">
						<p class = "info-container">					
							<span class = "info-value" id = "quantidadePaginas"></span>
						</p>
					</div>
				</div>
				<hr class = "info-separator">
				
				<div class = "row my-4">
	
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "label">Quantidade em estoque:</span>
							<span class = "info-value" id = "quantidadeEstoque"></span>
						</p>
					</div>
					
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "label">Disponível para empréstimo?</span>
							<span class = "info-value" id = "disponibilidade"></span>
						</p>
					</div>
				</div>
					
			</div>
		</div>
	</div>
						
	