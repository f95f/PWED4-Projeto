<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Editoras</title>
	
	<script>
		
		$(document).ready(function(){
	
			getAllEditoras();
			
			$("#txtSearchEditoras").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchEditoras").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeEditoras(queryKey, queryValue);

			}
			else{
				getAllEditoras();
			}	
		}
		
		let getSomeEditoras = function(key, value){
			$(".sem-info-notice").remove();
			
			getSomeItems("editoras", key, value, function(editorasList){
				
				if(editorasList.length > 0){
					
					render(editorasList);
									
				}
				else{
					
					$("#no-data-notice").append(
							 "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhuma editora encontrada."
						    + "</span>");
				}
			});
		}
		
		let getAllEditoras = function(){
			$(".sem-info-notice").remove();
			
			getAllItems("editoras", function(editorasList){
				
				if(editorasList.length > 0){
	
					render(editorasList);
									
				}
				else{		
					$("#no-data-notice").append(
							 "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
								+ "Não há editoras para mostrar aqui."
						    + "</span>");
				}
			});
		}
		
		let render = function(editorasList){
			let editorasTable = $("#editorasTable");
			for(let i = 0; i < editorasList.length; i++){
				
				editorasRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + editorasList[i].id + "</td>" +
						"<td>" + editorasList[i].nome + "</td>" +
						"<td>" + editorasList[i].descr + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'editar' onClick = 'loadEditoraInfo(" + editorasList[i].id + ")'" +
								" data-bs-toggle = 'modal' data-bs-target='#editModal'>" +
									"<ion-icon name='create-outline'></ion-icon>" +
								"</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteEditora(" + editorasList[i].id + ")'>" + 
								"<ion-icon name='trash-bin-outline'></ion-icon>" +
							"</button>" +
						"</td>"+
					"</tr>";
				editorasTable.append(editorasRow);
			}	
		}
		
		let deleteEditora = function(editoraId){
			
			$.ajax({
			    url: 'editoras?editoraId=' + editoraId,
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
		
		let loadEditoraInfo = function(editoraId){

			$.get('editoras?action=editoraId&value=' + editoraId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let editora = {
			    	id: editoraId,
		    		nome: data[0].nome,
		    		description: data[0].description
			    }
			    sessionStorage.setItem('editora', JSON.stringify(editora));

			    fillData();
			});
			
		}
		
		$("#editModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("editora");
		}));
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Editoras</h1>
			</div>
		</div>
				
		<div class = "container px-5 search-internal-container ">

			<form id = "formSearchEditoras">
				
				<label for="txtSearchEditoras">Pesquisar:</label><br>
				<div class="input-group">
					<div class="input-group-prepend">
					   <select name = "txtSearchType" id = "txtSearchType" class="btn btn-outline-secondary search-select">
							<option value = "editoraName">Por Nome</option>
							<option value = "editoraDescr" selected>Por Descrição</option>
							<option value = "editoraId">Por Código</option>
						</select>
					</div>
				    <input 
						type = "text" 	
						id = "txtSearchEditoras" 
						name = "txtSearchEditoras"
						placeholder = "pesquisar..."
						class="form-control"
					>
				</div>
			</form>	
			<a class = "btn-novo my-4 px-5" type="button" data-bs-toggle = "modal" data-bs-target="#addEditoraFormModal"> + Nova Editora</a>	
		</div>
		
		<div class = "container px-5" id = "editoraTableContainer">
			<div class = "table-responsive">
				<table id = "editorasTable">
				
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
	
	<div id="addEditoraFormModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/forms/form-cadastrar-editora.jsp" %>

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
						
					<%@ include file = "components/editar-editora.jsp" %>

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