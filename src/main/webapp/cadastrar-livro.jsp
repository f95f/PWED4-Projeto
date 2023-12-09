<%@page import="classes.models.Section"%>
<%@page import="classes.models.Genero"%>
<%@page import="classes.models.Editora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Autor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<% //TODO: Substituir todos os includes do jsp pelo import do js %>
	<script src="scripts/buscar-livro.js"></script>
	
	<title>ARQUIVE | Cadastrar Livro</title>
	<script type="text/javascript">
		
		$(document).ready(function(){
			grantAccess(["funcionario", "admin"])
			
			getAllItems("sections", function(sectionsList){
				
				let sectionOptionElement;
				let option;
				
				if(sectionsList.length > 0){
					
					for(let i = 0; i < sectionsList.length; i++){

						sectionOptionElement = 
							"<option" + ((i == sectionsList.length -1)? " selected " : " ") + "value = " + sectionsList[i].id + ">" 
								+ sectionsList[i].nome + 
							"</option>";
						$("#txtSection").append(sectionOptionElement);
							
					}					
				}
				else{
					sectionOptionElement = 
						"<option id = 'optionSemSection' value = -1> Nenhuma seção encontrada! </option>"
					$("#txtSection").append(sectionOptionElement);
					
				}
				
			});
			getAllItems("editoras", function(editorasList){
				
				let editoraOptionElement;
				if(editorasList.length > 0){
					
					for(let i = 0; i < editorasList.length; i++){
						
						editoraOptionElement = 
							"<option" + ((i == editorasList.length -1)? " selected " : " ") + "value = " + editorasList[i].id + ">" 
								+ editorasList[i].nome + 
							"</option>";
						$("#txtEditora").append(editoraOptionElement);
							
					}					
				}
				else{
					
					editoraOptionElement = 
						"<option id = 'optionSemEditora' value = -1> Nenhuma editora encontrada! </option>"
					$("#txtEditora").append(editoraOptionElement);
					
				}
				
			});
			getAllItems("generos", function(generosList){
				
				let generoElement;
				if(generosList.length > 0){
					
					for(let i = 0; i < generosList.length; i++){
						
						generoElement = 
							"<div class = 'form-check my-2'>" +
								"<input type = 'checkbox' class = 'form-check-input' name = 'selectedGeneros[]' id = 'chk_" + generosList[i].id + "' value=" + generosList[i].id + ">" +
								"<label class = 'form-check-label' for = 'chk_" + generosList[i].id + "'>" + generosList[i].nome + "</label>" + 
							"</div>";
						$("#generoOptionsContainer").append(generoElement);
							
					}					
				}
				else{
					
					generoElement = 
						"<div class = 'text-center my-5 py-3 text-muted background-text' id = 'optionSemGeneros'> Nenhum gênero cadastrado. </div> "
						$("#generoOptionsContainer").append(generoElement);
					
				}
				
			});
			getAllItems("autores", function(autoresList){
				
				let autorElement;
				if(autoresList.length > 0){
					
					for(let i = 0; i < autoresList.length; i++){
						
						autorElement = 
							"<div class = 'form-check my-2'>" +
								"<input type = 'checkbox' class = 'form-check-input' name = 'selectedAutores[]' id = 'chk_" + autoresList[i].id + "' value=" + autoresList[i].id + ">" +
								"<label class = 'form-check-label' for = 'chk_" + autoresList[i].id + "'>" + autoresList[i].nome + "</label>" + 
							"</div>";
						$("#autorOptionsContainer").append(autorElement);
							
					}					
				}
				else{
					
					autorElement = 
						"<div class = 'text-center my-5 py-3 text-muted background-text' id = 'optionSemAutores'> Nenhum Autor cadastrado. </div> "
						$("#autorOptionsContainer").append(autorElement);
					
				}
				
			});
		
			$("#formLivro").submit(function(event){
				
				event.preventDefault();
				
				let dataForm = $("#formLivro").serialize();
				let url = "livros";
				alert(dataForm);
						
				$.post(url, dataForm, function(data, status){
					
					if(data){
						/*
						sessionStorage.setItem("novoLivro", JSON.stringify(data));	
						$("#submitAutorStatus").html("<ion-icon name = 'checkmark'></ion-icon>Autor " + data.nome + " " + data.sobrenome + " adicionado.");
						*/
					}
					else{
						//$("#submitAutorStatus").text("<ion-icon name = 'close'></ion-icon>Erro ao salvar. Por favor, verifique os dados e tente novamente.");							
					}	
						
					alert("a");
					
				}, "json");
				
			});
			
			$("#addEditoraFormModal").on("hidden.bs.modal", (function(){
				
				let objeto = JSON.parse(sessionStorage.getItem("novaEditora"));
				
				if(objeto !== null){
					
					$("#optionSemEditora").remove();

					let option = "<option selected value = " + objeto.id + "> " + objeto.nome + " </option>";
					$("#txtEditora").append(option);
					
				}
				sessionStorage.removeItem("novaEditora");
			}));
			
			$("#addSectionFormModal").on("hidden.bs.modal", (function(){
				
				let objeto = JSON.parse(sessionStorage.getItem("newSection"));
				
				if(objeto !== null){
					
					$("#optionSemSection").remove();

					let option = "<option selected value = " + objeto.id + "> " + objeto.nome + " </option>";
					$("#txtSection").append(option);
					
				}
				sessionStorage.removeItem("newSection");
			}));
			
			$("#addGeneroFormModal").on("hidden.bs.modal", (function(){
				
				let novoObjeto = JSON.parse(sessionStorage.getItem("novoGenero"));
				
				if(novoObjeto !== null){
					
					$("#optionSemGeneros").remove();
					
					let option =
						
						"<div class = 'form-check my-2'>" +
							"<input type = 'checkbox' class = 'form-check-input' name = 'selectedGeneros[]' id = 'chk_" + novoObjeto.id + "' value=" + novoObjeto.id + ">" +
							"<label class = 'form-check-label' for = 'chk_" + novoObjeto.id + "'>" + novoObjeto.nome + "</label>" +
						"</div>"
					;
					
					$("#generoOptionsContainer").append(option);
					
				}
				sessionStorage.removeItem("novoGenero");
				
			})); 
			
			$("#selectGeneroModal").on("hidden.bs.modal", (function(){
				
				let objeto = sessionStorage.getItem("itensSelecionados");
				let nomesSelecionados = sessionStorage.getItem("mostrarItensSelecionados");

				if(objeto !== null){

					$("#generosSelecionados").html("Selecionados: " + nomesSelecionados);
					
				}
				else{
					$("#GenerosSelecionados").html("Nenhum selecionado");
				}
				
				sessionStorage.removeItem("itensSelecionados");
				sessionStorage.removeItem("mostrarItensSelecionados");
				
			}));
			//  /\
			//  ||===> Juntar estas duas funções 
			//  \/
 			$("#selectAutorModal").on("hidden.bs.modal", (function(){
				
				let objeto = sessionStorage.getItem("itensSelecionados");
				let nomesSelecionados = sessionStorage.getItem("mostrarItensSelecionados");

				if(objeto !== null){

					$("#autoresSelecionados").html("Selecionados: " + nomesSelecionados);
					
				}
				else{
					$("#autoresSelecionados").html("Nenhum selecionado");
				}
				
				sessionStorage.removeItem("itensSelecionados");
				sessionStorage.removeItem("mostrarItensSelecionados");
				
			}));
			
		});
		
	</script>
	
