<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	
	<%@ include file = "components/head.jsp" %>
	
	<title>ARQUIVE | Consultar Usuários</title>
	
	<script>
		
		$(document).ready(function(){
			
			getAllUsers();
			
			$("#txtSearchUsers").keyup(function(){
				doSearch();	
			});
			
			$("#txtSearchType").on("change", function(){
				doSearch()
			});
			
		});
		
		let doSearch = function(){
			
			let queryValue = $("#txtSearchUsers").val();
			let queryKey = $("#txtSearchType").find('option').filter(':selected').val()
			$("tbody").empty();
			$("#sem-info-notice").empty();
			
			if(queryValue.trim() != ""){
				getSomeUsers(queryKey, queryValue);
	
			}
			else{
				getAllUsers();
			}	
		}
		
		let getSomeUsers = function(key, value){
			
			getSomeItems("usuarios", key, value, function(usersList){
				
				let usersTableBody = $("tbody");
				if(usersList.length > 0){
					
					render(usersList);
									
				}
				else{
					
					usersTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'> " 
								+ "Nenhum usuário encontrado."
						    + "</span>");
				}
			});
		}
		
		let getAllUsers = function(){
			
			let usersTableBody = $("tbody");
			getAllItems("usuarios", function(usersList){
				
				if(usersList.length > 0){
	
					render(usersList);
									
				}
				else{		
					usersTableBody.append(
							+ "<span class = 'sem-info-notice' id = 'sem-info-notice'>" 
								+ "Não há usuários para mostrar aqui."
						    + "</span>");
				}
			});
		}
		
		let render = function(usersList){
			let usersTable = $("#usersTable");
			for(let i = 0; i < usersList.length; i++){
				
				usersRow = 
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + " onClick='alert(" + usersList[i].nome + ")'>" +
						"<td>" + usersList[i].id + "</td>" +
						"<td>" + usersList[i].nome + "</td>" +
						"<td>" + usersList[i].email + "</td>" +
						"<td>" + usersList[i].telefone + "</td>" +
						"<td>" + usersList[i].nivel + "</td>" +
						"<td>" + usersList[i].acesso + "</td>" +
					"</tr>";
				usersTable.append(usersRow);
			}	
		}
		
	</script>
</head>
<body>

	<%@ include file = "components/nav-internal.jsp" %>	
	<main class = "container-fluid px-0">

		<div class = "container-fluid header-bg my-5 shadow">
			<div class = "container py-5">
				<h1 class = "mt-3">Consultar Usuários</h1>
			</div>
		</div>
				
		<div class = "container mb-5 search-internal-container ">

			<form id = "formSearchUsers">
				
				<label for="txtSearchUsers">Pesquisar:</label>
				<select name = "txtSearchType" id = "txtSearchType">
					<option value = "userName">Por Nome</option>
					<option value = "userLevel">Por Nível</option>
					<option value = "userId">Por Código</option>
				</select>
				<input 
					type = "text" 	
					id = "txtSearchUsers" 
					name = "txtSearchUsers"
					placeholder = "pesquisar..."
				>
			</form>	
			<a class="btn-novo shadow my-4 px-5" type="button" href = "cadastrar-usuario.jsp" target = "_blank">
				+ Novo 
				<ion-icon name="arrow-forward-outline" class = "icon-redirect"></ion-icon>
			</a>			
		</div>
		
		<div class = "container px-5" id = "usersTableContainer">
			<div class = "table-responsive">
				<table id = "usersTable">
				
					<thead>
						<tr>
							<th>Id</th>
							<th>Nome</th>
							<th>Email</th>
							<th>Telefone</th>
							<th>Nível</th>
							<th>Conta</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			
			</div>
		</div>
	</main>
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>