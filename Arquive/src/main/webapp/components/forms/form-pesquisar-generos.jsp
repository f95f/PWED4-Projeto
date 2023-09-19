<%@page import="java.util.ArrayList"%>
<%@page import="classes.models.Genero"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<div class = "container-fluid header-bg mb-5 mt-0 shadow">
	<div class = "container py-4">
		<h1 class = "mt-3">Selecionar Gêneros</h1>
	</div>
</div>

<div class = "container px-5">
	
	<form method = "post" id = "formGenero">
		
		<div class = "row mb-3">
				
			<div class = "col-md-6 mx-auto">
	
				<label for = "txtPesquisar" class = "form-label" aria-hidden = "true">Pesquisar:</label>
				<input type = "text" name = "txtPesquisar" id = "txtPesquisar" placeholder = "Nome do gênero ou categoria..." class = "form-control shadow-sm mb-4 py-2">
	
			</div>
		</div>
		
		<div class = "row">
			<div class = "form-check form-check-inline px-5 mb-5">
							
				<%
					Genero generos = new Genero();
					ArrayList<Genero> listarGeneros = generos.listarGeneros();
					
					for(int i = 0; i < listarGeneros.size(); i++){
			
						out.print(
								
							"<input type= 'checkbox' class = 'btn-check custom-checkbox' autocomplete='off' id = 'chk_" + listarGeneros.get(i).getIdGenero() + "' value=" + listarGeneros.get(i).getIdGenero() + ">" +
							"<label class = 'btn custom-checkbox-label mx-1 my-1' for = 'chk_" + listarGeneros.get(i).getIdGenero() + "'>" + listarGeneros.get(i).getNome() + "</label>"
									
						);
						
					}
				%>
			
		</div>
			
		</div>
	
	</form>
	
</div>