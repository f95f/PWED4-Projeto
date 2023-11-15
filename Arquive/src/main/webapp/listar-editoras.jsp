<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Editoras</title>
	
	<script>
		
		$(document).ready(function(){
		
			getAllItems("editoras", function(editorasList){
				
				let editorasTable = $("#editorasTable");
				if(editorasList.length > 0){
					
					for(let i = 0; i < editorasList.length; i++){
						
						editorasRow = 
							"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
								"<td> <input class = 'select-checkbox' type = 'checkbox' name = 'autor-'" + editorasList[i].id + "aria-describedby = 'selecionar-column'></td>" +
								"<td>" + editorasList[i].id + "</td>" +
								"<td>" + editorasList[i].nome + "</td>" +
								"<td>" + editorasList[i].descr + "</td>" +
							"</tr>";
						editorasTable.append(editorasRow);
							
					}					
				}
				else{
					
					editorasTable.append(
							+ "<span class = 'sem-info-notice'>" 
								+ "Não há editoras para mostrar aqui."
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
				<h1 class = "mt-3">Consultar Editoras</h1>
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
		
		<div class = "container px-5" id = "editoraTableContainer">
			<div class = "table-responsive">
				<table id = "editorasTable">
				
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