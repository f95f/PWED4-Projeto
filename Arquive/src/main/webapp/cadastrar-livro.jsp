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
			
			/*$("#addEditoraFormModal").ready(function(){  ------------------------------->  
				
				$("#btnSalvarEditora").attr("data-bs-dismiss", "modal");
				
			});*/
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
				<p>Informe as informações pertinentes ao livro.</p>
			</div>
		</div>
		
		<div class = "container px-5">
			
			<form action="#" id = "formLivro">
				
				<div class = "row my-4">
				
					<div class = "col-md-10 mx-auto">							
				    
						<label for = "txtIsbn" class = "form-label md-2 mb-0 h4-like">ISBN</label>
					    <p class="form-text text-muted mb-4" id = "txtIsbnDescription">
					    	Informe o código de barra ISBN para o livro. Esse código pode ser encontrado atrás do livro, ou na contra-capa.
					    </p>
						<input type = "text" name = "txtIsbn" id = "txtIsbn" placeholder = "" class = "form-control shadow-sm mb-4 py-2" maxlength = "15" aria-describedby = "txtIsbnDescription">
						
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
						<input type = "text" name = "txtTitulo" id = "txtTitulo" placeholder = "Título do livro." class = "form-control shadow-sm mb-4 py-2" required>
						
						<label for = "txtSubtítulo" class = "form-label">Subtítulo</label>
						<input type = "text" name = "txtSubtítulo" id = "txtSubtítulo" placeholder = "Subtítulo, se houver." class = "form-control shadow-sm mb-4 py-2">
						
						<label for = "txtAutor" class = "form-label">Autor</label>
						<select class="form-select form-control shadow-sm py-2 mb-4" aria-label="Autor" id = "txtAutor" multiple 	name = "txtAutor[]" required>
						
							<%
							Autor autores = new Autor();
							ArrayList<Autor> listAutores = autores.listAutores();
		
							for(int i = 0; i < listAutores.size(); i++){
								
								out.print(
									"<option " + ((i == 0)? "selected " : null) + "value = " 
									+ listAutores.get(i).getIdAutor() + ">" 
									+ listAutores.get(i).getNome() + " " 
									+ listAutores.get(i).getSobrenome() + 
									"</option>"
								);	
								
							}
							%>
						
						</select>
			
						
						
						
						
						
						
						
						
						
						
						
						<%/*
						<label for = "txtAutor" class = "form-label">Autor</label>
						<select class="form-select form-control shadow-sm py-2 mb-4" aria-label="Autor" id = "txtAutor" name = "txtAutor" required>
						
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
						% >
						
						</select>	
						*/%>							
						
						<label for = "txtDescription" class = "form-label">Descrição</label>
						<textarea rows = "4" name = "txtDescription" id = "txtDescription" placeholder = "Informe uma breve sinopse para o livro..." class = "form-control shadow-sm mb-4 py-2" maxlength = 300></textarea>
					
						<label for = "btnSelecionarGenero" class = "form-label">Gêneros:</label>
						<div class = "input-group mb-4">
						
							<button class="btn btn-outline-secondary w-75 shadow-sm py-2 inline-select-button" id = "btnSelecionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#selectGeneroModal">Selecionar... </button>	

							<div class="input-group-append">
							
								<button class="btn btn-outline-secondary shadow-sm py-2 inline-add-button" id = "btnAdicionarGenero" type="button" data-bs-toggle = "modal" data-bs-target="#addGeneroFormModal">Novo Gênero</button>
										
							</div>
												
						</div>
					</div>
					
					<div class = "col-md-3">
					
						<label for = "txtImgurl" class = "form-label">Capa:</label>
						<input type = "text" name = "txtImgurl" id = "txtImgurl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da imagem.">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
					</div>	
					<div class = "col"></div>
					<hr>
					
				</div>
					<% // d-flex  justify-content-center align-items-center  %>
				<div class = "row my-4">
					
					<div class = "col-md-10 mx-auto">
					
						<h4 class = "mb-2">Dados de Catálogo</h4>
					    <p class="form-text text-muted mb-4">
					    	Informe aqui os dados técnicos e demais detalhes sobre o livro.
					    </p>
				    
				    </div>
				</div>
					<% // d-flex  justify-content-center align-items-center  %>
				<div class = "row my-4">
				
					<div class = "col"></div>		
				
					<div class = "col-md-6">
						
						<label for = "txtEditora" class = "form-label">Editora</label>
					    <div class="input-group mb-3">
					    
							<select class="form-select form-control shadow-sm py-2" id = "txtEditora" name = "txtEditora" aria-label="Selecionar Editora" required>
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
						    <input class="form-check-input" type="checkbox" id="chkDisponibilidade" checked aria-describedby = "chkDisponibilidadeDescription">
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