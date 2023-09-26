/***/

let getAllEditoras = function(){
	
	let url = "section";
	$.get(url, function(data){	
		
		alert(data);
		
	}, "JSON");
	
}