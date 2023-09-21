<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<script src="scripts/buscar-livro.js"></script>
	
	<title>ARQUIVE | Identifique-se!</title>
	
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>
	
	<main>
		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
			
				<h1 class = "mt-3">Login</h1>
				<p>Identifique-se.</p>
			
			</div>
		
		</div>
		
		<div class = "container my-5 py-5">
			<form action="get" id = "frmLoginFunc">
			
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtLoginFunc" class = "form-label">Usuário:</label>
						<input type = "text" name = "txtLoginFunc" id = "txtLoginFunc" placeholder = "Nome de usuário..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtSenhaFunc" class = "form-label">Senha:</label>
						<input type = "password" name = "txtSenhaFunc" id = "txtSenhaFunc" placeholder = "Senha" class = "form-control shadow-sm mb-4 py-2">
					
						<input type = "submit" id = "btnLogin" value = "Entrar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
		</div>
		
	</main>

	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>