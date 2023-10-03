
let getAllSections = function(){
	
	let url = "sections";
	$.get(url, function(data){	
		
		alert("Nome: " + data[2].nome);
		
	}, "json");
}
let getAllEditoras = function(){
	
	let url = "editoras";
	$.get(url, function(data){
		
		alert(data);
		
	})
	
}
let getAllAutores = function(){
	
	let url = "autores";
	$.get(url, function(data){
		
		alert(data);
		
	})	
}
let getAllGeneros = function(){
	
	let url = "generos";
	$.get(url, function(data){
		
		alert(data);
		
	})	
}