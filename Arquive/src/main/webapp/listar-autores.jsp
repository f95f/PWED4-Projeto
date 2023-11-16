<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Autores</title>
	
	<script>
		
		$(document).ready(function(){
			
			getAllAuthors();
			
			$("#txtSearchAuthors").keyup(function(){
			
				doSearch();
				
			});
			$("#txtSearchType").on("change", function(){
				 doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchAuthors").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeAuthors(queryKey, queryValue);

			}
			else{
				getAllAuthors();
			}	
		}
		
		let getSomeAuthors = function(key, value){
			
			getSomeItems("autores", key, value, function(autoresList){
				
				let autorTableBody = $("tbody");
				if(autoresList.length > 0){
					
					render(autoresList);
									
				}
				else{
					
					autorTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhum autor encontrado."
						    + "</span>");
					
				}
					
			});
			
		}
		
		let getAllAuthors = function(){
			
			let autorTableBody = $("tbody");
			getAllItems("autores", function(autoresList){
				
				if(autoresList.length > 0){
					
					render(autoresList);
									
				}
				else{
					
					autorTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
								+ "Não há autores para mostrar aqui."
						    + "</span>");
					
				}
			});
		}
		
		let render = function(autoresList){
			let autorTable = $("#authorsTable");
			for(let i = 0; i < autoresList.length; i++){
				
				autorRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + autoresList[i].id + "</td>" +
						"<td>" + autoresList[i].olid + "</td>" +
						"<td>" + autoresList[i].nome + ' ' + autoresList[i].sobrenome + "</td>" +
						"<td>" + autoresList[i].biografia + "</td>" +
						"<td> Editar/Excluir </td>" +
					"</tr>";
					autorTable.append(autorRow);
					
			}	
			
		}
	
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Autores</h1>
			</div>
		</div>
				
		<div class = "container mb-5 search-internal-container ">

			<form id = "formSearchAuthors">
				
				<label for="txtSearchAuthors">Pesquisar:</label>
				<select name = "txtSearchType" id = "txtSearchType">
					<option value = "authorName" selected>Por Nome</option>
					<option value = "authorOLID">Por OLID</option>
					<option value = "authorId">Por ID</option>
				</select>
				<input 
					type = "text" 	
					id = "txtSearchAuthors" 
					name = "txtSearchAuthors"
					placeholder = "pesquisar..."
				>
			</form>	
		
		</div>
		
		<div class = "container mx-auto" id = "authorTableContainer">
			<div class = "table-responsive">
				<table id = "authorsTable">
					<thead>
					<tr>
						<th>Id</th>
						<th>OLID</th>
						<th>Nome</th>
						<th class = "large-width-column">Biografia</th>
						<th>Operações</th>
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