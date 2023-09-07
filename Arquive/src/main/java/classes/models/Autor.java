package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Autor {

//id,nome,sobrenome,biografia,foto
	private int idAutor;
	private String olid;
	private String nome;
	private String sobrenome;
	private String biografia;
	private String foto;
	
	String tableName = "arquive.autor";
	String fieldsName = "id,olid,nome,sobrenome,biografia,foto";
	String fieldKey = "idAutor";
	
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey);

	public Autor(){}

	public Autor(int idAutor, String olid, String nome, String sobrenome, String biografia, String foto) {
		super();
		this.setIdAutor(idAutor);
		this.setOlid(olid);
		this.setNome(nome);
		this.setSobrenome(sobrenome);
		this.setBiografia(biografia);
		this.setFoto(foto);
	}
	
	public String[] toArray() {
		
		String[] autorString = {
				
			this.getIdAutor() + "",
			this.getOlid(),
			this.getNome(),
			this.getSobrenome(),
			this.getBiografia(),
			this.getFoto()				
		};
		return autorString;
	}

	@Override
	public String toString() {
		return 
			"Autor ["
				+ "idAutor=" + idAutor
				+ ", olid=" + olid 
				+ ", nome=" + nome 
				+ ", sobrenome=" + sobrenome 
				+ ", biografia=" + biografia
				+ ", foto=" + foto 
			+ "]";
	}
	
	public int salvar() {
		
		int resposta = this.dbQuery.insert(this.toArray());
		return resposta;
		
	} 
	
	public ArrayList<Autor> listAutores(){
		
		ArrayList<Autor> autoresLista = new ArrayList<Autor>();
		ResultSet rs = this.dbQuery.select("");
		
		try {
			while(rs.next()) {
				autoresLista.add(
					new Autor(
							
						rs.getInt("id"),
						rs.getString("olid"),
						rs.getString("nome"),
						rs.getString("sobrenome"),
						rs.getString("biografia"),
						rs.getString("foto")
							
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return autoresLista;
		
	}

	public int getIdAutor() {
		return idAutor;
	}

	public void setIdAutor(int idAutor) {
		this.idAutor = idAutor;
	}

	public String getOlid() {
		return olid;
	}

	public void setOlid(String olid) {
		this.olid = olid;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public String getBiografia() {
		return biografia;
	}

	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	
}
