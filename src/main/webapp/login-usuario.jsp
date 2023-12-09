<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	<%@ include file = "components/head.jsp" %>
	<meta charset="UTF-8">
	<title>ARQUIVE | Faça seu login</title>
	
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
			<form action="post" id = "frmLoginUser">
			
				<div class = "row">
				
					<div class = "col-md-6 mx-auto">	
				
						<label for = "txtLoginUser" class = "form-label">Usuário:</label>
						<input type = "text" name = "txtLoginUser" id = "txtLoginUser" placeholder = "Nome de usuário..." class = "form-control shadow-sm mb-4 py-2">
		
						<label for = "txtSenhaUser" class = "form-label">Senha:</label>
						<input type = "password" name = "txtSenhaUser" id = "txtSenhaUser" placeholder = "Senha" class = "form-control shadow-sm mb-4 py-2">
					
						<input type = "submit" id = "btnLogin" value = "Entrar" class = "btn-gravar shadow my-4">
					</div>
					
				</div>
			
			</form>
		</div>
		
	</main>

	<%@ include file = "components/footer-internal.jsp" %>
</body>
<script type="text/javascript">

$(document).ready(function(){
	$("#frmLoginUser").on("submit", function(event){
		
		event.preventDefault();
		var url = "login-usuer.jsp";
		var dataForm = $("#frmLoginUser").serialize();
		
		$.post( url, dataForm, function(data, status) {
			alert( "email:"+ data.email + "  \n senha:  " + data.senha);
		}, "json");
		
	});
});

</script>
</html>
