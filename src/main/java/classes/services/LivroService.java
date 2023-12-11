package classes.services;

import java.util.ArrayList;

import classes.dtos.LivroDTO;
import classes.models.Autor;
import classes.models.Editora;
import classes.models.Genero;
import classes.models.Livro;
import classes.models.LivroAutorDAO;
import classes.models.LivroGeneroDAO;
import classes.models.Section;

public class LivroService {
	
	private Livro livro = new Livro();
	private Editora editora = new Editora();
	private Section section = new Section();
	private Genero genero = new Genero();
	private Autor autor = new Autor();
	
	public int salvarAutores(int idLivro, String[] idAutores) {
		
		for (String id : idAutores) {
			LivroAutorDAO autorDAO = new LivroAutorDAO();
			autorDAO.setLivroId(idLivro);
			autorDAO.setAutorId(Integer.parseInt(id));
			autorDAO.salvar();
		}
		return 0;
	}
	
	public int salvarGeneros(int idLivro, String[] idGeneros) {
		
		for (String id : idGeneros) {
			LivroGeneroDAO generoDAO = new LivroGeneroDAO();
			generoDAO.setLivroId(idLivro);
			generoDAO.setGeneroId(Integer.parseInt(id));
			generoDAO.salvar();
		}
		return 0;
	}
	
	public int updateAutores(int idLivro, String[] idAutores) {
		LivroAutorDAO autorDAO = new LivroAutorDAO();
		autorDAO.clear(idLivro + "");
		return salvarAutores(idLivro, idAutores);
	}
	public int updateGeneros(int idLivro, String[] idGeneros) {
		LivroGeneroDAO generoDAO = new LivroGeneroDAO();
		generoDAO.clear(idLivro + "");
		return salvarGeneros(idLivro, idGeneros);
	}
	
	public Livro findFirst(String field, String valor) {
		
		ArrayList<Livro> encontrado =  livro.buscarPor(field, valor);
		return encontrado.get(0);				
		
	}
	
	public ArrayList<LivroDTO> findBy(String field, String valor) {

		ArrayList<Livro> livrosList = livro.buscarPor(field, valor);
		ArrayList<LivroDTO> livros = new ArrayList<>();
		
		if(livrosList == null) { return null; }
			
			for(Livro item: livrosList) {
				LivroDTO tempLivro = new LivroDTO();
				tempLivro.setIdLivro(item.getIdLivro());
				tempLivro.setTitulo(item.getTitulo());
				tempLivro.setSubtitulo(item.getTitulo());
				tempLivro.setDescription(item.getDescription());
				tempLivro.setAnoPublication(item.getAnoPublication());
				tempLivro.setDisponibilidade(item.getDisponibilidade());
				tempLivro.setEdition(item.getEdition());
				tempLivro.setEditora(editora.buscarPor("id", item.getIdEditora() + "").get(0).getNome());
				tempLivro.setImagemCapa(item.getImagemCapa());
				tempLivro.setIsbn(item.getIsbn());
				tempLivro.setQuantidadeEstoque(item.getQuantidadeEstoque());
				tempLivro.setQuantidadePaginas(item.getQuantidadePaginas());
				tempLivro.setSection(section.buscarPor("id", item.getIdSection() + "").get(0).getNome());
				tempLivro.setGeneros(getGenerosToString(item.getIdLivro()));
				tempLivro.setAutores(getAutoresToString(item.getIdLivro()));
				
				livros.add(tempLivro);
			}
		return livros;				
	}
	
