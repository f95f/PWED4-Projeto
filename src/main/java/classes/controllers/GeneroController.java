package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Autor;
import classes.models.Genero;
import classes.models.Livro;

@WebServlet("/generos")
public class GeneroController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PrintWriter out;
	private Genero genero = new Genero();

	public GeneroController() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();

		ArrayList<Genero> listGeneros = new ArrayList<Genero>();
		String generosJSON = "[]";
		String parameter = request.getParameter("action");
		
		if(parameter == null) {
			
			listGeneros = genero.listarGeneros();
	
		}
		else if(parameter.equals("genreName")) {
			
			String valor = request.getParameter("value");
			listGeneros = genero.buscarPor("nome", valor);
			
		}
		else if(parameter.equals("genreDescr")) {
			
			String valor = request.getParameter("value");
			listGeneros = genero.buscarPor("descr", valor);
			
		}
		else if(parameter.equals("genreId")) {
			
			String valor = request.getParameter("value");
			listGeneros = genero.buscarPor("id", valor);
			
		}
		
		if(listGeneros.size() != 0) {
			
			generosJSON = "[";
			for(int i = 0; i < listGeneros.size(); i++) {

				generosJSON += "{\"id\": \"" + listGeneros.get(i).getIdGenero() + "\", "
							+	"\"nome\": \"" + listGeneros.get(i).getNome() + "\", "
							+ 	"\"descr\": \"" + listGeneros.get(i).getDescription() + "\" "
							+  "}" + ((i < listGeneros.size() -1)? ", " : "");
			}

			generosJSON += "]";

		}

		out.print(generosJSON);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();

		genero.setNome(request.getParameter("txtNome"));
		genero.setDescription(request.getParameter("txtDescr"));

		genero.salvar();

		out.print("{\"id\": \"" + genero.getIdGenero() + "\", \"nome\": \"" + genero.getNome() + "\", \"descr\": \"" + genero.getDescription() + "\"}");


	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String generoId = request.getParameter("generoId");
		int status = 0;
		
		ArrayList<Genero> generoEncontrado = genero.buscarPor("id", generoId);
		if(generoEncontrado.size() != 0) {
			
			generoEncontrado.get(0).setNome(request.getParameter("txtNome"));
			generoEncontrado.get(0).setDescription(request.getParameter("txtDescription"));
			status = generoEncontrado.get(0).update();
		}
		out.print(status);
	}



	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		out = response.getWriter();
		String genreId = request.getParameter("genreId");
		int status = 0;
		
		ArrayList<Genero> generoEncontrado = genero.buscarPor("id", genreId);
		if(generoEncontrado.size() != 0) {
			status = generoEncontrado.get(0).deletar();
		}
		out.print(status);
		
	}
}
