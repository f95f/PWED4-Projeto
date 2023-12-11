package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class LivroAutorDAO {
	private int livroId;
	private int autorId;
	
	String tableName = "arquive.livro_autor";
	String fieldsName = "livro_id,autor_id";
	String fieldKey = "";

	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey);
	
	public int salvar() {

		int resposta = this.dbQuery.insert(this.toArray());
		return resposta;

	}
	public int clear(String idLivro) {
		return this.dbQuery.execute("delete from livro_autor where livro_id = '" + idLivro + "'; ");
	}
	public ArrayList<LivroAutorDAO> findById(int bookId){
		ArrayList<LivroAutorDAO> lista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("livro_id = '" + bookId + "'; ");
		try {
			while(rs.next()) {
				lista.add(new LivroAutorDAO(
					rs.getInt("livro_id"),
					rs.getInt("autor_id")
				));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return lista;
	}
	public ArrayList<LivroAutorDAO> findByAuthor(int authorId){
		ArrayList<LivroAutorDAO> lista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("autor_id = '" + authorId + "'; ");
		try {
			while(rs.next()) {
				lista.add(new LivroAutorDAO(
					rs.getInt("livro_id"),
					rs.getInt("autor_id")
				));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return lista;
	}
	public String[] toArray() {

		String[] livroString = {
	
			this.getLivroId() + "",
			this.getAutorId() + ""

		};
		return livroString;

	}
	public LivroAutorDAO() {
		super();
	}

	public LivroAutorDAO(int livroId, int autorId) {
		super();
		this.livroId = livroId;
		this.autorId = autorId;
	}

	public int getLivroId() {
		return livroId;
	}

	public void setLivroId(int livroId) {
		this.livroId = livroId;
	}

	public int getAutorId() {
		return autorId;
	}

	public void setAutorId(int autorId) {
		this.autorId = autorId;
	}

	
}
