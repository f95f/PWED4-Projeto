<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Gêneros</title>
	
	<script>
		
		$(document).ready(function(){
		
			getAllGenres();
			
			$("#txtSearchGenres").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchGenres").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeGenres(queryKey, queryValue);

			}
			else{
				getAllGenres();
			}	
		}
		
		let getSomeGenres = function(key, value){
			$(".sem-info-notice").remove();
			
			getSomeItems("generos", key, value, function(genresList){
				
				if(genresList.length > 0){
					
					render(genresList);
									
				}
				else{
					
					$("#no-data-notice").append(
						 "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
							+ "Nenhum gênero encontrado."
					    + "</span>");
				}
			});
		}
		
		let getAllGenres = function(){
			$(".sem-info-notice").remove();
			
			getAllItems("generos", function(genresList){
				
				if(genresList.length > 0){
	
					render(genresList);
									
				}
				else{		
					$("#no-data-notice").append(
						 "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
							+ "Não há gêneros para mostrar aqui."
					    + "</span>");
				}
			});
		}
		
		let render = function(genresList){
			let genresTable = $("#genresTable");
			for(let i = 0; i < genresList.length; i++){
				
				genreRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + genresList[i].id + "</td>" +
						"<td>" + genresList[i].nome + "</td>" +
						"<td>" + genresList[i].descr + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'editar' onClick = 'loadGeneroInfo(" + genresList[i].id + ")'" +
								" data-bs-toggle = 'modal' data-bs-target='#editModal'>" +
									"<ion-icon name='create-outline'></ion-icon>" +
								"</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteGenero(" + genresList[i].id + ")'>" + 
								"<ion-icon name='trash-bin-outline'></ion-icon>" +
							"</button>" +
						"</td>" +
					"</tr>";
				genresTable.append(genreRow);	
			}	
		}
		
		let deleteGenero = function(genreId){
			
			$.ajax({
			    url: 'generos?genreId=' + genreId,
			    type: 'DELETE',
			    cache: false,
			    dataType: 'json',
			    success: function(response) {
			        response == 1? alert("ok deletado") : alert("fodeo")
			    },
			    error: function(xhr, status, error) {
					alert(error)		        
			    }
			});
		}
		
		let loadGeneroInfo = function(generoId){

			$.get('generos?action=genreId&value=' + generoId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let genero = {
			    	id: generoId,
		    		nome: data[0].nome,
					descr: data[0].description
			    }
			    sessionStorage.setItem('genre', JSON.stringify(genero));

			    fillData();
			});
			
		}
		$("#editModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("genre");
		}));
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
		
		<div class = "container px-5 search-internal-container ">

			<form id = "formSearchGenres">
				
				<label for="txtSearchGenres">Pesquisar:</label>
				<div class="input-group">
					<div class="input-group-prepend">
					   <select name = "txtSearchType" id = "txtSearchType" class="btn btn-outline-secondary search-select">
							<option value = "genreName">Por Nome</option>
							<option value = "genreDescr" selected>Por Descrição</option>
							<option value = "genreId">Por Código</option>
						</select>
					</div>
				    <input  
						type = "text" 	
						id = "txtSearchGenres" 
						name = "txtSearchGenres"
						placeholder = "pesquisar..."
						class="form-control"
					>
				</div>
			</form>
			<a class = "btn-novo my-4 px-5" type="button" class = "btn-novo shadow my-4 px-5" data-bs-toggle = "modal" data-bs-target="#addGeneroFormModal">+ Novo Gênero</a>	
			
		</div>
		
		<div class = "container px-5" id = "genreTableContainer">
			<div class = "table-responsive">
				<table id = "genresTable">
					<thead>
						<tr>
							<th>Id</th>
							<th>Nome</th>
							<th class = "large-width-column">Descrição</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
				<div id = "no-data-notice"></div>
			</div>
		</div>
	</main>
	
	<div id="addGeneroFormModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/forms/form-cadastrar-genero.jsp" %>

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
						
					<%@ include file = "components/editar-genero.jsp" %>

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