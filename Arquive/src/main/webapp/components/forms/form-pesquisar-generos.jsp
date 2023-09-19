<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class = "container-fluid mb-5 mt-0 shadow">
	
	<div class = "row header-bg py-3">
		<h1 class = "mt-3 text-center">Selecionar Gêneros</h1>
	</div>

	<div class = "container px-5">
		
		<form method = "post" id = "formBuscarGenero">
			
			<div class = "row mt-5">
					
				<div class = "col-md-10 mx-auto">
								
					<label for = "txtPesquisar" class = "form-label my-2" aria-hidden = "true">Pesquisar:</label>
					<input type = "text" name = "txtPesquisar" id = "txtPesquisar" placeholder = "Nome do gênero ou categoria..." class = "form-control shadow-sm mb-4 py-3">
					
				</div>
			</div>
		</form>
		<form method = "post" id = "formSelecionarGenero">
			<div class = "row my-3">
	
				<div class = "col-md-10 mx-auto">
					<%
						Genero generos = new Genero();
						ArrayList<Genero> listarGeneros = generos.listarGeneros();
						
						for(int i = 0; i < listarGeneros.size(); i++){
				
							out.print(
									
								"<div class = 'form-check my-2'>" +
									"<input type= 'checkbox' class = 'form-check-input' name = 'selectedGeneros[]' id = 'chk_" + listarGeneros.get(i).getIdGenero() + "' value=" + listarGeneros.get(i).getIdGenero() + ">" +
									"<label class = 'form-check-label' for = 'chk_" + listarGeneros.get(i).getIdGenero() + "'>" + listarGeneros.get(i).getNome() + "</label>" + 
								"</div>"
										
							);
							
						}
					%>
							
				</div>
				
			</div>
			
			<div class = "container footer-bg d-flex justify-content-end my-0 mx-3 py-0">

		        <button type="button" class="btn text-white content mx-2 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				<button type="submit" class="btn content mx-2 btn-outline-light" id = "btnSelecionarGeneros" data-bs-dismiss="modal">Adicionar</button>
				
			</div>		
			
		</form>
	</div>
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#formSelecionarGenero").submit(function(event){
			
			event.preventDefault();
			let dataForm = $("#formSelecionarGenero").serialize();
			alert(dataForm);	
			
		});
		
	});

</script>