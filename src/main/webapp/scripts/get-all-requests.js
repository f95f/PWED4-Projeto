/*
let getAllItems = function(url, callback){
	
	$.get(url, function(data){	
		
		callback(data);
		
	}, "json");
	
}*/
let getAllItems = function(url, callback) {
    $.ajax({
        url: url,
        type: 'GET',
        cache: false, 
        dataType: 'json',
        success: function(data) {
            callback(data);
        }
    });
};
let getSomeItems = function(url, key, value, callback){
	
	//parameter = formData + "action=" + key + "&value=" + value 
	parameter = "action=" + key + "&value=" + value 
	$.get(url, parameter, function(data){	
		
		callback(data);
		
	}, "json");
	
}

let goto = function(url){
	window.location.replace(url);
}
