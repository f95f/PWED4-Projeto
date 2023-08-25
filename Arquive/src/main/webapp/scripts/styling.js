/**
 * Script para controle de estilos e animações.
 */

$(document).ready(function(){
	
	let navbar = $("header");
	let navbar_padding = $("#nav-fade-control");
	
	$(window).scroll(function(){
		
		if($(document).scrollTop() > 50){
			navbar.addClass("dark-bg");
			navbar_padding.removeClass("py-4");
			navbar_padding.addClass("py-2");
		}
		else{
			navbar.removeClass("dark-bg");
			navbar_padding.removeClass("py-2");
			navbar_padding.addClass("py-4");			
		}
		
	});
});