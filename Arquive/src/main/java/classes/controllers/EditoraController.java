package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Editora;

@WebServlet("/editoras")
public class EditoraController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Editora editora = new Editora();
    private PrintWriter out;

    public EditoraController() {
        super();
    }
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		ArrayList<Editora> listEditoras = editora.listarEditoras();

		String editorasJSON = "[]";

		if(listEditoras.size() != 0) {

			editorasJSON = "[";
			for(int i = 0; i < listEditoras.size(); i++) {

				editorasJSON += "   {\"id\": \"" + listEditoras.get(i).getIdEditora() + "\", "
								+ "\"nome\": \"" + listEditoras.get(i).getNome() + "\", "
						       + "\"descr\": \"" + listEditoras.get(i).getDescription() + "\"}" + ((i < listEditoras.size() -1)? ", " : "");

			}
			editorasJSON += "]";

		}
		out.print(editorasJSON);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
		try {
			editora.setNome(request.getParameter("txtNome"));
			editora.setDescription(request.getParameter("txtBio"));
			editora.salvar();	
			out.print("{\"id\": \"" + editora.getIdEditora() + "\", \"nome\": \"" + editora.getNome() + "\", \"descr\": \"" + editora.getDescription() + "\" }");
		} catch (Exception e) {
			out.print("{\"id\": \"0\", \"nome\": \"\", \"descr\": \""+e.getMessage()+"\" }");
		}
		

		

	}

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
