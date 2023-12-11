<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Cadastrar Autor</title>
	
	<script>
	
		$(document).ready(function(){
			grantAccess(["funcionario", "admin"]);
			
			$("#txtImgurl").blur(function(){
				let url = $("#txtImgurl").val();
				$("#capa-container").attr("src",url);
			});
			
			$("#formAutor").submit(function(event){ 
				
				event.preventDefault();
				
				let dataForm = $("#formAutor").serialize();
				let url = "autores";
				
				$.post(url, dataForm, function(data, status){
					
					if(data){
						
						sessionStorage.setItem("novoAutor", JSON.stringify(data));	
						$("#submitAutorStatus").html("<ion-icon name = 'checkmark'></ion-icon>Autor " + data.nome + " adicionado.");

					}
					else{
						$("#submitAutorStatus").text("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
					}	
											
					let timerId = 0;
					if(timerId){
						clearInterval(timer);
					}
					
					$("#submitAutorStatus").fadeIn(1);
					timerId = setTimeout(function(){
					
						$("#submitAutorStatus").fadeOut(200);

					}, 3000);
					
					
				}, "json");
				
				$("#txtOlid").val(null);
				$("#txtNome").val(null);
				$("#txtBio").val(null);
				$("#txtImgUrl").val(null);
				
			});
		});
	
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	

	<main class = "container-fluid px-0">
	
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Autor</h1>
				<p>Use este formulário para adicionar um novo autor.</p>
			</div>
		</div>
		
		<div class = "container px-5">
			
			<form method = "post" id = "formAutor">
				
				<div class = "row my-4">
				
					<div class = "col-md-10 mx-auto">
						<label for = "txtOlid" class = "form-label md-2 mb-0 h4-like">OLID</label>
						 <p class="form-text text-muted mb-4" id = "txtOlidDescription">
					    	Informe o código OLID para o autor caso o possua. Esse código auxiliará no preenchimento dos dados.
					    </p>
						<input type = "text" name = "txtOlid" id = "txtOlid" placeholder = "Código OLID do autor" class = "form-control shadow-sm mb-4 py-2">
					</div>
					<hr>
				</div>
				
				<div class = "row my-4">	
					
					<div class = "col-md-10 mx-auto">
					
						<h4 class = "mb-2">Informações do Autor</h4>
					    <p class="form-text text-muted mb-4">
					    	Informe nesta seção os dados de identificação do autor.
					    </p>
				    
				    </div>
				    
				</div>
				
				<div class = "row my-4">
				
				    <div class = "col"></div>
					<div class = "col-md-7">	
				
						<label for = "txtNome" class = "form-label">Nome</label>
						<input type = "text" name = "txtNome" id = "txtNome" placeholder = "Nome do autor..." class = "form-control shadow-sm mb-4 py-2">

						<label for = "txtBio" class = "form-label">Biografia:</label>
						<textarea rows = "8" name = "txtBio" id = "txtBio" placeholder = "Fale um pouco sobre o autor e seus trabalhos, gêneros etc..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
					</div>
			
					<div class = "col-md-3">
						
						<label for = "txtImgUrl" class = "form-label">Foto:</label>
						<input type = "text" name = "txtImgurl" id = "txtImgurl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da foto..." value = "img/vendor/sem-capa.png">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
					</div>	
					
				    <div class = "col"></div>
				</div>
				<div class = "row mb-5">
					<div class = "col-md-10 mx-auto">	
						<input type = "submit" id = "btnSalvarAutor" value = "Adicionar" class = "btn-gravar shadow my-4">
						<span class = "notify submit-status" id = "submitAutorStatus"></span>									
					</div>
				</div>
			
			</form>
			
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>