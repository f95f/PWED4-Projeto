<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Livros</title>
	
	<script>
		
		$(document).ready(function(){
		
			getAllItems("livros", function(livrosList){
				
				let bookTable = $("#booksTable");
				if(bookTable.length > 0){
					
					for(let i = 0; i < bookTable.length; i++){
						
						bookRow = 
							"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
								"<td> <input class = 'select-checkbox' type = 'checkbox' name = 'autor-'" + bookTable[i].id + "aria-describedby = 'selecionar-column'></td>" +
								"<td>" + bookTable[i].id + "</td>" +
								"<td>" + bookTable[i].isbn + "</td>" +
								"<td>" + bookTable[i].titulo + ' ' + bookTable[i].subtitulo + "</td>" +
								"<td> Autor <td>"	//<td>" + bookTable[i].description + "</td>" +
								"<td>" + bookTable[i].description + "</td>" +
								"<td>" + bookTable[i].editora + "</td>" +
								"<td>" + ((bookTable[i].disponibilidade)? ("Sim") : ("Não")) + "</td>" +
							"</tr>"
						bookTable.append(bookRow);
					}					
				}
				else{
					
					bookTable.append(
							+ "<span class = 'sem-info-notice'>" 
								+ "Não há livros para mostrar aqui."
						    + "</span>");
					
				}
				
			});
			
		})
		
	
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Livros</h1>
			</div>
		</div>
				
		<div class = "container">
			<div class = "row mb-5">
				<div class = "input-group mb-4">						
								
					<input class="btn btn-outline-secondary shadow-sm py-2 px-3 inline-select-button " id = "txtSearch">
	
					<div class="input-group-append">
					
						<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnPesquisar" type="button">Pesquisar</button>
				
					</div>
										
				</div>
			</div>
		</div>
		
		<div class = "container px-5" id = "bookTableContainer">
			<div class = "table-responsive">
				<table id = "booksTable">
				
					<tr>
						<th id = "selecionar-column">Selecionar</th>	<!-- TODO: Style this later -->
						<th>Id</th>
						<th class = "large-width-column">Código ISBN</th>
						<th class = "large-width-column">Título</th>
						<th>Autor</th>
						<th class = "large-width-column">Sinopse</th>
						<th>Editora</th>
						<th>Disponível</th>
					</tr>
				</table>
			
			</div>
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>