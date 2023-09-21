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
	<script src="scripts/buscar-livro.js"></script>
	
	<title>ARQUIVE | Cadastrar Livro</title>
	<script type="text/javascript">
		
		$(document).ready(function(){
			
			$("#formLivro").submit(function(event){
				
				event.preventDefault();
				
				let dataForm = $("#formLivro").serialize();
				alert(dataForm);		
				
			});
			
			$("#addEditoraFormModal").ready(function(){
				
				$("#btnSalvarEditora").attr("data-bs-dismiss", "modal");
				
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
			
			$("#addGeneroFormModal").ready(function(){
				
				$("#btnSalvarGenero").attr("data-bs-dismiss", "modal");
				
			});
			$("#addGeneroFormModal").on("hidden.bs.modal", (function(){
				
				let novoObjeto = JSON.parse(sessionStorage.getItem("novoGenero"));
				
				if(novoObjeto !== null){

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

					$("#btnSelecionarGenero").html("Selecionados: " + nomesSelecionados);
					
				}
				else{
					$("#btnSelecionarGenero").html("Clique para selecionar...");
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
				<p>Informe o ISBN. Se disponíveis, as outras informações serão preenchidas automaticamente.</p>
			</div>
		</div>
		
		<div class = "container">
			
			<form action="#" id = "formLivro">
				
				
				<div class = "row">
				
					<div class = "col-md-8">	
				
						<label for = "txtIsbn" class = "form-label">ISBN</label>
						<input type = "text" name = "txtIsbn" id = "txtIsbn" placeholder = "Código de barra ISBN..." class = "form-control shadow-sm mb-4 py-2">
					
						<label for = "txtTitulo" class = "form-label">Título</label>
						<input type = "text" name = "txtTitulo" id = "txtTitulo" placeholder = "Título..." class = "form-control shadow-sm mb-4 py-2">
						
						<label for = "txtSubtítulo" class = "form-label">Subtítulo</label>
						<input type = "text" name = "txtSubtítulo" id = "txtSubtítulo" placeholder = "Subtítulo, se houver..." class = "form-control shadow-sm mb-4 py-2">
													
						<div class = "row mb-4">
						
							<div class = "col">
								<label for = "txtAutor" class = "form-label">Autor</label>
								<select class="form-select form-control shadow-sm py-2" aria-label="Autor" id = "txtAutor" name = "txtAutor">
								
								<%
									Autor autores = new Autor();
									ArrayList<Autor> listAutores = autores.listAutores();
									
									String selected = "selected ";
				
									for(int i = 0; i < listAutores.size(); i++){
										
										if(i > 0){ selected = ""; }
										
										out.print(
											"<option " + selected + "value = " 
											+ listAutores.get(i).getIdAutor() + ">" 
											+ listAutores.get(i).getNome() + " " 
											+ listAutores.get(i).getSobrenome() + 
											"</option>"
										);
										
									}
								%>
								
								</select>
								<a href = "cadastrar-autor.jsp">Novo</a>	

							</div>
							
							<div class = "col-4">
								<label for = "txtEdition" class = "form-label">Edição</label>
								<input type = "text" name = "txtEdition" id = "txtEdition" placeholder = "Edição do exemplar..." class = "form-control shadow-sm mb-4 py-2">
							</div>
							
						</div>
						
						<div class = "row">
						
							<div class = "col">
							
								<label for = "txtEditora" class = "form-label">Editora</label>
							    <div class="input-group mb-3">
							    
									<select class="form-select form-control shadow-sm py-2" id = "txtEditora" name = "txtEditora" aria-label="Selecionar Editora">
									    <%
											Editora editoras = new Editora();
												
											ArrayList<Editora> listEditoras = editoras.listarEditoras();
											String selectedEditora = "";
											
											if(listEditoras.size() == 0){
												
												out.print(
													"<option id = 'optionSemEditora' selected value = -1> " +
														"Nenhuma encontrada!" +	
													"</option>"
												);
												
											}
																					
											for(int i = 0; i < listEditoras.size(); i++){
												
												if(i == listEditoras.size() -1){
													selectedEditora = "selected ";
												}
												
												out.print(
													"<option " + selectedEditora + "value = " + listEditoras.get(i).getIdEditora() + ">" 
														+ listEditoras.get(i).getNome() + 
													"</option>"
												);
												
											}
										%>
									</select>
									
									<div class="input-group-append">
									
										<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarEditora" type="button" data-bs-toggle = "modal" data-bs-target="#addEditoraFormModal">Nova Editora</button>
												
									</div>
								</div>
						
							</div>
							
							<div class = "col-3">
								<label for = "txtAno" class = "form-label">Ano</label>
								<input type = "number" name = "txtAno" id = "txtAno" placeholder = "Ano de publicação..."class = "form-control shadow-sm py-2">		
							</div>
												
							<div class = "col-3">
								<label for = "txtPages" class = "form-label">Páginas</label>
								<input type = "number" name = "txtPages" id = "txtPages" placeholder = "Número de páginas..." class = "form-control shadow-sm mb-4 py-2">
							</div>
							
						</div>
						
						<label for = "txtDescription" class = "form-label">Descrição</label>
						<textarea rows = "4" name = "txtDescription" id = "txtDescription" placeholder = "Descrição..." class = "form-control shadow-sm mb-4 py-2"></textarea>
					
						<div class = "row mb-4">
						
							<div class = "col">
							
								<label for = "btnSelecionarGenero" class = "form-label">Gênero</label>
								<div class = "input-group mb-3">
								
									<button class="btn btn-outline-secondary w-75 shadow-sm py-2 inline-select-button" id = "btnSelecionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#selectGeneroModal">Selecionar... </button>	

									<div class="input-group-append">
									
										<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#addGeneroFormModal">Novo Gênero</button>
												
									</div>
																	
								</div>
							</div>
								
						</div>
						
						<div class = "row mb-4">
							
							<div class = "col">
								<label for = "txtQuantidade" class = "form-label">Quantidade</label>
								<input type = "number" name = "txtQuantidade" id = "txtQuantidade" placeholder = "Quantidade" class = "form-control shadow-sm py-2">		
							</div>							
							
							<div class = "col-4">
							
								<label class="form-label" for="chkDisponibilidadeContainer">Disponibilidade</label>
								<div class="form-check form-switch" id = "chkDisponibilidadeContainer">
								    <input class="form-check-input" type="checkbox" id="chkDisponibilidade" checked>
								    <label class="form-label" for="chkDisponibilidade">Disponível para empréstimo</label>
								</div>
				
							</div>
							
						</div>
						
						<input type = "submit" id = "btn-salvar-livro" value = "Adicionar" class = "btn-gravar shadow my-4">
						
					</div>
					
					<div class = "col-md-4">
					
						<label for = "txtImgurl" class = "form-label">Capa:</label>
						<input type = "text" name = "txtImgurl" id = "txtImgurl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da imagem...">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
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
	</main>
	
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>