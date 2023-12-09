<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Livros</title>
	
	<script>
		
		$(document).ready(function(){
			
			getAllBooks();
			
			$("#txtSearchBooks").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				 doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchBooks").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeBooks(queryKey, queryValue);

			}
			else{
				getAllBooks();
			}	
		}
		
		let getSomeBooks = function(key, value){
			
			getSomeItems("livros", key, value, function(booksList){
				
				let bookTableBody = $("tbody");
				if(booksList.length > 0){
					
					render(booksList);
									
				}
				else{
					
					bookTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhum livro encontrado."
						    + "</span>");
				}
			});
		}
		
		let getAllBooks = function(){
			let bookTableBody = $("tbody");
			getAllItems("livros", function(booksList){
				
				if(booksList.length > 0){
					render(booksList);				
				}
				else{
					bookTable.append(
							+ "<span class = 'sem-info-notice'>" 
								+ "NÃ£o hÃ¡ livros para mostrar aqui."
						    + "</span>"
				    );
				}
			});
		}
		
		let render = function(livrosList){
			let bookTable = $("#booksTable	");
			for(let i = 0; i < livrosList.length; i++){
				
				bookRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + livrosList[i].id + "</td>" +
						"<td>" + livrosList[i].isbn + "</td>" +
						"<td>" + livrosList[i].titulo + ' - ' + livrosList[i].subtitulo + "</td>" +
						"<td> Autor </td>" +
						"<td>" + livrosList[i].idSection + "</td>" +
						"<td>" + ((livrosList[i].disponibilidade)? ("Sim") : ("NÃ£o")) + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'ver' onClick = 'displayBookInfo(" + livrosList[i].id + ")' " +
								" data-bs-toggle = 'modal' data-bs-target='#detailsModal'>ver</button>" +
							"<button class = 'table-action' value = 'editar' onClick = 'loadBookInfo(" + livrosList[i].id + ")'>editar</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteBook(" + livrosList[i].id + ")'>excluir</button>" +
						"</td>"
					"</tr>"
				bookTable.append(bookRow);
			}		
		}
		
		let displayBookInfo = function(bookId){

			$.get('livros?action=id&value=' + bookId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let livro = {
		    		isbn: data[0].isbn,
					titulo: data[0].titulo,
					subtitulo: data[0].subtitulo,
					idEditora: data[0].idEditora,
					idSection: data[0].idSection,
					edition: data[0].edition,
					quantidadePaginas: data[0].quantidadePaginas,
					quantidadeEstoque: data[0].quantidadeEstoque,
					anoPublication: data[0].anoPublication,
					description: data[0].description,
					imagemCapa: data[0].imagemCapa,
					disponibilidade: data[0].disponibilidade
			    }
			    sessionStorage.setItem('livro', JSON.stringify(livro));
			    loadData();
			});
			
		}

		let deleteBook = function(bookId){
		
			$.ajax({
		   		url: 'livros?bookId=' + bookId,
			    type: 'DELETE',
			    cache: false,
			    dataType: 'json',
			    success: function(response) {
			        response == 1? alert("ok deletado") : alert("fodeo")
			    },
			    error: function(xhr, status, error) {
					alert(error)		        
			    }
			});

		}
		
		let loadBookInfo = function(bookId){
			$.get('livros?action=idlivro&value=' + bookId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let livro = {
			    	id: bookId,
			    	isbn: data[0].isbn,
		    		titulo: data[0].titulo,
		    		subtitulo: data[0].subtitulo,
		    		description: data[0].description,
		    		imgUrl: data[0].imgUrl,
		    		edition: data[0].edition,
		    		anoPublication: data[0].anoPublication,
		    		pageCount: data[0].pageCount,
		    		estoque: data[0].estoque,
		    		disponibilidade: data[0].disponibilidade
			    }
			    sessionStorage.setItem('livro', JSON.stringify(livro));

			    window.open("editar-livro.jsp", "_blank");
			});
			
		}
		
		$("#detailsModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("livro");
		}));

	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Livros</h1>
			</div>
		</div>
				
		<div class = "container mb-5 search-internal-container ">

			<form id = "formSearchBookss">
				
				<label for="txtSearchBooks">Pesquisar:</label>
				<select name = "txtSearchType" id = "txtSearchType">
					<option value = "bookTitle" selected>Por Título</option>
					<option value = "bookIsbn">Por ISBN</option>
				</select>
				<input 
					type = "text" 	
					id = "txtSearchBooks" 
					name = "txtSearchBooks"
					placeholder = "pesquisar..."
				>
			</form>	
			
			<a class="btn-novo shadow my-4 px-5" type="button" href = "cadastrar-livro.jsp" target = "_blank">
				+ Novo 
				<ion-icon name="arrow-forward-outline" class = "icon-redirect"></ion-icon>
			</a>
		
		</div>
		
		<div class = "container px-5" id = "bookTableContainer">
			<div class = "table-responsive">
				<table id = "booksTable">
					<thead>
						<tr>
							<th>Id</th>
							<th class = "large-width-column">Código ISBN</th>
							<th class = "large-width-column">Título</th>
							<th>Autor</th>
							<th class = "large-width-column">Seção</th>
							<th>Disponível</th>
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>

			</div>
		</div>

	</main>
	
	<div id="detailsModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/detalhes-livro.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
			    
		    </div>
		
		</div>
	</div>
	
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>
