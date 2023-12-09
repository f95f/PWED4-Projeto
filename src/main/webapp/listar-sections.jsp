<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Seções</title>
	
	<script>
		
		$(document).ready(function(){
			
			getAllSections();
			
			$("#txtSearchSections").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchSections").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeSections(queryKey, queryValue);
	
			}
			else{
				getAllSections();
			}	
		}
		
		let getSomeSections = function(key, value){
			
			getSomeItems("sections", key, value, function(sectionsList){
				
				let sectionsTableBody = $("tbody");
				if(sectionsList.length > 0){
					
					render(sectionsList);
									
				}
				else{
					
					sectionsTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhuma seção encontrada."
						    + "</span>");
				}
			});
		}
		
		let getAllSections = function(){
			
			let sectionsTableBody = $("tbody");
			getAllItems("sections", function(sectionsList){
				
				if(sectionsList.length > 0){
	
					render(sectionsList);
									
				}
				else{		
					sectionsTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
								+ "Não há seções para mostrar aqui."
						    + "</span>");
				}
			});
		}
		
		let render = function(sectionsList){
			let sectionsTable = $("#sectionsTable");
			for(let i = 0; i < sectionsList.length; i++){
				
				sectionsRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + sectionsList[i].id + "</td>" +
						"<td>" + sectionsList[i].nome + "</td>" +
						"<td>" + sectionsList[i].descr + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'editar' onClick = 'loadSectionInfo(" + sectionsList[i].id + ")'"+
								" data-bs-toggle = 'modal' data-bs-target='#editModal'>Editar</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteSection(" + sectionsList[i].id + ")'>excluir</button>" +
						"</td>"
					"</tr>";
				sectionsTable.append(sectionsRow);
			}	
		}
		
		let deleteSection = function(sectionId){
			
			$.ajax({
			    url: 'sections?sectionId=' + sectionId,
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
		
		let loadSectionInfo = function(sectionId){

			$.get('sections?action=sectionId&value=' + sectionId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let section = {
			    	id: sectionId,
		    		nome: data[0].nome,
		    		description: data[0].descr
			    }
			    sessionStorage.setItem('section', JSON.stringify(section));

			    fillData();
			});
			
		}
		
		$("#editModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("section");
		}));
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Seções</h1>
			</div>
		</div>
		
		<div class = "container mb-5 search-internal-container ">

			<form id = "formSearchSections">
				
				<label for="txtSearchSections">Pesquisar:</label>
				<select name = "txtSearchType" id = "txtSearchType">
					<option value = "sectionName">Por Nome</option>
					<option value = "sectionDescr" selected>Por Descrição</option>
					<option value = "sectionId">Por Código</option>
				</select>
				<input 
					type = "text" 	
					id = "txtSearchSections" 
					name = "txtSearchSections"
					placeholder = "pesquisar..."
				>
			</form>	
			<input type = "submit" value = " + Nova Editora" class = "btn-novo shadow my-4 px-5" data-bs-toggle = "modal" data-bs-target="#addSectionFormModal">		
			
		</div>
		
		<div class = "container px-5" id = "sectionTableContainer">
			<div class = "table-responsive">
				<table id = "sectionsTable">
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
			
			</div>
		</div>
	</main>
	
	<div id="addSectionFormModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/forms/form-cadastrar-section.jsp" %>

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
						
					<%@ include file = "components/editar-section.jsp" %>

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