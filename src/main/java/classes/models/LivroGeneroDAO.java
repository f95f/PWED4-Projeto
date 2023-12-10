package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class LivroGeneroDAO {
	private int livroId;
	private int generoId;
	
	String tableName = "arquive.livro_genero";
	String fieldsName = "livro_id,genero_id";
	String fieldKey = "";

	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey);
	
	public int salvar() {

		int resposta = this.dbQuery.insert(this.toArray());
		return resposta;

	}
	public int clear(int idLivro) {
		return this.dbQuery.execute("delete * from tb livro_genero where livro_id = '" + idLivro + "'; ");
	}
	public ArrayList<LivroGeneroDAO> findById(int bookId){
		ArrayList<LivroGeneroDAO> lista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("livro_id = '" + bookId + "'; ");
		try {
			while(rs.next()) {
				lista.add(new LivroGeneroDAO(
					rs.getInt("livro_id"),
					rs.getInt("genero_id")
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
			this.getGeneroId() + ""

		};
		return livroString;

	}
	public LivroGeneroDAO() {
		super();
	}

	public LivroGeneroDAO(int livroId, int generoId) {
		super();
		this.livroId = livroId;
		this.generoId = generoId;
	}

	public int getLivroId() {
		return livroId;
	}

	public void setLivroId(int livroId) {
		this.livroId = livroId;
	}

	public int getGeneroId() {
		return generoId;
	}

	public void setGeneroId(int generoId) {
		this.generoId = generoId;
	}

	
}
