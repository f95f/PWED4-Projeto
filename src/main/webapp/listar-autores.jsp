<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
			$(".sem-info-notice").remove();
			
			getSomeItems("autores", key, value, function(autoresList){
				if(autoresList.length > 0){
					
					render(autoresList);
									
				}
				else{
					
					$("#no-data-notice").append(
							 "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhum autor encontrado."
						    + "</span>");
				}
			});
		}
		
		let getAllAuthors = function(){
			$(".sem-info-notice").remove(); 
			
			getAllItems("autores", function(autoresList){
				
				if(autoresList.length > 0){
					
					render(autoresList);
									
				}
				else{
					
					$("#no-data-notice").append(
						 "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
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
						"<td>" + autoresList[i].nome + "</td>" +
						"<td>" + autoresList[i].biografia + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'ver' onClick = 'displayAutorInfo(" + autoresList[i].id + ")' " +
								" data-bs-toggle = 'modal' data-bs-target='#detailsModal'>" + 
								"<ion-icon name='search-outline'></ion-icon>" +
							"</button>" +
							"<button class = 'table-action' value = 'editar' onClick = 'loadAutorInfo(" + autoresList[i].id + ")' " +
								" data-bs-toggle = 'modal' data-bs-target='#editModal'>" +
								"<ion-icon name='create-outline'></ion-icon>" +
							"</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteAutor(" + autoresList[i].id + ")'>" +
								"<ion-icon name='trash-bin-outline'></ion-icon>" +
							"</button>" +
						"</td>" +
					"</tr>";
				autorTable.append(autorRow);	
			}	
		}
		let deleteAutor = function(autorId){
			
			$.ajax({
			    url: 'autores?autorId=' + autorId,
			    type: 'DELETE',
			    cache: false,
			    dataType: 'json',
			    success: function(response) {
			    	location.reload()
			    },
			    error: function(xhr, status, error) {
					alert(error)		        
			    }
			});
		}

		let displayAutorInfo = function(autorId){
			
			$.get('autores?action=authorId&value=' + autorId, function(data, status){
			    if(data.length === 0){
			    	return
			    }
			    data = JSON.parse(data);
			    let autor = {
		    		olid: data[0].olid,
					nome: data[0].nome,
					biografia: data[0].biografia,
					foto: data[0].foto
			    }
			    sessionStorage.setItem('autor', JSON.stringify(autor));
			    loadData();
			});
		}
		
		let loadAutorInfo = function(authorId){

			$.get('autores?action=authorId&value=' + authorId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let autor = {
			    	id: authorId,
		    		nome: data[0].nome,
					olid: data[0].olid,
					biografia: data[0].biografia,
					foto: data[0].foto
			    }
			    sessionStorage.setItem('autor', JSON.stringify(autor));

			    fillData();
			});
			
		}
		
		$("#detailsModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("autor");
		}));
		$("#editModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("autor");
		}));
	
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
				
		<div class = "container search-internal-container ">

			<form id = "formSearchAuthors">
				<label for="txtSearchAuthors">Pesquisar:</label>
				<div class="input-group">
					<div class="input-group-prepend">
					   <select name = "txtSearchType" id = "txtSearchType" class="btn btn-outline-secondary search-select">
							<option value = "authorName" selected>Por Nome</option>
							<option value = "authorOLID">Por OLID</option>
							<option value = "authorId">Por ID</option>
						</select>
					</div>
				    <input 
						type = "text" 	
						id = "txtSearchAuthors" 
						name = "txtSearchAuthors"
						placeholder = "pesquisar..."
						class="form-control"
					>
				</div>
			</form>	
			
			<a class="btn-novo my-4 px-5" type="button" href = "cadastrar-autor.jsp">
				+ Novo 
			</a>	
		
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
							<th class = "actions-column">Ações</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<div id = "no-data-notice"></div>
			</div>
		</div>
	</main>
	
	<div id="detailsModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/detalhes-autor.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
			    
		    </div>
		
		</div>
	</div>
	
	<div id="editModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/editar-autor.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
			    
		    </div>
		
		</div>
	</div>

	<%@ include file = "components/footer-internal.jsp" %>

</body>
</html>