<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

	<script type="text/javascript">
		let loadData = function(){
			
			let livro = JSON.parse(sessionStorage.getItem('livro'));
			$("#isbn").html( livro.isbn );
			$("#titulo").html( livro.titulo );
			$("#subtitulo").html( livro.subtitulo );
			$("#idEditora").html( livro.idEditora );
			$("#idSection").html( livro.idSection );
			$("#edition").html( livro.edition );
			$("#quantidadePaginas").html( livro.quantidadePaginas );
			$("#quantidadeEstoque").html( livro.quantidadeEstoque );
			$("#anoPublication").html( livro.anoPublication );
			$("#description").html( livro.description );
			$("#imagemCapa").html( livro.imagemCapa );
			$("#disponibilidade").html( livro.disponibilidade === false? "Não" : "Sim");
				
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
				
				<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
				
			</div>
			
			<div class = "col-md-7 mx-auto">
			
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Título:</span>
						<span class = "info-value" id = "titulo"></span>
					</p>
				</div>
				
				<div class = "row my-4 debug">
					<p class = "info-container">						
						<span class = "info-label">Subtítulo:</span>
						<span class = "info-value" id = "subtitulo"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Autores:</span>
						<span class = "info-value" id = "autores"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">						
						<span class = "info-label">Gêneros:</span>
						<span class = "info-value" id = "generos"></span>
					</p>
				</div>
				
				<div class = "row my-4">
					<p class = "info-container">					
						<span class = "info-label">Ano de Publicação:</span>
						<span class = "info-value" id = "anoPublication"></span>
					</p>
				</div>
			</div>
		</div>
		
		<div class = "row">
			<div class = "col">
			
				<div class = "row my-4">
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "info-label">Sinopse:</span>
							<span class = "info-value" id = "description"></span>
						</p>
					</div>	
				</div>
				
				<div class = "row my-4">
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "info-label">Editora:</span>
							<span class = "info-value" id = "idEditora"></span>
						</p>
					</div>
	
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "info-label">Páginas:</span>
							<span class = "info-value" id = "quantidadePaginas"></span>
						</p>
					</div>

				</div>
				
				
				<div class = "row my-4">
					<div class = "col-md mx-auto">
						<p class = "info-container">						
							<span class = "info-label">Seção:</span>
							<span class = "info-value" id = "idSection"></span>
						</p>
					</div>
	
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "info-label">Edição:</span>
							<span class = "info-value" id = "edition"></span>
						</p>
					</div>
				</div>
				
				<div class = "row my-4">
	
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "info-label">Quantidade em estoque:</span>
							<span class = "info-value" id = "quantidadeEstoque"></span>
						</p>
					</div>
					
					<div class = "col-md mx-auto">
						<p class = "info-container">							
							<span class = "info-label">Disponível para empréstimo?</span>
							<span class = "info-value" id = "disponibilidade"></span>
						</p>
					</div>
				</div>
					
			</div>
		</div>
	</div>
						
	