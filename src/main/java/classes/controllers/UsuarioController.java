package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.services.UsuarioService;
import classes.models.Autor;
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
		else if(parameter.equals("userLevel")) {
			
			String valor = request.getParameter("value");
			listUsuarios = usuario.buscarPor("nivel", valor);
			
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

		out = response.getWriter();
		
		usuario.setNome(request.getParameter("txtNome") + " " + request.getParameter("txtSobrenome"));
		usuario.setEmail(request.getParameter("txtEmail")); 
		usuario.setTelefone(request.getParameter("txtTelefone")); 
		usuario.setSenha("senha");
		
		String nivelUsuario = request.getParameter("txtAcesso");
		usuario.setIdNivelUsuario(nivelUsuario);
		if(nivelUsuario == "") { nivelUsuario = "Visitante"; }
		String acesso = (request.getParameter("chkStatus") != null)? "Ativo" : "Inativo";
		usuario.setAcesso(acesso);

		int status = usuario.save();
		
		if(status == 1) {
			out.print("{ \"erro\": \" Erro ao salvar usuário. \"}");
			return;
		}
		
	}
	
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String userId = request.getParameter("userId");
		int status = 0;
		
		ArrayList<Usuario> userEncontrado = usuario.buscarPor("id", userId);
		if(userEncontrado.size() != 0) {
			
			userEncontrado.get(0).setNome(request.getParameter("txtNome"));
			userEncontrado.get(0).setEmail(request.getParameter("txtEmail")); 
			userEncontrado.get(0).setTelefone(request.getParameter("txtTelefone")); 
			String nivelUsuario = request.getParameter("txtAcesso");
			if(nivelUsuario == "") { nivelUsuario = "Visitante"; }
			userEncontrado.get(0).setIdNivelUsuario(nivelUsuario);
			String acesso = (request.getParameter("chkStatus") != null)? "Ativo" : "Inativo";
			userEncontrado.get(0).setAcesso(acesso);
			status = userEncontrado.get(0).update();
		}
		out.print(status);
		
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String userId = request.getParameter("userId");
		int status = 0;
		
		ArrayList<Usuario> userEncontrado = usuario.buscarPor("id", userId);
		if(userEncontrado.size() != 0) {
			status = userEncontrado.get(0).deletar();
		}
		out.print(status);
		
	}
}
