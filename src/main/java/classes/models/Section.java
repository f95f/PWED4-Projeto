package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Section{

	private int idSection;
	private String nome;
	private String description;

	String tableName = "arquive.section";
	String fieldsName = "id,nome,descr";
	String fieldKey = "idSection";

	private DBQuery dbQuery = new DBQuery(tableName, fieldsName, fieldKey);

	public Section() {}

	public Section(int idSection, String nome, String description) {
		super();
		this.idSection = idSection;
		this.nome = nome;
		this.description = description;
	}

	public String[] toArray() {

		String[] sectionArray = {

			this.getIdSection() + "",
			this.getNome(),
			this.getDescription()

		};

		return sectionArray;
	}

	public int salvar() {
		return this.dbQuery.insert(this.toArray());
	}
	public int deletar() {
		return this.dbQuery.execute("delete from section where id =" +  this.getIdSection() + ";");
	}
	public ArrayList<Section> listSections(){

		ArrayList<Section> sectionList = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("");

		try {
			while(rs.next()) {
				sectionList.add(new Section(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sectionList;
	}
	
	public ArrayList<Section> buscarPor(String campo, String valor) {
		
		ArrayList<Section> sectionsList = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("LOWER(" + campo + ") like LOWER('%" + valor + "%') ");

		try {
			while(rs.next()) {
				sectionsList.add(new Section(
					rs.getInt("id"),
					rs.getString("nome"),
					rs.getString("descr")
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sectionsList;
		
	}
	public int update() {
		return this.dbQuery.execute(""
				+ "update section "
				+ "set "
					+ "nome = '" +  this.getNome() + "', "
					+ "descr = '" +  this.getDescription() + "' "
				+ "where"
					+ " id = '" + this.getIdSection() + "' "
				+ ";");
	}
	public int getIdSection() {
		return idSection;
	}

	public void setIdSection(int idSection) {
		this.idSection = idSection;
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


}