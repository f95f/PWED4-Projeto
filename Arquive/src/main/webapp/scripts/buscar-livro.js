/**
 * Script para buscar informações de um livro por meio de API
 * através do ISBN informado.
 * 
 * Testes: 9788579622878 9780980200447 0385472579 9780385533225 9782253089889 9789588931623
 * 
 */

$(document).ready(function(){

	$("#txtIsbn").blur(function(){
		
		let livro = $("#txtIsbn").val();
	
		let url = "https://openlibrary.org/api/books?bibkeys=ISBN:" + livro + "&jscmd=data&format=json";
		
		$.get(url, function(response){
			
			$("#txtTitulo").val(response["ISBN:" + livro].title);
			$("#txtAutor").val(response["ISBN:" + livro].authors[0].name);
			$("#txtEditora").val(response["ISBN:" + livro].publishers[0].name);
			$("#txtImgurl").val(response["ISBN:" + livro].cover.large);
			
			$("#capa-container").attr('src', response["ISBN:" + livro].cover.large);
			$("#capa-container").attr('alt', "Capa do livro " + response["ISBN:" + livro].title + ".");
			
		});
		
	});
	
});
