<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Gêneros</title>
	
	<script>
		
		$(document).ready(function(){
		
			getAllItems("generos", function(generosList){
				
				let genresTable = $("#genresTable");
				if(generosList.length > 0){
					
					for(let i = 0; i < generosList.length; i++){
						
						genresRow = 
							"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
								"<td> <input class = 'select-checkbox' type = 'checkbox' name = 'autor-'" + generosList[i].id + "aria-describedby = 'selecionar-column'></td>" +
								"<td>" + generosList[i].id + "</td>" +
								"<td>" + generosList[i].nome + "</td>" +
								"<td>" + generosList[i].descr + "</td>" +
							"</tr>";
							genresTable.append(genresRow);
							
					}					
				}
				else{
					
					genresTable.append(
							+ "<span class = 'sem-info-notice'>" 
								+ "Não há gêneros para mostrar aqui."
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
				<h1 class = "mt-3">Consultar Gêneros</h1>
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
		
		<div class = "container px-5" id = "genreTableContainer">
			<div class = "table-responsive">
				<table id = "genresTable">
				
					<tr>
						<th id = "selecionar-column">Selecionar</th>	<!-- TODO: Style this later -->
						<th>Id</th>
						<th>Nome</th>
						<th class = "large-width-column">Descrição</th>
					</tr>
				</table>
			
			</div>
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>