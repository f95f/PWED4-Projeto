package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Genero;

/**
 * Servlet implementation class GeneroController
 */
@WebServlet("/generos")
public class GeneroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private PrintWriter out;
	private Genero genero = new Genero();
 
	public GeneroController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
	
		ArrayList<Genero> listGeneros = genero.listarGeneros();
		String generosJSON = "[]";
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		
		genero.setNome(request.getParameter("txtNome"));
		genero.setDescription(request.getParameter("txtDesc"));
		
		genero.salvar();
		
		out.print("{\"id\": \"" + genero.getIdGenero() + "\", \"nome\": \"" + genero.getNome() + "\", \"descr\": \"" + genero.getDescription() + "\"}");
		
		
	}

}
