package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Livro{
	
	private int idLivro;
	private String isbn;
	private String titulo;
	private String subtitulo;
	private String editora;
	private String section;
	private String edition;
	private int quantidadePaginas;
	private int quantidadeEstoque;
	private int anoPublication;
	private String description;
	private String imagemCapa;
	private Boolean disponibilidade;
	
	public Livro() {}

	public Livro(int idLivro, String isbn, String titulo, String subtitulo, String editora, String section,
			String edition, int quantidadePaginas, int quantidadeEstoque, int anoPublication, String description,
			String imagemCapa, Boolean disponibilidade) {
		super();
		this.idLivro = idLivro;
		this.isbn = isbn;
		this.titulo = titulo;
		this.subtitulo = subtitulo;
		this.editora = editora;
		this.section = section;
		this.edition = edition;
		this.quantidadePaginas = quantidadePaginas;
		this.quantidadeEstoque = quantidadeEstoque;
		this.anoPublication = anoPublication;
		this.description = description;
		this.imagemCapa = imagemCapa;
		this.disponibilidade = disponibilidade;
	}

	String tableName = "arquive.livro";
	String fieldsName = "idLivro,isbn,titulo,subtitulo,editora,section,edition,quantidadePaginas,quantidadeEstoque,anoPublication,description,imagemCapa,disponibilidade";
	String fieldKey = "idLivro";
	
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey);

	public String[] toArray() {
		
		String[] livroString = {
				
			this.getIdLivro() + "",
			this.getIsbn(),
			this.getTitulo(),
			this.getSubtitulo(),
			this.getEditora(),
			this.getSection(),
			this.getEdition(),
			this.getQuantidadePaginas() + "",
			this.getQuantidadeEstoque() + "",
			this.anoPublication + "",
			this.description,
			this.imagemCapa,
			this.disponibilidade + ""
				
		};
		return livroString;
		
	}
	
	public String toString() {
		
		return
			"Livro ["
				+ "idLivro=" + idLivro
				+ "isbn=" + isbn
				+ "titulo=" + titulo
				+ "subtitulo=" + subtitulo
				+ "editora=" + editora
				+ "section=" + section
				+ "edition=" + edition
				+ "quantidadePaginas=" + quantidadePaginas
				+ "quantidadeEstoque=" + quantidadeEstoque
				+ "anoPublication=" + anoPublication
				+ "description=" + description
				+ "imagemCapa=" + imagemCapa
				+ "disponibilidade=" + disponibilidade
			+ "]";
	}
	
	public ArrayList<Livro> listarLivro(){
		
		ArrayList<Livro> livrosLista = new ArrayList<Livro>();
		ResultSet rs = this.dbQuery.select("");
		
		try {
			while(rs.next()) {
			
				livrosLista.add(new Livro(
			
					rs.getInt("idLivro"),
					rs.getString("isbn"),
					rs.getString("titulo"),
					rs.getString("subtitulo"),
					rs.getString("editora"),
					rs.getString("section"),
					rs.getString("edition"),
					rs.getInt("quantidadePaginas"),
					rs.getInt("quantidadeEstoque"),
					rs.getInt("anoPublication"),
					rs.getString("description"),
					rs.getString("imagemCapa"),
					rs.getBoolean("disponibilidade")
				));
			}
		} catch (SQLException e) {
				
				e.printStackTrace();
		}
		return livrosLista;
		
	}
	
	public int salvar() {
		
		int resposta = this.dbQuery.insert(this.toArray());
		return resposta;
		
	}
	
	
	// Só getters e setters
	
	public int getIdLivro() {
		return idLivro;
	}

	public void setIdLivro(int idLivro) {
		this.idLivro = idLivro;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getSubtitulo() {
		return subtitulo;
	}

	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}

	public String getEditora() {
		return editora;
	}

	public void setEditora(String editora) {
		this.editora = editora;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getEdition() {
		return edition;
	}

	public void setEdition(String edition) {
		this.edition = edition;
	}

	public int getQuantidadePaginas() {
		return quantidadePaginas;
	}

	public void setQuantidadePaginas(int quantidadePaginas) {
		this.quantidadePaginas = quantidadePaginas;
	}

	public int getQuantidadeEstoque() {
		return quantidadeEstoque;
	}

	public void setQuantidadeEstoque(int quantidadeEstoque) {
		this.quantidadeEstoque = quantidadeEstoque;
	}

	public int getAnoPublication() {
		return anoPublication;
	}

	public void setAnoPublication(int anoPublication) {
		this.anoPublication = anoPublication;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImagemCapa() {
		return imagemCapa;
	}

	public void setImagemCapa(String imagemCapa) {
		this.imagemCapa = imagemCapa;
	}

	public Boolean getDisponibilidade() {
		return disponibilidade;
	}

	public void setDisponibilidade(Boolean disponibilidade) {
		this.disponibilidade = disponibilidade;
	}
	
		
}