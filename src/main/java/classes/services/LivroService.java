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
			System.out.println("\n > id livro - " + idLivro);
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
		autorDAO.clear(idLivro);
		return salvarAutores(idLivro, idAutores);
	}
	public int updateGeneros(int idLivro, String[] idGeneros) {
		LivroGeneroDAO generoDAO = new LivroGeneroDAO();
		generoDAO.clear(idLivro);
		return salvarGeneros(idLivro, idGeneros);
	}
	
	public Livro findBy(String field, String valor) {
		
		ArrayList<Livro> encontrado =  livro.buscarPor(field, valor);
		return encontrado.get(0);				
		
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
			System.out.println("\n\n <> " + generosIds.get(i) + "\n\n");System.out.println("\n\n <> " + generosFormatado + "\n\n");
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
}
