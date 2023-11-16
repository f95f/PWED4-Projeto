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

@WebServlet("/autores")
public class AutorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Autor autor = new Autor();
    private PrintWriter out;

    public AutorController() {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		ArrayList<Autor> listAutores = new ArrayList<Autor>();
		
		String autoresJSON = "[]";
		String parameter = request.getParameter("action");
		
		if(parameter == null) {
			
			listAutores = autor.listarAutores();
	
		}
		else if(parameter.equals("authorName")) {
			
			String valor = request.getParameter("value");
			listAutores = autor.buscarPor("nome", valor);
			
		}
		else if(parameter.equals("authorOLID")) {
			
			String valor = request.getParameter("value");
			listAutores = autor.buscarPor("olid", valor);
			
		}
		else if(parameter.equals("authorId")) {
			
			String valor = request.getParameter("value");
			listAutores = autor.buscarPor("id", valor);
			
		}
		if(listAutores.size() != 0) {
			
			autoresJSON = "[";
			for(int i = 0; i < listAutores.size(); i++) {

				autoresJSON += "{\"id\": \"" + listAutores.get(i).getIdAutor() + "\", "
							+	"\"olid\": \"" + listAutores.get(i).getOlid() + "\", "
							+	"\"nome\": \"" + listAutores.get(i).getNome() + "\", "
							+ 	"\"biografia\": \"" + listAutores.get(i).getBiografia() + "\", "
							+	"\"imgUrl\": \"" + listAutores.get(i).getFoto() + "\" "
							+  "}" + ((i < listAutores.size() -1)? ", " : "");

			}

			autoresJSON += "]";

		}
		out.print(autoresJSON);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();

		autor.setOlid(request.getParameter("txtOlid"));
		autor.setNome(request.getParameter("txtNome"));
		autor.setBiografia(request.getParameter("txtBio"));
		autor.setFoto(request.getParameter("txtImgUrl"));

		autor.salvar();

		out.print("{\"olid\": \"" + autor.getOlid() + "\", \"nome\": \"" + autor.getNome() + "\", \"imgUrl\": \"" + autor.getFoto() + "\" }");

	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
