<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Menu Principal</title>
	<script>
		
		$(document).ready(function(){
			
			let user = JSON.parse(sessionStorage.getItem("session"));
			let greeting = "Olá, " + user.nome;
			$("#greeter").text(greeting);
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
	</main>
	
	<footer class = "mt-5 py-4 text-center dark-bg main-menu-footer">
		<p class = "mb-0">&copy; 3026965, 2023</p>
	</footer>
</body>
</html>