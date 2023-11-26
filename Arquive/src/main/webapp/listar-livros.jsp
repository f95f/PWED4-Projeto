<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Livros</title>
	
	<script>
		
		$(document).ready(function(){
			
			getAllBooks();
			
			$("#txtSearchBooks").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				 doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchBooks").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeBooks(queryKey, queryValue);

			}
			else{
				getAllBooks();
			}	
		}
		
		let getSomeBooks = function(key, value){
			
			getSomeItems("livros", key, value, function(booksList){
				
				let bookTableBody = $("tbody");
				if(booksList.length > 0){
					
					render(booksList);
									
				}
				else{
					
					bookTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhum livro encontrado."
						    + "</span>");
				}
			});
		}
		
		let getAllBooks = function(){
			let bookTableBody = $("tbody");
			getAllItems("livros", function(booksList){
				
				if(booksList.length > 0){
					render(booksList);				
				}
				else{
					bookTable.append(
							+ "<span class = 'sem-info-notice'>" 
								+ "Não há livros para mostrar aqui."
						    + "</span>"
				    );
				}
			});
		}
		
		let render = function(livrosList){
			let bookTable = $("#booksTable	");
			for(let i = 0; i < livrosList.length; i++){
				
				bookRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + livrosList[i].id + "</td>" +
						"<td>" + livrosList[i].isbn + "</td>" +
						"<td>" + livrosList[i].titulo + ' - ' + livrosList[i].subtitulo + "</td>" +
						"<td> Autor </td>" +
						"<td>" + livrosList[i].description + "</td>" +
						"<td>" + ((livrosList[i].disponibilidade)? ("Sim") : ("Não")) + "</td>" +
					"</tr>"
				bookTable.append(bookRow);
			}		
		}
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
				
		<div class = "container mb-5 search-internal-container ">

			<form id = "formSearchBookss">
				
				<label for="txtSearchBooks">Pesquisar:</label>
				<select name = "txtSearchType" id = "txtSearchType">
					<option value = "bookTitle" selected>Por Título</option>
					<option value = "bookIsbn">Por ISBN</option>
				</select>
				<input 
					type = "text" 	
					id = "txtSearchBooks" 
					name = "txtSearchBooks"
					placeholder = "pesquisar..."
				>
			</form>	
			
			<a class="btn-novo shadow my-4 px-5" type="button" href = "cadastrar-livro.jsp" target = "_blank">
				+ Novo 
				<ion-icon name="arrow-forward-outline" class = "icon-redirect"></ion-icon>
			</a>
		
		</div>
		
		<div class = "container px-5" id = "bookTableContainer">
			<div class = "table-responsive">
				<table id = "booksTable">
					<thead>
						<tr>
							<th>Id</th>
							<th class = "large-width-column">Código ISBN</th>
							<th class = "large-width-column">Título</th>
							<th>Autor</th>
							<th class = "large-width-column">Sinopse</th>
							<th>Disponível</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>