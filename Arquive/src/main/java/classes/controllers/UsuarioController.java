package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Services.UsuarioService;
import classes.models.Usuario;

@WebServlet("/usuarios")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Usuario usuario = new Usuario();
	private UsuarioService usuarioService = new UsuarioService(); 
	private PrintWriter out;
       
    public UsuarioController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		ArrayList<Usuario> listUsuarios = new ArrayList<Usuario>();
		
		String usuariosJSON = "[]";
		String parameter = request.getParameter("action");
		
		if(parameter == null) {
			
			listUsuarios = usuario.listUsuarios();
	
		}
		else if(parameter.equals("userName")) {
			
			String valor = request.getParameter("value");
			listUsuarios = usuario.buscarPor("nome", valor);
			
		}
		else if(parameter.equals("userEmail")) {
			
			String valor = request.getParameter("value");
			listUsuarios = usuario.buscarPor("email", valor);
			
		}
		else if(parameter.equals("userTelefone")) {
			
			String valor = request.getParameter("value");
			listUsuarios = usuario.buscarPor("telefone", valor);
			
		}
		else if(parameter.equals("userId")) {
			
			String valor = request.getParameter("value");
			listUsuarios = usuario.buscarPor("id", valor);
			
		}
		if(listUsuarios.size() != 0) {
			
			usuariosJSON = "[";
			for(int i = 0; i < listUsuarios.size(); i++) {

				usuariosJSON += "{\"id\": \"" + listUsuarios.get(i).getIdUsuario() + "\", "
							+	"\"email\": \"" + listUsuarios.get(i).getEmail() + "\", "
							+	"\"nome\": \"" + listUsuarios.get(i).getNome() + "\", "
							+ 	"\"nivel\": \"" + listUsuarios.get(i).getIdNivelUsuario() + "\", "
							+ 	"\"acesso\": \"" + listUsuarios.get(i).getAcesso() + "\", "
							+	"\"telefone\": \"" + listUsuarios.get(i).getTelefone() + "\" "
							+  "}" + ((i < listUsuarios.size() -1)? ", " : "");

			}

			usuariosJSON += "]";

		}
		out.print(usuariosJSON);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		usuario.setNome(request.getParameter("txtNome"));
		usuario.setEmail(request.getParameter("txtEmail"));
		usuario.setSenha("senha");
		
		String nivelUsuario = request.getParameter("txtNivel");
		usuario.setIdNivelUsuario(nivelUsuario);
		if(nivelUsuario == "") { nivelUsuario = "Cliente"; }
		
		String acesso = request.getParameter("chkAcesso");
		if(acesso == "") { acesso = "Ativo"; }
		usuario.setAcesso(acesso);
		
		usuario.setTelefone(request.getParameter("txtTelefone"));
		
		System.out.println("\n > " + usuario.getNome());
		System.out.println("\n > " + usuario.getEmail());
		System.out.println("\n > " + usuario.getTelefone());
		System.out.println("\n > " + usuario.getIdNivelUsuario());
		System.out.println("\n > " + usuario.getAcesso());
		
		int status = usuario.save();
		
		if(status == 1) {
			out.print("{ \"erro\": \" Erro ao salvar usuário. \"}");
			return;
		}
		
		Usuario usuarioNovo = usuarioService.buscarNovo(usuario.getEmail());
		
		out.print(
			"{\"id\": \"" + usuarioNovo.getIdUsuario() 
			+ "\", \"nome\": \"" + usuarioNovo.getNome() 
			+ "\", \"email\": \"" + usuarioNovo.getEmail() 
			+ "\", \"telefone\": \"" + usuarioNovo.getTelefone()
			+ "\", \"nivel\": \"" + usuarioNovo.getIdNivelUsuario()
			+ "\", \"acesso\": \"" + usuarioNovo.getAcesso()
		+ "}");
		
	}
}
