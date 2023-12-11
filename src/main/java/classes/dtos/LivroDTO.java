package classes.dtos;

public class LivroDTO {
	
	private int idLivro;
	private String isbn;
	private String titulo;
	private String subtitulo;
	private String editora;
	private String section;
	private String edition;
	private String autores;
	private String generos;
	private int quantidadePaginas;
	private int quantidadeEstoque;
	private int anoPublication;
	private String description;
	private String imagemCapa;
	private Boolean disponibilidade;
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
	public String getAutores() {
		return autores;
	}
	public void setAutores(String autores) {
		this.autores = autores;
	}
	public String getGeneros() {
		return generos;
	}
	public void setGeneros(String generos) {
		this.generos = generos;
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
	public LivroDTO(int idLivro, String isbn, String titulo, String subtitulo, String editora, String section,
			String edition, String autores, String generos, int quantidadePaginas, int quantidadeEstoque,
			int anoPublication, String description, String imagemCapa, Boolean disponibilidade) {
		super();
		this.idLivro = idLivro;
		this.isbn = isbn;
		this.titulo = titulo;
		this.subtitulo = subtitulo;
		this.editora = editora;
		this.section = section;
		this.edition = edition;
		this.autores = autores;
		this.generos = generos;
		this.quantidadePaginas = quantidadePaginas;
		this.quantidadeEstoque = quantidadeEstoque;
		this.anoPublication = anoPublication;
		this.description = description;
		this.imagemCapa = imagemCapa;
		this.disponibilidade = disponibilidade;
	}
	public LivroDTO() {
		super();
	}
	
}