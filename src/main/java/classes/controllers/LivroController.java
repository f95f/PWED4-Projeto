package classes.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.dtos.LivroDTO;
import classes.models.Livro;
import classes.services.LivroService;

@WebServlet("/livros")
public class LivroController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private PrintWriter out;
    private Livro livro;
    private LivroService service = new LivroService();

    public LivroController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		out = response.getWriter();
		livro = new Livro();
		ArrayList<LivroDTO> listLivros = new ArrayList<>();
		String livrosJSON = "[]";
		String parameter = request.getParameter("action");
		String valor = request.getParameter("value");
		
		if(parameter == null) {
			
			listLivros = service.list();
	
		}
		else if(parameter.equals("bookTitle")) {
			listLivros = service.findBy("titulo", valor);
		}
		else if(parameter.equals("bookIsbn")) {
			listLivros = service.findBy("isbn", valor);
		}
		else if(parameter.equals("id")) {
			listLivros = service.findBy("idLivro", valor);
		}
		else if(parameter.equals("bookAuthor")) {		
			listLivros = service.findByAuthor(valor);
		}
		else if(parameter.equals("bookGenre")) {
			listLivros = service.findByGenre(valor);
		}
		else if(parameter.equals("sectionId")) {
			listLivros = service.findBy("section_id", valor);
		}
		
		if(listLivros.size() != 0) {
			
			livrosJSON = "[";
			for(int i = 0; i < listLivros.size(); i++) {
				
				livrosJSON +=  "{\"id\": \"" + listLivros.get(i).getIdLivro() + "\", "
							+	"\"isbn\": \"" + listLivros.get(i).getIsbn() + "\", "
							+	"\"titulo\": \"" + listLivros.get(i).getTitulo() + "\", "
							+	"\"subtitulo\": \"" + listLivros.get(i).getSubtitulo() + "\", "
							+	"\"editora\": \"" + listLivros.get(i).getEditora() + "\", "
							+	"\"section\": \"" + listLivros.get(i).getSection() + "\", "
							+	"\"autores\": \"" + listLivros.get(i).getAutores() + "\", "
							+	"\"generos\": \"" + listLivros.get(i).getGeneros() + "\", "
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
		livro = new Livro();
		String autoresList = request.getParameter("autores");
		String generosList = request.getParameter("generos");

		String[] autores = autoresList.split(",");
		String[] generos = generosList.split(",");
		
		
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
		Livro livroNovo = service.findFirst("isbn", livro.getIsbn());
		if(livroNovo != null) {
			service.salvarAutores(livroNovo.getIdLivro(), autores);	
			service.salvarGeneros(livroNovo.getIdLivro(), generos);
			out.print(1);
		}
		out.print(0);
	}


	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		livro = new Livro();
		out = response.getWriter();
		String[] autores = request.getParameterValues("autores");
		String[] generos = request.getParameterValues("generos");
		String bookId = request.getParameter("livroId");
		int status = 0;
		
		ArrayList<Livro> livroEncontrado = livro.buscarPor("idLivro", bookId);
		if(livroEncontrado.size() != 0) {
			livroEncontrado.get(0).setIsbn(request.getParameter("txtIsbn"));
			livroEncontrado.get(0).setTitulo(request.getParameter("txtTitulo"));
			livroEncontrado.get(0).setSubtitulo(request.getParameter("txtSubtitulo"));
			livroEncontrado.get(0).setDescription(request.getParameter("txtDescription"));
			livroEncontrado.get(0).setImagemCapa(request.getParameter("txtImgurl"));
			livroEncontrado.get(0).setIdEditora(Integer.parseInt(request.getParameter("txtEditora")));
			livroEncontrado.get(0).setIdSection(Integer.parseInt(request.getParameter("txtSection")));
			livroEncontrado.get(0).setEdition(request.getParameter("txtEdition"));
			livroEncontrado.get(0).setAnoPublication(Integer.parseInt(request.getParameter("txtAno")));
			livroEncontrado.get(0).setQuantidadePaginas(Integer.parseInt(request.getParameter("txtPages")));
			livroEncontrado.get(0).setQuantidadeEstoque(Integer.parseInt(request.getParameter("txtQuantidade")));
			livroEncontrado.get(0).setDisponibilidade(Boolean.parseBoolean(request.getParameter("chkDisponibilidade")));
			status = livroEncontrado.get(0).update();
			service.updateAutores(Integer.parseInt(bookId), autores);	
			service.updateGeneros(Integer.parseInt(bookId), generos);
		}
		out.print(status);
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		livro = new Livro();
		out = response.getWriter();
		String bookId = request.getParameter("bookId");
		int status = 0;
		
		ArrayList<Livro> livroEncontrado = livro.buscarPor("idLivro", bookId);
		
		
		if(livroEncontrado.size() != 0) {
			status = service.excluirLivro(bookId);
		}
		out.print(status);
		
	}

}
