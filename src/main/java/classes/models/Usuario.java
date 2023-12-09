package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Usuario {

	private int idUsuario;
	private String email;
	private String senha;
	private String idNivelUsuario;
	private String nome;
	private String telefone;
	private String acesso;

	String tableName 	= "arquive.usuario";
	String fieldsName 	= "id,email,senha,nivel,nome,telefone,acesso";
	String fieldKey 	= "idUsuario";
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey );

	public int save() {
	
		return this.dbQuery.insert(this.toArray());
	}

	public ResultSet buscarPorId(int id) {
		
		return this.dbQuery.select("id = " + id);
		
	}
	public ResultSet buscarPorEmail(String email) {
		
		return this.dbQuery.select("email = '" + email + "' ");
		
	}
	
	public int deletar() {
		return this.dbQuery.execute("delete from usuario where id =" +  this.getIdUsuario() + ";");
	}
	
	public int update() {
		return this.dbQuery.execute(""
				+ "update usuario "
				+ "set "
					+ "nome = '" +  this.getNome() + "', "
					+ "email = '" +  this.getEmail() + "', "
					+ "telefone = '" +  this.getTelefone() + "', "
					+ "nivel = '" +  this.getIdNivelUsuario() + "', "
					+ "acesso = '" +  this.getAcesso() + "' "
				+ "where"
					+ " id = '" + this.getIdUsuario() + "' "
				+ ";");
	}
	
	public ArrayList<Usuario> buscarPor(String campo, String valor) {
		
		ArrayList<Usuario> usuariosList = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("LOWER(" + campo + ") like LOWER('%" + valor + "%') ");

		try {
			while(rs.next()) {
				usuariosList.add(
					new Usuario(
						rs.getInt("id"),
						rs.getString("email"),
						rs.getString("senha"),
						rs.getString("nivel"),
						rs.getString("nome"),
						rs.getString("telefone"),
						rs.getString("acesso")
					)
				);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return usuariosList;
		
	}
	
	public int trocar(String coluna, String valor, int id){
		
		return this.dbQuery.execute("update usuario set " + coluna + " = '" + valor + "' where id = " + id + ";"); 
		
	}
	
	public Usuario() {}

	public Usuario(int idUsuario, String email, String senha, String idNivelUsuario, String nome, String telefone, String ativo){
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setTelefone(telefone);
		this.setAcesso(ativo);
	}

	public String[] toArray() {
		String[] temp = {
				this.getIdUsuario() + "",
				this.getEmail(),
				this.getSenha(),
				this.getIdNivelUsuario() + "",
				this.getNome(),
				this.getTelefone(),
				this.getAcesso()
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
			this.getAcesso()
		);

	}

	public ArrayList<Usuario> listUsuarios(){
		ArrayList<Usuario> tempList = new ArrayList<>();
		ResultSet rs  = this.dbQuery.select("");
		try {
			while (rs.next()) {
				tempList.add( new Usuario(
					rs.getInt("id"),
					rs.getString("email"),
					rs.getString("senha"),
					rs.getString("nivel"),
					rs.getString("nome"),
					rs.getString("telefone"),
					rs.getString("acesso")
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

	public String getIdNivelUsuario() {
		return idNivelUsuario;
	}

	public void setIdNivelUsuario(String idNivelUsuario) {
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

	public String getAcesso() {
		return acesso;
	}

	public void setAcesso(String ativo) {
		this.acesso = ativo;
	}



}
