package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.models.Livro;

@WebServlet("/livros")
public class LivroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PrintWriter out;
    private Livro livro = new Livro();

    public LivroController() {
        super();
    }

    // TODO: Get livros by id

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		ArrayList<Livro> listLivros = livro.listarLivros();
		String livrosJSON = "[]";
		String parameter = request.getParameter("action");
		
		if(parameter == null) {
			
			listLivros = livro.listarLivros();
	
		}
		else if(parameter.equals("bookTitle")) {
			
			String valor = request.getParameter("value");
			listLivros = livro.buscarPor("titulo", valor);
			
		}
		else if(parameter.equals("bookIsbn")) {
			
			String valor = request.getParameter("value");
			listLivros = livro.buscarPor("isbn", valor);
			
		}
		
		if(listLivros.size() != 0) {
			
			livrosJSON = "[";
			for(int i = 0; i < listLivros.size(); i++) {
				
				livrosJSON +=  "{\"id\": \"" + listLivros.get(i).getIdLivro() + "\", "
							+	"\"isbn\": \"" + listLivros.get(i).getIsbn() + "\", "
							+	"\"titulo\": \"" + listLivros.get(i).getTitulo() + "\", "
							+	"\"subtitulo\": \"" + listLivros.get(i).getSubtitulo() + "\", "
							+	"\"idEditora\": \"" + listLivros.get(i).getIdEditora() + "\", "
							+	"\"idSection\": \"" + listLivros.get(i).getIdSection() + "\", "
							+	"\"edition\": \"" + listLivros.get(i).getEdition() + "\", "
							+	"\"quantidadePaginas\": \"" + listLivros.get(i).getQuantidadePaginas() + "\", "
							+	"\"quantidadeEstoque\": \"" + listLivros.get(i).getQuantidadeEstoque() + "\", "
							+	"\"anoPublication\": \"" + listLivros.get(i).getAnoPublication() + "\", "
							+	"\"description\": \"" + listLivros.get(i).getDescription() + "\", "
							+	"\"imagemCapa\": \"" + listLivros.get(i).getImagemCapa() + "\", "
							+	"\"disponibilidade\": \"" + listLivros.get(i).getDisponibilidade() + "\" "
							+  "}" + ((i < listLivros.size() -1)? ", " : "");	
			}
			livrosJSON += "]";
			
		}
		out.print(livrosJSON);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		out = response.getWriter();
	
		livro.setIsbn(request.getParameter("txtIsbn"));
		livro.setTitulo(request.getParameter("txtTitulo"));
		livro.setSubtitulo(request.getParameter("txtSubtitulo"));
		livro.setDescription(request.getParameter("txtDescription"));
		livro.setImagemCapa(request.getParameter("txtImgurl"));
		livro.setIdEditora(Integer.parseInt(request.getParameter("txtEditora")));
		livro.setIdSection(Integer.parseInt(request.getParameter("txtSection")));
		livro.setEdition(request.getParameter("txtEdition"));
		livro.setAnoPublication(Integer.parseInt(request.getParameter("txtAno")));
		livro.setQuantidadePaginas(Integer.parseInt(request.getParameter("txtPages")));
		livro.setQuantidadeEstoque(Integer.parseInt(request.getParameter("txtQuantidade")));
		livro.setDisponibilidade(Boolean.parseBoolean(request.getParameter("chkDisponibilidade")));

		livro.salvar();
	}


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}



	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


	}

}
