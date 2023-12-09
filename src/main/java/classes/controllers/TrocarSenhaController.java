package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.services.UsuarioService;
import classes.models.UserSession;
import classes.models.Usuario;

@WebServlet("/trocar-senha")
public class TrocarSenhaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Usuario usuario;
    private UserSession session;
    private UsuarioService usuarioService = new UsuarioService();
    private PrintWriter out;
    
    public TrocarSenhaController() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		out.print(
				"{\"status\": \"405\","
			  + "\"message\": \"Método Incorreto.\","  
			  + "}"
		  );
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		usuario = new Usuario();
		
		String status = "";
		String idLogado = request.getParameter("idLogado");
		String senhaAtual = request.getParameter("txtSenhaAtual");
		String senhaNova = request.getParameter("txtSenhaNova");
		String senhaConfirmar = request.getParameter("txtSenhaConfirmar");
		
		status = usuarioService.trocarSenha(idLogado, senhaAtual, senhaNova, senhaConfirmar);
		
		out.print(status);	
		
	}

}
