package classes.models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import classes.database.DBQuery;

public class Emprestimo {

	private int idEmprestimo;
	private int idLivro;
	private int idUsuario;
	private String dataEmprestimo;
	private String dataDevolucao;
	private String Obervacao;
	private Boolean atrasado;

	String tableName = "arquive.emprestimos";
	String fieldsName = "idEmprestimo,idLivro,idUsuario,dataEmprestimo,dataDevolucao,Obervacao,atrasado";
	String fieldKey = "idEmprestimo";
	private DBQuery dbQuery = new DBQuery( tableName, fieldsName, fieldKey );
	
	public String[] toArray() {
		
		return new String[] {
				
			this.getIdEmprestimo() + "",
			this.getIdLivro() + "",
			this.getIdUsuario() + "",
			this.getDataEmprestimo(),
			this.getDataDevolucao(),
			this.getObervacao(),
			this.getAtrasado() + ""
				
		};
	}
	
	public String toString() {
		
		return new String(
			this.getIdEmprestimo() + "" + ", " +
			this.getIdLivro() + ", " +
			this.getIdUsuario() + ", " +
			this.getDataEmprestimo() + "" + ", " +
			this.getDataDevolucao() + ", " +
			this.getObervacao() + ", " +
			this.getAtrasado()
		);
	}
	
	public int salvar() {
		
		return this.dbQuery.insert(this.toArray());
		
	}
	
	public ArrayList<Emprestimo> listEmprestimos(){
		
		ArrayList<Emprestimo> lista = new ArrayList<>();
		ResultSet rs = this.dbQuery.select("");
		
		try {
			while(rs.next()) {
				lista.add(new Emprestimo(
					rs.getInt("idEmprestimo"),
					rs.getInt("idLivro"),
					rs.getInt("idUsuario"),
					rs.getString("dataEmprestimo"),
					rs.getString("dataDevolucao"),
					rs.getString("observacao"),
					rs.getBoolean("atrasado")
						
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lista;
		
	}
	
	public Emprestimo() {}
	public Emprestimo(int idEmprestimo, int idLivro, int idUsuario, String dataEmprestimo, String dataDevolucao,
			String obervacao, Boolean atrasado) {
		super();
		this.idEmprestimo = idEmprestimo;
		this.idLivro = idLivro;
		this.idUsuario = idUsuario;
		this.dataEmprestimo = dataEmprestimo;
		this.dataDevolucao = dataDevolucao;
		Obervacao = obervacao;
		this.atrasado = atrasado;
	}

	public int getIdEmprestimo() {
		return idEmprestimo;
	}

	public void setIdEmprestimo(int idEmprestimo) {
		this.idEmprestimo = idEmprestimo;
	}

	public int getIdLivro() {
		return idLivro;
	}

	public void setIdLivro(int idLivro) {
		this.idLivro = idLivro;
	}

	public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getDataEmprestimo() {
		return dataEmprestimo;
	}

	public void setDataEmprestimo(String dataEmprestimo) {
		this.dataEmprestimo = dataEmprestimo;
	}

	public String getDataDevolucao() {
		return dataDevolucao;
	}

	public void setDataDevolucao(String dataDevolucao) {
		this.dataDevolucao = dataDevolucao;
	}

	public String getObervacao() {
		return Obervacao;
	}

	public void setObervacao(String obervacao) {
		Obervacao = obervacao;
	}

	public Boolean getAtrasado() {
		return atrasado;
	}

	public void setAtrasado(Boolean atrasado) {
		this.atrasado = atrasado;
	}
}
