/**
 * Script para buscar informações de um livro por meio de API
 * através do ISBN informado.
 * 
 * 
 */

$(document).ready(function(){

	$("#txtIsbn").blur(function(){
		let testBook = 9780980200447;
		let livro = $("#txtIsbn").val();
	
		let url = "https://openlibrary.org/api/books?bibkeys=ISBN:" + livro + "&jscmd=data&format=json";
		
		$.get(url, function(response){
			
			$("#txtTitulo").val(response["ISBN:" + livro].title);
			$("#txtAutor").val(response["ISBN:" + livro].authors[0].name);
			$("#txtEditora").val(response["ISBN:" + livro].publishers[0].name);
		});
		
	});
	
});