</head>
<body>
	
	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">
	
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Cadastrar Livro</h1>
				<p>Informe as informações pertinentes ao livro.</p>
			</div>
		</div>
		
		<div class = "container px-5">
			
			<form action="post" id = "formLivro">
				
				<div class = "row my-4">
				
					<div class = "col-md-10 mx-auto">							
				    
						<label for = "txtIsbn" class = "form-label md-2 mb-0 h4-like">ISBN</label>
					    <p class="form-text text-muted mb-4" id = "txtIsbnDescription">
					    	Informe o código de barra ISBN para o livro. Esse código pode ser encontrado atrás do livro, ou na contra-capa.
					    </p>
						<input type = "text" name = "txtIsbn" id = "txtIsbn" placeholder = "Código ISBN" class = "form-control shadow-sm mb-4 py-2" maxlength = "15" aria-describedby = "txtIsbnDescription">
						
					</div>
					<hr>
				</div>
				
				<div class = "row my-4">	
					
					<div class = "col-md-10 mx-auto">
					
						<h4 class = "mb-2">Informações de Capa</h4>
					    <p class="form-text text-muted mb-4">
					    	Os dados informados nesta seção serão as primeiras informações exibidas ao usuário em pesquisas e na página principal.
					    </p>
				    
				    </div>
				    
				</div>
				
				<div class = "row my-4">	
				
				    <div class = "col"></div>
				    
					<div class = "col-md-7">						
					    
						<label for = "txtTitulo" class = "form-label">Título</label>
						<input type = "text" name = "txtTitulo" id = "txtTitulo" placeholder = "Título do livro" class = "form-control shadow-sm mb-4 py-2" required>
						
						<label for = "txtSubtitulo" class = "form-label">Subtítulo</label>
						<input type = "text" name = "txtSubtitulo" id = "txtSubtitulo" placeholder = "Subtítulo, se houver" class = "form-control shadow-sm mb-4 py-2">
						
						<div class = "row">
						
							<div class = "col-lg">
							
								<label for = "btnSelecionarAutor" class = "form-label">Autor</label>
								<span id = "autoresSelecionados" class = "mb-2 px-2 multi-select-span">Nenhum selecionado.</span>
		
								<div class = "input-group mb-4">						
							
									<button class="btn btn-outline-secondary shadow-sm py-2 px-3 inline-select-button flex-fill" id = "btnSelecionarAutor" type="button" data-bs-toggle = "modal" data-bs-target="#selectAutorModal">Selecionar... </button>	
		
									<div class="input-group-append">
									
										<a class="btn btn-outline-secondary shadow-sm py-2 px-3 inline-add-button" id = "btnAdicionarAutor" type="button" href = "cadastrar-autor.jsp" target = "_blank">
											Novo 
											<ion-icon name="arrow-forward-outline" class = "icon-redirect"></ion-icon>
										</a>
												
									</div>
														
								</div>
							</div>	
			
							<div class = "col-lg">
							
								<label for = "btnSelecionarGenero" class = "form-label">Gêneros</label>
								<span id = "generosSelecionados" class = "mb-2 px-2 multi-select-span">Nenhum selecionado.</span>
		
								<div class = "input-group mb-4">						
							
									<button class="btn btn-outline-secondary shadow-sm py-2 px-3 inline-select-button flex-fill" id = "btnSelecionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#selectGeneroModal">Selecionar... </button>	
		
									<div class="input-group-append">
									
										<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#addGeneroFormModal">Novo</button>
								
									</div>
														
								</div>
							
							</div>
						
						</div>
						
						<label for = "txtDescription" class = "form-label">Descrição</label>
						<textarea rows = "4" name = "txtDescription" id = "txtDescription" placeholder = "Informe uma breve sinopse para o livro..." class = "form-control shadow-sm mb-4 py-2" maxlength = 300></textarea>

					</div>
					
					<div class = "col-md-3">
					
						<label for = "txtImgurl" class = "form-label">Capa:</label>
						<input type = "text" name = "txtImgurl" id = "txtImgurl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da imagem.">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
					</div>	
					<div class = "col"></div>
					<hr>
					
				</div>

				<div class = "row my-4">
					
					<div class = "col-md-10 mx-auto">
					
						<h4 class = "mb-2">Dados de Catálogo</h4>
					    <p class="form-text text-muted mb-4">
					    	Informe aqui os dados técnicos e demais detalhes sobre o livro.
					    </p>
				    
				    </div>
				</div>
				
				<div class = "row my-4">
				
					<div class = "col"></div>		
				
					<div class = "col-md-6">
						
						<label for = "txtEditora" class = "form-label">Editora</label>
					    <div class="input-group mb-3">
					    
							<select class="form-select form-control shadow-sm py-2" id = "txtEditora" name = "txtEditora" aria-label="Selecionar Editora" required>
							</select>
							
							<div class="input-group-append">
							
								<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarEditora" type="button" data-bs-toggle = "modal" data-bs-target="#addEditoraFormModal">Nova Editora</button>
										
							</div>
						</div>
					</div>
							
					<div class = "col-md-2">
						<label for = "txtAno" class = "form-label">Ano</label>
						<input type = "number" name = "txtAno" id = "txtAno" placeholder = "Ano de publicação" class = "form-control shadow-sm py-2" min = 0>		
					</div>
					<div class = "col-md-2">
						<label for = "txtPages" class = "form-label">Páginas</label>
						<input type = "number" name = "txtPages" id = "txtPages" placeholder = "Número de páginas" class = "form-control shadow-sm mb-4 py-2" min = 0>
					</div>
						
					<div class = "col"></div>
					
				</div>
						
				<div class = "row my-4">
					
					<div class = "col"></div>
					
					<div class = "col-md-6">
							
						<label for = "txtSection" class = "form-label">Seção</label>
					    <div class="input-group mb-3">
					    
							<select class="form-select form-control shadow-sm py-2" id = "txtSection" name = "txtSection" aria-label="Selecionar seção" required>
							</select>
							
							<div class="input-group-append">
							
								<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarSection" type="button" data-bs-toggle = "modal" data-bs-target="#addSectionFormModal">Nova Seção</button>
										
							</div>
						</div>
					</div>
					
					<div class = "col-md-2">
						<label for = "txtEdition" class = "form-label">Edição</label>
						<input type = "text" name = "txtEdition" id = "txtEdition" placeholder = "Edição do exemplar..." class = "form-control shadow-sm mb-4 py-2">
					</div>
					
					<div class = "col-md-2">
						<label for = "txtQuantidade" class = "form-label">Quantidade</label>
						<input type = "number" name = "txtQuantidade" id = "txtQuantidade" placeholder = "Quantidade" value = 1 class = "form-control shadow-sm py-2" min = 0>		
					</div>	
					
					<div class = "col"></div>	
										
					<hr>
				</div>
						
				<div class = "row my-4">
				
					<div class = "col-md-10 mx-auto">
								
						<h4 class = "mt-3 mb-2">Disponibilidade</h4>
					    <p id="chkDisponibilidadeDescription" class="form-text text-muted">
							Ao desmarcar esta opção, o livro ficará visível aos usuários, mas não poderá ser reservado para empréstimos.
						</p>
						<div class="form-check form-switch my-4" id = "chkDisponibilidadeContainer">
						    <input class="form-check-input" type="checkbox" id="chkDisponibilidade" name = "chkDisponibilidade" checked aria-describedby = "chkDisponibilidadeDescription">
						    <label class="form-label" for="chkDisponibilidade">Disponibilizar para empréstimo</label>
						</div>
		
					</div>
						
				</div>
				
				<div class = "row my-4">					
					<div class = "col md-10 mx-auto">
						<input type = "submit" id = "btn-salvar-livro" value = "Adicionar Livro" class = "btn-gravar shadow my-4 px-5">			
					</div>
				</div>
				
			</form>
		</div>
		
		
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
		
		
		<div id="addGeneroFormModal" class="modal modal-lg fade" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
				    <div class="modal-body mx-0 my-0 px-0 py-0">
							
						<%@ include file = "components/forms/form-cadastrar-genero.jsp" %>

				    </div>
			    
		    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
						<div class = "d-flex justify-content-end">
						
					        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
					
						</div>		
					</div>
				    
			    </div>
			
			</div>
		</div>
		
		
		<div id="selectGeneroModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
				    <div class="modal-body mx-0 my-0 px-0 py-0">

						<%@ include file = "components/forms/form-pesquisar-generos.jsp" %>
						
				    </div>
			    				    
			    </div>
			
			</div>
		</div>
		
		
		<div id="selectAutorModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
			    <div class="modal-content">
				    <div class="modal-body mx-0 my-0 px-0 py-0">

						<%@ include file = "components/forms/form-pesquisar-autores.jsp" %>
						
				    </div>
			    				    
			    </div>
			
			</div>
		</div>
	</main>
	
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>