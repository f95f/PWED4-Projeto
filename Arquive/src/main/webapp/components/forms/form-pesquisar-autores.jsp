<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Autor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class = "container-fluid mt-0 shadow">
	
	<div class = "row header-bg py-3">
		<h1 class = "mt-3 text-center">Selecionar Autores</h1>
	</div>

	<div class = "container px-5">
		
		<form method = "post" id = "formBuscarAutor">
			
			<div class = "row mt-5">
					
				<div class = "col-md-10 mx-auto">
								
					<label for = "txtPesquisar" class = "form-label my-2" >Pesquisar:</label>
					<input type = "text" name = "txtPesquisar" id = "txtPesquisar" placeholder = "Nome do autor..." class = "form-control shadow-sm mb-4 py-3" disabled>
					
				</div>
			</div>
			
		</form>
	</div>
	
	<form method = "post" id = "formSelecionarAutor">
		<div class = "container px-5">
			<div class = "row mt-3 mb-5">
	
				<div class = "col-md-10 mx-auto" id = "generoOptionsContainer">
				
					<%
						Autor autores = new Autor();
						ArrayList<Autor> listarAutores = autores.listarAutores();
						
						for(int i = 0; i < listarAutores.size(); i++){
				
							out.print(
									
								"<div class = 'form-check my-2'>" +
									"<input type = 'checkbox' class = 'form-check-input' name = 'selectedAutores[]' id = 'chk_" + listarAutores.get(i).getIdAutor() + "' value=" + listarAutores.get(i).getIdAutor() + ">" +
									"<label class = 'form-check-label' for = 'chk_" + listarAutores.get(i).getIdAutor() + "'>" + listarAutores.get(i).getNome() + " " + listarAutores.get(i).getSobrenome() +  "</label>" + 
								"</div>"
										
							);
							
						}
					%>
							
				</div>
				
			</div>
			<span class = "alert submit-status" id = "selectAutoresStatus"></span>
			
		</div>
		<div class = "row footer-bg d-flex justify-content-end mt-3 py-3">			
		
			 <div class = "container-fluid d-flex justify-content-end">

		        <button type="button" class="btn text-white content mx-2 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				<button type="submit" class="btn content mx-2 btn-outline-light" id = "btnSelecionarGeneros">Adicionar</button>
				
			</div>
		</div>
		
	</form>
	
</div>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#formSelecionarAutor").submit(function(event){
			
			event.preventDefault();
			
			let dataForm = $("#formSelecionarAutor").serialize();
			if(!dataForm){
				
				$("#selectAutoresStatus").html("<ion-icon name = 'close'></ion-icon>Selecione as opções para adicionar.");	
				
				let timerId = 0;
				if(timerId){
					clearInterval(timer);
				}
				
				$("#selectAutoresStatus").fadeIn(1);
				timerId = setTimeout(function(){
				
					$("#selectAutoresStatus").fadeOut(200);

				}, 3000);
			}
			else{
					
				sessionStorage.setItem("itensSelecionados", dataForm);
				
				let displaySelectedAutores = "";
	
				$(':checkbox[name="selectedAutores[]"]:checked').each(function(){
					
					if(displaySelectedAutores !== ""){
						displaySelectedAutores += ", ";
					}
					
					displaySelectedAutores += $('label[for="' + $(this).attr('id') + '"]').text();
					
				});
					
				displaySelectedAutores += ".";
				sessionStorage.setItem("mostrarItensSelecionados", displaySelectedAutores);
				

				$("#selectAutorModal").modal('hide');
			}
		});
		
	});

</script>




