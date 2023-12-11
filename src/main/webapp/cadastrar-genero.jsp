<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Cadastrar Gêneros</title>
	
	<script type="text/javascript">
	
		$(document).ready(function(){

			grantAccess(["funcionario", "admin"])
			
		});
	</script>
</head>
<body>
	
	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">
	
		<%@ include file = "components/forms/form-cadastrar-genero.jsp" %>
		
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
</body>
</html>