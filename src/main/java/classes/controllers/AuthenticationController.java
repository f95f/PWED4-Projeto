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

@WebServlet("/login")
public class AuthenticationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Usuario usuario;
    private UserSession session;
    private UsuarioService usuarioService = new UsuarioService();
    private PrintWriter out;
    
    public AuthenticationController() { super(); }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		out.print(
				"{\"status\": \"405\","
			  + "\"message\": \"Método errado.\","  
			  + "}"
		  );
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		usuario = new Usuario();
		
		String loginResponse = "";
		String email = request.getParameter("txtUsuario");
		String senha = request.getParameter("txtSenha");
		
		//System.out.println("\n\n > " + request.getParameter("txtUsuario") + "\n\n");
		session = usuarioService.login(email, senha);
		
		loginResponse = "{\"id\": \"" + session.getIdUsuario() + "\","
						   + "\"nome\": \"" + session.getNome() + "\","
						   + "\"nivel\": \"" + session.getIdNivelUsuario() + "\","
						   + "\"status\": \"" + session.getStatus() + "\","
						   + "\"canLogin\": \"" + session.isPodeEntrar() + "\""
					   + "}";
		
		out.print(loginResponse);	
		
	}

}
