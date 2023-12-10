<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class = "container-fluid mt-0 shadow">
	
	<div class = "row header-bg py-3">
		<h1 class = "mt-3 text-center">Selecionar Gêneros</h1>
	</div>

	<div class = "container px-5">
		
		<form method = "post" id = "formBuscarGenero">
			
			<div class = "row mt-5">
					
				<div class = "col-md-10 mx-auto">
								
					<label for = "txtPesquisar" class = "form-label my-2" >Pesquisar:</label>
					<input type = "text" name = "txtPesquisar" id = "txtPesquisar" placeholder = "Nome do gênero ou categoria..." class = "form-control shadow-sm mb-4 py-3" disabled>
					
				</div>
			</div>
			
		</form>
	</div>
	
	<form method = "post" id = "formSelecionarGenero">
		<div class = "container px-5">
			<div class = "row mt-3 mb-5">
	
				<div class = "col-md-10 mx-auto" id = "generoOptionsContainer"></div>
				
			</div>
			<span class = "alert submit-status" id = "selectGenerosStatus">
			</span>	
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
		
		$("#formSelecionarGenero").submit(function(event){
			
			event.preventDefault();
			
			let dataForm = $("#formSelecionarGenero").serialize();
			if(!dataForm){
				
				$("#selectGenerosStatus").html("<ion-icon name = 'close'></ion-icon>Selecione as opções para adicionar.");	
				
				let timerId = 0;
				if(timerId){
					clearInterval(timer);
				}
				
				$("#selectGenerosStatus").fadeIn(1);
				timerId = setTimeout(function(){
				
					$("#selectGenerosStatus").fadeOut(200);

				}, 3000);
				
			}
			else{
			
				let selectedGenresIds = [];
				let displaySelectedGeneros = "";

				$(':checkbox[name="selectedGeneros[]"]:checked').each(function(){
					
					selectedGenresIds.push($(this).val());
					if(displaySelectedGeneros !== ""){
						displaySelectedGeneros += ", ";
					}
					
					displaySelectedGeneros += $('label[for="' + $(this).attr('id') + '"]').text();
					
				});

				displaySelectedGeneros += ".";
				sessionStorage.setItem("generosSelecionados", selectedGenresIds);
				sessionStorage.setItem("mostrarGenerosSelecionados", displaySelectedGeneros);
				$("#selectGeneroModal").modal('hide');
				
			}
			
		});
		
	});

</script>




