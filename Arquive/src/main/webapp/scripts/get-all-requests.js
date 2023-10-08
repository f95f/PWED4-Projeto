
let getAllItems = function(url, callback){
	
	$.get(url, function(data){	
		
		callback(data);
		
	}, "json");
	
}
