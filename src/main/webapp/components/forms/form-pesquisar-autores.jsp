<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class = "container-fluid mt-0 shadow">
	
	<div class = "row header-bg py-3">
		<h1 class = "mt-3 text-center">Selecionar Autores</h1>
	</div>

	<form method = "post" id = "formSelecionarAutor">
		<div class = "container px-5">
			<div class = "row mt-3 mb-5">
	
				<div class = "col-md-10 mx-auto" id = "autorOptionsContainer"></div>
				
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
					
				let selectedAuthorsIds = [];
				let displaySelectedAutores = "";
	
				$(':checkbox[name="selectedAutores[]"]:checked').each(function(){
					
					selectedAuthorsIds.push($(this).val());
					
					if(displaySelectedAutores !== ""){
						displaySelectedAutores += ", ";
					}
					
					displaySelectedAutores += $('label[for="' + $(this).attr('id') + '"]').text();
					
				});
					
				displaySelectedAutores += ".";
				sessionStorage.setItem("autoresSelecionados", selectedAuthorsIds);
				sessionStorage.setItem("mostrarAutoresSelecionados", displaySelectedAutores);

				$("#selectAutorModal").modal('hide');
			}
		});
		
	});

</script>




