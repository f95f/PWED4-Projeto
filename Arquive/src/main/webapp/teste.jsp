<%@page import="classes.models.Editora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Autor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<script src="scripts/buscar-livro.js"></script>
	
	<title>tested</title>
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			$("#formEditora").on("submit", (function(event){
				
				event.preventDefault();
				alert("a");		
				
			}));
			$("#formLivro").on("submit", (function(event){
				
				event.preventDefault();
				alert("b");		
				
			}));
		});
		
	</script>
	
</head>
<body>
	
	<%@ include file = "components/nav-internal.jsp" %>	
	
	<main class = "container-fluid px-0">

		<div class = "container my-5 py-5">
			
			<form action="#" id = "formLivro">
			
				<div class = "col">
							
					<label for = "txtEditora" class = "form-label">Editora</label>
				    <div class="input-group mb-3">
				    
						<select class="form-select form-control shadow-sm py-2" aria-label="Editora" id = "txtEditora" name = "txtEditora" placeholder = "Selecione uma editora..." aria-label="Selecionar Editora">
						    <%
								Editora editoras = new Editora();
									
								ArrayList<Editora> listEditoras = editoras.listarEditoras();
								
								for(int i = 0; i < listEditoras.size(); i++){
									
									out.print(
										"<option value = " + listEditoras.get(i).getIdEditora() + ">" 
											+ listEditoras.get(i).getNome() + 
										"</option>"
									);
									
								}
							%>
						</select>
						
						<div class="input-group-append">
						
							<button class="btn btn-outline-secondary shadow-sm py-2" type="button" data-bs-toggle = "modal" data-bs-target="#addEditoraForm">Nova Editora</button>

							<div id="addEditoraModal" class="modal fade" role="dialog">
					
						</div>
					</div>
				
				</div>
				<input type = "submit" id = "btn-salvar-livro" value = "Adicionar" class = "btn-gravar shadow my-4">
						
			</div>
			</form>
			
			<div class = "container">
							<!-- Trigger the modal with a button -->
				<button type="button" class="btn btn-info btn-lg" data-bs-toggle="modal" data-bs-target="#">Open Modal</button>
				
				<!-- Modal -->
				<div id="addEditoraForm" class="modal fade" role="dialog">
				  <div class="modal-dialog">
				
				    <!-- Modal content-->
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title">Modal Header</h4>
				      </div>
				      <div class="modal-body">

						<form method = "post" id = "formEditora">
							
							<div class = "row">
							
								<div class = "col-md-6 mx-auto">	
							
									<label for = "txtNome" class = "form-label">Nome</label>
									<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome da editora..." class = "form-control shadow-sm mb-4 py-2">
					
									<label for = "txtBio" class = "form-label">Descrição</label>
									<textarea rows = "5" name = "txtBio" id = "txtBio" placeholder = "Informação adicional sobre a editora..." class = "form-control shadow-sm mb-4 py-2"></textarea>
								
									<input type = "submit" id = "btnSalvarEditora" value = "Adicionar" class = "btn-gravar shadow my-4" data-dismiss="modal">
								</div>
								
							</div>
						
						</form>

				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				      </div>
				    </div>
				
				  </div>
				</div>
		</div>
	
	</main>
	
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>