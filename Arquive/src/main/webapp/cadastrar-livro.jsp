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
									
										<a class="btn btn-outline-secondary shadow-sm py-2" role="button" target = "_blank" href = "cadastrar-editora.jsp">Nova Editora</a>
										<% //todo: fazer abrir o formulário em um modal na mesma página %>				
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
						
							<div class = "col-6">
								<label for = "txtGenero" class = "form-label">Gênero</label>
								<input type = "text" name = "txtGenero" id = "txtGenero" placeholder = "Gêneros, separar por vírgula" class = "form-control shadow-sm py-2">		
							</div>
							
							<div class = "col-4">
							
								<label for = "txtDisponibilidade" class = "form-label">Disponibilidade</label>
								<select class="form-select form-control shadow-sm py-2" aria-label="Disponibilidade" id = "txtDisponibilidade" name = "txtDisponibilidade">
								    <option selected value = "1">Disponível para empréstimo</option>
								    <option value="0">Indisponível para empréstimo</option>
								</select>
								
							</div>
							
							<div class = "col">
								<label for = "txtQuantidade" class = "form-label">Quantidade</label>
								<input type = "number" name = "txtQuantidade" id = "txtQuantidade" placeholder = "Quantidade" class = "form-control shadow-sm py-2">		
							</div>							
							
						</div>
						
						<input type = "button" action = "#" id = "btn-salvar-livro" value = "Adicionar" class = "btn-gravar shadow my-4">
						
					</div>
					
					<div class = "col-md-4">
					
						<label for = "txtImgurl" class = "form-label">Capa:</label>
						<input type = "text" name = "txtImgurl" id = "txtImgurl" class = "form-control shadow-sm mb-4 py-2" placeholder = "Url da imagem...">
					
						<img alt="sem capa" src="img/vendor/sem-capa.png" class = "form-control" id = "capa-container">
						
					</div>	
							
				</div>
				
				
			</form>
		
		</div>
	
	</main>
	
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>