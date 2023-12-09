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
					"<tr" + ((i % 2)? (" class = 'even-row' ") : ("")) + ">" +
						"<td>" + usersList[i].id + "</td>" +
						"<td>" + usersList[i].nome + "</td>" +
						"<td>" + usersList[i].email + "</td>" +
						"<td>" + usersList[i].telefone + "</td>" +
						"<td>" + usersList[i].nivel + "</td>" +
						"<td>" + usersList[i].acesso + "</td>" +
						"<td>" + 
							"<button class = 'table-action' value = 'ver' onClick = 'displayUserInfo(" + usersList[i].id + ")' " +
								" data-bs-toggle = 'modal' data-bs-target='#detailsModal'>ver</button>" +
							"<button class = 'table-action' value = 'editar' onClick = 'loadUserInfo(" + usersList[i].id + ")' " +
								" data-bs-toggle = 'modal' data-bs-target='#editModal'>Editar</button>" +
							"<button class = 'table-action' value = 'excluir' onClick = 'deleteUser(" + usersList[i].id + ")'>excluir</button>" +
						"</td>"
					"</tr>";
				usersTable.append(usersRow);
			}	
		}
		
		let deleteUser = function(userId){
			
			$.ajax({
			    url: 'usuarios?userId=' + userId,
			    type: 'DELETE',
			    cache: false,
			    dataType: 'json',
			    success: function(response) {
			        response == 1? alert("ok deletado") : alert("fodeo")
			    },
			    error: function(xhr, status, error) {
					alert(error)		        
			    }
			});
		}
		let displayUserInfo = function(userId){

			$.get('usuarios?action=userId&value=' + userId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let user = {
		    		nome: data[0].nome,
					email: data[0].email,
					telefone: data[0].telefone,
					nivel: data[0].nivel, 
					acesso: data[0].acesso,
			    }
			    sessionStorage.setItem('user', JSON.stringify(user));

			    loadData();
			});
			
		}
		let loadUserInfo = function(userId){

			$.get('usuarios?action=userId&value=' + userId, function(data, status){
			    if(!data){
			    	return;
			    }
			    data = JSON.parse(data);
			    let user = {
			    	id: userId,
		    		nome: data[0].nome,
					email: data[0].email,
					telefone: data[0].telefone,
					nivel: data[0].nivel, 
					acesso: data[0].acesso,
			    }
			    sessionStorage.setItem('user', JSON.stringify(user));

			    fillData();
			});
			
		}
		$("#detailsModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("user");
		}));
		$("#editModal").on("hidden.bs.modal", (function(){
			sessionStorage.removeItem("user");
		}));
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
							<th>Ações</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			
			</div>
		</div>
	</main>
	
	<div id="detailsModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/detalhes-usuarios.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
			    
		    </div>
		
		</div>
	</div>
		
	<div id="editModal" class="modal modal-lg fade" role="dialog">
		<div class="modal-dialog">
		    <div class="modal-content">
			    <div class="modal-body mx-0 my-0 px-0 py-0">
						
					<%@ include file = "components/editar-usuario.jsp" %>

			    </div>
		    
	    		<div class = "container-fluid footer-bg py-3 px-0 mx-0 my-0">
					<div class = "d-flex justify-content-end">
					
				        <button type="button" class="btn text-white mx-5 btn-fechar-modal" data-bs-dismiss="modal">Cancelar</button>
				
					</div>		
				</div>
			    
		    </div>
		
		</div>
	</div>
	<%@ include file = "components/footer-internal.jsp" %>
	
</body>
</html>