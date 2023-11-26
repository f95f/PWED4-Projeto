<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<script>

	$(document).ready(function(){

		$("#formGenero").submit(function(event){ 
			
			event.preventDefault();
			
			let dataForm = $("#formGenero").serialize();
			let url = "generos";
			
			$.post(url, dataForm, function(data, status){
				
				if(data){
					
					sessionStorage.setItem("novoGenero", JSON.stringify(data));	
					$("#submitGeneroStatus").html("<ion-icon name = 'checkmark'></ion-icon>Gênero " + data.nome + " adicionado.");

				}
				else{
					$("#submitGeneroStatus").text("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
				}	
										
				let timerId = 0;
				if(timerId){
					clearInterval(timer);
				}
				
				$("#submitGemeroStatus").fadeIn(1);
				timerId = setTimeout(function(){
				
					$("#submitGeneroStatus").fadeOut(200);

				}, 3000);
				
			}, "json");
			
			$("#txtNome").val(null);
			$("#txtDescr").val(null);
		});
	});

</script>
<div class = "container-fluid header-bg mb-5 shadow">
	<div class = "container py-5">
		<h1 class = "mt-3">Cadastrar Gêneros</h1>
		<p>Use este formulário para adicionar um novo gênero ou uma nova categoria de livros.</p>
	</div>
</div>

<div class = "container w-75">
	
	<form method = "post" id = "formGenero">
		
		<div class = "row">
		
			<div class = "col">
		
				<label for = "txtNome" class = "form-label">Nome</label>
				<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do gênero ou categoria" class = "form-control shadow-sm mb-4 py-2" required>

				<label for = "txtDescr" class = "form-label">Descrição:</label>
				<textarea rows = "5" name = "txtDescr" id = "txtDescr" placeholder = "Fale um pouco sobre este gênero ou categoria..." class = "form-control shadow-sm mb-4 py-2"  maxlength = 300></textarea>
			
			</div>
			
		</div>
		<div class = "row mb-5">
		
			<div class = "col-sm">	
				<input type = "submit" id = "btnSalvarGenero" value = "Adicionar" class = "btn-gravar shadow my-4">
				<span class = "notify submit-status" id = "submitEditoraStatus"></span>									
			</div>	
		
		</div>
	</form>
	
</div>