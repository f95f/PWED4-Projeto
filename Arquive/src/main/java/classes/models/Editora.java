package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Editora {

	private int idEditora;
	private String nome;
	private String description;

	String tableName = "arquive.editora";
	String fieldsName = "id,nome,descr";
	String fieldKey = "idEditora";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	public Editora(){}
	public Editora(int idEditora, String nome, String description) {
		super();
		this.idEditora = idEditora;
		this.nome = nome;
		this.description = description;
	}
	public String[] toArray() {

		String[] editoraArray = {

			this.getIdEditora() + "",
			this.getNome(),
			this.getDescription()

		};

		return editoraArray;
	}

	public int salvar() {

		return this.dbQuery.insert(this.toArray());

	}

	public ArrayList<Editora> listarEditoras(){

		ArrayList<Editora> editorasLista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("");

		try {
			while(rs.next()) {
				editorasLista.add(new Editora(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return editorasLista;

	}
	
	public ArrayList<Editora> buscarPor(String campo, String valor) {
		
		ArrayList<Editora> editorasList = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("LOWER(" + campo + ") like LOWER('%" + valor + "%') ");

		try {
			while(rs.next()) {
				editorasList.add(new Editora(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return editorasList;
	}

	public int getIdEditora() {
		return idEditora;
	}
	public void setIdEditora(int idEditora) {
		this.idEditora = idEditora;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Override
	public String toString() {
		return "Editora [idEditora=" + idEditora + ", nome=" + nome + ", description=" + description + "]";
	}

}
