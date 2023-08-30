package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.xdevapi.Result;

import classes.database.DBQuery;

public class Usuario {
	
	private int idUsuario;
	private String email;
	private String senha;
	private int idNivelUsuario;
	private String nome;
	private String cpf;
	private String endereco;
	private String bairro;
	private String cidade;
	private String uf;
	private String cep;
	private String telefone;
	private String foto;
	private String ativo;
	
	String tableName 	= "lojinha.usuarios";
	String fieldsName 	= "idUsuario,email,senha,idNivelUsuario,nome,cpf,endereco,bairro,cidade,uf,cep,telefone,foto,ativo";
	String fieldKey 	= "idUsuario";
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey );
	
	public Usuario() {
	
	}
	
	public Usuario(int idUsuario, String email, String senha, int idNivelUsuario, String nome, String cpf, String endereco, String bairro, String cidade, String uf, String cep, String telefone, String foto, String ativo){
		this.setIdUsuario(idUsuario);
		this.setEmail(email);
		this.setSenha(senha);
		this.setIdNivelUsuario(idNivelUsuario);
		this.setNome(nome);
		this.setCpf(cpf);
		this.setEndereco(endereco);
		this.setBairro(bairro);
		this.setCidade(cidade);
		this.setUf(uf);
		this.setCep(cep);
		this.setTelefone(telefone);
		this.setFoto(foto);
		this.setAtivo(ativo);
	}

	public String[] toArray() {
		String[] temp = {
				this.getIdUsuario() + "",
				this.getEmail(),
				this.getSenha(),
				this.getIdNivelUsuario() + "",
				this.getNome(),
				this.getCpf(),
				this.getEndereco(),
				this.getBairro(),
				this.getCidade(),
				this.getUf(),
				this.getCep(),
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
			this.getCpf() + ", " +
			this.getEndereco() + ", " +
			this.getBairro() + ", " +
			this.getCidade() + ", " +
			this.getUf() + ", " +
			this.getCep() + ", " +
			this.getTelefone() + ", " +
			this.getFoto() + ", " +
			this.getAtivo()
		);
		
	}
	
	public ArrayList<Usuario> listUsuarios(){ // ( String filterField, String filterOperator, String filterValue ) {
		ArrayList<Usuario> tempList = new ArrayList<Usuario>();
		ResultSet rs  = this.dbQuery.select("");
		try {
			while (rs.next()) {
				tempList.add( new Usuario(
					rs.getInt("idUsuario"),
					rs.getString("email"),
					rs.getString("senha"),
					rs.getInt("idNivelUsuario"),
					rs.getString("nome"),
					rs.getString("cpf"),
					rs.getString("endereco"),
					rs.getString("bairro"),
					rs.getString("cidade"),
					rs.getString("uf"),
					rs.getString("cep"),
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

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
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
