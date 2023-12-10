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
        },
        error: function(data){
			console.log(data)
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

let grantAccess = function(accessPermitted){
	let sessionObject = sessionStorage.getItem("session");
	let hasAccess = false;
	
	if(sessionObject){
		session = JSON.parse(sessionObject);
		
		for(let i = 0; i < accessPermitted.length; i++){
						
			if (session.nivel === accessPermitted[i]) {
                hasAccess = true;
                break;
            }
		}
		accessPermitted.forEach((nivel) => function(){
			
		});
		if(!hasAccess){
			setTimeout(notify(), 1000);
			goto("main-menu.jsp");
		}
	}
	else{ goto("login.jsp"); }
	return false;
}

let notify = function(){
	$("#cardStatus").html("<ion-icon name = 'close'></ion-icon>Você não tem acesso à essa função.");							
				
	let timerId = 0;
	if(timerId){
		clearInterval(timer);
	}
	
	$("#cardStatus").fadeIn(1);
	timerId = setTimeout(function(){
	
		$("#cardStatus").fadeOut(200);

	}, 3000);
}















