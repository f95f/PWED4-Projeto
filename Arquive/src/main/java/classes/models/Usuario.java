package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Usuario {

	private int idUsuario;
	private String email;
	private String senha;
	private int idNivelUsuario;
	private String nome;
	private String telefone;
	private String foto;
	private String ativo;

	String tableName 	= "lojinha.usuarios";
	String fieldsName 	= "idUsuario,email,senha,idNivelUsuario,nome,telefone,foto,ativo";
	String fieldKey 	= "idUsuario";
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey );

	public Usuario() {}
	public Usuario(int idUsuario, String email, String senha, int idNivelUsuario, String nome, String telefone,
			String foto, String ativo) {
		super();
		this.idUsuario = idUsuario;
		this.email = email;
		this.senha = senha;
		this.idNivelUsuario = idNivelUsuario;
		this.nome = nome;
		this.telefone = telefone;
		this.foto = foto;
		this.ativo = ativo;
	}

	public String[] toArray() {
		String[] temp = {
				this.getIdUsuario() + "",
				this.getEmail(),
				this.getSenha(),
				this.getIdNivelUsuario() + "",
				this.getNome(),
				this.getTelefone(),
				this.getFoto(),
				this.getAtivo()
		};
		return(temp);
	}

	@Override
	public String toString() {

		return (
			this.getIdUsuario() + "" + ", " +
			this.getEmail() + ", " +
			this.getSenha() + ", " +
			this.getIdNivelUsuario() + "" + ", " +
			this.getNome() + ", " +
			this.getTelefone() + ", " +
			this.getFoto() + ", " +
			this.getAtivo()
		);

	}

	public int salvar() {
		
		return this.dbQuery.insert(this.toArray());
		
	}
	
	public ArrayList<Usuario> listUsuarios(){ // ( String filterField, String filterOperator, String filterValue ) {
		ArrayList<Usuario> tempList = new ArrayList<>();
		ResultSet rs  = this.dbQuery.select("");
		try {
			while (rs.next()) {
				tempList.add( new Usuario(
					rs.getInt("idUsuario"),
					rs.getString("email"),
					rs.getString("senha"),
					rs.getInt("idNivelUsuario"),
					rs.getString("nome"),
					rs.getString("telefone"),
					rs.getString("foto"),
					rs.getString("ativo")
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(tempList);
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public int getIdNivelUsuario() {
		return idNivelUsuario;
	}
	public void setIdNivelUsuario(int idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getAtivo() {
		return ativo;
	}
	public void setAtivo(String ativo) {
		this.ativo = ativo;
	}

}