	public ArrayList<LivroDTO> list(){
		
		ArrayList<Livro> livrosList = livro.listarLivros();
		ArrayList<LivroDTO> livros = new ArrayList<>();
		
		if(livrosList == null) { return null; }
		
		for(Livro item: livrosList) {
			LivroDTO tempLivro = new LivroDTO();
			tempLivro.setIdLivro(item.getIdLivro());
			tempLivro.setTitulo(item.getTitulo());
			tempLivro.setSubtitulo(item.getTitulo());
			tempLivro.setDescription(item.getDescription());
			tempLivro.setAnoPublication(item.getAnoPublication());
			tempLivro.setDisponibilidade(item.getDisponibilidade());
			tempLivro.setEdition(item.getEdition());
			tempLivro.setEditora(editora.buscarPor("id", item.getIdEditora() + "").get(0).getNome());
			tempLivro.setImagemCapa(item.getImagemCapa());
			tempLivro.setIsbn(item.getIsbn());
			tempLivro.setQuantidadeEstoque(item.getQuantidadeEstoque());
			tempLivro.setQuantidadePaginas(item.getQuantidadePaginas());
			tempLivro.setSection(section.buscarPor("id", item.getIdSection() + "").get(0).getNome());
			tempLivro.setGeneros(getGenerosToString(item.getIdLivro()));
			tempLivro.setAutores(getAutoresToString(item.getIdLivro()));
			
			livros.add(tempLivro);
		}
		return livros;
	}
	private String getGenerosToString(int idLivro) {
		
		LivroGeneroDAO livroGenero = new LivroGeneroDAO();
		ArrayList<LivroGeneroDAO> generosIds = new ArrayList<>();
		generosIds = livroGenero.findById(idLivro);
		String generosFormatado = "";
		
		for(int i = 0; i < generosIds.size(); i++) {
			generosFormatado += genero.buscarPor("id", generosIds.get(i).getGeneroId() + "").get(0).getNome();
			if(i < generosIds.size() -1) {
				generosFormatado += ", ";
			}
		}
		generosFormatado += ".";
		return generosFormatado;
	}
	
	private String getAutoresToString(int idLivro) {
		
		LivroAutorDAO livroAutor = new LivroAutorDAO();
		ArrayList<LivroAutorDAO> autoresIds = new ArrayList<>();
		autoresIds = livroAutor.findById(idLivro);
		String autoressFormatado = "";
		
		for(int i = 0; i < autoresIds.size(); i++) {
			autoressFormatado += autor.buscarPor("id", autoresIds.get(i).getAutorId() + "").get(0).getNome();
			if(i < autoresIds.size() -1) {
				autoressFormatado += ", ";
			}
		}
		autoressFormatado += ".";
		return autoressFormatado;
	}
	
	public ArrayList<LivroDTO> findByAuthor(String authorName) {
		
		LivroAutorDAO autorDAO = new LivroAutorDAO();
		ArrayList<LivroDTO> livros = new ArrayList<LivroDTO>();
		ArrayList<LivroAutorDAO> autoresIds = new ArrayList<>();
		ArrayList<Autor> autoresList = autor.buscarPor("nome", authorName);
		
		if(autoresList == null) { return null; }
		
		for(Autor item: autoresList) {
			ArrayList<LivroAutorDAO> livrosAutoresList = autorDAO.findByAuthor(item.getIdAutor());
			if(livrosAutoresList.size() != 0) {
				autoresIds.add(livrosAutoresList.get(0));
			}
			
		}
		for(LivroAutorDAO item: autoresIds) {
			livros.add(this.findBy("idLivro", item.getLivroId() + "").get(0));
		}
		
		return livros;
	}
	public ArrayList<LivroDTO> findByGenre(String genreName) {
		
		LivroGeneroDAO genreDAO = new LivroGeneroDAO();
		ArrayList<LivroDTO> livros = new ArrayList<LivroDTO>();
		ArrayList<LivroGeneroDAO> generosIds = new ArrayList<>();
		ArrayList<Genero> generosList = genero.buscarPor("nome", genreName);
		
		if(generosList == null) { return null; }
		
		for(Genero item: generosList) {
			ArrayList<LivroGeneroDAO> livrosGenerosList = genreDAO.findByGenero(item.getIdGenero());
			
			if(livrosGenerosList.size() != 0) {
				generosIds.add(livrosGenerosList.get(0));				
			}
		}
		for(LivroGeneroDAO item: generosIds) {
			livros.add(this.findBy("idLivro", item.getLivroId() + "").get(0));
		}
		
		return livros;
	}
	public int excluirLivro(String idLivro) {
		LivroGeneroDAO genreDAO = new LivroGeneroDAO();
		LivroAutorDAO autorDAO = new LivroAutorDAO();
		Livro tempLivro = livro.buscarPor("idLivro", idLivro).get(0);
		
		genreDAO.clear(idLivro);
		autorDAO.clear(idLivro);
		
		return tempLivro.deletar();
		
	}
}
