<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Menu Principal</title>
	<script>
		
		$(document).ready(function(){	
			$("#cardStatus").fadeOut(0);	
			let sessionObject = sessionStorage.getItem("session");
			if(sessionObject){
				let user = JSON.parse(sessionObject);
				console.log(user)
				if(user.id !== "0"){
					let greeting = "Olá, " + user.nome;
					$("#greeter").text(greeting);
				}
				else{
					goto("login.jsp");
				}
			}
			else{
				goto("login.jsp");
			}
		})
	
	</script>
</head>
<body>
	<%@ include file = "components/nav-internal.jsp" %>	
	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3" id = "greeter"></h1>
			</div>
		</div>
		<img alt="arquive - backdrop logo" class = "backdrop-logo" src="img/vendor/logomarca-dark.svg">
		<span class = "notify card-status" id = "cardStatus"></span>		
	</main>
	
	<footer class = "mt-5 py-4 text-center dark-bg main-menu-footer">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>

	<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>