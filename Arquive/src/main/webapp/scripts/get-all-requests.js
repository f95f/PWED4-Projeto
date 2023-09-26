/***/

let getAllSections = function(){
	
	let url = "section";
	$.get(url, function(data){	
		
		alert(data);
		
	});
	
}