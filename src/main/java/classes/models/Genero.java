package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Genero {

	private int idGenero;
	private String nome;
	private String description;

	String tableName = "arquive.genero";
	String fieldsName = "id,nome,descr";
	String fieldKey = "idGenero";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	public Genero(){}
	public Genero(int idGenero, String nome, String description) {
		super();
		this.idGenero = idGenero;
		this.nome = nome;
		this.description = description;
	}
	public String[] toArray() {

		String[] generoArray = {

			this.getIdGenero() + "",
			this.getNome(),
			this.getDescription()

		};

		return generoArray;
	}

	public int salvar() {

		return this.dbQuery.insert(this.toArray());

	}

	public int deletar() {
		return this.dbQuery.execute("delete from genero where id =" +  this.getIdGenero() + ";");
	}
	public int update() {
		return this.dbQuery.execute(""
				+ "update genero "
				+ "set "
					+ "nome = '" +  this.getNome() + "', "
					+ "descr = '" +  this.getDescription() 
				+ "where"
					+ " id = '" + this.getIdGenero() + "' "
				+ ";");
	}
	public ArrayList<Genero> listarGeneros(){

		ArrayList<Genero> generosLista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("");

		try {
			while(rs.next()) {
				generosLista.add(new Genero(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return generosLista;

	}
	public ArrayList<Genero> buscarPor(String campo, String valor) {
		
		ArrayList<Genero> generosList = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("LOWER(" + campo + ") like LOWER('%" + valor + "%') ");

		try {
			while(rs.next()) {
				generosList.add(new Genero(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return generosList;
		
	}

	public int getIdGenero() {
		return idGenero;
	}
	public void setIdGenero(int idGenero) {
		this.idGenero = idGenero;
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
		return "Genero [idGenero=" + idGenero + ", nome=" + nome + ", description=" + description + "]";
	}

}
